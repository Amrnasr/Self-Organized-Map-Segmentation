% % 
% % 
% % How to export the output of a SOM in MATLAB
% % 
% % up vote
% % 0
% % down vote
% % favorite
% % 1
% % Ok, so this question is related to my ongoing task of getting text data categorized, you can refer to this question for more details on how I approached this problem.
% % 
% % I used the standard matlab function "nctool" (neural clustering tool) to get my inputs organized on a plane of 10x10 SOM nodes. I also got the output of this map (i.e. which of my inputs ended up on which node) saved in to the "output" variable in my workspace.
% % 
% % I would now like to get this data out and see if I can write another script. I'm aware of the 'save' and some of the export functions in MATLAB, however it seems that MATLAB does not support ascii export of this variable since it is a sparse matrix.
% % 
% % I am currently writing a script to get this thing exported out, however if someone already has a solution, please post. Otherwise I will do so after I finish testing it.
% % 
% % Update: I found a workaround to this fairly easily:
% % 
% % % convert a sparse matrix to full
% % output = full(output);
% % 
% % % output this to a file (excel)
% % xlswrite('test.csv',output);
% % neural-network matlab self-organiz