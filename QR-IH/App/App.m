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

% Last Modified by GUIDE v2.5 17-May-2015 13:48:38

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
global BGM;
global BGMflag1;
global BGMflag2;
BGMflag1=1;
BGMflag2=1;
HH=axes('units','normalized','position',[0 0 1 1]);     %自适应背景，不明觉厉！
uistack(HH,'up');
image(imread('少少.jpg'));
colormap gray;
set(HH,'handlevisibility','off','visible','off');       %控件背景
set(handles.pushbutton1,'cdata',imread('少少.jpg'));
set(handles.pushbutton2,'cdata',imread('少少.jpg'));
set(handles.pushbutton3,'cdata',imread('少少.jpg'));
set(handles.pushbutton4,'cdata',imread('少少.jpg'));


% --- Outputs from this function are returned to the command line.
function varargout = App_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%可中断与可中断指令，于“Property Inspector”中设置！
global BGM;
global BGMflag1;
global BGMflag2;
load handel;        %放在前面，否则没声音，但是？
clc;
if(BGMflag1==1)
    BGMflag1=0;
    while(~BGMflag1)%吾简直是个天才！
        switch BGMflag2
            case 01
                BGMflag2=2;         %再加一个按键并利用eval()函数便可以实现选择需要的播放模式了，eval()是一个非常精髓的函数！
                [Bgm,Fs]=wavread('一舞倾城-秦时明月.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(130);
            case 02
                BGMflag2=3;
                [Bgm,Fs]=wavread('飞雪玉花-秦时明月.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(188);
            case 03
                BGMflag2=4;
                [Bgm,Fs]=wavread('易水两岸-秦时明月.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(75);
            otherwise
                BGMflag2=1;
                [Bgm,Fs]=wavread('幻音宝盒-秦时明月.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(87);
        end
    end
else
    BGMflag1=1;
    stop(BGM);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BGM;
clc;
close(App);
stop(BGM);                              



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;Np=42;
[Sel,Oo]=listdlg('liststring',{'1.Optimal','2.Original'},'listsize',[180 80],'OkString','Yes','CancelString','Cancel','promptstring','Scheme','name','方案选择','selectionmode','single');
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
            ing=pwd;                                  %保存当前路径，保存完后换回
            cd(PathName);                             %将当前路径修改为存储路径
            imwrite(Disp,FileName);
            cd(ing);
        end
    end
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;Np=42;
[Sel,Oo]=listdlg('liststring',{'1.Optimal','2.Original'},'listsize',[180 80],'OkString','Yes','CancelString','Cancel','promptstring','Scheme','name','方案选择','selectionmode','single');
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
%输入信息时不要点取消！
%如果解码可以足够快，那么背景音乐就没有什么问题了！

