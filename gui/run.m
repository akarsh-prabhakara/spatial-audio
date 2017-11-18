function varargout = run(varargin)
% run MATLAB code for run.fig
%      run, by itself, creates a new run or raises the existing
%      singleton*.
%
%      H = run returns the handle to a new run or the handle to
%      the existing singleton*.
%
%      run('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in run.M with the given input arguments.
%
%      run('Property','Value',...) creates a new run or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help run

% Last Modified by GUIDE v2.5 18-Nov-2017 11:37:10

% Begin initialization code - DO NOT EDIT

addpath('../src/');

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @run_OpeningFcn, ...
                   'gui_OutputFcn',  @run_OutputFcn, ...
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


% --- Executes just before run is made visible.
function run_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to run (see VARARGIN)

% Choose default command line output for run
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes run wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = run_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[handles.x,handles.fs] = wavread(handles.val);
guidata(hObject, handles);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String'));
handles.val = contents{get(hObject,'Value')};
display(handles.val)
guidata(hObject,handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.choice = get(hObject,'Value');
display(handles.choice)
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.opt = get(hObject,'Value');
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.choice == 1 || handles.choice == 3
    if handles.opt == 1 
        [l,r] = binaural_process(handles.x,0,handles.angle,1,handles.fs);
        soundsc([l r],handles.fs);
    elseif handles.opt == 2
        [l,r] = playback(handles.x,handles.fs,1);    
        soundsc([l r],handles.fs);
    elseif handles.opt == 3
        [l,r] = binaural_process(handles.x,str2double(handles.upAngle),0,1,handles.fs);    
        soundsc([l r],handles.fs);
    elseif handles.opt == 4
        [l,r] = playback(handles.x,handles.fs,2);     
        soundsc([l r],handles.fs);
    elseif handles.opt == 5
        [l,r] = playback(handles.x,handles.fs,3);     
        soundsc([l r],handles.fs);    
    end
elseif handles.choice == 2
    if handles.opt == 1
        [l,r]=loudspeaker(handles.x,0,handles.angle,1,handles.fs,0.15,30,0.4);
        soundsc([l r],handles.fs);
    elseif handles.opt == 2
        [l,r] = playback(handles.x,handles.fs,4);    
        soundsc([l r],handles.fs);    
    elseif handles.opt == 3
        [l,r]=loudspeaker(handles.x,str2double(handles.upAngle),0,1,handles.fs,0.15,30,0.4);   
        soundsc([l r],handles.fs);    
    elseif handles.opt == 4
        [l,r] = playback(handles.x,handles.fs,5);     
        soundsc([l r],handles.fs);
    elseif handles.opt == 5
        [l,r] = playback(handles.x,handles.fs,6);     
        soundsc([l r],handles.fs);    
    end
end

% --- Executes on button press in r1.
function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = -90;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r1


% --- Executes on button press in r2.
function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = -60;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r2


% --- Executes on button press in r3.
function r3_Callback(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = -30;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r3


% --- Executes on button press in r4.
function r4_Callback(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 0;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r4


% --- Executes on button press in r5.
function r5_Callback(hObject, eventdata, handles)
% hObject    handle to r5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 30;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r5


% --- Executes on button press in r6.
function r6_Callback(hObject, eventdata, handles)
% hObject    handle to r6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 60;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r6


% --- Executes on button press in r7.
function r7_Callback(hObject, eventdata, handles)
% hObject    handle to r7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 90;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of r7


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
display(round(get(hObject,'Value')/double(1/9)));
contents = cellstr(get(hObject,'String'));
handles.upAngle = contents{round(get(hObject,'Value')/double(1/9))};
display(handles.upAngle) 
handles.text5.String = handles.upAngle;
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function r1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in l1.
function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = -90;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l1


% --- Executes on button press in l7.
function l7_Callback(hObject, eventdata, handles)
% hObject    handle to l7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 90;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l7


% --- Executes on button press in l4.
function l4_Callback(hObject, eventdata, handles)
% hObject    handle to l4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 0;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l4


% --- Executes on button press in l2.
function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = -60;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l2


% --- Executes on button press in l3.
function l3_Callback(hObject, eventdata, handles)
% hObject    handle to l3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = -30;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l3


% --- Executes on button press in l5.
function l5_Callback(hObject, eventdata, handles)
% hObject    handle to l5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 30;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l5


% --- Executes on button press in l6.
function l6_Callback(hObject, eventdata, handles)
% hObject    handle to l6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    handles.angle = 60;
    display(handles.angle);
    guidata(hObject,handles);
end
% Hint: get(hObject,'Value') returns toggle state of l6



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


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[handles.text5,hObject] = gcbo;
guidata(hObject,handles);
