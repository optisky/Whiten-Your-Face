%% -------------------------------------------------------------------------------------
% % 创建用户界面
% % uicontrol: 创建用户界面控件
% % getfile: 获取图像文件并打开
% % beautification: 图像处理的主程序
% % save_image: 保存图像
%% -------------------------------------------------------------------------------------

%% -------------------------------------------------------------------------------------
clear;
clc;
global f GrayWindowWidth state;
f = figure(1);
set(f,'pos',[200, 80, 600, 600],'name','图像处理');
aImage = axes('parent',f,'pos',[0.1, 0.15, 0.8, 0.75],'Visible','off');

uicontrol('parent',f,'style','pushbutton','string','打开图片','pos',[150, 550, 100, 30],...
    'fontsize',10,'callback','getfile');

uicontrol('parent',f,'style','pushbutton','string','开始处理','pos',[350 550 100 30],...
    'fontsize',10,'callback','beautification');

uicontrol('parent',f,'style','pushbutton','string','输出图像','pos',[300 50 100 30],...
    'fontsize',10,'callback',@(o,e)save_image(o,e));
uicontrol('parent',f,'style','edit','pos',[200 50 100 30],'fontsize',10,'tag','name',...
    'string','filename');
uicontrol('parent',f,'style','radiobutton','string','连续处理','pos',[50,60,100,30],...
    'tag','normal_radio','value',1,'callback',@(o,e)NormalRadio_callback(o,e));
uicontrol('parent',f,'style','radiobutton','string','测试模式','pos',[50,30,100,30],...
    'tag','test_radio','value',0,'callback',@(o,e)TestRadio_callback(o,e));

if isempty(GrayWindowWidth)
    GrayWindowWidth = 31;
end
    
% if state
%     hSlider = uicontrol('parent',f,'style','slider','string','灰度窗口(像素x像素)',...
%         'pos',[50,10,200,15],'tag','slider','value',GrayWindowWidth,'Min',1,'Max',100,'SliderStep',[0.01,0.01]);
% end

%% ---------------------------------------------------------------------------------------