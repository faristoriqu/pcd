function varargout = tomatt(varargin)
% TOMATT MATLAB code for tomatt.fig
%      TOMATT, by itself, creates a new TOMATT or raises the existing
%      singleton*.
%
%      H = TOMATT returns the handle to a new TOMATT or the handle to
%      the existing singleton*.
%
%      TOMATT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOMATT.M with the given input arguments.
%
%      TOMATT('Property','Value',...) creates a new TOMATT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tomatt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tomatt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tomatt

% Last Modified by GUIDE v2.5 22-Jul-2020 23:33:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tomatt_OpeningFcn, ...
                   'gui_OutputFcn',  @tomatt_OutputFcn, ...
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


% --- Executes just before tomatt is made visible.
function tomatt_OpeningFcn(hObject, eventdata, handles, varargin)
global data_universal
data_universal.MyData = [];
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tomatt (see VARARGIN)

% Choose default command line output for tomatt
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tomatt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tomatt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namafile,namapath]=uigetfile({'*.jpg*';'*.*'},'ambilgambar');
if ~isequal(namafile,0)
    handles.gambar1=imread(fullfile(namapath,namafile));
    handles.gambar = imresize(handles.gambar1,[300 300]);
    guidata(hObject,handles);
    axes(handles.citraasli);
    imshow(handles.gambar1);
    nama_file1=namafile;
    set(handles.namagambar,'String',nama_file1);
    set(handles.namaalamat,'String',[namapath,namafile]);
else
    return;
end


function namagambar_Callback(hObject, eventdata, handles)
% hObject    handle to namagambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namagambar as text
%        str2double(get(hObject,'String')) returns contents of namagambar as a double


% --- Executes during object creation, after setting all properties.
function namagambar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namagambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function namaalamat_Callback(hObject, eventdata, handles)
% hObject    handle to namaalamat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namaalamat as text
%        str2double(get(hObject,'String')) returns contents of namaalamat as a double


% --- Executes during object creation, after setting all properties.
function namaalamat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namaalamat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;
L = rgb2hsv(gambar);
I = L(:,:,2);
axes(handles.citrasaturasi);
imshow(I); 
% Histogram
% blue = gambar (:,:,3);
axes(handles.histogram),imhist(I);
guidata(hObject,handles);

threshold = graythresh(I);
bw = im2bw(I,threshold);
bw = bwareaopen(bw,30);
 
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
axes(handles.citrabiner);
imshow(bw); 

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pilihan = questdlg('Are you really want to reset all?', ...
 'Reset', ...
 'Yes','No','No');
% Handle response
switch pilihan
    case 'Yes'
        set(handles.namagambar,'String','');
        set(handles.namaalamat,'String','');
        axes(handles.citraasli)
        cla reset
        set(gca,'XTick',[])
        set(gca,'YTick',[]) 
        axes(handles.citrasaturasi);
        cla reset
        set(gca,'XTick',[])
        set(gca,'YTick',[])
        axes(handles.histogram);
        cla reset
        set(gca,'XTick',[])
        set(gca,'YTick',[])
        axes(handles.citrabiner);
        set(handles.nilaired,'String','');
        set(handles.nilaigreen,'String','');
        set(handles.nilaiblue,'String','');
        set(handles.nilaiarea,'String','');
        set(handles.nilaiperimeter,'String','');
        set(handles.nilaieccentricity,'String','');
        set(handles.tabel,'data','')
    case 'No'
        return;
end

% --- Executes on button press in warna.
function warna_Callback(hObject, eventdata, handles)
% hObject    handle to warna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
gambar = handles.gambar;
red = gambar(:,:,1);
green = gambar(:,:,2);
blue = gambar(:,:,3);

fr = mean(mean(red));
fg = mean(mean(green));
fb = mean(mean(blue));
frr = fr/255;
fbb = fg/255;
fcc = fb/255;

set(handles.nilaired,'string',fr)
set(handles.nilaigreen,'string',fg)
set(handles.nilaiblue,'string',fb)

% --- Executes on button press in bentuk.
function bentuk_Callback(hObject, eventdata, handles)
% hObject    handle to bentuk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;
L = rgb2hsv(gambar);
I = L(:,:,2);
threshold = graythresh(I);
bw = im2bw(I,threshold);
bw = bwareaopen(bw,30);
 
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
[B,L] = bwboundaries(bw,'noholes');
 
hold on
for k = 1:length(B)  
end
 
stats = regionprops(L,'Area','Centroid','Eccentricity');
 
for k = 1:length(B)
    boundary = B{k};
    delta_sq = diff(boundary).^2;
    perimeter = sum(sqrt(sum(delta_sq,2)));
    area = stats(k).Area;
    eccentricity = stats(k).Eccentricity;
    metric = 4*pi*area/perimeter^2;
     
    centroid = stats(k).Centroid;
    set(handles.nilaiarea,'string',num2str(area));
    set(handles.nilaiperimeter,'string',num2str(perimeter));
    set(handles.nilaieccentricity,'string',num2str(eccentricity));
    
end


function nilaigreen_Callback(hObject, eventdata, handles)
% hObject    handle to nilaigreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaigreen as text
%        str2double(get(hObject,'String')) returns contents of nilaigreen as a double


% --- Executes during object creation, after setting all properties.
function nilaigreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaigreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiblue_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiblue as text
%        str2double(get(hObject,'String')) returns contents of nilaiblue as a double


% --- Executes during object creation, after setting all properties.
function nilaiblue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaired_Callback(hObject, eventdata, handles)
% hObject    handle to nilaired (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaired as text
%        str2double(get(hObject,'String')) returns contents of nilaired as a double


% --- Executes during object creation, after setting all properties.
function nilaired_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaired (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiarea_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiarea as text
%        str2double(get(hObject,'String')) returns contents of nilaiarea as a double


% --- Executes during object creation, after setting all properties.
function nilaiarea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiperimeter_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiperimeter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiperimeter as text
%        str2double(get(hObject,'String')) returns contents of nilaiperimeter as a double


% --- Executes during object creation, after setting all properties.
function nilaiperimeter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiperimeter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaieccentricity_Callback(hObject, eventdata, handles)
% hObject    handle to nilaieccentricity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaieccentricity as text
%        str2double(get(hObject,'String')) returns contents of nilaieccentricity as a double


% --- Executes during object creation, after setting all properties.
function nilaieccentricity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaieccentricity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in masukkan.
function masukkan_Callback(hObject, eventdata, handles)
% hObject    handle to masukkan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_universal
excel_red = get(handles.nilaired,'string');
excel_green = get(handles.nilaigreen,'string'); 
excel_blue = get(handles.nilaiblue,'string');
excel_area = get(handles.nilaiarea,'string');
excel_perimeter = get(handles.nilaiperimeter,'string');
excel_eccentricity = get(handles.nilaieccentricity,'string');

data_universal.MyData = [data_universal.MyData ; [{excel_red} {excel_green} {excel_blue} {excel_area} {excel_perimeter} {excel_eccentricity}]];
set(handles.tabel,'Data',data_universal.MyData)

set(handles.nilaired,'String',''); 
set(handles.nilaigreen,'String','');
set(handles.nilaiblue,'String',''); 
set(handles.nilaiarea,'String',''); 
set(handles.nilaiperimeter,'String','');
set(handles.nilaieccentricity,'String','');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
export=get(handles.tabel,'data'); 
headers = {'red','green','blue','area','perimeter','eccentricity'}; 
xlswrite('Tomat.xlsx',[headers; export]);


% --------------------------------------------------------------------



% hObject    handle to beranda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function program_Callback(hObject, eventdata, handles)
% hObject    handle to program (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','on');
set(handles.uipanel5,'visible','off');


% --------------------------------------------------------------------
function keluar_Callback(hObject, eventdata, handles)
% hObject    handle to keluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pilihan = questdlg('Are you really want to exit the program?', ...
 'Close the program', ...
 'Yes','No','No');
% Handle response
switch pilihan
    case 'Yes'
        close(tomatt);
    case 'No'
        return;
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel5,'visible','off');


% --------------------------------------------------------------------
function Home_Callback(hObject, eventdata, handles)
set(handles.uipanel5,'visible','on');
% hObject    handle to Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
