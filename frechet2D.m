X1=P1(:,1);

X2=P2(:,1);

Y1=P1(:,2);

Y2=P2(:,2);

% Z1=P1(:,3);
% 
% Z2=P2(:,3);

%get path point length

L1=length(X1);

L2=length(X2);

%check vector lengths

if or(L1~=length(Y1),L2~=length(Y2))

    error('Paired input vectors (Xi,Yi) must be the same length.')

end

%check for column inputs

if or(or(size(X1,1)<=1,size(Y1,1)<=1),or(size(X2,1)<=1,size(Y2,1)<=1))

    error('Input vectors must be column vectors.')

end

%create maxtrix forms

X1_mat=ones(L2,1)*X1';

Y1_mat=ones(L2,1)*Y1';

% Z1_mat=ones(L2,1)*Z1';

X2_mat=X2*ones(1,L1);

Y2_mat=Y2*ones(1,L1);

% Z2_mat=Z2*ones(1,L1);

%calculate frechet distance matrix
% 
% frechet1=sqrt((X1_mat-X2_mat).^2+(Y1_mat-Y2_mat).^2+(Z1_mat-Z2_mat).^2);
frechet1=sqrt((X1_mat-X2_mat).^2+(Y1_mat-Y2_mat).^2);

fmin=min(frechet1(:));

fmax=max(frechet1(:));

%handle resolution

if ~isempty(varargin)

    res=varargin{1};

    if res<=0

        error('The resolution parameter must be greater than zero.')

    elseif ((fmax-fmin)/res)>10000

        warning('Given these two curves, and that resolution, this might take a while.')

    elseif res>=(fmax-fmin)

        warning('The resolution is too low given these curves to compute anything meaningful.')

        f=fmax;

        return

    end

else

    res=(fmax-fmin)/100;

end

%compute frechet distance

clear f

for q3=fmin:res:fmax

    im1=bwlabel(frechet1<=q3);

%get region number of beginning and end points

    if and(im1(1,1)~=0,im1(1,1)==im1(end,end))

        f=q3;

        break

    end

end

if (~(exist ('f')))

    f=fmax;

end

% disp(f)