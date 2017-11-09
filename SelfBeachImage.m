


clear;
clc;
i=imread('Beach.jpg'); 
I = imresize(i,0.5);
cform = makecform('srgb2lab');
lab_I = applycform(I,cform);
ab = double(lab_I(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
a = ab(:,1);
b = ab(:,2);
normA = (a-min(a(:))) ./ (max(a(:))-min(a(:)));
normB = (b-min(b(:))) ./ (max(b(:))-min(b(:)));
ab = [normA normB];
newnRows = size(ab,1);
newnCols = size(ab,2);
cluster = 3;
% Max number of iteration
N = 90;
% initial learning rate
eta = 0.3;
% exponential decay rate of the learning rate
etadecay = 0.2;
%random weight

w = rand(2,cluster);
%initial D
D = zeros(1,cluster);
% initial cluster index
clusterindex = zeros(newnRows,1);
% start 
for t = 1:N
   for data = 1 : newnRows
       for c = 1 : cluster
           D(c) = sqrt(((w(1,c)-ab(data,1))^2) + ((w(2,c)-ab(data,2))^2));
       end
       %find best macthing unit
       [~, bmuindex] = min(D);
       clusterindex(data)=bmuindex;

       %update weight
       oldW = w(:,bmuindex);
       new = oldW +  eta * (reshape(ab(data,:),2,1)-oldW);
       w(:,bmuindex) = new;

   end
   % update learning rate
   eta= etadecay * eta;
end

%Label Every Pixel in the Image Using the Results from KMEANS
pixel_labels = reshape(clusterindex,nrows,ncols);
%Create Images that Segment the I Image by Color.
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:cluster
    color = I;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
figure,imshow(segmented_images{1}), title('objects in cluster 1');
figure,imshow(segmented_images{2}), title('objects in cluster 2');
figure,imshow(segmented_images{3}), title('objects in cluster 3');