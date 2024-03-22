function varargout = GYUI(varargin)
% GYUI MATLAB code for GYUI.fig
%      GYUI, by itself, creates a new GYUI or raises the existing
%      singleton*.
%
%      H = GYUI returns the handle to a new GYUI or the handle to
%      the existing singleton*.
%
%      GYUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GYUI.M with the given input arguments.
%
%      GYUI('Property','Value',...) creates a new GYUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GYUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GYUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GYUI

% Last Modified by GUIDE v2.5 05-Jan-2023 21:15:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GYUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GYUI_OutputFcn, ...
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


% --- Executes just before GYUI is made visible.
function GYUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GYUI (see VARARGIN)

% Choose default command line output for GYUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GYUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GYUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload_picture.
function upload_picture_Callback(hObject, eventdata, handles)
a = uigetfile('.png');
a = imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a);
% hObject    handle to upload_picture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exec_cod.
function exec_cod_Callback(hObject, eventdata, handles)
% hObject    handle to exec_cod (see GCBO)
axes(handles.axes1);
a = getappdata(0,'a');
Sageti(a);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
