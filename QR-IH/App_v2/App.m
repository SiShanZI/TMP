function varargout = App(varargin)
% APP MATLAB code for App.fig
%      APP, by itself, creates a new APP or raises the existing
%      singleton*.
%
%      H = APP returns the handle to a new APP or the handle to
%      the existing singleton*.
%
%      APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP.M with the given input arguments.
%
%      APP('Property','Value',...) creates a new APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App

% Last Modified by GUIDE v2.5 24-Oct-2015 16:13:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_OpeningFcn, ...
                   'gui_OutputFcn',  @App_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before App is made visible.
function App_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App (see VARARGIN)

% Choose default command line output for App
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Np;
global BGM;
global BGMflag1;
global BGMflag2;
Np=42;
BGM=[];
BGMflag1=1;
BGMflag2=1;
Background=axes('units','normalized','position',[0 0 1 1]);
uistack(Background,'up');
image(imread('少少.jpg'));
colormap gray;
set(Background,'handlevisibility','off','visible','off');
%自适应背景，不明觉厉！


% --- Outputs from this function are returned to the command line.
function varargout = App_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
global BGM;
global BGMflag1;
if(BGMflag1==0)
BGMflag1=1;
stop(BGM);
end


% --------------------------------------------------------------------
function Menu_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BGM;
global BGMflag1;
global BGMflag2;
load handel;        %放在前面，否则没声音，但是？
clc;
if(BGMflag1==1)
BGMflag1=0;
while(~BGMflag1)    %吾简直是个天才！
switch BGMflag2
case 01
BGMflag2=2;         %再加一个按键并利用eval()函数便可以实现选择需要的播放模式了，eval()是一个非常精髓的函数！
[Bgm,Fs]=audioread('一舞倾城-秦时明月.wav');
case 02
BGMflag2=3;
[Bgm,Fs]=audioread('飞雪玉花-秦时明月.wav');
case 03
BGMflag2=4;
[Bgm,Fs]=audioread('易水两岸-秦时明月.wav');
otherwise
BGMflag2=1;
[Bgm,Fs]=audioread('幻音宝盒-秦时明月.wav');
end
BGM=audioplayer(Bgm,Fs);
playblocking(BGM);
end
else
BGMflag1=1;
stop(BGM);
end


% --------------------------------------------------------------------
function Menu_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_2_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Np;
clc;
[Sel,Oo]=listdlg('liststring',{'1.无密钥方案','2.加密钥方案'},'listsize',[150 150],'OkString','Yes','CancelString','Cc','promptstring','Scheme','name','方案选择','selectionmode','single');
if(Oo==1)
[FileName,PathName,FileIndex]=uigetfile({'*.bmp';'*.png';'*.gif'},'你的Cover?','*.png');
if(FileIndex~=0)
FileAddress=strcat(PathName,FileName);        
image=im2bw(rgb2gray(imread(FileAddress)));   %从二维码软件得到的QR码图像一般是rgb图像
switch Sel
case 01
[Disp,Loss]=Optimize_En(image,Np,Sel);
otherwise
[Disp,Loss]=Original_En(image,Np,Sel);
end
Msg=sprintf('失真率：%.2f',Loss*100);
Msg=strcat(Msg,'%');
Oo=msgbox(Msg,'完毕!','on');      
waitfor(Oo);
Disp=Disp.*255;                               %二值转灰度
Disp=Gr_rgb(Disp);                            %灰度转“RGB”
[FileName,PathName,FileIndex]=uiputfile({'*.bmp';'*.png';'*.gif'},'Save as','*.png');
if(FileIndex~=0)
ing=pwd;                                      %保存当前路径，保存完后换回
cd(PathName);                                 %将当前路径修改为存储路径
imwrite(Disp,FileName);
cd(ing);
end
end
end
clc;


% --------------------------------------------------------------------
function Menu_2_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Np;
clc;
[Sel,Oo]=listdlg('liststring',{'1.无密钥方案','2.加密钥方案'},'listsize',[150 150],'OkString','Yes','CancelString','Cc','promptstring','Scheme','name','方案选择','selectionmode','single');
if(Oo==1)
[FileName,PathName,FileIndex]=uigetfile({'*.bmp';'*.png';'*.gif'},'大侠，要查谁?','*.png');
if(FileIndex~=0)
FileAddress=strcat(PathName,FileName);
image=im2bw(rgb2gray(imread(FileAddress)));
switch Sel
case 01
Message=Optimize_De(image,Np);
otherwise
Message=Original_De(image,Np);
end
Oo=msgbox(Message,'噤声！','on');
waitfor(Oo);
end
end
clc;
%输入信息时不要点取消！
%如果解码可以足够快，那么背景音乐就没有什么问题了！
