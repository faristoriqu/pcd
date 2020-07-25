function varargout = beranda(varargin)
% BERANDA MATLAB code for beranda.fig
%      BERANDA, by itself, creates a new BERANDA or raises the existing
%      singleton*.
%
%      H = BERANDA returns the handle to a new BERANDA or the handle to
%      the existing singleton*.
%
%      BERANDA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BERANDA.M with the given input arguments.
%
%      BERANDA('Property','Value',...) creates a new BERANDA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before beranda_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to beranda_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help beranda

% Last Modified by GUIDE v2.5 22-Jul-2020 21:50:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @beranda_OpeningFcn, ...
                   'gui_OutputFcn',  @beranda_OutputFcn, ...
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


% --- Executes just before beranda is made visible.
function beranda_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to beranda (see VARARGIN)

% Choose default command line output for beranda
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes beranda wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = beranda_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
