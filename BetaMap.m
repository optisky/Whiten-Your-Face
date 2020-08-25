function beta_map = BetaMap(img)
% Produce the beta map for logarithmic enhancement 
%  Reference: A Two-Stage Contrast Enhancement Algorithm for Digital Images
%  Author: Shen-Chuan Tai etc
%    img = imread('lena.bmp');
    img = double(img);
    [row, column, ~] = size(img);
    beta_map = zeros(row, column, 3);
    
    Sobel = [-1, -2, -1;
              0,  0,  0;
              1,  2,  1];
    Edge = ~((imfilter(img, Sobel') + imfilter(img, Sobel)) > 128);
    for k = 1:3
        mean = sum(sum(Edge(:,:,k).*img(:,:,k)))/sum(sum(Edge(:,:,k)));
        for i = 1:row
            for j = 1:column
                if Edge(i,j,k)
                    if img(i,j,k) >= mean
                        beta_map(i,j,k) = 10*(img(i,j,k)-mean)/img(i,j,k) + 2;
                    else
                        beta_map(i,j,k) = 2;
                    end
                else
                    flag = 1;
%                     t = ~sum(sum(Edge(i-flag:i+flag,j-flag:j+flag,k)))
                    while i>flag && row-i>flag && j>flag && column-j>flag && ~sum(sum(Edge(i-flag:i+flag,j-flag:j+flag,k)))
                        flag = flag + 1;
                    end
                    if i>flag && row-i>flag && j>flag && column-j>flag
                        beta_map(i,j,k) = sum(sum(img(i-flag:i+flag,j-flag:j+flag,k)))/sum(sum(Edge(i-flag:i+flag,j-flag:j+flag,k)));
                    else
                        beta_map(i,j,k) = 2;
                    end
                end
            end
        end
    end
    
end
