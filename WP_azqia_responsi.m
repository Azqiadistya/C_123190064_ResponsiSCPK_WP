function varargout = WP_azqia_responsi(varargin)
% WP_AZQIA_RESPONSI MATLAB code for WP_azqia_responsi.fig
%      WP_AZQIA_RESPONSI, by itself, creates a new WP_AZQIA_RESPONSI or raises the existing
%      singleton*.
%
%      H = WP_AZQIA_RESPONSI returns the handle to a new WP_AZQIA_RESPONSI or the handle to
%      the existing singleton*.
%
%      WP_AZQIA_RESPONSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WP_AZQIA_RESPONSI.M with the given input arguments.
%
%      WP_AZQIA_RESPONSI('Property','Value',...) creates a new WP_AZQIA_RESPONSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WP_azqia_responsi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WP_azqia_responsi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WP_azqia_responsi

% Last Modified by GUIDE v2.5 25-Jun-2021 22:29:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WP_azqia_responsi_OpeningFcn, ...
                   'gui_OutputFcn',  @WP_azqia_responsi_OutputFcn, ...
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


% --- Executes just before WP_azqia_responsi is made visible.
function WP_azqia_responsi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WP_azqia_responsi (see VARARGIN)

% Choose default command line output for WP_azqia_responsi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WP_azqia_responsi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WP_azqia_responsi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tampilData.
function tampilData_Callback(hObject, eventdata, handles)
% hObject    handle to tampilData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('Dataset.xlsx','C2:F51');%membaca 50 data teratas
set(handles.tabel1,'data',data);%menampilkan data di tabel1 pada GUI

% --- Executes on button press in prosesData.
function prosesData_Callback(hObject, eventdata, handles)
% hObject    handle to prosesData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('Dataset.xlsx','C2:F51');
x = [data];
k = [1,0,1,0];
%0 = cost
%1 = benefit
w = [3,5,4,1];%pembobotan yang sudah ditentukan

%TAHAP PERTAMA
[m,n]=size (x);%inisialisasi x
w=w./sum(w);%membagi bobot per kriteria dengan jumlah total seluruh bobot

%TAHAP KEDUA
for j=1:n
    if k(j)==0, w(j)=-1*w(j);
end
end
for i=1:m
    S(i)=prod(x(i,:).^w);
end

%TAHAP KETIGA
V= S/sum(S);
Skor_Max = max(V);
set(handles.hasil,'String',Skor_Max);

% --- Executes on button press in resetData.
function resetData_Callback(hObject, eventdata, handles)
% hObject    handle to resetData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabel1,'data','');
