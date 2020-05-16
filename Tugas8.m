function varargout = Tugas8(varargin)
% TUGAS8 MATLAB code for Tugas8.fig
%      TUGAS8, by itself, creates a new TUGAS8 or raises the existing
%      singleton*.
%
%      H = TUGAS8 returns the handle to a new TUGAS8 or the handle to
%      the existing singleton*.
%
%      TUGAS8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS8.M with the given input arguments.
%
%      TUGAS8('Property','Value',...) creates a new TUGAS8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tugas8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tugas8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tugas8

% Last Modified by GUIDE v2.5 16-May-2020 22:47:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tugas8_OpeningFcn, ...
                   'gui_OutputFcn',  @Tugas8_OutputFcn, ...
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


% --- Executes just before Tugas8 is made visible.
function Tugas8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tugas8 (see VARARGIN)

% Choose default command line output for Tugas8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tugas8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tugas8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'DataTugas.xlsx';
sheet = 1;
range = 'G5:J9';
data = xlsread(filename,sheet,range);%pembacaan isi excel
range = 'E5:E9';
data2 = xlsread(filename,sheet,range);%pembacaan isi excel
range = 'F5:F9';
[~,text] = xlsread(filename,sheet,range);%pembacaan isi excel
range = 'E5:J9';
[~,~,ReadData] = xlsread(filename,sheet,range);%pembacaan isi excel
 k = [0,1,1,1,]; % 1 = benefit ,0 = cost
 w=[0.2,0.3,0.3,0.15];
 [m n]=size (data);
 R=zeros (m,n);
 Y=zeros (m,n);
 for j=1:n
     if k(j)==1 
         R(:,j)=data(:,j)./max(data(:,j));
     else
         R(:,j)=min(data(:,j))./data(:,j);
     end
 end
 for i=1:m
     V(i)= sum(w.*R(i,:));
 end
 for i=1:m
     if max(V)==V(i)
         data1 = data2(i);
         data2 = text(i);
         data3 = V(i);
     end 
 end
 char = int2str(data1);%merubah int to string
 hasil= transpose(V);%membuat menjadi baris
 xlswrite('Hasilnya.xlsx', hasil);%isi excel
 ReadData2 = xlsread('Hasilnya.xlsx');%pembacaan isi excel
 %isi rekomendasi
 set(handles.editnik,'string',char); 
 set(handles.editnama,'string',data2);
 set(handles.editHasilnya,'string',data3);
 set(handles.uitable1,'Data',ReadData);
 set(handles.uitable2,'Data',ReadData2);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editnik_Callback(hObject, eventdata, handles)
% hObject    handle to editnik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editnik as text
%        str2double(get(hObject,'String')) returns contents of editnik as a double


% --- Executes during object creation, after setting all properties.
function editnik_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editnik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editnama_Callback(hObject, eventdata, handles)
% hObject    handle to editnama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editnama as text
%        str2double(get(hObject,'String')) returns contents of editnama as a double


% --- Executes during object creation, after setting all properties.
function editnama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editnama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editHasil_Callback(hObject, eventdata, handles)
% hObject    handle to editHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editHasil as text
%        str2double(get(hObject,'String')) returns contents of editHasil as a double


% --- Executes during object creation, after setting all properties.
function editHasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editHasilnya_Callback(hObject, eventdata, handles)
% hObject    handle to editHasilnya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editHasilnya as text
%        str2double(get(hObject,'String')) returns contents of editHasilnya as a double


% --- Executes during object creation, after setting all properties.
function editHasilnya_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editHasilnya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
