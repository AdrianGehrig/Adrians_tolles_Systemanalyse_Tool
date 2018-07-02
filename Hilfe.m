function varargout = Hilfe(varargin)
% HILFE MATLAB code for Hilfe.fig
%      HILFE, by itself, creates a new HILFE or raises the existing
%      singleton*.
%
%      H = HILFE returns the handle to a new HILFE or the handle to
%      the existing singleton*.
%
%      HILFE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HILFE.M with the given input arguments.
%
%      HILFE('Property','Value',...) creates a new HILFE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hilfe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hilfe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hilfe

% Last Modified by GUIDE v2.5 23-May-2017 23:59:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hilfe_OpeningFcn, ...
                   'gui_OutputFcn',  @Hilfe_OutputFcn, ...
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


% --- Executes just before Hilfe is made visible.
function Hilfe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hilfe (see VARARGIN)

H_Hauptprogramm=findobj(0,'Tag', 'figure_Adrians_tolles_Systemanalysetool');   %%%Handle des Hauptprogramms holen

Tex_Sym_wr=getappdata(H_Hauptprogramm,'Tex_Sym_wr');

Tex_Sym_Ar=getappdata(H_Hauptprogramm,'Tex_Sym_Ar');

Tex_Sym_wD=getappdata(H_Hauptprogramm,'Tex_Sym_wD');

Tex_Sym_wk=getappdata(H_Hauptprogramm,'Tex_Sym_wk');

Tex_Sym_Awk=getappdata(H_Hauptprogramm,'Tex_Sym_Awk');

Tex_Sym_Frequenzeinheit=getappdata(H_Hauptprogramm,'Tex_Sym_Frequenzeinheit');

Tex_Sym_phiR=getappdata(H_Hauptprogramm,'Tex_Sym_phiR');




axes(handles.axes1)
legende=[Tex_Sym_wr ' = Resonanzfrequenz ' newline ];
legende=[legende Tex_Sym_Ar ' = Amplitude bei Resonanz ' newline ];
legende=[legende Tex_Sym_wD ' = Durchtrittsfrequenz ' newline ];
legende=[legende Tex_Sym_phiR ' = Phasenreserve' newline ];
legende=[legende Tex_Sym_wk ' = Kritischefrequenz ' newline ];
legende=[legende Tex_Sym_Awk ' = Amplitude bei Kritischefrequenz ' newline ];


Funktion=text(0,0,legende);
set(Funktion,'fontsize',str2num(getappdata(H_Hauptprogramm,'groesseUeberschrift')));

% Choose default command line output for Hilfe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hilfe wait for user response (see UIRESUME)
% uiwait(handles.figure_Hilfe);


% --- Outputs from this function are returned to the command line.
function varargout = Hilfe_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Link_PID.
function Link_PID_Callback(hObject, eventdata, handles)
% hObject    handle to Link_PID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'http://www.technik-consulting.eu/Optimierung/Drohne_PID-Regelung.html';
web(url,'-browser')


% --- Executes on button press in Link_Buch.
function Link_Buch_Callback(hObject, eventdata, handles)
% hObject    handle to Link_Buch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://www.google.de/search?q=keine+panik+vor+regelungstechnik';
web(url,'-browser')
url ='https://recherche.bibkatalog.de/InfoGuideClient.fwssis/start.do?Login=wofwss';
web(url,'-browser')


% --- Executes on button press in Link_EMail.
function Link_EMail_Callback(hObject, eventdata, handles)
% hObject    handle to Link_EMail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
email = 'gehrig.adrian@gmail.com';
url = ['mailto:',email];
web('mailto:gehrig.adrian@gmail.com')
