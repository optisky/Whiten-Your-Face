%% --------
function SkinWhitening(luminance)
    fprintf('\n肤色美白处理中···\n');
    global img hImage;
    global skin;
    img = im2double(img);   
    beta = BetaMap(img);
    [row, column, z] = size(img);
    for k = 1:z
        for i = 1:row
            for j = 1:column
                 if skin(i,j)
%                     img(i,j,k) = log(img(i,j,k)*(beta(i,j,k)-1)+1)/log(beta(i,j,k))*luminance + img(i,j,k);
                    img(i,j,k) = log(img(i,j,k)*(beta(i,j,k)-1)+1)/log(beta(i,j,k))*img(i,j,k)+luminance;
                 end
            end
        end
    end
    img = uint8(img*255);
    delete(hImage);
    hImage = imshow(img);
    fprintf('\n肤色美白完成\n');
end