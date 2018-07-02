function varargout = Einstellungen(varargin)
% EINSTELLUNGEN MATLAB code for Einstellungen.fig
%      EINSTELLUNGEN, by itself, creates a new EINSTELLUNGEN or raises the existing
%      singleton*.
%
%      H = EINSTELLUNGEN returns the handle to a new EINSTELLUNGEN or the handle to
%      the existing singleton*.
%
%      EINSTELLUNGEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EINSTELLUNGEN.M with the given input arguments.
%
%      EINSTELLUNGEN('Property','Value',...) creates a new EINSTELLUNGEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Einstellungen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Einstellungen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Einstellungen

% Last Modified by GUIDE v2.5 18-May-2017 01:40:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Einstellungen_OpeningFcn, ...
                   'gui_OutputFcn',  @Einstellungen_OutputFcn, ...
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


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Einstellungen Laden...kopierte und erweiterte Funktion aus dem Hauptprogramm++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



% --- Executes just before Einstellungen is made visible.
function Einstellungen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Einstellungen (see VARARGIN)




% Choose default command line output for Einstellungen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Einstellungen wait for user response (see UIRESUME)
% uiwait(handles.figure_Einstellungen);


% --- Outputs from this function are returned to the command line.
function varargout = Einstellungen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Verzeichnis_und_Name = fullfile( 'Daten','AppDaten' , 'Einstellungen.mat');
%% Wenn Datei existiert dann laden

H=handles.figure_Einstellungen;

if exist(Verzeichnis_und_Name,'file') ==2       
    fprintf('|...Einstellungen gefunden                    |\n') 
    tmp=load(Verzeichnis_und_Name); %Datei Laden...ist leider struct mit name tmp
    Geladene_Einstellungen=tmp.Einstellungen;  %Ursprüngliches struct herstellen...tiefer rein schaun
    
    %%%autorun_checkbox beim Starten der GUI
    setappdata(H,'autorun',Geladene_Einstellungen.autorun);
    set(handles. autorun_checkbox,'Value',getappdata(H,'autorun'))%In der GUI anzeigen
    
    %%%Schriftgröße/Farbe:
    setappdata(H,'groesse',Geladene_Einstellungen.groesse);
    set(handles.EINSTELLUNGEN_groesse,'String',getappdata(H,'groesse'))%In der GUI anzeigen
  

    setappdata(H,'groesseUeberschrift',num2str(str2num(getappdata(H,'groesse'))*1.4))
    setappdata(H,'groesseAchse' , num2str(str2num(getappdata(H,'groesse'))*1.3))
    %Die farben werden mit '\color{farbe}' geändert, alle nachfolgenden character haben die selbe Farbe...bei 'interpreter','Tex'

    %%%Genauigkeit in der Anzeige:
    setappdata(H,'nachkomma',Geladene_Einstellungen.nachkomma)
   set(handles.EINSTELLUNGEN_Nachkomma,'String',getappdata(H,'nachkomma'))%In der GUI anzeigen
    

    %%%Frequenzeinheit='Hz'
    setappdata(H,'Frequenzeinheit',Geladene_Einstellungen.Frequenzeinheit) 
  
    if strcmp(getappdata(H,'Frequenzeinheit'),'Hz')
    set(handles.radiobutton_Hz,'Value',1)%In der GUI anzeigen
    else
    set(handles.radiobutton_rad,'Value',1)%In der GUI anzeigen
    end
    
    fprintf('|...Einstellungen geladen                     |\n') 
%% ansonsten standard generieren
else
  %%%%%%Savety Routine, falls die Einstellungen ausversehen gelöscht wurden, diese mit defaultwerten neu generieren
    fprintf('|(X)[Einstellungen nicht gefunden]            |\n') 
    fprintf('|...generiere standard Einstellungen          |\n') 
    
    %%%autorun_checkbox beim Starten der GUI
    setappdata(H,'autorun',true);
    
    %%%Schriftgröße/Farbe:
    setappdata(H,'groesse','9');

    setappdata(H,'groesseUeberschrift',num2str(str2num(getappdata(H,'groesse'))*1.4))
    setappdata(H,'groesseAchse' , num2str(str2num(getappdata(H,'groesse'))*1.3))
    %Die farben werden mit '\color{farbe}' geändert, alle nachfolgenden character haben die selbe Farbe...bei 'interpreter','Tex'

    %%%Genauigkeit in der Anzeige:
    setappdata(H,'nachkomma',2)


    %%%Frequenzeinheit='Hz'
    setappdata(H,'Frequenzeinheit','rad/s')
    
    
    Einstellungen=struct('autorun', getappdata(H,'autorun'),'groesse',getappdata(H,'groesse'),'nachkomma',getappdata(H,'nachkomma'),'Frequenzeinheit',getappdata(H,'Frequenzeinheit'));
 

    FileName_alle_Betriebssysteme = fullfile( 'Daten', 'AppDaten', 'Einstellungen'); %Verzeichnisse werden bei Linux und Apple anders geschreiben...die Funktion macht se universal lesbar
    save ([FileName_alle_Betriebssysteme], 'Einstellungen');
end





% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in EINSTELLUNGEN_Abbrechen.
function EINSTELLUNGEN_Abbrechen_Callback(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Abbrechen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H_Hauptprogramm=findobj(0,'Tag', 'figure_Adrians_tolles_Systemanalysetool');   %%%Handle des Hauptprogramms holen
setappdata(H_Hauptprogramm,'Einstellungen_geaendert',0) 
close gcf

% --- Executes on button press in Einstellungen_Uebernehmen.
function Einstellungen_Uebernehmen_Callback(hObject, eventdata, handles)
% hObject    handle to Einstellungen_Uebernehmen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ins Hauptprogramm schreiben
H_Hauptprogramm=findobj(0,'Tag', 'figure_Adrians_tolles_Systemanalysetool');   %%%Handle des Hauptprogramms holen
H=handles.figure_Einstellungen;
    %%%autorun_checkbox beim Starten der GUI
    setappdata(H_Hauptprogramm,'autorun',getappdata(H,'autorun'));
 
   
    
    %%%Schriftgröße/Farbe:
    setappdata(H_Hauptprogramm,'groesse',getappdata(H,'groesse'));

    setappdata(H_Hauptprogramm,'groesseUeberschrift',num2str(str2num(getappdata(H_Hauptprogramm,'groesse'))*1.4))
    setappdata(H_Hauptprogramm,'groesseAchse' , num2str(str2num(getappdata(H_Hauptprogramm,'groesse'))*1.3))
    %Die farben werden mit '\color{farbe}' geändert, alle nachfolgenden character haben die selbe Farbe...bei 'interpreter','Tex'

    %%%Genauigkeit in der Anzeige:
    setappdata(H_Hauptprogramm,'nachkomma',getappdata(H,'nachkomma'))

     %%%Frequenzeinheit='Hz'
    setappdata(H_Hauptprogramm,'Frequenzeinheit',getappdata(H,'Frequenzeinheit'))   
%% Symbole für den plot formatieren
%Formatierung im TeX interpreter (is immer als default drinnen) 
%(nicht in LaTeX formatiert... da Farbe und schriftart da ned veränderbar)
%...Symbole,  tiefer stellen,  Nachkommastellen abschneiden,  aus 'Inf' werde ''

%%%Frequenz bei Resonanz                
setappdata(H_Hauptprogramm,'Tex_Sym_wr' , ['\bf\fontsize{' getappdata(H_Hauptprogramm,'groesse') ' } \color{red} \omega_{r}']);


%%%Amplitude bei Resonanz                
setappdata(H_Hauptprogramm,'Tex_Sym_Ar' , ['\bf\fontsize{' getappdata(H_Hauptprogramm,'groesse') '} \color{red} A_{r}']);


%%%Durchtrittsfrequenz                        
setappdata(H_Hauptprogramm,'Tex_Sym_wD', ['\bf\fontsize{' getappdata(H_Hauptprogramm,'groesse') '} \color{blue} \omega_{D}']);


%%%Phasenreserve                              
setappdata(H_Hauptprogramm,'Tex_Sym_phiR' , ['\bf\fontsize{' getappdata(H_Hauptprogramm,'groesse') '} \color{blue} \phi_{R}']);


%%%kritische Frequenz                        
setappdata(H_Hauptprogramm,'Tex_Sym_wk' , ['\bf\fontsize{' getappdata(H_Hauptprogramm,'groesse') '} \color{black} \omega_{k}']);


%%%Amplitude bei wk                          
setappdata(H_Hauptprogramm,'Tex_Sym_Awk' , ['\bf\fontsize{' getappdata(H_Hauptprogramm,'groesse') '} \color{black} A(\omega_{k})']);

%%%Eingestellte Frequenz                    Hz oder rad/s
if strcmp(getappdata(H,'Frequenzeinheit'),'Hz')
    
    setappdata(H_Hauptprogramm,'Tex_Sym_Frequenzeinheit',' Hz');
else
   setappdata(H_Hauptprogramm,'Tex_Sym_Frequenzeinheit',' rad/s');
end


  
    
   
    
%% In der Einstellungsdatei speichern
H=handles.figure_Einstellungen;
Einstellungen=struct('autorun', getappdata(H,'autorun'),'groesse',getappdata(H,'groesse'),'nachkomma',getappdata(H,'nachkomma'),'Frequenzeinheit',getappdata(H,'Frequenzeinheit'));
 FileName_alle_Betriebssysteme = fullfile( 'Daten', 'AppDaten', 'Einstellungen'); %Verzeichnisse werden bei Linux und Apple anders geschreiben...die Funktion macht se universal lesbar
    save ([FileName_alle_Betriebssysteme], 'Einstellungen');
 fprintf('|...Einstellungen übernommen und gespeichert  |\n') 
    close gcf

%% Neu rechnen und plotten um Einstellungen zu übernehmen
%Funktion einer anderen Gui aufrufen
setappdata(H_Hauptprogramm,'Einstellungen_geaendert',1)   
    
   


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in EINSTELLUNGEN_Abbrechen.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Abbrechen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function EINSTELLUNGEN_Nachkomma_Callback(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Nachkomma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Einstellungen;
setappdata(H,'nachkomma',str2num(get(hObject,'String')))
% Hints: get(hObject,'String') returns contents of EINSTELLUNGEN_Nachkomma as text
%        str2double(get(hObject,'String')) returns contents of EINSTELLUNGEN_Nachkomma as a double


% --- Executes during object creation, after setting all properties.
function EINSTELLUNGEN_Nachkomma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Nachkomma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EINSTELLUNGEN_groesse_Callback(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_groesse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
H=handles.figure_Einstellungen;
setappdata(H,'groesse',get(hObject,'String'))
% Hints: get(hObject,'String') returns contents of EINSTELLUNGEN_groesse as text
%        str2double(get(hObject,'String')) returns contents of EINSTELLUNGEN_groesse as a double


% --- Executes during object creation, after setting all properties.
function EINSTELLUNGEN_groesse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_groesse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EINSTELLUNGEN_Achsenbeschriftung_Callback(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Achsenbeschriftung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EINSTELLUNGEN_Achsenbeschriftung as text
%        str2double(get(hObject,'String')) returns contents of EINSTELLUNGEN_Achsenbeschriftung as a double


% --- Executes during object creation, after setting all properties.
function EINSTELLUNGEN_Achsenbeschriftung_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Achsenbeschriftung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EINSTELLUNGEN_Plot_und_Legende_Callback(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Plot_und_Legende (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EINSTELLUNGEN_Plot_und_Legende as text
%        str2double(get(hObject,'String')) returns contents of EINSTELLUNGEN_Plot_und_Legende as a double


% --- Executes during object creation, after setting all properties.
function EINSTELLUNGEN_Plot_und_Legende_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EINSTELLUNGEN_Plot_und_Legende (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in autorun_checkbox.
function autorun_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to autorun_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Einstellungen;
setappdata(H,'autorun',get(hObject,'Value'))
% Hint: get(hObject,'Value') returns toggle state of autorun_checkbox


% --- Executes when selected object is changed in EINSTELLUNGEN_Frequenzeinheit.
function EINSTELLUNGEN_Frequenzeinheit_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in EINSTELLUNGEN_Frequenzeinheit 
% eventdata  reserved - to be defined in a future version of MATLAB
H=handles.figure_Einstellungen;
ausgewaehltesObject=get(handles.EINSTELLUNGEN_Frequenzeinheit,'SelectedObject');
if ausgewaehltesObject == handles.radiobutton_Hz
    setappdata(H,'Frequenzeinheit','Hz');
else
    setappdata(H,'Frequenzeinheit','rad/s');
end
% handles    structure with handles and user data (see GUIDATA)
