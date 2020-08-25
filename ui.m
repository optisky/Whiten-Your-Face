%% -------------------------------------------------------------------------------------
% % �����û�����
% % uicontrol: �����û�����ؼ�
% % getfile: ��ȡͼ���ļ�����
% % beautification: ͼ�����������
% % save_image: ����ͼ��
%% -------------------------------------------------------------------------------------

%% -------------------------------------------------------------------------------------
clear;
clc;
global f GrayWindowWidth state;
f = figure(1);
set(f,'pos',[200, 80, 600, 600],'name','ͼ����');
aImage = axes('parent',f,'pos',[0.1, 0.15, 0.8, 0.75],'Visible','off');

uicontrol('parent',f,'style','pushbutton','string','��ͼƬ','pos',[150, 550, 100, 30],...
    'fontsize',10,'callback','getfile');

uicontrol('parent',f,'style','pushbutton','string','��ʼ����','pos',[350 550 100 30],...
    'fontsize',10,'callback','beautification');

uicontrol('parent',f,'style','pushbutton','string','���ͼ��','pos',[300 50 100 30],...
    'fontsize',10,'callback',@(o,e)save_image(o,e));
uicontrol('parent',f,'style','edit','pos',[200 50 100 30],'fontsize',10,'tag','name',...
    'string','filename');
uicontrol('parent',f,'style','radiobutton','string','��������','pos',[50,60,100,30],...
    'tag','normal_radio','value',1,'callback',@(o,e)NormalRadio_callback(o,e));
uicontrol('parent',f,'style','radiobutton','string','����ģʽ','pos',[50,30,100,30],...
    'tag','test_radio','value',0,'callback',@(o,e)TestRadio_callback(o,e));

if isempty(GrayWindowWidth)
    GrayWindowWidth = 31;
end
    
% if state
%     hSlider = uicontrol('parent',f,'style','slider','string','�Ҷȴ���(����x����)',...
%         'pos',[50,10,200,15],'tag','slider','value',GrayWindowWidth,'Min',1,'Max',100,'SliderStep',[0.01,0.01]);
% end

%% ---------------------------------------------------------------------------------------