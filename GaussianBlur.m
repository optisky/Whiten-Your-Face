%% Gaussian
function GaussianBlur(GreyWindowWidth, sigma)
    fprintf('\n��˹ģ�������С�����\n');
    global img hImage skin;
    skin = SkinDetection(img,0);
    img_a = imfilter(img,fspecial('gaussian',double(int32(GreyWindowWidth)),sigma));
    img_a = uint8(skin).*img_a;
    img_b = uint8(~skin).*img;
    img = img_a + img_b;
    delete(hImage);
    hImage = imshow(img);
    fprintf('\n��˹ģ��������ɡ�����\n');
end