

function newimg=Replacevalues(img,R,G,B)

newimg=zeros(size(img));

 for ii=1:size(img,1)
     for jj=1:size(img,2)
         
         
         q=img(ii,jj,:);
         
         if q(:,:,1)==0 && q(:,:,2)==0 && q(:,:,3)==0
             newimg(ii,jj,:)=0; 
         
         else
             newimg(ii,jj,1)=R;
             newimg(ii,jj,2)=G;
             newimg(ii,jj,3)=B;
         
         end    

     end
     
 end




end