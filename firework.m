% clear;
% mov1=VideoReader(['Fireworks_3.mp4']);
% nframes = mov1.NumberOfFrames;
% R_total = zeros(1,nframes);
% G_total = zeros(1,nframes);
% B_total = zeros(1,nframes);
% R_std = zeros(1,nframes);
% G_std = zeros(1,nframes);
% B_std = zeros(1,nframes);
% R_stdin = zeros(1,nframes);
% G_stdin = zeros(1,nframes);
% B_stdin = zeros(1,nframes);
% R_totalin =zeros(1,nframes);
% G_totalin = zeros(1,nframes);
% B_totalin = zeros(1,nframes);
% 
% 
% xx = 1080;
% yy = 1920;
% location_x = zeros(1080,1920);
% location_y = zeros(1080,1920);
% for i = 1: xx
%     for j = 1: yy
%         location_y(i,j) = i;
%         location_x(i,j) = j;      
%     end
% end
% 
% h=waitbar(0,'waiting');
% 
% for k=1:nframes
%     k
%     waitbar((k)/nframes-1)
%     image=read(mov1,k);
%     R = double(image(:,:,1));
%     G = double(image(:,:,2));
%     B = double(image(:,:,3));
%     R_total(k) = sum(sum(R));
%     G_total(k) = sum(sum(G));
%     B_total(k) = sum(sum(B));
%     R_std(k) = std2(R);%Red channel std
%     G_std(k) = std2(G);
%     B_std(k) = std2(B);
%     R_stdin(k) =  R_stdin(k)+std2(R);
%     G_stdin(k) =  G_stdin(k)+std2(G);
%     B_stdin(k) =  B_stdin(k)+std2(B);
%     if k<nframes
%     R_stdin(k+1) =  R_stdin(k);
%     G_stdin(k+1) =  G_stdin(k);
%     B_stdin(k+1) =  B_stdin(k);
%     end
%     R_totalin(k) = R_totalin(k)+sum(sum(R)); %Red channel increaing intensity
%     G_totalin(k) = G_totalin(k)+sum(sum(G));
%     B_totalin(k) = B_totalin(k)+sum(sum(B));
%     if k<nframes
%     R_totalin(k+1) = R_totalin(k); %Red channel increaing intensity
%     G_totalin(k+1) = G_totalin(k);
%     B_totalin(k+1) = B_totalin(k);
%     end
% end
% close(h)
% figure;
% plot (1:nframes, R_total, 'r-')
% hold on
% plot (1:nframes, G_total, 'g-')
% hold on
% plot (1:nframes, B_total, 'b-')
% hold off
% figure;
% plot (1:nframes, R_std, 'r-')
% hold on
% plot (1:nframes, G_std, 'g-')
% hold on
% plot (1:nframes, B_std, 'b-')
% hold off
% figure;
plot (1:nframes, R_totalin, 'r-')
hold on
plot (1:nframes, G_totalin, 'g-')
hold on
plot (1:nframes, B_totalin, 'b-')
hold off
figure;
plot (1:nframes, R_stdin, 'r-')
hold on
plot (1:nframes, G_stdin, 'g-')
hold on
plot (1:nframes, B_stdin, 'b-')
hold off
A=[R_totalin;G_totalin;B_totalin;R_stdin;G_stdin;B_stdin;R_total;G_total;B_total;R_std;G_std;B_std];
% csvwrite('intensity2.csv',A')