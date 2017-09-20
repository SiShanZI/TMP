function [Disp_rgb]=Gr_rgb(Disp_gr)
Si=size(Disp_gr);
Disp_gr=reshape(Disp_gr,Si(1),Si(2),1);
Disp_rgb(:,:,1)=Disp_gr;
Disp_rgb(:,:,2)=Disp_gr;
Disp_rgb(:,:,3)=Disp_gr;
Disp_rgb;

