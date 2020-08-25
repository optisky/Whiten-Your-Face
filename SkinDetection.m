function result = SkinDetection (img, flag)
% Reference: Human Skin Colour Clustering for Face Detection
% Author: Jure Kovac

    if ~flag
        result = (img(:,:,1)>95) & (img(:,:,2)>40) & (img(:,:,3)>20) & ...
                 (max(max(max(img)))-min(min(min(img)))>15) & ...
                 (abs(img(:,:,1)-img(:,:,2)>15)) & (img(:,:,1)>img(:,:,2)) & ...
                 (img(:,:,1)>img(:,:,3));
    end
    if flag
        result = (img(:,:,1)>220) & (img(:,:,2)>210) & (img(:,:,3)>170) & ...
                 (abs(img(:,:,1)-img(:,:,2))<=15) & (img(:,:,1)>img(:,:,2)) & ...
                 (img(:,:,2)>img(:,:,3));
    end
end

