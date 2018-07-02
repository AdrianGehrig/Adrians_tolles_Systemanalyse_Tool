
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     _       _      _                   _____     _ _               ____            _                                   _                  _____           _ 
%    / \   __| |_ __(_) __ _ _ __  ___  |_   _|__ | | | ___  ___    / ___| _   _ ___| |_ ___ _ __ ___   __ _ _ __   __ _| |_   _ ___  ___  |_   _|__   ___ | |
%   / _ \ / _` | '__| |/ _` | '_ \/ __|   | |/ _ \| | |/ _ \/ __|   \___ \| | | / __| __/ _ \ '_ ` _ \ / _` | '_ \ / _` | | | | / __|/ _ \   | |/ _ \ / _ \| |
%  / ___ \ (_| | |  | | (_| | | | \__ \   | | (_) | | |  __/\__ \    ___) | |_| \__ \ ||  __/ | | | | | (_| | | | | (_| | | |_| \__ \  __/   | | (_) | (_) | |
% /_/   \_\__,_|_|  |_|\__,_|_| |_|___/___|_|\___/|_|_|\___||___/___|____/ \__, |___/\__\___|_| |_| |_|\__,_|_| |_|\__,_|_|\__, |___/\___|___|_|\___/ \___/|_|
%                                    |_____|                   |_____|     |___/                                           |___/        |_____|               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|---------------------|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|--> Tipps und Tricks |%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|---------------------|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  
%||::::::::::::::::::::::::::::::::::::::::::::::::::::::::||
%||::::GANZ GANZ WICHTIG UM ALLES BESSER ZU VERSTEHEN::::::||
%||::::::::::::::::>>OBJEKTORIENTIERT<<::::::::::::::::::::||
%||::::::::::::::::::::::::::::::::::::::::::::::::::::::::||
%||--------------------------------------------------------||
%||%%Variablen in den 'GUI Workspace' speichern und holen  ||
%||%Jede GUI,figure,achse,und was auch immer ist ein       ||
%||%Object und hat handles(Eigenschaften),                 ||
%||%Mit H=findall(0,'type','figure') bekommt man das       ||
%||%aktuelle GUI object.                                   ||
%||%...besser ist es das object lieber direkt mit seinem   || 
%||Tag an zu sprechen, wenn andere Matlab figures offen    ||
%||sind bekommt man sonst ein falsches object              ||
%||%Mit handles=guidata(H) wird der Variable handles alle  ||
%||%Eigenschaften zugewiesen. Um nun direkt auf eine       ||                     << Léon    c:
%||%Eigenschaft zuzugreifen schreibt man handles.axes_Bode ||
%||%!!(handles muss hierbei in der Funktion bekannt sein)!!||
%||Vorsicht Variablen können gelesen werde...um sie aber   ||
%||zu speichern braucht man den Befehl                     ||
%||guidata(hObject,handles)                                ||
%||%Zusätzlich kann                                        ||
%||%man weitere Variablen(handles) anlegen.                ||
%||%Um die verpönten globalen Variablen zu umgehen,        ||
%||%speichert man Variablen mit setappdata() als handle in ||
%||%einem Object. Mit getappdata() kann diese variable     ||
%||%dann von einer anderen Funktion benutzt werden         ||
%||--------------------------------------------------------||
%||%H = findall(0,'type','figure');                        || %Verursacht probleme, wenn andere Matlab figures offen sind
%||H=handles.figure_Adrians_tolles_Systemanalysetool       || %Object lieber direkt durch ansprechen mit seinem tag holen(Jedes Objekt hat einen Eindeutigen Namen/Tag)
%||setappdata(hObject,'VariablenName',Wert);               ||
%||getappdata(hObject,'VariablenName')                     ||
%||                                                        ||
%||handles=guidata(H)                                      || %Auf alle Eigenschaften des ParentObjects(Urobjects/Hintergrundfigure...des ding, wo alles alles andre drauf sitzt) zugreifen
%||cla(handles.axes_GrafischeGleichung)                    || % altes Bild löschen...figure leeren
%||========================================================||

%|handles eines anderen Fensters bekommen
%|------------------------------------------
%|%https://de.mathworks.com/matlabcentral/answers/146215-pass-data-between-gui-s
%|object=findobj('Tag','figure_Adrians_tolles_Systemanalysetool')
%|handles = guidata(object)

%|Globale Variablen
%|-----------------
%|%Globale Variablen sind in Matlab eher "friend Variablen" überall wo sie
%|%gesehen werden sollen müssen sie erst wieder neu definiert werden,
%|%globaler Wert kann aber gelesen werden.
%|global G0
%|G1=G0




%|Zeilenumbruch
%|------------------------------------------
%|bodePeak=[sdbMpeak newline sFpeak]        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|---------------------|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|<-- Tipps und Tricks |%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|---------------------|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
function varargout = Adrians_tolles_Systemanalyse_toolV3_5(varargin)
%%
% ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5 MATLAB code for Adrians_tolles_Systemanalyse_toolV3_5.fig
%      ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5, by itself, creates a new ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5 or raises the existing
%      singleton*.
%
%      H = ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5 returns the handle to a new ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5 or the handle to
%      the existing singleton*.
%
%      ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5.M with the given input arguments.
%
%      ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5('Property','Value',...) creates a new ADRIANS_TOLLES_SYSTEMANALYSE_TOOLV3_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Adrians_tolles_Systemanalyse_toolV3_5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Adrians_tolles_Systemanalyse_toolV3_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Adrians_tolles_Systemanalyse_toolV3_5

% Last Modified by GUIDE v2.5 03-Dec-2017 02:41:48


% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Adrians_tolles_Systemanalyse_toolV3_5_OpeningFcn, ...
                   'gui_OutputFcn',  @Adrians_tolles_Systemanalyse_toolV3_5_OutputFcn, ...
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




%%
% --- Executes just before Adrians_tolles_Systemanalyse_toolV3_5 is made visible.
function Adrians_tolles_Systemanalyse_toolV3_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Adrians_tolles_Systemanalyse_toolV3_5 (see VARARGIN)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||======================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|-------------------------------------------|%%%%%%%%%%%%%%%%%%%%
%%%|| >> Startup Funktion  ||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%| Ab hier bin ich am Werk ...Adrian         |%%%%%%%%%%%%%%%%%%%%
%%%||======================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|-------------------------------------------|%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\n\n _____________________________________________ \n|=============================================|\n|          Starte Initialisierung:            | \n|=============================================|\n|...|-->                                      | \n');

%% Beispiele
%{
global G0
global s

s=tf('s');
wo=0.1;
d=0.005;
%G0=1/((s^2)/wo^2+(2*d*s)/wo+1)
%G0 = tf([0.04798 0.0464],[1 -1.81 0.9048],0.1)
%G0=(1+s)/((s/10-1)*(s/10+1))
%G0=(1+s)/((s/2-1)*(s/10+1))
%G0=1/(s^2 +s+1)
%G0=1.7/(4*s+1)^3
%G0=1.7/(4*s+1)^5
%G0=3/(4*s+1)^4

%G0= ((s/11+1)*(s/42+1))/((s/(2+1)*(s/5+1)*(s/27+1)*s)) 
G0= (27*(s/11+1)*(s/42+1))/(s*(s/2+1)*(s/5+1)*(s/27+1))

%}



%% setze globale variablen
fprintf('|...setze globale Variablen                   | \n')

%%% s=tf('s') für erleichterte Eingabe der Übertragungsfunktion
global s;
s=tf('s');   %%muss hier irgendwie direkt gesetzt werden...klappt ned mit setappdata(hObject,'s',tf('s'))...er findet des s dann ned bei eval()

%% Einstellungen laden
%H = findall(0,'type','figure');%%Verursacht probleme, wenn andere Matlab figures offen sind
H=handles.figure_Adrians_tolles_Systemanalysetool;

fprintf('|...Lade Einstellungen                        |\n')
Lade_Einstellungen(H)

%% Buttons mit Bildern Versorgen
Verzeichnis = fullfile( 'Daten','AppDaten' , filesep); %damits auch auf anderen Systeman läuft
set(handles.GUI_oeffnen, 'CData', mach_Bild_transparent_pfusch([Verzeichnis 'Open_24.png']) );
set(handles.GUI_Speichern, 'CData', mach_Bild_transparent_pfusch([Verzeichnis 'Save_Dirty_24.png']));
set(handles.GUI_Einstellungen, 'CData', mach_Bild_transparent_pfusch([Verzeichnis 'Settings_24.png']));
set(handles.GUI_Hilfe, 'CData', mach_Bild_transparent_pfusch([Verzeichnis 'Help_24.png']));
%set(handles.GUI_rechne, 'CData', mach_Bild_transparent_pfusch('Daten\AppDaten\rakete_27.png'));
set(handles.GUI_rechne, 'CData', imread([Verzeichnis 'rakete_30.png']));



% Choose default command line output for Adrians_tolles_Systemanalyse_toolV3_5
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

%% Abschließen...matlab springt weiter in interne Funktion zum generieren der Grafik...glaub ich jedenfalls xD
fprintf('|...generiere grafische Benutzeroberfläche    | \n')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||===========================================================================================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|| >> GUI ist jetzt Vollständig geladen und sichtbar...nachfolgende Funktion wird ausgeführt ||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||===========================================================================================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% UIWAIT makes Adrians_tolles_Systemanalyse_toolV3_5 wait for user response (see UIRESUME)
% uiwait(handles.figure_Adrians_tolles_Systemanalysetool);
% --- Outputs from this function are returned to the command line.
function varargout = Adrians_tolles_Systemanalyse_toolV3_5_OutputFcn(hObject, eventdata, handles) 
%%
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

varargout{1} = handles.output;

fprintf('|...-->|                                      |\n|=============================================|\n|        Initialisierung abgeschlossen        |\n|=============================================|\n')
fprintf('\n   >>> WILLKOMMEN ...LASS UNS ANFANGEN ! <<< \n\n\n')


%% lade Beispielfunktion, wenn eingestellt


if getappdata(hObject,'autorun') == true
    fprintf('|=============================================|\n|Autostart ist aktiviert...zeige Startfunktion|\n|=============================================|\n|...|-->                                      |\n')
%%%%%%%Hier öffnen() und dann getappdata(H,'String_G0') getappdata(H,'Name_Uebertragungsfunktion')

   Standardfunktion='G0';
   
   lade_Uebertragungsfunktion(Standardfunktion,handles) 
   Eingabe_Uebertragungsfunktion_Callback(handles.Eingabe_Uebertragungsfunktion, eventdata, handles); %%braucht handles vom textfelt um zu funktionieren, deswegen handles.Eingabe_Uebertragungsfunktion
   
   
   fprintf('|...-->|                                      |\n|=============================================|\n|Autostart abgeschlossen                      |\n|=============================================|\n')

    
    guidata(hObject, handles);
end



% Get default command line output from handles structure





function Eingabe_Callback(hObject, eventdata, handles)
% hObject    handle to Eingabe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function Eingabe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Eingabe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


    

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end


% --------------------------------------------------------------------
function Wichtige_Informationen_Callback(hObject, eventdata, handles)
% hObject    handle to Wichtige_Informationen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||=====================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|| >>    Eingabe       ||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||=====================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function Eingabe_Uebertragungsfunktion_Callback(hObject, eventdata, handles)
%%
% hObject    handle to Eingabe_Uebertragungsfunktion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


w = waitbar(0,'1','Name','Verarbeite Eingabe...');  %%Erzeuge Waitbar, die immer oben bleibt
frames = java.awt.Frame.getFrames();
frames(end).setAlwaysOnTop(1); 

global s

H=handles.figure_Adrians_tolles_Systemanalysetool;

waitbar(0/100,w,sprintf('Einlesen'))
%%%Einlesen
G0string=get(hObject,'String'); % Hints: get(hObject,'String') returns contents of Eingabe as text%        str2double(get(hObject,'String')) returns contents of Eingabe as a double
setappdata(H,'String_G0',G0string)
setappdata(H,'G0',eval(G0string)) %%%eval() führt den string wie als Eingabe in das komanndofenster aus...dadurch ist die eingabe der Übertragunfsfunktion mit der "s" schreibweise möglich
display(getappdata(H,'G0'))
fprintf('|=============================================|\n|            Verarbeite Eingabe:              | \n|=============================================|\n|...|-->                                      | \n');

%%% Eigenschaften neu berechnen
waitbar(10/100,w,sprintf('Alles neu berechnen '))
fprintf('|...Alles neu berechnen                       | \n')
Alles_neu_berechnen(H,getappdata(H,'G0'))
%%% Grafische Anzeige
waitbar(35/100,w,sprintf('generiere LaTeX Übertragungsfunktion '))
fprintf('|...generiere LaTeX Übertragungsfunktion      | \n')
Plotten_Uebertragungsfkt_grafisch(H)
%%% Bodediagramm plotten
waitbar(40/100,w,sprintf('plotte Bodediagramm '))
fprintf('|...plotte Bodediagramm                       | \n')
Plotten_Bode(H,getappdata(H,'G0'))
%%% Ortskurve plotten
waitbar(60/100,w,sprintf('plotte Ortskurve  '))
fprintf('|...plotte Ortskurve                          | \n')
Plotten_Ortskurve(H,getappdata(H,'G0'))
%%% Pol Nullstellen Diagramm plotten
waitbar(80/100,w,sprintf('plotte Pol Nullstellen Diagramm'))
fprintf('|...plotte Pol Nullstellen Diagramm          | \n')
Plotten_PolNullstellen(H,getappdata(H,'G0'))
%%% Sprungantwort plotten
waitbar(86.66/100,w,sprintf('plotte Sprungantwort '))
fprintf('|...plotte Sprungantwort                      | \n')
Plotten_Sprungantwort(H,getappdata(H,'G0'))
%%% Impulsantwort plotten
waitbar(93.33/100,w,sprintf('plotte Impulsantwort  '))
fprintf('|...plotte Impulsantwort                      | \n')
Plotten_Impulsantwort(H,getappdata(H,'G0'))


fprintf('|...-->|                                      |\n|=============================================|\n|         Verarbeitung abgeschlossen          | \n|=============================================|\n')
waitbar(100/100,w,sprintf('Fertig'))
close(w) 
% Hints: get(hObject,'String') returns contents of Eingabe_Uebertragungsfunktion as text
%        str2double(get(hObject,'String')) returns contents of Eingabe_Uebertragungsfunktion as a double

%%
% --- Executes during object creation, after setting all properties.
function Eingabe_Uebertragungsfunktion_CreateFcn(hObject, eventdata, ~)
% hObject    handle to Eingabe_Uebertragungsfunktion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||=======================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%|| >> Eigene Funktionen  ||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%||=======================||%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Einstellungen Laden+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Lade_Einstellungen(hObject)
%%
Verzeichnis_und_Name = fullfile( 'Daten','AppDaten' , 'Einstellungen.mat');
%% Wenn Datei existiert dann laden
if exist(Verzeichnis_und_Name,'file') ==2       
    fprintf('|...Einstellungen gefunden                    |\n') 
    tmp=load(Verzeichnis_und_Name); %Datei Laden...ist leider struct mit name tmp
    Geladene_Einstellungen=tmp.Einstellungen;  %Ursprüngliches struct herstellen...tiefer rein schaun
    
    %%%Autorun beim Starten der GUI
    setappdata(hObject,'autorun',Geladene_Einstellungen.autorun);
    
    %%%Schriftgröße/Farbe:
    setappdata(hObject,'groesse',Geladene_Einstellungen.groesse);

    setappdata(hObject,'groesseUeberschrift',num2str(str2num(getappdata(hObject,'groesse'))*1.4))
    setappdata(hObject,'groesseAchse' , num2str(str2num(getappdata(hObject,'groesse'))*1.3))
    %Die farben werden mit '\color{farbe}' geändert, alle nachfolgenden character haben die selbe Farbe...bei 'interpreter','Tex'

    %%%Genauigkeit in der Anzeige:
    setappdata(hObject,'nachkomma',Geladene_Einstellungen.nachkomma)


    %%%Frequenzeinheit='Hz'
    setappdata(hObject,'Frequenzeinheit',Geladene_Einstellungen.Frequenzeinheit) 
    
    fprintf('|...Einstellungen geladen                     |\n') 
%% ansonsten standard generieren
else
  %%%%%%Savety Routine, falls die Einstellungen ausversehen gelöscht wurden, diese mit defaultwerten neu generieren
    fprintf('|(X)[Einstellungen nicht gefunden]            |\n') 
    fprintf('|...generiere standard Einstellungen          |\n') 
    
    %%%Autorun beim Starten der GUI
    setappdata(hObject,'autorun',true);
    
    %%%Schriftgröße/Farbe:
    setappdata(hObject,'groesse','9');

    setappdata(hObject,'groesseUeberschrift',num2str(str2num(getappdata(hObject,'groesse'))*1.4))
    setappdata(hObject,'groesseAchse' , num2str(str2num(getappdata(hObject,'groesse'))*1.3))
    %Die farben werden mit '\color{farbe}' geändert, alle nachfolgenden character haben die selbe Farbe...bei 'interpreter','Tex'

    %%%Genauigkeit in der Anzeige:
    setappdata(hObject,'nachkomma',2)


    %%%Frequenzeinheit='Hz'
    setappdata(hObject,'Frequenzeinheit','rad/s')
    
    
Einstellungen=struct('autorun', getappdata(hObject,'autorun'),'groesse',getappdata(hObject,'groesse'),'nachkomma',getappdata(hObject,'nachkomma'),'Frequenzeinheit',getappdata(hObject,'Frequenzeinheit'));
 

FileName_alle_Betriebssysteme = fullfile( 'Daten', 'AppDaten', 'Einstellungen'); %Verzeichnisse werden bei Linux und Apple anders geschreiben...die Funktion macht se universal lesbar
    save ([FileName_alle_Betriebssysteme], 'Einstellungen');
    
    
end

%% Symbole für den plot formatieren
%Formatierung im TeX interpreter (is immer als default drinnen) 
%(nicht in LaTeX formatiert... da Farbe und schriftart da ned veränderbar)
%...Symbole,  tiefer stellen,  Nachkommastellen abschneiden,  aus 'Inf' werde ''

%%%Frequenz bei Resonanz                
setappdata(hObject,'Tex_Sym_wr' , ['\bf\fontsize{' getappdata(hObject,'groesse') ' } \color{red} \omega_{r}']);


%%%Amplitude bei Resonanz                
setappdata(hObject,'Tex_Sym_Ar' , ['\bf\fontsize{' getappdata(hObject,'groesse') '} \color{red} A_{r}']);


%%%Durchtrittsfrequenz                        
setappdata(hObject,'Tex_Sym_wD', ['\bf\fontsize{' getappdata(hObject,'groesse') '} \color{blue} \omega_{D}']);


%%%Phasenreserve                              
setappdata(hObject,'Tex_Sym_phiR' , ['\bf\fontsize{' getappdata(hObject,'groesse') '} \color{blue} \phi_{R}']);


%%%kritische Frequenz                        
setappdata(hObject,'Tex_Sym_wk' , ['\bf\fontsize{' getappdata(hObject,'groesse') '} \color{black} \omega_{k}']);


%%%Amplitude bei wk                          
setappdata(hObject,'Tex_Sym_Awk' , ['\bf\fontsize{' getappdata(hObject,'groesse') '} \color{black} A(\omega_{k})']);


%%%Eingestellte Frequenz                    Hz oder rad/s
if strcmp(getappdata(hObject,'Frequenzeinheit'),'Hz')
    
    setappdata(hObject,'Tex_Sym_Frequenzeinheit',' Hz');
else
   setappdata(hObject,'Tex_Sym_Frequenzeinheit',' rad/s');
end


%%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Werte Für den plot runden, oder Unendlich Symbol schreiben, anstatt von Inf++++++++++++++++++++++++++++++++++++++
%%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function [raus1]= runden_oder_wennUnendlichdannSymbol(rein1,nachkomma) 
    
    %runden auf Nachkommastelle
    raus1= num2str(round(rein1,nachkomma));    
    
    %Unendlich Symbol schreiben, wenn Variable inf ist
    if (isinf(rein1)) && (rein1>0);   
        raus1='+\infty';
    end

    if (isinf(rein1)) && (rein1<0);
        raus1='-\infty';
    end
 
    
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Frequenz Einheiten nach eingestellter umrechnen+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 


function [raus2]= FrequenzEinheit(rein2,H) 
    %global Frequenzeinheit;    % muss da stehn, um auf eine Globale Variable zugreifen zu können
    
    if strcmp(getappdata(H,'Frequenzeinheit'),'Hz')
        raus2=rein2/(2*pi);
    else
        raus2=rein2;
    end
    
    
    
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Eigenschaften neu berechnen+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 

function Alles_neu_berechnen(H,G0)

nachkomma=getappdata(H,'nachkomma');

%% Frequenz und Verstärkung bei Resonanz    
[Ar,wr] = getPeakGain(G0);  %Max Verstärkung und dessen Frequenz raus holen 

%%%Frequenz bei Resonanz 
setappdata(H,'komplexPeak' ,evalfr(G0,j*wr))                %Komplexe Zahl am Peak berechnen (s=j*w)
%evalfr braucht rad/s!!!...also erst jetzt die Frequenz in Hz umstellen, falls Hz eingestellt ist
setappdata(H,'wr', FrequenzEinheit(wr,H))
setappdata(H,'Tex_Var_wr',runden_oder_wennUnendlichdannSymbol(getappdata(H,'wr'),nachkomma)) 

%%%Amplitude bei Resonanz 
setappdata(H,'Ar', Ar) 
setappdata(H,'ArdB', 20*log10(Ar))    % Umwandlung in Dezibel
setappdata(H,'Tex_Var_Ar',runden_oder_wennUnendlichdannSymbol(Ar,nachkomma))
setappdata(H,'Tex_Var_ArdB' , runden_oder_wennUnendlichdannSymbol(getappdata(H,'ArdB'),nachkomma))

%% Amplitude bei wkrit,Phasenreserve,Kritischefrequenz,Durchtrittsfrequenz
[Awkres,PhiR,wk,wD] = margin(G0);           % Amplitudenreserve(Verstärkung maximal mit diesem wert multiplizieren,  danach wirds instabil),Phasenreserve,Kritischefrequenz,Durchtrittsfrequenz,

%%%Durchtrittsfrequenz
setappdata(H,'komplexDurchtritt',evalfr(G0,j*wD))  %(s=j*w) !!!!! %Komplexe Zahl beim Durchtritt der Ortskurve bei 1 evalvr braucht rad/s!
setappdata(H,'wD',FrequenzEinheit(wD,H))                     % in Eingestellte Frequenzeinheit umrechnen, standard is rad/s
setappdata(H,'Tex_Var_wD',runden_oder_wennUnendlichdannSymbol(getappdata(H,'wD'),nachkomma))

%%%Phasenreserve 
setappdata(H,'PhiR',PhiR)
setappdata(H,'Tex_Var_phiR',runden_oder_wennUnendlichdannSymbol(PhiR,nachkomma))

%%%kritische Frequenz  
setappdata(H,'komplexKrit', evalfr(G0,j*wk))       %(s=j*w) !!!!! %Komplexe Zahl Ortskurve bei kritischer Frequenz evalvr braucht rad/s!
setappdata(H,'wk',FrequenzEinheit(wk,H))                     % in Eingestellte Frequenzeinheit umrechnen, standard is rad/s
setappdata(H,'Tex_Var_wk',runden_oder_wennUnendlichdannSymbol(getappdata(H,'wk'),nachkomma))

%%%Amplitude bei wk  
setappdata(H,'Awk',(1/Awkres))                             % Amplitude bei wk des annere is ja die Amplitudenreserve, also der wert, mit dem man maximal noch verstärken/multiplizern darf
setappdata(H,'AwkdB',20*log10(getappdata(H,'Awk')))                       
setappdata(H,'Tex_Var_Awk',runden_oder_wennUnendlichdannSymbol(getappdata(H,'Awk'),nachkomma))
setappdata(H,'Tex_Var_AwkdB',runden_oder_wennUnendlichdannSymbol(getappdata(H,'AwkdB'),nachkomma))

%% Pole und Nullstellen
[pole,nullstellen] = pzmap(G0);
 setappdata(H,'pole',pole);
 setappdata(H,'nullstellen',nullstellen);

 %Grundverstärkung
Grundverstaerkung=dcgain(G0);

global s % damit sich des s rauskürtzt und ich den wert bekomm der im Zähler als verstärkung steht

if Grundverstaerkung == 0
   %%wenn im Zähler s^n steht...dann n mal rauskürtzen
   n=1; 
   while Grundverstaerkung == 0
    Grundverstaerkung=dcgain(G0*1/s^n);
    n=n+1;
    end
end

if Grundverstaerkung == +Inf
    %%wenn im Nenner s^n steht...dann n mal rauskürtzen
    n=1; 
    while Grundverstaerkung ==+Inf
    Grundverstaerkung=dcgain(G0*s^n);
    n=n+1;
    end
end

setappdata(H,'Grundverstaerkung',Grundverstaerkung);

% input Delay
setappdata(H,'inputDelay',G0.inputDelay) 






%% Grafische Darstellung schreibweise
setappdata(H, 'G0_grafisch',BerechneUebertragungsfunktionGrafisch(H,getappdata(H,'nullstellen'),getappdata(H,'pole')));
 





%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Übertragungsfunktion Grafisch ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function [raus3]= BerechneUebertragungsfunktionGrafisch(H,nullstellen_Eingang, pole_Eingang) 

nachkomma=getappdata(H,'nachkomma'); 
Grundverstaerkung=getappdata(H,'Grundverstaerkung');
inputDelay= getappdata(H,'inputDelay');
    
 Zaehler='';
anz_nullstellen=length(nullstellen_Eingang);
Nenner=[''];
anz_pole=length(pole_Eingang);


%%% Nullstellen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
s_hoch=0;
    while n < anz_nullstellen
        Tex_Var_nst= -1*nullstellen_Eingang(n+1);           %*-1 nullstelle steht ja im Nenner, s im zähler(Nullstellenform)
        Tex_Var_nst=round(Tex_Var_nst,nachkomma);   %runden auf eingestellte Einstellung
    
   
         %wenn s Nullstelle is, dann 's' schrieben
        if (Tex_Var_nst == 0) && (s_hoch == 0)
           Zaehler=['s'];
           s_hoch=1; 
        elseif (Tex_Var_nst == 0) && (s_hoch > 0)%wenn s mehrfache Nullstelle is, dann s^s_hoch schreiben
            s_hoch=s_hoch+1;
            Zaehler=['s^{' num2str(s_hoch) '}'];
  
    
        %andere Nullstellen
        else
            Zaehler=[Zaehler '(\frac{\mathbf{s}}{\mathbf{' num2str(Tex_Var_nst) '}}+1)'];
        end
    
        n=n+1;
    
        if (n< anz_nullstellen) %wenn noch nullstellen kommen '*' schreiben
            Zaehler=[Zaehler '\cdot '];
        end 
    end


%%% Pole %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=0;
s_hoch=0;
    if anz_pole==0
        Nenner='1';
    else    
    
        while p < anz_pole
            Tex_Var_pol= -1*pole_Eingang(p+1);                 %*-1 pol steht ja im Nenner, s im zähler(Nullstellenform)
            Tex_Var_pol=round(Tex_Var_pol,nachkomma);  %runden auf eingestellte Einstellung
    
            %wenn s polstelle is, dann 's' schrieben
            if (Tex_Var_pol == 0) && (s_hoch == 0)
               Nenner=['s'];
               s_hoch=1; 
            elseif (Tex_Var_pol == 0) && (s_hoch > 0)%wenn s mehrfache polstelle is, dann s^s_hoch schreiben
                s_hoch=s_hoch+1;
                Nenner=['s^{' num2str(s_hoch) '}'];
        
            %andere Pole
            else
                Nenner=[Nenner '(\frac{\mathbf{s}}{\mathbf{' num2str(Tex_Var_pol) '}}+1)'];
            end
    
            p=p+1;
    
            if p< anz_pole
            Nenner=[Nenner '\cdot '];
            end 
        end
    end
    
    %%% inputDelay %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if inputDelay > 0 
    TextInputDelay=(['\cdot e^{(-' num2str(inputDelay) '\cdot s)}']);
    else % wenn es keine Verzögerungszeit gibt e^(verzögerung)nicht schreiben
        TextInputDelay= [''];
    end
 
    
    
    %Ausgabe hat drei Standardmöglichkeinten
    %Nenner hat keine Nst
    if anz_nullstellen == 0
        raus3=[getappdata(H,'Name_Uebertragungsfunktion') '\quad=\quad$$\frac{\mathbf{'  num2str(round(Grundverstaerkung,nachkomma)) '}}{\mathbf{' Nenner '}}\mathbf{' TextInputDelay '}$$'];

        %Nur Zaehler
    elseif anz_pole ==0
        raus3=[getappdata(H,'Name_Uebertragungsfunktion') '\quad=\quad$$\mathbf{'  num2str(round(Grundverstaerkung,nachkomma)) '\cdot ' Zaehler  TextInputDelay '}$$'];

        %Alles andre
    else
        raus3=[getappdata(H,'Name_Uebertragungsfunktion') '\quad=\quad$$\frac{\mathbf{'  num2str(round(Grundverstaerkung,nachkomma)) '\cdot ' Zaehler  '}}{\mathbf{' Nenner '}}\mathbf{' TextInputDelay '}$$'];
    end

    
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Übertragungsfunktion grafisch plotten+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Plotten_Uebertragungsfkt_grafisch(H)

handles=guidata(H);% handles von Object H bekommen um auf achsen zugreifen zu können
cla(handles.axes_GrafischeGleichung)  %% altes Bild löschen...figure leeren
axes(handles.axes_GrafischeGleichung)


%Funktion=text(0.5,0.5,getappdata(H,'G0_grafisch'));
Funktion=text(0,0.5,getappdata(H,'G0_grafisch'));
title('Übertragungsfunktion:');
set(Funktion,'Interpreter','latex','fontsize',str2num(getappdata(H,'groesseUeberschrift')));






%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Bodediagramm plotten++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Plotten_Bode(H,Uebertragungsfkt)
%%


G0=Uebertragungsfkt;
%%%Plotten

handles=guidata(H);
cla(handles.axes_Bode);  %Vorheriges Bild Löschen
axes(handles.axes_Bode); %Auswahl der Achse zum Plotten

bodediagram=bodeplot(G0);
setoptions(bodediagram,'FreqUnits', getappdata(H,'Frequenzeinheit')); %Einheit auf die oben eingestellte ändern

AlleKinderImPanel=allchild(handles.uipanel4); %%%!!!!Panel entspricht der figure im Live script...hier sind beide subplots drinnen...Achse 4 is nur die Amplitude die Children von Achse 4 sind nur die eigenschaften der Amplitude...verstehst?! :P

%{ 
%%%Spielerei...Tiefer in das Objekt schauen und nach einer Langen suche gelangt man letztendlich an die 'Line'(also den gezeichneten Grafen) und kann dessen Eigenschaften Verändern
 DrittesElement=AlleKinderImPanel(3)
 KinderDieserAchse=get(DrittesElement,'Children')
 Gruppe=KinderDieserAchse(1)
 kinderderGruppe=get(Gruppe,'Children')
 kinderderGruppe.LineWidth=5
 set(kinderderGruppe,'LineStyle',':')
%}
%{ 
%%%Weitere Spielerei...Rand des Plots modifizieren
Achse_Amp=handles.axes_Bode     %%%Es muss tiefer in dieses Objekt geschaut werden um an die Eigenschaften zu kommen
Elternteil =get(Achse_Amp, 'Parent') 
Kind =get(Elternteil, 'Children') 
koordinatensystem=Kind(2)
set(koordinatensystem,'LineWidth', 5) %rand dickern
KindeNochmal=get(koordinatensystem,'Children')
%}

axes(AlleKinderImPanel(3));        % Generiert Kartesische Koordinaten im "Dritten Kind(in dem Fall Amplitudengang)"select magnitude (kartesische Koordinaten) 
hold on                                      % dank den oberen Funktionen kann jetzt im Amplitudengang geplottet werden

%%%Erstmal alle Variablen laden...bin mir noch unschlüssig, ob das so besser ist oder ob man lieber
%%%bei jedem mal wo man eine braucht diese mit appdata() holt...persönlich finde ich dass die Anweisungen dann überalden und unübersichtlicher aus schaun
%%%Ich weiß auch nicht, welche der beiden Varianten besser für die Laufzeit ist...
wr=getappdata(H,'wr');
ArdB=getappdata(H,'ArdB');
Tex_Sym_wr=getappdata(H,'Tex_Sym_wr');
Tex_Var_wr=getappdata(H,'Tex_Var_wr');
Tex_Sym_Ar=getappdata(H,'Tex_Sym_Ar');
Tex_Var_ArdB=getappdata(H,'Tex_Var_ArdB');
wD=getappdata(H,'wD');
Tex_Sym_wD=getappdata(H,'Tex_Sym_wD');
Tex_Var_wD=getappdata(H,'Tex_Var_wD');
wk=getappdata(H,'wk');
Tex_Sym_wk=getappdata(H,'Tex_Sym_wk');
Tex_Var_wk=getappdata(H,'Tex_Var_wk');
AwkdB=getappdata(H,'AwkdB');
Tex_Sym_Awk=getappdata(H,'Tex_Sym_Awk');
Tex_Var_AwkdB=getappdata(H,'Tex_Var_AwkdB');
Tex_Sym_Frequenzeinheit=getappdata(H,'Tex_Sym_Frequenzeinheit');
PhiR=getappdata(H,'PhiR');
Tex_Sym_phiR=getappdata(H,'Tex_Sym_phiR');
Tex_Var_phiR=getappdata(H,'Tex_Var_phiR');
groesseUeberschrift=getappdata(H,'groesseUeberschrift');
groesseAchse=getappdata(H,'groesseAchse');


%%%Amplitudengang Achsen Min und Max Einstellungen holen...zum Plotten der Hilfslinien
achsenEinstellungen = gca;                   % Alle momentanen Achseneinstellungen holen
x_min_max=achsenEinstellungen.XLim;           % Nur X min/max
y_min_max=achsenEinstellungen.YLim;           % Nur Y min/max


%%%Resonanz markieren
p_bode_Fr=plot(wr,ArdB,'+r');                     %Max Verstärkung
text(wr,ArdB,Tex_Sym_wr,'color','r');    
p_bode_Ar=plot([wr wr,], [0 ArdB],'.r--');        %Linie vom Peak auf nulllinie ziehen
text(wr,ArdB/2,Tex_Sym_Ar,'color','r');      %infos auf halber länge plazieren
%%%Durchtrittsfrequenz
plot([x_min_max],[0,0],':k');                %Hilfslinie "0 dB"
plot([wD,wD],[0,y_min_max(1)],':k');         %Hilfslinie runter auf wD
p_bode_wd=plot(wD,0,'ob','MarkerFaceColor','b');  %Durchtritt blauer ausgemahlter Punkt
text(wD,0,Tex_Sym_wD ,'color','b');


%%%Amplitude bei wk
plot([wk,wk],[AwkdB,y_min_max(1)],':k');     % Hilfslinie "wk"
plot([wk,wk],[0,AwkdB],'w');                 % falls überschneidungen mit hilfslinie, Überschniedung mit weiß übermalen
p_bode_Awk=plot([wk,wk],[0,AwkdB],'.--k');
text(wk,AwkdB/2,Tex_Sym_Awk);
%%Legende Amplitudengang
l_A=legend([p_bode_Fr,p_bode_Ar,p_bode_wd,p_bode_Awk],[Tex_Sym_wr ' = ' Tex_Var_wr , Tex_Sym_Frequenzeinheit ],[Tex_Sym_Ar ' = ' Tex_Var_ArdB ' dB'],[Tex_Sym_wD ' = ' Tex_Var_wD , Tex_Sym_Frequenzeinheit ],[Tex_Sym_Awk ' = ' Tex_Var_AwkdB ' dB']);
set(l_A,'Interpreter','tex');

title(['\fontsize{' groesseUeberschrift '}Bode Diagramm']);
ylabel(['\fontsize{' groesseAchse '}Amplitudengang']);

hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%-->| bis hier alles in die Verstärkung plotten
axes(AlleKinderImPanel(2));         % Generiert Kartesische Koordinaten im "Zweiten Kind(in dem Fall Phasengang)"select magnitude (kartesische Koordinaten) 
                                    % dank den oberen Funktionen kann jetzt im Phasengang geplottet werden
%%%|--> ab hier alles in die Phase plotten
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Phasengang Achsen Min und Max Einstellungen holen...zum Plotten der Hilfslinien
achsenEinstellungen = gca;                   % Alle momentanen Achseneinstellungen holen
x_min_max=achsenEinstellungen.XLim;         % Nur X min/max
y_min_max=achsenEinstellungen.YLim;           % Nur Y min/max
%%%Phasenreserve
hold on
plot([wD,wD],[y_min_max],':k');              % Hilfslinie "wD"
plot([wD,wD],[-180,-180+PhiR],'w');          % falls überschneidungen mit hilfslinie, Überschniedung mit weiß übermalen
p_bode_PhiR=plot([wD,wD],[-180,-180+PhiR],'--.b');
text(wD,(-180+PhiR)/2-90,[Tex_Sym_phiR]);
%%%kritische Frequenz wk bei -180°
plot([wk,wk],[y_min_max],':k');              % Hilfslinie "wk"
plot([x_min_max],[-180,-180],':k');       % Hilfslinie "-180°"
p_bode_wk=plot(wk,-180,'ok','MarkerFaceColor','k');  % Durchtritt -180°
text(wk,-180,[Tex_Sym_wk]);


%%%Legende
l_P=legend([p_bode_PhiR,p_bode_wk],[Tex_Sym_phiR ' = ' Tex_Var_phiR ' °'],[Tex_Sym_wk ' = ' Tex_Var_wk ,Tex_Sym_Frequenzeinheit ]);
set(l_P,'Interpreter','tex');


xlabel(['\fontsize{' groesseAchse '}Frequenz']);    %kann irgendwie nur so beschrieben werden... über .YLabel.String bleibt default Beschriftung irgendwie noch da?
achsenEinstellungen.YLabel.String = ['\fontsize{' groesseAchse  '}Phasengang  ( ° )'];    % Um Standardeinstellung der Einheit zu umgehen

hold off



%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Ortskurve plotten++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



function Plotten_Ortskurve(H,G0)
%%
%%%Erstmal alle Variablen laden...bin mir noch unschlüssig, ob das so besser ist oder ob man lieber
%%%bei jedem mal wo man eine braucht diese mit appdata() holt...persönlich finde ich dass die Anweisungen dann überalden und unübersichtlicher aus schaun
%%%Ich weiß auch nicht, welche der beiden Varianten besser für die Laufzeit ist...
komplexPeak=getappdata(H,'komplexPeak');
Tex_Sym_Ar=getappdata(H,'Tex_Sym_Ar');
Tex_Var_Ar=getappdata(H,'Tex_Var_Ar');
wr=getappdata(H,'wr');
Tex_Sym_wr=getappdata(H,'Tex_Sym_wr');
Tex_Var_wr=getappdata(H,'Tex_Var_wr');
komplexDurchtritt=getappdata(H,'komplexDurchtritt');
Tex_Sym_wD=getappdata(H,'Tex_Sym_wD');
Tex_Var_wD=getappdata(H,'Tex_Var_wD');
PhiR=getappdata(H,'PhiR');
Tex_Sym_phiR=getappdata(H,'Tex_Sym_phiR');
Tex_Var_phiR=getappdata(H,'Tex_Var_phiR');
komplexKrit=getappdata(H,'komplexKrit');
Tex_Sym_wk=getappdata(H,'Tex_Sym_wk');
Tex_Var_wk=getappdata(H,'Tex_Var_wk');
Tex_Sym_Awk=getappdata(H,'Tex_Sym_Awk');
Tex_Var_Awk=getappdata(H,'Tex_Var_Awk');
Tex_Sym_Frequenzeinheit=getappdata(H,'Tex_Sym_Frequenzeinheit');
groesseUeberschrift=getappdata(H,'groesseUeberschrift');
groesseAchse=getappdata(H,'groesseAchse');


handles=guidata(H);
cla(handles.axes_Ortskurve);  %Vorheriges Bild Löschen
axes(handles.axes_Ortskurve); %Auswahl der Achse zum Plotten

hold on
ny1 = nyquistplot(G0);
setoptions(ny1,'FreqUnits', getappdata(H,'Frequenzeinheit')); %Einheit auf die oben eingestellte ändern

setoptions(ny1,'ShowFullContour','off');    %negative Frequenzen raus
%%%Resonanz
%p_ortsk_wr=plot(komplexPeak,'or','MarkerFaceColor','r');             % MaximumKreis rot ausmalen
p_ortsk_wr=plot(real(komplexPeak),imag(komplexPeak),'or','MarkerFaceColor','r');             
p_ortsk_Ar=plot([0,real(komplexPeak)],[0,imag(komplexPeak)],'--r');
text(real(komplexPeak/2),imag(komplexPeak/2),Tex_Sym_wr);

%%%Einheitskreis
thetaE = linspace(0,2*pi);
x_Einheitskreis = cos(thetaE);
y_Einheitskreis  = sin(thetaE);
plot(x_Einheitskreis,y_Einheitskreis,':k')

%%%Durchtritt
%p_ortsk_wD=plot(komplexDurchtritt,'ob','MarkerFaceColor','b');  % so plottet er den punkt nicht, wenn komplex Druchtritt  bei 0 oder unendlich ist...???
p_ortsk_wD=plot(real(komplexDurchtritt),imag(komplexDurchtritt),'ob','MarkerFaceColor','b');  
text(real(komplexDurchtritt),imag(komplexDurchtritt),Tex_Sym_wD);

%%%Winkel PhiR
p_ortsk_PhiR=plot([0,real(komplexDurchtritt)],[0,imag(komplexDurchtritt)],'m');
thetaR = linspace(pi,pi+(PhiR*(pi/180)));     %Von Rad nach Degree mal 180 durch Pii
x_PhiR = cos(thetaR);
y_PhiR = sin(thetaR);
plot(x_PhiR,y_PhiR,'b');
plot([0,-1],[0,0],'b');

text(real(komplexDurchtritt/2)-0.5,imag(komplexDurchtritt/2),Tex_Sym_phiR);


%%%kritische Frequenz wk bei -180°
p_ortsk_wk=plot(real(komplexKrit),0,'ok','MarkerFaceColor','k');  % Durchtritt -180°
text(real(komplexKrit),imag(komplexKrit),Tex_Sym_wk);
p_ortsk_Awk=plot([0,real(komplexKrit)],[0,0],'--k');              % Awk 
text(real(komplexKrit)/2,0,Tex_Sym_Awk);

%%%Legende
l_Ortskurve=legend([p_ortsk_wr,p_ortsk_Ar,p_ortsk_wD,p_ortsk_PhiR,p_ortsk_wk,p_ortsk_Awk],[Tex_Sym_wr ' = ' Tex_Var_wr , Tex_Sym_Frequenzeinheit ],[Tex_Sym_Ar ' = ' Tex_Var_Ar],[Tex_Sym_wD ' = ' Tex_Var_wD , Tex_Sym_Frequenzeinheit ],[Tex_Sym_phiR ' = ' Tex_Var_phiR ' °'],[Tex_Sym_wk ' = ' Tex_Var_wk ,Tex_Sym_Frequenzeinheit ],[Tex_Sym_Awk ' = ' Tex_Var_Awk]);
set(l_Ortskurve,'Interpreter','tex');


title(['\fontsize{' groesseUeberschrift '}Ortskurve']);
xlabel(['\fontsize{' groesseAchse '}Realteil']);
ylabel(['\fontsize{' groesseAchse '}Imaginärteil']);

hold off



%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Pol Nullstellen Diagramm plotten+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Plotten_PolNullstellen(H,G0)
handles=guidata(H);
cla(handles.axes_PolNullstellen);  %Vorheriges Bild Löschen
axes(handles.axes_PolNullstellen); %Auswahl der Achse zum Plotten
PolNullstellen=pzplot(G0);
%grid on
groesseUeberschrift=getappdata(H,'groesseUeberschrift');
title(['\fontsize{' groesseUeberschrift '}Pole und Nullstellen']);



%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Sprungantwort plotten+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Plotten_Sprungantwort(H,G0)
handles=guidata(H);
cla(handles.axes_Sprungantwort);  %Vorheriges Bild Löschen
axes(handles.axes_Sprungantwort); %Auswahl der Achse zum Plotten
Sprung=stepplot(G0);
groesseUeberschrift=getappdata(H,'groesseUeberschrift');
title(['\fontsize{' groesseUeberschrift '}Sprungantwort']);




%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Impulsantwort plotten+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Plotten_Impulsantwort(H,G0)
handles=guidata(H);
cla(handles.axes_Impulsantwort);  %Vorheriges Bild Löschen
axes(handles.axes_Impulsantwort); %Auswahl der Achse zum Plotten
Impuls=impulseplot(G0);
groesseUeberschrift=getappdata(H,'groesseUeberschrift');
title(['\fontsize{' groesseUeberschrift '}Impulsantwort']);




%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Bild transparent machen+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function [oeffnen_Bild]=mach_Bild_transparent_pfusch(Bildname)
oeffnen_Bild = imread(Bildname);
oeffnen_Bild  = double(oeffnen_Bild )/255;
index1 = oeffnen_Bild(:,:,1) == 0;
index2 = oeffnen_Bild(:,:,2) == 0;
index3 = oeffnen_Bild(:,:,3) == 0;
indexSchwarz = index1+index2+index3==3;
for idx = 1 : 3
   rgb = oeffnen_Bild(:,:,idx);     % extract part of the image
   rgb(indexSchwarz) = NaN;  % set the white portion of the image to NaN
   oeffnen_Bild(:,:,idx) = rgb;     % substitute the update values
end



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Eingabe_Uebertragungsfunktion.
function Eingabe_Uebertragungsfunktion_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Eingabe_Uebertragungsfunktion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
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


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GUI_Einstellungen_aufrufen_Callback(hObject, eventdata, handles)
% hObject    handle to GUI_Einstellungen_aufrufen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% starte Übertragungsfunktion Öffnen++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



% --- Executes on button press in GUI_oeffnen.
function GUI_oeffnen_Callback(hObject, eventdata, handles)
% hObject    handle to GUI_oeffnen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%startingFolder = ;
defaultFileName = fullfile( 'Daten','Uebertragungsfunktionen' , '*.mat');
%[baseFileName, folder] = uigetfile(defaultFileName, 'Such dir was schönns raus');

[baseFileName, folder] = uigetfile(defaultFileName, 'Such dir was schönns raus');

%Abfragen, ob Nutzer auf [X] geklickt hat
if baseFileName ~= 0
	fullFileName = fullfile(baseFileName);
    Name_ofFile=fullFileName(1:end-4);   %Dateiendung entfernen length('.mat') = 4
	%laden einer Datei
    lade_Uebertragungsfunktion(Name_ofFile,handles);
    %Starte Rechnung mit dieser Datei
    Eingabe_Uebertragungsfunktion_Callback(handles.Eingabe_Uebertragungsfunktion, eventdata, handles); %%callback so starten aufrufen ...braucht handles vom textfelt um zu funktionieren, deswegen handles.Eingabe_Uebertragungsfunktion
   
end
%return;

%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Eine Übertragungsfunktion Öffnen++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function []=lade_Uebertragungsfunktion(Name,handles)
fprintf('|=============================================|\n|             starte Ladevorgang              | \n|=============================================|\n|...|-->                                      |\n')
H=handles.figure_Adrians_tolles_Systemanalysetool;

Verzeichnis_und_Name = fullfile( 'Daten','Uebertragungsfunktionen' , [Name, '.mat']);
%Datei=[Name '.mat'];
if exist(Verzeichnis_und_Name,'file') ==2         %Wenn Datei Existiert
    tmp=load (Verzeichnis_und_Name);                  %Datei Laden...ist leider struct mit name tmp
    Gneu=eval(['tmp.' Name]);             %Ursprüngliches struct herstellen...tiefer rein schaun
    
    setappdata(H,'String_G0',Gneu.Funktion) 
    set(handles.Eingabe_Uebertragungsfunktion,'String',getappdata(H,'String_G0')); %In der GUI anzeigen
    
    setappdata(H,'Name_Uebertragungsfunktion',Name)
    set(handles. GUI_Name_Uebertragungsfunktion,'String',getappdata(H,'Name_Uebertragungsfunktion')); %In der GUI anzeigen
    
    fprintf(['|...Datei geladen:                            |\n|...'  getappdata(H,'String_G0') '\n']) %nachschaun, ob Variable im globalen workspace an gekommen ist
    Uebertragungsfunktion=Gneu.Funktion; %String raus holen...string is Übertragungsfunktion in dieser "s" Schreibweise
    fprintf(['|...Name:                                     |\n|...' getappdata(H,'Name_Uebertragungsfunktion') '\n'])  %nachschaun, ob Variable im globalen workspace an gekommen ist
else   
    fprintf('|(X)[Datei nicht gefunden]                     |\n')
    Uebertragungsfunktion=0;
end
fprintf('|...-->|                                      |\n|=============================================|\n|        Ladevorgang   abgeschlossen          | \n|=============================================|\n')






%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Übertragungsfunktion Speichern++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




% --- Executes on button press in GUI_Speichern.
function GUI_Speichern_Callback(hObject, eventdata, handles)
% hObject    handle to GUI_Speichern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;

Name = getappdata(H,'Name_Uebertragungsfunktion');
String_Funktion = getappdata(H,'String_G0');
Beschreibung = 'Jetzt gehts los';

FileName_alle_Betriebssysteme = fullfile( 'Daten', 'UebertragungsFunktionen', [Name, '.mat']); %Verzeichnisse werden bei Linux und Apple anders geschreiben...die Funktion macht se universal lesbar

[EingestellterName,startingFolder] = uiputfile(FileName_alle_Betriebssysteme,'Speichere die Übertragungsfunktion unter diesem Namen oder überleg dir nen besseren');

%Abfragen, ob Nutzer auf [X] geklickt hat
if EingestellterName ~=0
    NameMinusDateiendung=EingestellterName(1:end-4); %Dateiendung entfernen length('.mat') = 4
    Inhalt=[NameMinusDateiendung ' =struct(''Funktion'','''  String_Funktion ''',''Beschreibung'',''' Beschreibung ''');'];
    eval(Inhalt);

FileName_alle_Betriebssysteme = fullfile( 'Daten', 'UebertragungsFunktionen', [EingestellterName]); %Verzeichnisse werden bei Linux und Apple anders geschreiben...die Funktion macht se universal lesbar
    save ([FileName_alle_Betriebssysteme], NameMinusDateiendung);
end
%Daten\AppDaten\


% --- Executes on button press in GUI_Einstellungen.
function GUI_Einstellungen_Callback(hObject, eventdata, handles)
run Einstellungen.m;

%nochma neu rechnen und plotten um Einstellungen zu übernehmen
H=handles.figure_Adrians_tolles_Systemanalysetool;
%%if getappdata(H,'Einstellungen_geaendert')==1 
%%Eingabe_Uebertragungsfunktion_Callback(handles.Eingabe_Uebertragungsfunktion, eventdata, handles); %%braucht handles vom textfelt um zu funktionieren, deswegen handles.Eingabe_Uebertragungsfunktion 
%%end
% hObject    handle to GUI_Einstellungen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function GUI_Name_Uebertragungsfunktion_Callback(hObject, eventdata, handles)
% hObject    handle to GUI_Name_Uebertragungsfunktion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;
%%%Einlesen
Name=get(hObject,'String'); % Hints: get(hObject,'String') returns contents of Eingabe as text%        str2double(get(hObject,'String')) returns contents of Eingabe as a double
setappdata(H,'Name_Uebertragungsfunktion',Name)


% Hints: get(hObject,'String') returns contents of GUI_Name_Uebertragungsfunktion as text
%        str2double(get(hObject,'String')) returns contents of GUI_Name_Uebertragungsfunktion as a double


% --- Executes during object creation, after setting all properties.
function GUI_Name_Uebertragungsfunktion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GUI_Name_Uebertragungsfunktion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in GUI_rechne.
function GUI_rechne_Callback(hObject, eventdata, handles)
  Eingabe_Uebertragungsfunktion_Callback(handles.Eingabe_Uebertragungsfunktion, eventdata, handles); %%callback so starten aufrufen ...braucht handles vom textfelt um zu funktionieren, deswegen handles.Eingabe_Uebertragungsfunktion
  
% hObject    handle to GUI_rechne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in GUI_Hilfe.
function GUI_Hilfe_Callback(hObject, eventdata, handles)
% hObject    handle to GUI_Hilfe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Hilfe.m

% --------------------------------------------------------------------
function Geschmeidig_Callback(hObject, eventdata, handles)
% hObject    handle to Geschmeidig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

H=handles.figure_Adrians_tolles_Systemanalysetool;
setappdata(H,'Bild','Geschmeidig');
run Bild.m


% --------------------------------------------------------------------
function Regler_vom_Himmel_Callback(hObject, eventdata, handles)
% hObject    handle to Regler_vom_Himmel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;
setappdata(H,'Bild','Regler');
run Bild.m


% --- Executes on button press in Bild_Bode.
function Bild_Bode_Callback(hObject, eventdata, handles)
% hObject    handle to Bild_Bode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;
setappdata(H,'Bild','Bode');
run Bild.m

% --- Executes on button press in Bild_KritischerPunkt.
function Bild_KritischerPunkt_Callback(hObject, eventdata, handles)
% hObject    handle to Bild_KritischerPunkt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;
setappdata(H,'Bild','KritischerPunkt');
run Bild.m

% --- Executes on button press in Bild_Ortskurve.
function Bild_Ortskurve_Callback(hObject, eventdata, handles)
% hObject    handle to Bild_Ortskurve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;
setappdata(H,'Bild','Ortskurve');
run Bild.m

% --- Executes on button press in Bild_Sprungantwort.
function Bild_Sprungantwort_Callback(hObject, eventdata, handles)
% hObject    handle to Bild_Sprungantwort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=handles.figure_Adrians_tolles_Systemanalysetool;
setappdata(H,'Bild','Sprungantwort');
run Bild.m
