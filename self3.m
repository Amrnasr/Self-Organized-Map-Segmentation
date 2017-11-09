

clc; clear all; close all;

%%%The script assumes that the input vectors are already
%%%%loaded into the workspace. To show the command-line 
%%%operations, you can use a different data set than you used
%%%%for the GUI operation. Use the flower data set as an example.
    %%%%The iris data set consists of 150 four-element input vectors.

% load iris_dataset
% 
% inputs = irisInputs;


I=imread('googleearth.jpg');

figure,imshow(I);

I1=rgb2gray(I);

I2=imresize(I1,[30 30]);

figure,imshow(I2);

%%Create a network. For this example, 
%%you use a self-organizing map (SOM).
%%This network has one layer, with the neurons
%%%organized in a grid. (For more information,
%%%see "Self-Organizing Feature Maps".)
%%%When creating the network with selforgmap,
%%%you specify the number of rows and columns in the grid:

[m,n]=size(I2);

 dimension1 = 2;
 dimension2 = 2;
% factor=100;
% dimension1 = floor(m/factor);
% dimension2 = floor(n/factor);
% 
net = selforgmap([dimension1 dimension2]);


%%%%Train the network. The SOM network uses the
%%%%default batch SOM algorithm for training.

inputs=reshape(I2,1,[]);
% inputs=inputs';

inputs=double(inputs);

[net,tr] = train(net,inputs);


y=net(inputs(:,1));


