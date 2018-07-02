function varargout = Bild(varargin)
% BILD MATLAB code for Bild.fig
%      BILD, by itself, creates a new BILD or raises the existing
%      singleton*.
%
%      H = BILD returns the handle to a new BILD or the handle to
%      the existing singleton*.
%
%      BILD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BILD.M with the given input arguments.
%
%      BILD('Property','Value',...) creates a new BILD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Bild_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Bild_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Bild

% Last Modified by GUIDE v2.5 23-May-2017 22:50:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Bild_OpeningFcn, ...
                   'gui_OutputFcn',  @Bild_OutputFcn, ...
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




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||======================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|-------------------------------------------|%%%%%%%%%%%%%%%%%%%%
%%%|| >> Startup Funktion  ||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%| Ab hier bin ich am Werk ...Adrian         |%%%%%%%%%%%%%%%%%%%%
%%%||======================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|-------------------------------------------|%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes just before Bild is made visible.
function Bild_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Bild (see VARARGIN)


H_Hauptprogramm=findobj(0,'Tag', 'figure_Adrians_tolles_Systemanalysetool');   %%%Handle des Hauptprogramms holen
Verzeichnis = fullfile( 'Daten','AppDaten' , filesep); %damits auch auf anderen Systeman läuft

axes(handles.Entsprechendes_Bild_anzeigen);

switch getappdata(H_Hauptprogramm,'Bild')
    case 'Geschmeidig'
        %%%Achtung figure muss bei Tools>GUI Options>Resize behavior >Proportional   sein...sonst klappts ned!!! 
        %imshow([Verzeichnis 'Ortskurve_bei_Muenchen.png'],'Border','tight')
        imshow([Verzeichnis 'Ortskurve_bei_Muenchen.png'])%funktioniert auch ohne dem 'Border','tight'
    case 'Regler'
        imshow([Verzeichnis 'Regler.png'])
    case 'Sprungantwort'
        imshow([Verzeichnis 'Sprungantwort.png'])
    case 'Ortskurve'
        imshow([Verzeichnis 'Ortskurve.png'])
    case 'KritischerPunkt'
        imshow([Verzeichnis 'KritischerPunkt.png'])
    case 'Bode'
        imshow([Verzeichnis 'Bode.png'])
            
end        

 % Bild in Originalgröße anzeigen
truesize

% Choose default command line output for Bild
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Bild wait for user response (see UIRESUME)
% uiwait(handles.figure_Bild);


% --- Outputs from this function are returned to the command line.
function varargout = Bild_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
% Get default command line output from handles structure
varargout{1} = handles.output;
