function scan(img)
    files = dir('*.jpg');
    hist = [];
    for n = 1 : length(files)
       filename = files(n).name;
       file = imread(filename);

       hist = [hist, imhist(rgb2gray(imresize(file,[ 50 50])))]; %#ok
    end

    som = selforgmap([10 10]);
    som = train(som, hist);
    t   = som(hist); %extract class data

    net = lvqnet(10);
    net = train(net, hist, t);

    like(img, hist, files, net)
end