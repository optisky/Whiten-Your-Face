% beautification %
global f img OriginalImage GrayWindowWidth;

fprintf('\nCompleting...\n');

OriginalImage = uint8(OriginalImage);
test_radio = findobj(f,'tag','test_radio');
state = get(test_radio,'value');
if state
    img = OriginalImage;
end
GrayWindowWidth = double(GrayWindowWidth);
ImageEquiv;
GaussianBlur(GrayWindowWidth,80);
SkinWhitening(0.1);
RuddySkin;
imfeather(21,20);
%%
fprintf('\nDone.\n');