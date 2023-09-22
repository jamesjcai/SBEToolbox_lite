function varargout = SBEGUItest(varargin)
% SBEGUItest M-network for SBEGUItest.fig
%      SBEGUItest, by itself, creates a new SBEGUItest or raises the existing
%      singleton*.
%
%      H = SBEGUItest returns the handle to a new SBEGUItest or the handle to
%      the existing singleton*.
%
%      SBEGUItest('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SBEGUItest.M with the given input arguments.
%
%      SBEGUItest('Property','Value',...) creates a new SBEGUItest or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SBEGUItest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SBEGUItest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Statistics menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SBEGUItest

% Last Modified by GUIDE v2.5 22-Jun-2009 10:13:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
    'gui_Singleton', gui_Singleton, ...
    'gui_OpeningFcn', @SBEGUItest_OpeningFcn, ...
    'gui_OutputFcn', @SBEGUItest_OutputFcn, ...
    'gui_LayoutFcn', [], ...
    'gui_Callback', []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SBEGUItest is made visible.
    function SBEGUItest_OpeningFcn(hObject, eventdata, handles, varargin)
        % This function has no output args, see OutputFcn.
        % hObject    handle to figure
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        % varargin   command line arguments to SBEGUItest (see VARARGIN)

        % Choose default command line output for SBEGUItest
        handles.output = hObject;

        % Update handles structure
        guidata(hObject, handles);

        % UIWAIT makes SBEGUItest wait for user response (see UIRESUME)
        % uiwait(handles.SBEToolboxGUI);


        % --- Outputs from this function are returned to the command line.
            function varargout = SBEGUItest_OutputFcn(hObject, eventdata, handles)
                % varargout  cell array for returning output args (see VARARGOUT);
                % hObject    handle to figure
                % eventdata  reserved - to be defined in a future version of MATLAB
                % handles    structure with handles and user data (see GUIDATA)

                % Get default command line output from handles structure
                varargout{1} = handles.output;


                % --------------------------------------------------------------------
                    function Network_Callback(hObject, eventdata, handles)
                        % hObject    handle to Network (see GCBO)
                        % eventdata  reserved - to be defined in a future version of MATLAB
                        % handles    structure with handles and user data (see GUIDATA)


                        % --------------------------------------------------------------------
                            function Statistics_Callback(hObject, eventdata, handles)
                                % hObject    handle to Statistics (see GCBO)
                                % eventdata  reserved - to be defined in a future version of MATLAB
                                % handles    structure with handles and user data (see GUIDATA)


                                % --------------------------------------------------------------------
                                    function Help_Callback(hObject, eventdata, handles)
                                        % hObject    handle to Help (see GCBO)
                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                        % handles    structure with handles and user data (see GUIDATA)


                                        % --------------------------------------------------------------------
                                            function NetworkOpen_Callback(hObject, eventdata, handles)
                                                % hObject    handle to NetworkOpen (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)


                                                % --------------------------------------------------------------------
                                                    function NetworkExit_Callback(hObject, eventdata, handles)
                                                        % hObject    handle to NetworkExit (see GCBO)
                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                        % handles    structure with handles and user data (see GUIDATA)

                                                        %global pgeguiolddir aln pgeversionstr;
                                                        %aln=[];
                                                        %cd(pgeguiolddir);
                                                        %clear global aln olddir pgeversionstr
                                                        %warning on all
                                                        close;


                                                        % --------------------------------------------------------------------
                                                            function HelpHelpContents_Callback(hObject, eventdata, handles)
                                                                % hObject    handle to HelpHelpContents (see GCBO)
                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                % handles    structure with handles and user data (see GUIDATA)
                                                                helpwin sbetoolbox;


                                                                % --------------------------------------------------------------------
                                                                    function StatCentralityOutDegree_Callback(hObject, eventdata, handles)
                                                                        % hObject    handle to StatCentralityOutDegree (see GCBO)
                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                        % --------------------------------------------------------------------
                                                                            function StatCentralityBetweenness_Callback(hObject, eventdata, handles)
                                                                                % hObject    handle to StatCentralityBetweenness (see GCBO)
                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                % --------------------------------------------------------------------
                                                                                    function StatCentralityCurrentInformationFlow_Callback(hObject, eventdata, handles)
                                                                                        % hObject    handle to StatCentralityCurrentInformationFlow (see GCBO)
                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                        % --------------------------------------------------------------------
                                                                                            function StatClusteringCoefficient_Callback(hObject, eventdata, handles)
                                                                                                % hObject    handle to StatClusteringCoefficient (see GCBO)
                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                % --------------------------------------------------------------------
                                                                                                    function Edit_Callback(hObject, eventdata, handles)
                                                                                                        % hObject    handle to Edit (see GCBO)
                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                        % --------------------------------------------------------------------
                                                                                                            function Layout_Callback(hObject, eventdata, handles)
                                                                                                                % hObject    handle to Layout (see GCBO)
                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                % --------------------------------------------------------------------
                                                                                                                    function HelpDemo_Callback(hObject, eventdata, handles)
                                                                                                                        % hObject    handle to HelpDemo (see GCBO)
                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                        % --------------------------------------------------------------------
                                                                                                                            function StatNetworkSymmetry_Callback(hObject, eventdata, handles)
                                                                                                                                % hObject    handle to StatNetworkSymmetry (see GCBO)
                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                    function StatGraphDistance_Callback(hObject, eventdata, handles)
                                                                                                                                        % hObject    handle to StatGraphDistance (see GCBO)
                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                            function StatAverageGraphDistance_Callback(hObject, eventdata, handles)
                                                                                                                                                % hObject    handle to StatAverageGraphDistance (see GCBO)
                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                    function StatDistanceMatrix_Callback(hObject, eventdata, handles)
                                                                                                                                                        % hObject    handle to StatDistanceMatrix (see GCBO)
                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                            function StatDiameter_Callback(hObject, eventdata, handles)
                                                                                                                                                                % hObject    handle to StatDiameter (see GCBO)
                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                    function StatCentralities_Callback(hObject, eventdata, handles)
                                                                                                                                                                        % hObject    handle to StatCentralities (see GCBO)
                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                            function NetworkNew_Callback(hObject, eventdata, handles)
                                                                                                                                                                                % hObject    handle to NetworkNew (see GCBO)
                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                    function NetworkViewAdjacencyMatrix_Callback(hObject, eventdata, handles)
                                                                                                                                                                                        % hObject    handle to NetworkViewAdjacencyMatrix (see GCBO)
                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                            function NetworkClose_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                % hObject    handle to NetworkClose (see GCBO)
                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                    function StatCentralityInDegree_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                        % hObject    handle to StatCentralityInDegree (see GCBO)
                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                            function StatCentralityCloseness_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                % hObject    handle to StatCentralityCloseness (see GCBO)
                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                    function StatCentralityGraph_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                        % hObject    handle to StatCentralityGraph (see GCBO)
                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                            function StatCentralityStress_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                % hObject    handle to StatCentralityStress (see GCBO)
                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                    function StatCentralityEccentricity_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                        % hObject    handle to StatCentralityEccentricity (see GCBO)
                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                            function NetworkCreate_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                % hObject    handle to NetworkCreate (see GCBO)
                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                                    function NetworkSave_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                        % hObject    handle to NetworkSave (see GCBO)
                                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                                            function NeworkSaveAs_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                % hObject    handle to NeworkSaveAs (see GCBO)
                                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                    function NetworkCreateSmallWorld_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                        % hObject    handle to NetworkCreateSmallWorld (see GCBO)
                                                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                            function NetworkCreateErdosRenyi_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                % hObject    handle to NetworkCreateErdosRenyi (see GCBO)
                                                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                    function NetworkCreateRingLattice_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                        % hObject    handle to NetworkCreateRingLattice (see GCBO)
                                                                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                            function NetworkCreateSameDegree_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                % hObject    handle to NetworkCreateSameDegree (see GCBO)
                                                                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                    function EditNode_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                        % hObject    handle to EditNode (see GCBO)
                                                                                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                            function EditLink_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                                % hObject    handle to EditLink (see GCBO)
                                                                                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                    function EditFilter_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                                        % hObject    handle to EditFilter (see GCBO)
                                                                                                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                            function EditSymmetrizeLinks_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                                                % hObject    handle to EditSymmetrizeLinks (see GCBO)
                                                                                                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                                                                % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                                    function EditAddNode_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                                                        % hObject    handle to EditAddNode (see GCBO)
                                                                                                                                                                                                                                                                                                                                        % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                                                        % handles    structure with handles and user data (see GUIDATA)


                                                                                                                                                                                                                                                                                                                                        % --------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                                            function EditRemoveNode_Callback(hObject, eventdata, handles)
                                                                                                                                                                                                                                                                                                                                                % hObject    handle to EditRemoveNode (see GCBO)
                                                                                                                                                                                                                                                                                                                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                                                                                                                                                                                                                                                                                                                % handles    structure with handles and user data (see GUIDATA)
