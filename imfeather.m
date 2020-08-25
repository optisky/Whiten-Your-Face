%% 
function imfeather(GreyWindowWidth, Opacity)
    fprintf('\n羽化中···\n');
    global img OriginalImage hImage;
    r = (GreyWindowWidth-1)/2;
    [row, column, z] = size(OriginalImage);
    EdgeInfo = zeros(row, column, z);

    for k = 1:z
        EdgeInfo(:,:,k) = edge(OriginalImage(:,:,k), 'Sobel','both');
    end
    EdgeInfo = logical(EdgeInfo);
    for k = 1:z
        for i = 1:row 
            for j = 1:column
                if EdgeInfo(i,j,k)
                    if i-r <= 0
                        rx1 = 1;
                    else 
                        rx1 = i-r;
                    end
                    if i+r > row
                        rx2 = row;
                    else
                        rx2 = i+r;
                    end
                    if j-r <= 0
                        ry1 = 1;
                    else
                        ry1 = j-r;
                    end
                    if j+r > column
                        ry2 = column;
                    else
                        ry2 = j+r;
                    end
                    img(i,j,k) = sum(sum(img(rx1:rx2,ry1:ry2,k)))/((rx2-rx1)*(ry2-ry1));
                end
            end
        end
    end
    % H = [0 -1 0; -1 5 -1; 0 -1 0];
    % img = imfilter(img,H);
    img = double(img);
    OriginalImage = double(OriginalImage);
    G = imfilter(img-OriginalImage+128,fspecial('gaussian',5,10));
    img = (OriginalImage*(100-Opacity)+(OriginalImage+2*G-256)*Opacity)/100;
    img = uint8(img);
    delete(hImage);
    hImage = imshow(img);
    fprintf('\n羽化处理完成\n');
end

                    