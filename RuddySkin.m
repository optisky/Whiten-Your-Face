%% 
function RuddySkin
    global img hImage skin
    img = uint8(~skin).*img + uint8(double(img).*skin*1.1);
    delete(hImage);
    hImage = imshow(img);
end