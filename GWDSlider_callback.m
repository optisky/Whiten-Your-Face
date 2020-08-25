function GWDSlider_callback(o,e)
    global hGWD GrayWindowWidth state;
    f = get(o,'parent');
    GWDSlider = findobj(f,'tag','GWDSlider');
    GrayWindowWidth = get(GWDSlider,'value');
    delete(hGWD);
    if state 
        hGWD = uicontrol('parent',f,'style','edit','string',num2str(uint8(GrayWindowWidth)),...
            'pos',[255,10,30,20],'tag','GWD','callback',@(o,e)GrayWindowWidth_callback(o,e));
    end
end
