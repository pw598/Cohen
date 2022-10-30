function varargout = guide2sigmoid(varargin)
% GUIDE2SIGMOID MATLAB code for guide2sigmoid.fig
%      GUIDE2SIGMOID, by itself, creates a new GUIDE2SIGMOID or raises the existing
%      singleton*.
%
%      H = GUIDE2SIGMOID returns the handle to a new GUIDE2SIGMOID or the handle to
%      the existing singleton*.
%
%      GUIDE2SIGMOID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE2SIGMOID.M with the given input arguments.
%
%      GUIDE2SIGMOID('Property','Value',...) creates a new GUIDE2SIGMOID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide2sigmoid_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide2sigmoid_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide2sigmoid

% Last Modified by GUIDE v2.5 01-Apr-2018 22:53:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide2sigmoid_OpeningFcn, ...
                   'gui_OutputFcn',  @guide2sigmoid_OutputFcn, ...
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


% --- Executes just before guide2sigmoid is made visible.
function guide2sigmoid_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide2sigmoid (see VARARGIN)

% get the default parameters
a = get(handles.slider_a,'Value');
b = get(handles.slider_b,'Value');
c = get(handles.slider_c,'Value');

handles.x = linspace(-5,5,400);


% X
% clc
% addlistener(handles.slider_a,'Value','PostSet',@(a,b) disp(get(b.AffectedObject.Parent)));
% addlistener(handles.slider_a,'Value','PostSet',@(~,b) updateSigmoid(guidata(b.Source)));



% compute a sigmoid
sigmoid = a ./ (1 + exp(-b*(handles.x-c)) );

% plot the sigmoid
handles.plots = plot(handles.sigaxis,handles.x,sigmoid,'linew',3);
% add some lines
hold(handles.sigaxis,'on')
ylim = [-.1 5.1];
plot(handles.sigaxis,[0 0],ylim,'k--')
handles.plotc = plot(handles.sigaxis,[c c],ylim,'r--');
handles.plota = plot(handles.sigaxis,handles.x([1 end]),[1 1]*a/2,'b--');
set(handles.sigaxis,'ylim',ylim)


% Choose default command line output for guide2sigmoid
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guide2sigmoid wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide2sigmoid_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_a_Callback(hObject, eventdata, handles)
% hObject    handle to slider_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


updateSigmoid(handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_b_Callback(hObject, eventdata, handles)
% hObject    handle to slider_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateSigmoid(handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_c_Callback(hObject, eventdata, handles)
% hObject    handle to slider_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateSigmoid(handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function updateSigmoid(handles)
% get the new parameter values
a = get(handles.slider_a,'Value');
b = get(handles.slider_b,'Value');
c = get(handles.slider_c,'Value');

% compute a sigmoid
sigmoid = a ./ (1 + exp(-b*(handles.x-c)) );

% update the sigmoid handle
set(handles.plots,'YData',sigmoid);

% update the lines
set(handles.plotc,'XData',[c c])
set(handles.plota,'YData',[1 1]*a/2)












