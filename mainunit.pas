unit mainunit;
 {$Include opts.inc} //optiosn: DGL, CoreGL or legacy GL
{$mode delphi}{$H+}
interface
uses
  {$IFDEF DGL} dglOpenGL, {$ELSE DGL} {$IFDEF COREGL}glcorearb, {$ELSE} gl, {$ENDIF}  {$ENDIF DGL}

  //{$IFDEF SCRIPTING}
  scriptengine,
  //{$ENDIF}
  {$IFNDEF UNIX} shellapi,  {$ENDIF}
  {$IFNDEF Darwin}uscaledpi, {$ENDIF}
  {$IFDEF COREGL} gl_core_3d, {$ELSE}     gl_legacy_3d, {$ENDIF}
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,math,
  ExtCtrls, OpenGLContext, mesh, LCLintf, ComCtrls, Menus, graphtype, curv,
  ClipBrd, shaderui, shaderu, prefs, userdir, LCLtype, Grids, Spin, matmath,
  colorTable, Track, types,  define_types, meshify,  gl_2d, zstream, gl_core_matrix, Process, meshify_simplify;

type
  { TGLForm1 }
  TGLForm1 = class(TForm)
    AOLabel: TLabel;
    CurvMenu: TMenuItem;
    CurvMenuTemp: TMenuItem;
    GoldColorMenu: TMenuItem;
    NewWindow1: TMenuItem;
    S1Check: TCheckBox;
    S6Check: TCheckBox;
    S6Label: TLabel;
    S6Track: TTrackBar;
    S2Check: TCheckBox;
    S1Label: TLabel;
    S7Check: TCheckBox;
    S7Label: TLabel;
    S7Track: TTrackBar;
    S3Check: TCheckBox;
    S2Label: TLabel;
    S1Track: TTrackBar;
    RestrictSep2Menu: TMenuItem;
    RestrictHideNodesWithoutEdges: TMenuItem;
    S8Check: TCheckBox;
    S8Label: TLabel;
    S8Track: TTrackBar;
    S4Check: TCheckBox;
    S3Label: TLabel;
    S2Track: TTrackBar;
    S9Check: TCheckBox;
    S9Label: TLabel;
    S9Track: TTrackBar;
    S5Check: TCheckBox;
    S4Label: TLabel;
    S3Track: TTrackBar;
    S10Check: TCheckBox;
    S5Label: TLabel;
    S4Track: TTrackBar;
    S10Label: TLabel;
    S5Track: TTrackBar;
    S10Track: TTrackBar;
    TrackScalarRangeBtn: TButton;
    ColorbarMenu: TMenuItem;
    HelpMenu: TMenuItem;
    DisplaySepMenu: TMenuItem;
    AdvancedMenu: TMenuItem;
    AdditiveOverlayMenu: TMenuItem;
    GLBox: TOpenGLControl;
    CenterMeshMenu: TMenuItem;
    TrackScalarLUTdrop: TComboBox;
    TrackScalarNameDrop: TComboBox;
    SimplifyMeshMenu: TMenuItem;
    ScriptMenu: TMenuItem;
    SimplifyTracksMenu: TMenuItem;
    TransparencySepMenu: TMenuItem;
    ReverseFacesMenu: TMenuItem;
    SwapYZMenu: TMenuItem;
    SaveMeshMenu: TMenuItem;
    VolumeToMeshMenu: TMenuItem;
    ResetMenu: TMenuItem;
    OrientCubeMenu: TMenuItem;
    Pref2Menu: TMenuItem;
    About2Menu: TMenuItem;
    XRayLabel: TLabel;
    EdgeSizeVariesCheck: TCheckBox;
    FileSepMenu: TMenuItem;
    occlusionTrack: TTrackBar;
    SaveTracksMenu: TMenuItem;
    meshAlphaTrack: TTrackBar;
    MeshBlendTrack: TTrackBar;
    NodeSizeVariesCheck: TCheckBox;
    PrefMenu: TMenuItem;
    NodeMaxEdit: TFloatSpinEdit;
    NodeMinEdit: TFloatSpinEdit;
    EdgeMinLabel1: TLabel;
    NodeThreshDrop: TComboBox;
    NodeScaleLabel1: TLabel;
    NodeScaleTrack: TTrackBar;
    EdgeMinEdit: TFloatSpinEdit;
    EdgeMaxEdit: TFloatSpinEdit;
    LUTdropEdge: TComboBox;
    EdgeBox: TGroupBox;
    EdgeColorVariesCheck: TCheckBox;
    NodeScaleLabel: TLabel;
    EdgeMinLabel: TLabel;
    edgeScaleTrack: TTrackBar;
    RestrictSepMenu: TMenuItem;
    RestrictAnyEdgeMenu: TMenuItem;
    RestrictPosEdgeMenu: TMenuItem;
    RestrictNegEdgeMenu: TMenuItem;
    RestrictRightMenu: TMenuItem;
    RestrictLeftMenu: TMenuItem;
    RestrictNoMenu: TMenuItem;
    RestrictMenu: TMenuItem;
    NodeColorVariesCheck: TCheckBox;
    GrayColorMenu: TMenuItem;
    BlueColorMenu: TMenuItem;
    GreenColorMenu: TMenuItem;
    ExitMenu: TMenuItem;
    DisplayMenu: TMenuItem;
    AnteriorMenu: TMenuItem;
    LeftMenu: TMenuItem;
    CloseMenu: TMenuItem;
    AddNodesMenu: TMenuItem;
    CloseNodesMenu: TMenuItem;
    LUTdropNode: TComboBox;
    SaveMeshDialog: TSaveDialog;
    NodeMenu: TMenuItem;
    RightMenu: TMenuItem;
    InferiorMenu: TMenuItem;
    SuperiorMenu: TMenuItem;
    PosteriorMenu: TMenuItem;
    RedColorItem: TMenuItem;
    QuickColorMenu: TMenuItem;
    NodeBox: TGroupBox;
    MeshColorBox: TGroupBox;
    TrackLengthLabel1: TLabel;
    MeshSaturationTrack: TTrackBar;
    TrackWidthLabel: TLabel;
    TrackLengthTrack: TTrackBar;
    TrackLengthLabel: TLabel;
    LightAziTrack: TTrackBar;
    ClipAziTrack: TTrackBar;
    ClipBox: TGroupBox;
    ClipTrack: TTrackBar;
    CollapseToolPanelBtn: TButton;
    ColorDialog1: TColorDialog;
    LightElevTrack: TTrackBar;
    ClipElevTrack: TTrackBar;
    TrackBox: TGroupBox;
    Label2: TLabel;
    DepthLabel: TLabel;
    AzimuthLabel: TLabel;
    ElevationLabel: TLabel;
    LUTdrop: TComboBox;
    MainMenu1: TMainMenu;
    AppleMenu: TMenuItem;
    FileMenu: TMenuItem;
    ColorMenu: TMenuItem;
    BackColorMenu: TMenuItem;
    AboutMenu: TMenuItem;
    EditMenu: TMenuItem;
    CopyMenu: TMenuItem;
    Memo1: TMemo;
    AddOverlayMenu: TMenuItem;
    CloseOverlaysMenu: TMenuItem;
    AddTracksMenu: TMenuItem;
    CloseTracksMenu: TMenuItem;
    TrackWidthLabel1: TLabel;
    TrackWidthLabel2: TLabel;
    TrackWidthLabel3: TLabel;
    TrackDitherLabel: TLabel;
    TrackWidthTrack: TTrackBar;
    TracksMenu: TMenuItem;
    MeshTransparencyTrack: TTrackBar;
    TrackDitherTrack: TTrackBar;
    Transparency75: TMenuItem;
    Transparency25: TMenuItem;
    Transparency50: TMenuItem;
    Transparency0: TMenuItem;
    TransparencyMenu: TMenuItem;
    OverlaysMenu: TMenuItem;
    OpenDialog: TOpenDialog;
    CollapsedToolPanel: TPanel;
    OverlayBox: TGroupBox;
    ShaderBox: TGroupBox;
    ShaderDrop: TComboBox;
    ErrorTimer: TTimer;
    StringGrid1: TStringGrid;
    OverlayTimer: TTimer;
    UpdateTimer: TTimer;
    ToolPanel: TPanel;
    SaveBitmapDialog: TSaveDialog;
    SaveMenu: TMenuItem;
    ObjectColorMenu: TMenuItem;
    OpenMenu: TMenuItem;
    procedure CurvMenuClick(Sender: TObject);
    procedure DepthLabelDblClick(Sender: TObject);
    procedure NewWindow1Click(Sender: TObject);
    procedure Quit2TextEditor;
    procedure CenterMeshMenuClick(Sender: TObject);
    procedure AdditiveOverlayMenuClick(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure GLBoxClick(Sender: TObject);
    procedure MeshColorBoxChange(Sender: TObject);
    function OpenNode(FilenameIn: string): boolean;
    function OpenTrack(FilenameIn: string): boolean;
    function OpenOverlay(FilenameIn: string): boolean;
    function OpenEdge(FilenameIn: string): boolean;
    function OpenMesh(FilenameIn: string): boolean;
    procedure AboutMenuClick(Sender: TObject);
    procedure AddNodesMenuClick(Sender: TObject);
    procedure AddOverlayMenuClick(Sender: TObject);
    procedure AddTracksMenuClick(Sender: TObject);
    procedure AzimuthLabelClick(Sender: TObject);
    procedure BackColorMenuClick(Sender: TObject);
    procedure ClipTrackChange(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure CloseNodesMenuClick(Sender: TObject);
    procedure CloseOverlaysMenuClick(Sender: TObject);
    procedure CloseTracksMenuClick(Sender: TObject);
    procedure CollapseToolPanelBtnClick(Sender: TObject);
    procedure ColorBarMenuClick(Sender: TObject);
    procedure CopyMenuClick(Sender: TObject);
    procedure DepthLabelClick(Sender: TObject);
    procedure DisplayMenuClick(Sender: TObject);
    procedure ElevationLabelClick(Sender: TObject);
    procedure ErrorTimerTimer(Sender: TObject);
    procedure GLBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure LUTdropChange(Sender: TObject);
    procedure NodePrefChange(Sender: TObject);
    procedure OrientCubeMenuClick(Sender: TObject);
    procedure OverlayTimerStart;
    procedure AdjustFormPos (var lForm: TForm);
    procedure OverlayBoxCreate;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AppDropFiles(Sender: TObject; const FileNames: array of String);
    procedure CreateRender(w,h: integer; isToScreen: boolean);
    procedure GLboxPaint(Sender: TObject);
    procedure GLboxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GLboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GLboxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectColorMenuClick(Sender: TObject);
    procedure OpenMenuClick(Sender: TObject);
    procedure OverlayTimerTimer(Sender: TObject);
    procedure OverlayVisible(lOverlay: integer; lVisible: integer);
    procedure OverlayInvert(lOverlay: integer; lInvert: boolean);
    procedure PrefMenuClick(Sender: TObject);
    procedure QuickColorClick(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure ResetMenuClick(Sender: TObject);
    procedure RestrictEdgeMenuClick(Sender: TObject);
    procedure RestrictHideNodesWithoutEdgesClick(Sender: TObject);
    procedure RestrictMenuClick(Sender: TObject);
    procedure ReverseFacesMenuClick(Sender: TObject);
    procedure SaveBitmap(FilenameIn: string);
    procedure SaveMenuClick(Sender: TObject);
    procedure SaveMz3(var mesh: TMesh; isSaveOverlays: boolean);
    procedure SaveTrack (var lTrack: TTrack);
    procedure SaveMesh(var mesh: TMesh; isSaveOverlays: boolean);
    procedure SaveMeshMenuClick(Sender: TObject);
    procedure SaveTracksMenuClick(Sender: TObject);
    procedure ScalarDropChange(Sender: TObject);
    function ScreenShot: TBitmap;
    procedure ScriptMenuClick(Sender: TObject);
    procedure SetOverlayTransparency(Sender: TObject);
    procedure ShaderBoxResize(Sender: TObject);
    procedure ShaderDropChange(Sender: TObject);
    procedure ShowmessageError(s: string);
    procedure GLboxRequestUpdate(Sender: TObject);
    procedure SimplifyMeshMenuClick(Sender: TObject);
    procedure SimplifyTracksMenuClick(Sender: TObject);
    procedure StringGrid1EditingDone(Sender: TObject);
    procedure StringGrid1Enter(Sender: TObject);
    procedure SurfaceAppearanceChange(Sender: TObject);
    procedure ReadCell (ACol,ARow: integer; Update: boolean);
    procedure StringGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: char);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure SwapYZMenuClick(Sender: TObject);
    procedure TrackBoxChange(Sender: TObject);
    procedure TrackScalarRangeBtnClick(Sender: TObject);
   procedure UniformChange(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure UpdateImageIntensity;
    procedure UpdateLUT(lOverlay,lLUTIndex: integer; lChangeDrop: boolean);
    function ComboBoxName2Index(var lCombo: TComboBox; lName: string): integer;
    procedure SetDistance(Distance: single);
    procedure OVERLAYMINMAX (lOverlay: integer; lMin,lMax: single);
    procedure OVERLAYCOLORNAME(lOverlay: integer; lFilename: string);
    procedure UpdateOverlaySpread;// (lIndex: integer);
    //procedure SetOrtho (w,h: integer; isMultiSample: boolean);
    procedure AddMRU(lFilename: string);
    procedure UpdateMRU;
    procedure CreateMRU;
    procedure OpenMRU(Sender: TObject);//open template or MRU
    procedure UpdateToolbar;
    procedure MultiPassRenderingToolsUpdate;
    procedure VolumeToMeshMenuClick(Sender: TObject);
    procedure XRayLabelClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  GLForm1: TGLForm1;
  gPrefs : TPrefs;
    gElevation : integer =20;
  gAzimuth : integer = 250;

implementation

{$R *.lfm}
var
  gMesh: TMesh;
  gNode: TMesh;
  gTrack: TTrack;
  isBusy: boolean = true;
  gDistance : single = 1;
  gMouseX : integer = -1;
  gMouseY : integer = -1;
  GLerror : string = '';
  clipPlane : TPoint4f; //clipping bottom
const

  kFname=0;
  kLUT=1;
  kMin=2;
  kMax=3;
     kTrackFilter = 'Camino, VTK, MRTrix, Quench, TrakVis, DTIstudio|*.Bfloat;*.Bfloat.gz;*.trk.gz;*.trk;*.tck;*.pdb;*.fib;*.vtk;*.dat|Any file|*.*';

function FindFile(Filename: string): string;
var
  p,n,x: string;
  searchResult : TSearchRec;
begin
   result := Filename;
   if FileExists(result) then exit;
   FilenameParts (Filename, p,n,x);
   //try location of last mesh
   p := ExtractFilePath(gPrefs.PrevFilename[1]);
   result := p+n+x;
   if FileExists(result) then exit;
   //try location of last overlay
   p := ExtractFilePath(gPrefs.PrevOverlayname);
   result := p+n+x;
   if FileExists(result) then exit;
   //try location of last track
   p := ExtractFilePath(gPrefs.PrevTrackname);
   result := p+n+x;
   if FileExists(result) then exit;
   //try location of last node
   p := ExtractFilePath(gPrefs.PrevNodename);
   result := p+n+x;
   if FileExists(result) then exit;
   //try location of last script
   p := ExtractFilePath(gPrefs.PrevScript);
   result := p+n+x;
   if FileExists(result) then exit;

   //try application directory
   p := AppDir2;
   result := p+n+x;
   if FileExists(result) then exit;
   SetCurrentDir(p);
   if findfirst('*', faDirectory, searchResult) = 0 then begin
    repeat
      // Only show directories
      if (searchResult.attr and faDirectory) = faDirectory then begin
       //ShowMessage('Directory = '+searchResult.Name);
       result := p+ searchResult.Name + pathdelim+n+x;
       if FileExists(result) then begin
          FindClose(searchResult);
          exit;
       end;
      end;
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;
   result := ''; //failed!
end;

procedure TGLForm1.MultiPassRenderingToolsUpdate;
var
  lBetter: boolean;
begin
  lBetter := (gPrefs.RenderQuality <> kRenderPoor) and (gPrefs.SupportBetterRenderQuality);
  AOLabel.Visible:= lBetter;
  occlusionTrack.Visible:= lBetter;
  XRayLabel.Visible:= lBetter;
  MeshBlendTrack.Visible:= lBetter;
  meshAlphaTrack.visible :=  lBetter;
end;

procedure TGLForm1.VolumeToMeshMenuClick(Sender: TObject);
const
{$IFDEF FOREIGNVOL}
 //kVolFilter = 'NIfTI volume|*.hdr;*.nii;*nii.gz';
 kVolFilter = 'Neuroimaging (*.nii)|*.hdr;*.nii;*.nii.gz;*.voi;*.HEAD;*.mgh;*.mgz;*.mha;*.mhd;*.nhdr;*.nrrd';
{$ELSE}
 kVolFilter = 'NIfTI volume|*.hdr;*.nii;*nii.gz';
{$ENDIF}
begin
  OpenDialog.Filter := kVolFilter;
  OpenDialog.Title := 'Select volume to convert';
  if not OpenDialog.Execute then exit;
  Nii2Mesh(OpenDialog.FileName);
end;

procedure TGLForm1.XRayLabelClick(Sender: TObject);
begin
  gPrefs.ShaderForBackgroundOnly := not gPrefs.ShaderForBackgroundOnly;
   GLBoxRequestUpdate(nil);
end;

procedure TGLForm1.UpdateToolbar;
begin
 NodeBox.Visible:= (length(gNode.nodes) > 0) ;
 EdgeBox.Visible:= (length(gNode.edges) > 0) ;
 TrackBox.Visible:= (gTrack.n_count > 0);
 OverlayBox.Visible := (gMesh.OpenOverlays > 0);
 MeshColorBox.Visible := (length(gMesh.vertexRGBA) > 0);
 Memo1.Lines.clear;
end; //UpdateToolbar()

function TGLForm1.OpenNode(FilenameIn: string): boolean;
 var
     FileName, edgename: string;
begin
 result := false;
 Filename := FindFile(FileNameIn);
 if Filename = '' then exit;
  if not gNode.LoadFromFile(FileName) then exit;
 result := true;
  gPrefs.PrevNodename := FileName;
 NodeMinEdit.value := gNode.nodePrefs.minNodeThresh;
 NodeMaxEdit.value := gNode.nodePrefs.maxNodeThresh;
 if gNode.NodePrefs.isNodeThresholdBySize then
  NodeThreshDrop.ItemIndex := 0  //threshold by size
 else
   NodeThreshDrop.ItemIndex := 1; //threshold by color
 edgename := ChangeFileExt(FileName, '.edge');
 if fileexists(edgename) then
    OpenEdge(edgename);
 OpenDialog.InitialDir:= ExtractFileDir(FileName);
 UpdateToolbar;
 GLBoxRequestUpdate(nil);
end;

procedure TGLForm1.MeshColorBoxChange(Sender: TObject);
begin
  gMesh.vertexRgbaAlpha := MeshTransparencyTrack.Position / MeshTransparencyTrack.Max;
  gMesh.vertexRgbaSaturation := MeshSaturationTrack.Position / MeshSaturationTrack.Max;
  gMesh.isRebuildList:= true;
  GLBoxRequestUpdate(nil);
end;

procedure TGLForm1.AdditiveOverlayMenuClick(Sender: TObject);
var
    i: integer;
    isIntensityOverlay: boolean;
begin
   gPrefs.AdditiveOverlay :=  AdditiveOverlayMenu.Checked;
   if gMesh.OpenOverlays < 1 then exit;
   isIntensityOverlay := false;
   for i :=  gMesh.OpenOverlays downto 1 do
          if length(gMesh.overlay[i].intensity) > 1 then
            isIntensityOverlay := true;
   if (not isIntensityOverlay) and (gPrefs.AdditiveOverlay) then begin
      Memo1.Lines.Clear;
      Memo1.lines.add('Hint: Additive effect only influences painted surfaces, not meshes');
   end;
   OverlayTimerStart;
end;

function TGLForm1.OpenEdge(FilenameIn: string): boolean;
var
  Filename, ext, nodename: string;
begin
   result := false;
   Filename := FindFile(FilenameIn);
   if Filename = '' then exit;
   result := true;
 ext := UpperCase(ExtractFileExt(Filename));
 setlength(gNode.edges,0); //clear edges array
 if (ext = '.NODEZ') or (ext = '.NODE') or (length(gNode.nodes) < 1) then begin
     nodename := ChangeFileExt(FileName, '.node');
     if fileexists(nodename) then begin
        OpenNode(nodename);
        UpdateToolbar;
        exit;
     end;
 end;
 if length(gNode.edges) < 1 then //only if edges not loaded by openNode
    if not gNode.LoadEdge(Filename, false) then exit;
 UpdateToolbar;
 edgeMinEdit.Value := 0;
 edgeMaxEdit.Value := gNode.nodePrefs.maxEdgeAbs;
 OpenDialog.InitialDir:= ExtractFileDir(FileName);
 GLBoxRequestUpdate(nil);
end;

function TGLForm1.OpenOverlay(FilenameIn: string): boolean;
var
  Filename: string;
begin
   //StringGrid1.Col := 3;
   result := false;
   Filename := FindFile(FilenameIn);
   if Filename = '' then exit;
   if not gMesh.LoadOverlay(FileName) then begin //gPrefs.SmoothVoxelwiseData
     GLBoxRequestUpdate(nil);
     UpdateToolbar;
     exit;
   end;
   result := true;
   gPrefs.PrevOverlayname := FileName;
   OpenDialog.InitialDir:= ExtractFileDir(FileName);
   StringGrid1.RowCount := gMesh.OpenOverlays+1;
        StringGrid1.Col := kMin;
   UpdateToolbar;
   UpdateOverlaySpread;
end;

function TGLForm1.OpenTrack(FilenameIN: string): boolean;
var
  Filename: string;
  i: integer;
begin
   result := false;
 Filename := FindFile(FilenameIN);
 if Filename = '' then exit;
 if (gTrack.LoadFromFile(FileName)) and (gTrack.n_count > 0) then begin
    result := true;
    OpenDialog.InitialDir:= ExtractFileDir(FileName);
    gPrefs.PrevTrackname := FileName;
    if (gTrack.maxObservedFiberLength * 0.5) < TrackLengthTrack.Position then
       TrackLengthTrack.Position := round(gTrack.maxObservedFiberLength * 0.5);
 end;
 if (length(gTrack.scalars) > 0) then begin
    {$IFDEF LCLcocoa}
    TrackBox.Height := 135;
    {$ELSE}
    TrackBox.ClientHeight := TrackScalarNameDrop.Top + TrackScalarNameDrop.Height + 2;
    {$ENDIF}

    TrackScalarNameDrop.Items.Clear;
    TrackScalarNameDrop.Items.Add('Direction');
    for i := 0 to (length(gTrack.scalars) -1) do
        TrackScalarNameDrop.Items.Add(gTrack.scalars[i].name);
    TrackScalarNameDrop.ItemIndex := 0;
    TrackScalarLUTdrop.ItemIndex := 1;
    TrackScalarLUTdrop.Enabled := false;
    TrackScalarRangeBtn.Enabled := false;
 end else
 {$IFDEF LCLcocoa}
 TrackBox.Height := 105;
 {$ELSE}
 TrackBox.ClientHeight := TrackDitherTrack.Top + TrackDitherTrack.Height;
 {$ENDIF}
 UpdateToolbar;
 GLBoxRequestUpdate(nil);
end;

function isVtkMesh (filename: string): boolean; //vtk files can be tracks (" LINES" ->Tracks/Open) or meshes ("POLYGONS " -> File/Open, Overlay/Open)
var
      f: file;
      Str: string;
      szRead: integer;
begin
     result := false;
     if not fileexists(filename) then exit;
     AssignFile(f, FileName);
     Reset(f,1);
     FileMode := fmOpenRead;
     szRead := FileSize(f);
     SetLength(Str, szRead);
     BlockRead(f, Str[1],szRead);
     CloseFile(f);
     if (pos('POLYGONS ', Str) > 0) then result := true; //faces
end;

function isGiiMesh (filename: string): boolean;
//returns true if file is a valid mesh (faces+vertices), returns false if overlay map
var
      f: file;
      Str: string;
      szRead: integer;
begin
     result := false;
     if not fileexists(filename) then exit;
     result := true;
     AssignFile(f, FileName);
     Reset(f,1);
     FileMode := fmOpenRead;
     szRead := FileSize(f);
     SetLength(Str, szRead);
     BlockRead(f, Str[1],szRead);
     CloseFile(f);
     if (pos('Intent="NIFTI_INTENT_TRIANGLE"', Str) > 0) then exit; //faces
     if (pos('Intent="NIFTI_INTENT_POINTSET"', Str) > 0) then exit; //vertices
     result := false;
end;

function isMz3Mesh (filename: string): boolean;
//returns true if file is a valid mesh (faces+vertices), returns false if overlay map
const
 kMagic =  23117; //"MZ"
 kChunkSize = 16;
label 666;
var
  i: integer;
  Magic, Attr: uint16;
  nFace, nVert: uint32;
  isFace, isVert: boolean;
  mStream : TMemoryStream;
  zStream: TGZFileStream;
  bytes : array of byte;
begin
     result := false;
     if not fileexists(Filename) then exit;
     mStream := TMemoryStream.Create;
     zStream := TGZFileStream.create(FileName, gzopenread);
     setlength(bytes, kChunkSize);
     i := zStream.read(bytes[0],kChunkSize);
     mStream.Write(bytes[0],i) ;
     if i < kChunkSize then goto 666;
     mStream.Position := 0;
     mStream.Read(Magic,2);
     mStream.Read(Attr,2);
     mStream.Read(nFace,4);
     mStream.Read(nVert,4);
     if (magic <> kMagic) then goto 666;
     isFace := (Attr and 1) > 0;
     isVert := (Attr and 2) > 0;
     result := (nFace > 0) and (nVert > 0) and (isFace) and (isVert);
   666 :
     zStream.Free;
     mStream.Free;
end; //isMz3Mesh

function TGLForm1.OpenMesh(FilenameIN: string): boolean;
var
    Filename, curvname, ext: string;
begin
  result := false;
  Filename := FindFile(FilenameIN);
  if Filename = '' then exit;
  result := true;
  ext := ExtractFileExtGzUpper(Filename);
  if (ext = '.GLS') then begin
     ScriptForm.Show;
     if ScriptForm.OpenScript(Filename) then
       ScriptForm.Compile1Click(nil);
     exit;
  end;

  //ext := UpperCase(ExtractFileExt(Filename));
  if (ext = '.NII') or (ext = '.HDR')  or (ext = '.NII.GZ') or (ext = '.ANNOT') or (ext = '.W') or (ext = '.CURV')  then begin
    OpenOverlay(Filename);
    exit;
  end else if (ext = '.VTK') and (not isVtkMesh (Filename)) then begin
    OpenTrack(Filename);  //.vtk files can be either meshes or tracks - autodetect
    exit;
  end else if (length(gMesh.Faces) > 0) and (ext = '.MZ3') and (not isMz3Mesh (Filename)) then begin
    OpenOverlay(Filename);  //GIfTI files can be meshes or overlays - autodetect
    exit;
  end else if (length(gMesh.Faces) > 0) and (ext = '.GII') and (not isGiiMesh (Filename)) then begin
    OpenOverlay(Filename);  //GIfTI files can be meshes or overlays - autodetect
    exit;
  end else if (ext = '.DAT') or  (ext = '.TRK') or  (ext = '.TRK.GZ') or (ext = '.FIB') or (ext = '.PDB') or (ext = '.TCK') or (ext = '.BFLOAT') or (ext = '.BFLOAT.GZ')  then begin
    OpenTrack(Filename);
    exit;
  end else if (ext = '.EDGE') then begin
    OpenEdge(Filename);
    exit;
  end else if (ext = '.NODE') or (ext = '.NODZ') then begin
    OpenNode(Filename);
    exit;
  end;
  if (ssShift in KeyDataToShiftState(vk_Shift)) then begin
     OpenOverlay(Filename);
     exit;
  end;
  CloseOverlaysMenuClick(nil);
  CloseTracksMenuClick(nil);
  CloseNodesMenuClick(nil);
  if not gMesh.LoadFromFile(Filename) then begin  //only add successful loads to MRU
     UpdateToolbar;
     GLBoxRequestUpdate(nil);
     exit;
  end;
  OpenDialog.InitialDir:= ExtractFileDir(Filename);
  UpdateToolbar;
  AddMRU(Filename);
  //if gMesh.isFreeSurferMesh then begin
     curvname := changefileext(Filename, '.curv');
     if fileexists(curvname) then
        OpenOverlay(curvname);
  //end;
  GLBoxRequestUpdate(nil);
end;

procedure TGLForm1.OpenMRU(Sender: TObject);//open template or MRU
begin
     OpenMesh(gPrefs.PrevFilename[(sender as TMenuItem).tag]);
end;

procedure TGLForm1.CreateMRU;
var
  lPos : integer;
  NewItem: TMenuItem;
begin
 for lPos :=  1 to knMRU do begin
        NewItem := TMenuItem.Create(FileMenu);
        NewItem.Caption :='';//(ParseFileName(ExtractFileName(lFName)));
        NewItem.Tag := lPos;
        NewItem.onclick :=  OpenMRU; //Lazarus
        NewItem.Visible := false;
        {$IFDEF Darwin}
        NewItem.ShortCut := ShortCut(Word('1')+ord(lPos-1), [ssMeta]);
        {$ELSE}
        NewItem.ShortCut := ShortCut(Word('1')+ord(lPos-1), [ssCtrl]);
        {$ENDIF}
        FileMenu.Add(NewItem);
  end;//for each MRU
end;

procedure TGLForm1.UpdateMRU;//most-recently-used RestrictMenu
var
   lCount, lPos : integer;
begin
 lCount := FileMenu.IndexOf(FileSepMenu);
 for lPos :=  1 to knMRU do begin
      if gPrefs.PrevFilename[lPos] <> '' then begin
        FileMenu.Items[lCount + lPos].Visible:= true;
        FileMenu.Items[lCount + lPos].Caption:= ExtractFileName(gPrefs.PrevFilename[lPos]);
      end else
          FileMenu.Items[lCount + lPos].Visible:= false;
  end;//for each MRU
end;  //UpdateMRU

procedure TGLForm1.AddMRU(lFilename: string);
var
  i, rep: integer;
  prev: TMRU;
begin
 rep := 1024;
 for i := 1 to knMRU do begin
     prev[i] := gPrefs.PrevFilename[i];
     if prev[i] = lFilename then
        rep := i;
 end;
 gPrefs.PrevFilename[1] := lFilename;
 for i := 1 to (knMRU-1) do begin
     if i >= rep then
        gPrefs.PrevFilename[i+1] := prev[i+1]
     else
         gPrefs.PrevFilename[i+1] := prev[i];
 end;
 UpdateMRU;
end;

function GetOrigin(out scale: single): TPoint3f;
begin
     result := ptf(0,0,0);
     scale := 0.0;
     if (length(gMesh.faces) > 0) then begin
        scale := gMesh.Scale;
        result :=  ptf(gMesh.Origin.X,gMesh.Origin.Y,gMesh.Origin.Z) ;
     end;
     if (length(gNode.faces) > 0) and (gNode.Scale > scale) then begin
        scale := gNode.Scale;
        result :=  ptf(gNode.Origin.X, gNode.Origin.Y, gNode.Origin.Z) ;
     end;
     if (gTrack.n_count > 0) and (gTrack.Scale > scale) then begin
       scale := gTrack.Scale;
       result :=  ptf(gTrack.Origin.X, gTrack.Origin.Y, gTrack.Origin.Z) ;
     end;
end;

procedure IncTrackBar (T: TTrackBar; isDepthTrack: boolean);
var
   i: integer;
begin
  i := (T.Max div 4);
  i := ((i+T.Position) div i) * i;
  if i >= T.Max then i := T.Min;
  T.position := i;
  if not(isDepthTrack) and (T.position <> 0) and (GLForm1.ClipTrack.position = 0) then
     GLForm1.ClipTrack.Position := GLForm1.ClipTrack.Max div 2;
end;

procedure TGLForm1.OverlayTimerStart;
begin
     OverlayTimer.enabled := true;
end;

procedure TGLForm1.ShowmessageError(s: string);
begin
 if  GLerror <> '' then exit;
     GLerror := s;
     ErrorTimer.Enabled := true;
end;

procedure TGLForm1.SetOverlayTransparency(Sender: TObject);
begin
  gMesh.OverlayTransparency := (sender as TMenuItem).tag;
  OverlayTimerStart;
end;



procedure TGLForm1.ShaderBoxResize(Sender: TObject);
const
kMinMemoSz= 32;
var
   lDesiredControlSz: integer;
begin
  if not ShaderBox.Visible then exit;
  lDesiredControlSz := ShaderPanelHeight;
  if ShaderBox.ClientHeight > (lDesiredControlSz+kMinMemoSz) then begin
    //if ShaderBox.Height > (lDesiredControlSz+kMinMemoSz) then begin
    Memo1.Height := ShaderBox.Height - lDesiredControlSz;
    Memo1.Height := ShaderBox.ClientHeight - lDesiredControlSz;
    Memo1.visible := true;
  end
  else
     Memo1.visible := false;
  ShaderBox.Refresh;
end;


function ResetIniDefaults : boolean;
begin
     if ParamCount > 0 then begin //e.g. Matlab users often launch system commands using keyboard shortcuts. These uses should use -R to force reset
        result := false;
        exit;
     end;
     //result := ( GetKeyState(VK_MENU)<> 0) or (GetKeyState(VK_LWIN) <> 0) or (GetKeyState(VK_CONTROL) <> 0)  or (ssShift in KeyDataToShiftState(VK_SHIFT)) ;
     result := ( GetKeyState(VK_MENU)<> 0) or (GetKeyState(VK_LWIN) <> 0)  or (ssShift in KeyDataToShiftState(VK_SHIFT)) ;
end;

procedure TGLForm1.ShaderDropChange(Sender: TObject);
begin
  SetShader(ShaderDir+pathdelim+ShaderDrop.Items[ShaderDrop.ItemIndex]+'.txt');
  ShaderBoxResize(Sender);
  GLBoxRequestUpdate(Sender);
end;


procedure TGLForm1.GLboxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
 if gMouseX < 0 then exit; //mouse is not down
 gElevation := gElevation + (Y - gMouseY);
 gAzimuth := gAzimuth - (X - gMouseX);
 while gAzimuth > 360 do
       gAzimuth := gAzimuth -360;
 while gAzimuth < -360 do
       gAzimuth := gAzimuth + 360;
 gMouseX := X;
 gMouseY := Y;
 GLBox.invalidate;//GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.GLboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     gMouseX := -1; //released
end;

procedure TGLForm1.GLboxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     gMouseX := X;
     gMouseY := Y;
end;

procedure sph2cartDeg90x(Azimuth,Elevation,R: single; var lX,lY,lZ: single);
//convert spherical AZIMUTH,ELEVATION,RANGE to Cartesion
var
  n: integer;
  E,Phi,Theta: single;
begin
  Theta := DegToRad(Azimuth-90);
  E := Elevation;
  if (E > 360) or (E < -360)  then begin
    n := trunc(E / 360) ;
    E := E - (n * 360);
  end;
  if ((E > 89) and (E < 91)) or (E < -269) and (E > -271) then
    E := 90;
  if ((E > 269) and (E < 271)) or (E < -89) and (E > -91) then
    E := -90;
  Phi := DegToRad(E);
  lX := r * cos(Phi)*cos(Theta);
  lY := r * cos(Phi)*sin(Theta);
  lZ := r * sin(Phi);
end;

procedure TGLForm1.ClipTrackChange(Sender: TObject);
var
  scale: single;
begin
 GetOrigin(scale);
 sph2cartDeg90x(ClipAziTrack.Position,ClipElevTrack.Position,1,clipPlane.X,clipPlane.Y,clipPlane.Z);
 if ClipTrack.Position < 1 then
    clipPlane.X := 2 //tell GLSL that plane is disabled: normalized value must be <= 1.0
 else
   clipPlane.W := ((ClipTrack.Position/ClipTrack.Max) - 0.5) * scale * 2.0;
 Memo1.Lines.clear;
 Memo1.Lines.Add(format('Clipping Amount %d',[ClipTrack.Position]));
 Memo1.Lines.Add(format('Clipping Azimuth %d',[ClipAziTrack.Position]));
 Memo1.Lines.Add(format('Clipping Elevation %d',[ClipElevTrack.Position]));
 GLBox.invalidate;  //show change immediately!, for delay: GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.CloseMenuClick(Sender: TObject);
begin
  gMesh.Close;
  gNode.Close;
  gTrack.Close;
  UpdateToolbar;
  GLboxRequestUpdate(Sender);
end;

procedure TGLForm1.CloseNodesMenuClick(Sender: TObject);
begin
  gNode.Close;
  UpdateToolbar;
  GLboxRequestUpdate(sender);
end;

procedure TGLForm1.CloseOverlaysMenuClick(Sender: TObject);
begin
  (*if (Sender <> nil) and (gMesh.OpenOverlays > 0) then begin
    if isFreeSurferLUT(gMesh.Overlay[1].LUTindex) then
         if MessageDlg('Curvature overlay open', 'Close the FreeSurfer CURV file?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
           exit;
  end;*)
  gMesh.CloseOverlays;
  GLForm1.SetFocusedControl(nil); //GLForm1.ActiveControl := nil;
  UpdateToolbar;
  GLboxRequestUpdate(sender);
end;

procedure TGLForm1.CloseTracksMenuClick(Sender: TObject);
begin
  gTrack.Close;
  UpdateToolbar;
  GLboxRequestUpdate(sender);
end;

procedure TGLForm1.GLboxRequestUpdate(Sender: TObject);
var
  scale: single;
begin
 GetOrigin(scale);
  sph2cartDeg90x(LightAziTrack.position,LightElevTrack.position, scale * 2, gShader.lightPos.X, gShader.lightPos.Z,gShader.lightPos.Y);
  gShader.lightPos.Z := -gShader.lightPos.Z;
  gShader.lightPos.X := gShader.lightPos.X * scale;
  gShader.lightPos.Y := gShader.lightPos.Y * scale;
  gShader.lightPos.Z := gShader.lightPos.Z * scale;
  UpdateTimer.Enabled := true;
end;

procedure TGLForm1.SaveTrack (var lTrack: TTrack);
const
    kTrackFilter  = 'VTK (.vtk)|*.vtk|Camino (.Bfloat)|*.Bfloat|CaminoGZ (.Bfloat.gz)|*.Bfloat.gz|TrackVis (.trk)|*.trk|TrackVisGZ (.trk.gz)|*.trk.gz';
var
  nam: string;
begin
  if (lTrack.n_count < 1) then begin
   showmessage('Unable to save tracks: no tracks open (use Tracks/AddTracks)');
   exit;
 end;
 SaveMeshDialog.Filter := kTrackFilter;
 SaveMeshDialog.Title := 'Save track file';
 nam := gPrefs.PrevTrackname;
 SaveMeshDialog.InitialDir:= ExtractFileDir(nam);
 if not fileexists(nam) then
   nam := 'Track.vtk';
 nam := extractfilename (nam);
 if gPrefs.SaveAsFormatTrack = kSaveAsTrackTrk then begin
   SaveMeshDialog.DefaultExt:= '.trk';
   SaveMeshDialog.FileName := changeFileExt(nam, '.trk');
   SaveMeshDialog.FilterIndex := 4;
 end else if gPrefs.SaveAsFormatTrack = kSaveAsTrackBfloat then begin
   SaveMeshDialog.DefaultExt:= '.BFloat';
   SaveMeshDialog.FileName := changeFileExt(nam, '.BFloat');
   SaveMeshDialog.FilterIndex := 2;
 end else begin
     SaveMeshDialog.DefaultExt:= '.vtk';
     SaveMeshDialog.FileName := changeFileExt(nam, '.vtk');
     SaveMeshDialog.FilterIndex := 1;
 end;
 if not SaveMeshDialog.Execute then exit;
 nam := UpperCase(ExtractFileExt(SaveMeshDialog.Filename));
 if (SaveMeshDialog.FilterIndex = 4) or (SaveMeshDialog.FilterIndex = 5) or (nam = '.TRK') or (nam = '.TRK.GZ') then
    lTrack.SaveTrk(SaveMeshDialog.Filename)
 else if (SaveMeshDialog.FilterIndex = 2) or (SaveMeshDialog.FilterIndex = 3) or (nam = '.BFLOAT') or (nam = '.BFLOAT.GZ') then
    lTrack.SaveBfloat(SaveMeshDialog.Filename)
 else
     lTrack.SaveVtk(SaveMeshDialog.Filename);
end;

function  SimplifyPref(out Tol, minLength: single): boolean;
var
    PrefForm: TForm;
    OkBtn: TButton;
    TolLabel, minLengthLabel: TLabel;
    TolEdit, minLengthEdit: TEdit;
begin
     Tol := 0.5;
     minLength := 10;
    PrefForm:=TForm.Create(nil);
    PrefForm.SetBounds(100, 100, 520, 112);
    PrefForm.Caption:='Track simplification preferences';
    PrefForm.Position := poScreenCenter;
    PrefForm.BorderStyle := bsDialog;
    //Tolerance
    TolLabel:=TLabel.create(PrefForm);
    TolLabel.Caption:= 'Tolerance ("1" will allow track to deviate 1mm from original)';
    TolLabel.Left := 8;
    TolLabel.Top := 12;
    TolLabel.Parent:=PrefForm;
    TolEdit:=TEdit.create(PrefForm);
    TolEdit.Caption := FloatToStrF(Tol, ffGeneral, 8, 4);
    TolEdit.Top := 12;
    TolEdit.Width := 92;
    TolEdit.Left := PrefForm.Width - TolEdit.Width - 8;
    TolEdit.Parent:=PrefForm;
    //minLength
    minLengthLabel:=TLabel.create(PrefForm);
    minLengthLabel.Caption:= 'Enter minimum fiber length';
    minLengthLabel.Left := 8;
    minLengthLabel.Top := 42;
    minLengthLabel.Parent:=PrefForm;
    minLengthEdit:=TEdit.create(PrefForm);
    minLengthEdit.Caption := FloatToStr(minLength);
    minLengthEdit.Top := 42;
    minLengthEdit.Width := 92;
    minLengthEdit.Left := PrefForm.Width - minLengthEdit.Width - 8;
    minLengthEdit.Parent:=PrefForm;
    //OK button
    OkBtn:=TButton.create(PrefForm);
    OkBtn.Caption:='OK';
    OkBtn.Top := 72;
    OkBtn.Width := 128;
    OkBtn.Left := PrefForm.Width - OkBtn.Width - 8;
    OkBtn.Parent:=PrefForm;
    OkBtn.ModalResult:= mrOK;
    {$IFNDEF Darwin} ScaleDPIX(PrefForm, 96);{$ENDIF}
    PrefForm.ShowModal;
    Tol := StrToFloatDef(TolEdit.Caption, Tol);
    minLength := StrToFloatDef(minLengthEdit.Caption, minLength);
    result :=  PrefForm.ModalResult = mrOK;
    FreeAndNil(PrefForm);
  end;


procedure TGLForm1.SimplifyTracksMenuClick(Sender: TObject);
var
  tol, minLength: single;
  lTrack: TTrack;
begin
     //showmessage(gPrefs.PrevTrackname);
 (*if DefaultFormatSettings.DecimalSeparator = '.' then
    s := '0.1'
  else
      s := '0,1';
  if not inputquery('Track simplify', 'Enter tolerance (e.g. "1" will allow track to deviate 1mm from original)', s) then exit;
  if not TryStrToFloat(s, tol) then begin
    showmessage('Unable convert value to a number');
    exit;
  end; *)
  if not SimplifyPref(Tol, minLength) then exit;
  OpenDialog.Filter := kTrackFilter;
  OpenDialog.Title := 'Select track file';
  if Fileexists(gPrefs.PrevTrackname) then begin
     OpenDialog.InitialDir := ExtractFileDir(gPrefs.PrevTrackname);
     OpenDialog.FileName:= gPrefs.PrevTrackname;
  end;
  if not OpenDialog.Execute then exit;
  lTrack := TTrack.Create;
  if lTrack.LoadFromFile(OpenDialog.FileName) then begin
     gPrefs.PrevTrackname := OpenDialog.FileName;
     if lTrack.SimplifyMM(Tol, minLength) then begin
      SaveTrack(lTrack);
     end;
  end;
  lTrack.Close;
  lTrack.Free;
end;

procedure TGLForm1.SaveTracksMenuClick(Sender: TObject);
begin
     SaveTrack(gTrack);
end;

procedure TGLForm1.ScalarDropChange(Sender: TObject);
var
  i: integer;
begin
  gTrack.scalarSelected := TrackScalarNameDrop.ItemIndex -1;//-1 for direction color, 0 for first scalar, etc.
  TrackScalarLUTdrop.Enabled := (gTrack.scalarSelected >= 0); //disable if color based on direction not scalar
  TrackScalarRangeBtn.Enabled := TrackScalarLUTdrop.Enabled;
  i := TrackScalarLUTdrop.ItemIndex;
  gTrack.scalarLUT := UpdateTransferFunction(i, false);
  gTrack.isRebuildList:= true;
  GLBoxRequestUpdate(Sender);
end;

// 'Defuzz' is used for comparisons and to avoid propagation of 'fuzzy',
//  nearly-zero values.  DOUBLE calculations often result in 'fuzzy' values.
//  The term 'fuzz' was adapted from the APL language.
(*FUNCTION  Defuzz(CONST x:  DOUBLE):  DOUBLE;
const
 fuzz = 1.0E-6;
BEGIN
  IF  ABS(x) < fuzz
  THEN RESULT := 0.0
  ELSE RESULT := x
END {Defuzz};
  *)
function  ScalarPref(var min, max: single; var ColorBarPrecedenceTracksNotOverlays: boolean): boolean;
var
    PrefForm: TForm;
    OkBtn: TButton;
    minLabel, maxLabel: TLabel;
    minEdit, maxEdit: TEdit;
    ColorBarCheck: TCheckBox;
begin
    PrefForm:=TForm.Create(nil);
    PrefForm.SetBounds(100, 100, 520, 142);
    PrefForm.Caption:='Track simplification preferences';
    PrefForm.Position := poScreenCenter;
    PrefForm.BorderStyle := bsDialog;
    //Tolerance
    minLabel:=TLabel.create(PrefForm);
    minLabel.Caption:= 'Minimum intensity';
    minLabel.Left := 8;
    minLabel.Top := 12;
    minLabel.Parent:=PrefForm;
    minEdit:=TEdit.create(PrefForm);
    minEdit.Caption := FloatToStrF(min, ffGeneral, 8, 4);
    minEdit.Top := 12;
    minEdit.Width := 92;
    minEdit.Left := PrefForm.Width - minEdit.Width - 8;
    minEdit.Parent:=PrefForm;
    //minLength
    maxLabel:=TLabel.create(PrefForm);
    maxLabel.Caption:= 'Maximum intensity';
    maxLabel.Left := 8;
    maxLabel.Top := 42;
    maxLabel.Parent:=PrefForm;
    maxEdit:=TEdit.create(PrefForm);
    maxEdit.Caption := FloatToStrF(max, ffGeneral, 8, 4);
    maxEdit.Top := 42;
    maxEdit.Width := 92;
    maxEdit.Left := PrefForm.Width - maxEdit.Width - 8;
    maxEdit.Parent:=PrefForm;
    //Precedence   ColorBarPrecedenceTracksNotOverlays
    ColorBarCheck:=TCheckBox.create(PrefForm);
    ColorBarCheck.Checked := ColorBarPrecedenceTracksNotOverlays;
    ColorBarCheck.Caption:='Colorbar for tracks, even if overlay loaded';
    ColorBarCheck.Left := 8;
    ColorBarCheck.Top := 72;
    ColorBarCheck.Parent:=PrefForm;
    //OK button
    OkBtn:=TButton.create(PrefForm);
    OkBtn.Caption:='OK';
    OkBtn.Top := 102;
    OkBtn.Width := 128;
    OkBtn.Left := PrefForm.Width - OkBtn.Width - 8;
    OkBtn.Parent:=PrefForm;
    OkBtn.ModalResult:= mrOK;
    {$IFNDEF Darwin} ScaleDPIX(PrefForm, 96);{$ENDIF}
    PrefForm.ShowModal;
    min := StrToFloatDef(minEdit.Caption, min);
    max := StrToFloatDef(maxEdit.Caption, max);
    ColorBarPrecedenceTracksNotOverlays := ColorBarCheck.Checked;
    result :=  PrefForm.ModalResult = mrOK;
    FreeAndNil(PrefForm);
  end;

procedure TGLForm1.TrackScalarRangeBtnClick(Sender: TObject);
begin
 if (gTrack.scalarSelected < 0) or (gTrack.scalarSelected >= length(gTrack.scalars)) then exit;
 ScalarPref(gTrack.scalars[gTrack.scalarSelected].mnView, gTrack.scalars[gTrack.scalarSelected].mxView, gPrefs.ColorBarPrecedenceTracksNotOverlays);
 gTrack.isRebuildList:= true;
 GLBoxRequestUpdate(Sender);
end;

(*const
    kTrackFilter  = 'VTK|*.vtk';
begin
 if (gTrack.n_count < 1) then begin
   showmessage('Unable to save tracks: no tracks open (use Tracks/AddTracks)');
   exit;
 end;
 SaveMeshDialog.Filter := kTrackFilter;
 SaveMeshDialog.DefaultExt:= '.vtk';
 SaveMeshDialog.Title := 'Save tracks as VTK';
 SaveMeshDialog.FileName := changeFileExt(gPrefs.PrevTrackname, '.vtk');
 if not SaveMeshDialog.Execute then exit;
 //gTrack.SaveVtk(SaveMeshDialog.Filename);
 gTrack.SaveBfloat(SaveMeshDialog.Filename);
end;*)

procedure TGLForm1.SurfaceAppearanceChange(Sender: TObject);
begin
  Memo1.Lines.Clear;
  GLForm1.Memo1.Lines.Add(gShader.note);
  if OcclusionTrack.Visible then begin
     Memo1.Lines.Add(format('Ambient Occlusion %d',[OcclusionTrack.position]));
     Memo1.Lines.Add(format('XRay Background %d Overlay %d',[meshAlphaTrack.position, MeshBlendTrack.position]));
  end;
  Memo1.Lines.Add(format('Light Elevation %d Azimuth %d',[LightElevTrack.position, LightAziTrack.position]));
  ReportUniformChange(Sender);
  GLboxRequestUpdate(Sender);
end;

procedure TGLForm1.StringGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
 if aRow < 1 then exit;
 if (gMesh.Overlay[aRow].LUTinvert) then
    TStringGrid(Sender).Canvas.Font.Style:= [fsItalic]
 else
   TStringGrid(Sender).Canvas.Font.Style:= [];
 if (gMesh.Overlay[aRow].LUTvisible = kLUTinvisible) then
    TStringGrid(Sender).Canvas.Font.Color := clRed
 else if (gMesh.Overlay[aRow].LUTvisible = kLUTtranslucent) then
      TStringGrid(Sender).Canvas.Font.Color := clBlue
 else
     TStringGrid(Sender).Canvas.Font.Color := clBlack;
 (*if (gMesh.Overlay[aRow].LUTvisible <> kLUTinvisible) then begin
    if (gMesh.Overlay[aRow].LUTinvert) then begin
       TStringGrid(Sender).Canvas.Font.Color := clBlue;
       TStringGrid(Sender).Canvas.Font.Style:= [fsItalic];
       TStringGrid(Sender).Canvas.TextOut(aRect.Left+2,aRect.Top+2, TStringGrid(Sender).Cells[ACol, ARow]);
    end;
    exit;
 end;
 //make rows of invisible overlays red
 TStringGrid(Sender).Canvas.Font.Color := clRed;*)
 TStringGrid(Sender).Canvas.TextOut(aRect.Left+2,aRect.Top+2, TStringGrid(Sender).Cells[ACol, ARow]);
end;

procedure TGLForm1.StringGrid1Exit(Sender: TObject);
begin
     //ReadCell(gPrevCol,gPrevRow, true);
end;

function IsDigit (letter : char) : boolean;
begin
  result := ((letter <= '9') and (letter >= '0'));
end;

function HasDigit (var lS: string): boolean;
//do not attempt to convert '-', '.', or '-.' as a number...
var
   lI,lLen: integer;
begin
     result := false;
     lLen := length (lS);
     if lLen < 1 then
        exit;
     for lI := 1 to lLen do begin
         if lS[lI] in ['0'..'9'] then begin
            result := true;
            exit;
         end;
     end;
end;

procedure TGLForm1.StringGrid1Enter(Sender: TObject);
//var
//   ACol, ARow: integer;
begin
     //ACol := abs(GLForm1.StringGrid1.Selection.Right);
     //ARow := abs(GLForm1.StringGrid1.Selection.Top);
     //StringGrid1.Cells[ACol,ARow] := '';
end;


procedure TGLForm1.StringGrid1EditingDone(Sender: TObject);
var
    lIndex: integer;
begin
 for lIndex := 1 to gMesh.OpenOverlays do begin
     gMesh.Overlay[lIndex].WindowScaledMin := strtofloatDef(StringGrid1.Cells[kMin,lIndex], gMesh.Overlay[lIndex].WindowScaledMin);
     gMesh.Overlay[lIndex].WindowScaledMax := strtofloatDef(StringGrid1.Cells[kMax,lIndex], gMesh.Overlay[lIndex].WindowScaledMax);

     //StringGrid1.Cells[kMin,lIndex] := FloatToStrF(gMesh.Overlay[lIndex].WindowScaledMin, ffGeneral, 8, 4);
    //StringGrid1.Cells[kMax,lIndex] := FloatToStrF(gMesh.Overlay[lIndex].WindowScaledMax, ffGeneral, 8, 4);
 end;
 UpdateImageIntensity;
 OverlayTimerStart;
end;

procedure TGLForm1.StringGrid1KeyPress(Sender: TObject; var Key: char);
begin
(*const
  EnterKey = #13;
  BackspaceKey = #8;
  ControlC = #3;   //  Copy
  ControlV = #22;  //  Paste
var
  ACol,ARow: integer;
  S: string;
begin
ACol := abs(GLForm1.StringGrid1.Selection.Right);
  ARow := abs(GLForm1.StringGrid1.Selection.Top);
  //if ((ACol <> gPrevCol) or (ACol <> gPrevCol)) and    ChangeOverlayUpdate;
  gPrevCol := ACol;
  gPrevRow := ARow;
  if (not (IsDigit (Key) or (Key = DefaultFormatSettings.DecimalSeparator) or (Key = '+') or (Key = '-') or
        (Key = ControlC) or (Key = ControlV) or (Key = BackspaceKey) or
        (Key = EnterKey))) then begin
    Key := #0;
    exit;
  end;
  if (Key = kTab) then begin
    OverlayTimerStart;
    exit;
  end;
  if (Key = kTab) or (Key = kCR) then begin
    ReadCell(gPrevCol,gPrevRow, true);
    OverlayTimerStart;
    exit;
  end;
  gTypeInCell := true;
  exit;//

  OverlayTimerStart;
  if(( GLForm1.StringGrid1.Selection.Top = GLForm1.StringGrid1.Selection.Bottom ) and
		( GLForm1.StringGrid1.Selection.Left = GLForm1.StringGrid1.Selection.Right )) then begin
          if gEnterCell then
             S := ''
          else
	      S := GLForm1.StringGrid1.Cells[ GLForm1.StringGrid1.Selection.Left,GLForm1.StringGrid1.Selection.Top ] ;
          gEnterCell := false;
          if ( ( Key = kDEL ) or ( Key = kBS ) )then begin
              if( length( S ) > 0 ) then begin
                  setlength( S, length( S ) - 1 ) ;
              end;
          end else
	      S := S + Key ;
     {$IFDEF FPC} GLForm1.StringGrid1.Cells[ GLForm1.StringGrid1.Selection.Left,GLForm1.StringGrid1.Selection.Top ] := S;
      {$ENDIF}
  end ;
  ReadCell(gPrevCol,gPrevRow, false);  *)
end;

procedure TGLForm1.UpdateOverlaySpread;// (lIndex: integer);
var
  lIndex: integer;
begin
 GLForm1.LUTdrop.visible := false;
 if gMesh.OpenOverlays < 1 then exit;
 for lIndex := 1 to gMesh.OpenOverlays do begin
   GLForm1.StringGrid1.Cells[kFName, lIndex] := gMesh.Overlay[lIndex].FileName;
    GLForm1.StringGrid1.Cells[kLUT, lIndex] := GLForm1.LutDrop.Items[gMesh.Overlay[lIndex].LUTindex];
    OverlayBox.Height :=  2+ ( (2+gMesh.OpenOverlays)*(StringGrid1.DefaultRowHeight+1));
    StringGrid1.Cells[kMin,lIndex] := float2str(gMesh.Overlay[lIndex].WindowScaledMin,3);//FloatToStrF(gMesh.Overlay[lIndex].WindowScaledMin, ffGeneral, 8, 4);
    StringGrid1.Cells[kMax,lIndex] := float2str(gMesh.Overlay[lIndex].WindowScaledMax,3);//FloatToStrF(gMesh.Overlay[lIndex].WindowScaledMax, ffGeneral, 8, 4);
  end;
  UpdateImageIntensity;
end;

procedure TGLForm1.OverlayVisible(lOverlay: integer; lVisible: integer);
begin
  if (lOverlay > gMesh.OpenOverlays) or (lOverlay < 1) then
    exit;
  if (lVisible < kLUTinvisible) or (lVisible > kLUTopaque) then
     gMesh.Overlay[lOverlay].LUTvisible := kLUTopaque
  else
     gMesh.Overlay[lOverlay].LUTvisible := lVisible;
  UpdateOverlaySpread;
end;

procedure TGLForm1.OverlayInvert(lOverlay: integer; lInvert: boolean);
begin
  if (lOverlay > gMesh.OpenOverlays) or (lOverlay < 1) then
    exit;
  gMesh.Overlay[lOverlay].LUTinvert := lInvert;
  UpdateOverlaySpread;
  gMesh.overlay[lOverlay].LUT := UpdateTransferFunction (gMesh.Overlay[lOverlay].LUTindex, gMesh.Overlay[lOverlay].LUTinvert);
  OverlayTimerStart;
end;

procedure TGLForm1.PrefMenuClick(Sender: TObject);
var
  PrefForm: TForm;
  OkBtn, AdvancedBtn: TButton;
  BitmapAlphaCheck, SmoothVoxelwiseDataCheck, TracksAreTubesCheck: TCheckBox; //MultiPassRenderingCheck
  //ShaderForBackgroundOnlyCombo,
    ZDimIsUpCombo, QualityCombo, SaveAsCombo: TComboBox;
  QualityLabel: TLabel;
  isAdvancedPrefs: boolean;
begin
  PrefForm:=TForm.Create(nil);
  PrefForm.SetBounds(100, 100, 520, 262);
  PrefForm.Caption:='Preferences';
  PrefForm.Position := poScreenCenter;
  PrefForm.BorderStyle := bsDialog;
    //Bitmap Alpha
  BitmapAlphaCheck:=TCheckBox.create(PrefForm);
  BitmapAlphaCheck.Checked := gPrefs.ScreenCaptureTransparentBackground;
  BitmapAlphaCheck.Caption:='Background transparent in bitmaps';
  BitmapAlphaCheck.Left := 8;
  BitmapAlphaCheck.Top := 8;
  BitmapAlphaCheck.Parent:=PrefForm;
  //SmoothVoxelwiseData
  SmoothVoxelwiseDataCheck:=TCheckBox.create(PrefForm);
  SmoothVoxelwiseDataCheck.Checked := gPrefs.SmoothVoxelwiseData;
  SmoothVoxelwiseDataCheck.Caption:='Smooth voxel-based images';
  SmoothVoxelwiseDataCheck.Left := 8;
  SmoothVoxelwiseDataCheck.Top := 38;
  SmoothVoxelwiseDataCheck.Parent:=PrefForm;
  //TracksAreTubes
  TracksAreTubesCheck:=TCheckBox.create(PrefForm);
  TracksAreTubesCheck.Checked := gPrefs.TracksAreTubes;
  TracksAreTubesCheck.Caption:='Better (but slower) tracks';
  TracksAreTubesCheck.Left := 8;
  TracksAreTubesCheck.Top := 68;
  TracksAreTubesCheck.Parent:=PrefForm;
  //ShaderForBackgroundOnly
  (*ShaderForBackgroundOnlyCombo := TComboBox.create(PrefForm);
  ShaderForBackgroundOnlyCombo.Items.Add('Tracks, nodes and overlays use fixed shader');
  ShaderForBackgroundOnlyCombo.Items.Add('Tracks, nodes and overlays use background shader');
  if (gPrefs.ShaderForBackgroundOnly) then
     ShaderForBackgroundOnlyCombo.ItemIndex := 0
  else
      ShaderForBackgroundOnlyCombo.ItemIndex := 1;
  ShaderForBackgroundOnlyCombo.Left := 8;
  ShaderForBackgroundOnlyCombo.Top := 98;
  ShaderForBackgroundOnlyCombo.Width := PrefForm.Width -16;
  ShaderForBackgroundOnlyCombo.Style := csDropDownList;
  ShaderForBackgroundOnlyCombo.Parent:=PrefForm; *)
  //ZDimIsUp
  ZDimIsUpCombo := TComboBox.create(PrefForm);
  ZDimIsUpCombo.Items.Add('Z-dimension is up (Neuroimaging/Talairach)');
  ZDimIsUpCombo.Items.Add('Y-dimension is up (Blender/OpenGL)');
  if (gPrefs.ZDimIsUp) then
     ZDimIsUpCombo.ItemIndex := 0
  else
      ZDimIsUpCombo.ItemIndex := 1;
  ZDimIsUpCombo.Left := 8;
  ZDimIsUpCombo.Top := 128;
  ZDimIsUpCombo.Width := PrefForm.Width -16;
  ZDimIsUpCombo.Style := csDropDownList;
  ZDimIsUpCombo.Parent:=PrefForm;
  //SaveAsObj     SaveAsFormat
  SaveAsCombo :=TComboBox.create(PrefForm);
  SaveAsCombo.Left := 8;
  SaveAsCombo.Top := 158;
  SaveAsCombo.Width := PrefForm.Width -16;
  SaveAsCombo.Items.Add('OBJ Format: Export to other programs');
  SaveAsCombo.Items.Add('GII Format: Neuroimaging');
  SaveAsCombo.Items.Add('MZ3 Format: Fast and small');
  SaveAsCombo.Items.Add('PLY Format: Export to other programs');
  SaveAsCombo.ItemIndex:= gPrefs.SaveAsFormat;
  SaveAsCombo.Style := csDropDownList;
  SaveAsCombo.Parent:=PrefForm;
  //SinglePass
  (*MultiPassRenderingCheck:=TCheckBox.create(PrefForm);
  MultiPassRenderingCheck.Checked := gPrefs.MultiPassRendering;
  MultiPassRenderingCheck.Caption:='Better rendering (slower)';
  MultiPassRenderingCheck.Left := 8;
  MultiPassRenderingCheck.Top := 128;
  MultiPassRenderingCheck.Parent:=PrefForm; *)
  //Smooth
  QualityCombo:=TComboBox.create(PrefForm);
  QualityCombo.Left := 8;
  QualityCombo.Top := 188;
  QualityCombo.Width := PrefForm.Width -16;
  QualityCombo.Items.Add('Quality: Poor (old hardware)');
  QualityCombo.Items.Add('Quality: Better');
  //QualityCombo.Items.Add('Quality: Best');
  QualityCombo.ItemIndex:= gPrefs.RenderQuality;
  QualityCombo.Style := csDropDownList;
  QualityCombo.Parent:=PrefForm;
  if not gPrefs.SupportBetterRenderQuality then begin
      QualityCombo.Visible := false;
      QualityLabel:=TLabel.create(PrefForm);
      QualityLabel.Left := 8;
      QualityLabel.Top := 188;
      QualityLabel.Width := PrefForm.Width -16;
      QualityLabel.Caption := 'NOTE: Hardware only supports poor rendering.';
      QualityLabel.Parent:=PrefForm;
  end;
  //SingleShader
 (*   ZDimIsUpCombo := TComboBox.create(PrefForm);
  ZDimIsUpCombo.Items.Add('Z-dimension is up (Neuroimaging/Talairach)');
  ZDimIsUpCombo.Items.Add('Y-dimension is up (Blender/OpenGL)');
  if (gPrefs.ZDimIsUp) then
     ZDimIsUpCombo.ItemIndex := 0
  else
      ZDimIsUpCombo.ItemIndex := 1;
  ZDimIsUpCombo.Left := 8;
  ZDimIsUpCombo.Top := 98;
  ZDimIsUpCombo.Width := PrefForm.Width -16;
  ZDimIsUpCombo.Style := csDropDownList;
  ZDimIsUpCombo.Parent:=PrefForm;  *)

  //OK button
  OkBtn:=TButton.create(PrefForm);
  OkBtn.Caption:='OK';
  OkBtn.Left := PrefForm.Width - 128;
  OkBtn.Width:= 100;
  OkBtn.Top := 228;
  OkBtn.Parent:=PrefForm;
  OkBtn.ModalResult:= mrOK;

  AdvancedBtn:=TButton.create(PrefForm);
  AdvancedBtn.Caption:='Advanced';
  AdvancedBtn.Left := PrefForm.Width - 256;
  AdvancedBtn.Width:= 100;
  AdvancedBtn.Top := 228;
  AdvancedBtn.Parent:=PrefForm;
  AdvancedBtn.ModalResult:= mrYesToAll;
  {$IFNDEF Darwin} ScaleDPIX(PrefForm, 96);  {$ENDIF}
  PrefForm.ShowModal;
  if (PrefForm.ModalResult <> mrOK) and (PrefForm.ModalResult <> mrYesToAll) then begin
    FreeAndNil(PrefForm);
  	exit; //if user closes window with out pressing "OK"
  end;
  gPrefs.ScreenCaptureTransparentBackground :=  BitmapAlphaCheck.Checked;
  gPrefs.SmoothVoxelwiseData := SmoothVoxelwiseDataCheck.Checked;
  (*if ShaderForBackgroundOnlyCombo.ItemIndex = 1 then
     gPrefs.ShaderForBackgroundOnly := false
  else
      gPrefs.ShaderForBackgroundOnly := true; *)
  if ZDimIsUpCombo.ItemIndex = 1 then
     gPrefs.ZDimIsUp := false
  else
      gPrefs.ZDimIsUp := true;
  gMesh.isZDimIsUp := gPrefs.ZDimIsUp;
  gNode.isZDimIsUp := gPrefs.ZDimIsUp;

  //gPrefs.SaveAsObj := SaveAsObjCheck.Checked;
  gPrefs.SaveAsFormat := SaveAsCombo.ItemIndex;
  if QualityCombo.ItemIndex <> gPrefs.RenderQuality then begin
     gPrefs.RenderQuality := QualityCombo.ItemIndex;
     MultiPassRenderingToolsUpdate;
     GLBoxRequestUpdate(Sender);
  end;
  if (gPrefs.TracksAreTubes <> TracksAreTubesCheck.Checked) then begin
    gPrefs.TracksAreTubes := TracksAreTubesCheck.Checked;
    gTrack.isTubes:= gPrefs.TracksAreTubes;
    gTrack.isRebuildList:= true;

  end;
  isAdvancedPrefs := (PrefForm.ModalResult = mrYesToAll);
  FreeAndNil(PrefForm);
      GLBoxRequestUpdate(Sender);
  if  isAdvancedPrefs then
     Quit2TextEditor;
end; // PrefMenuClick()

procedure TGLForm1.QuickColorClick(Sender: TObject);
begin
  case (sender as TMenuItem).tag of
       1: gPrefs.ObjColor:= RGBToColor(210,148,148); //red
       2: gPrefs.ObjColor:= RGBToColor(128,162,128); //green
       3: gPrefs.ObjColor:= RGBToColor(167,171,253); //blue
       4: gPrefs.ObjColor:= RGBToColor(226,171,0); //gold
       else gPrefs.ObjColor:= RGBToColor(192,192,192); //gray
  end;
  {$IFDEF COREGL}
  gMesh.isRebuildList := true;
  {$ENDIF}
  GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.ResetMenuClick(Sender: TObject);
begin
     gPrefs.BackColor := RGBToColor(255,255,255);
     gPrefs.Colorbar := true;
     gDistance := 1;
     gElevation := 20;
     gAzimuth := 250;
     Transparency0.Click;
     gPrefs.ShaderForBackgroundOnly:= false;
     gPrefs.AdditiveOverlay:= false;
     gMesh.isAdditiveOverlay:= gPrefs.AdditiveOverlay;
     AdditiveOverlayMenu.Checked:= gPrefs.AdditiveOverlay;
     gPrefs.ObjColor:= RGBToColor(192,192,192);
     //set tracks
     TrackLengthTrack.Position:= 20;
     TrackWidthTrack.Position := 2; ;  //12 for 666Demo
     TrackDitherTrack.Position := 3;
     //mesh colors
     MeshSaturationTrack.Position := 100;
     MeshTransparencyTrack.Position:= 100;
     //clipping
     ClipTrack.Position := 0;
     ClipAziTrack.Position := 180;
     ClipElevTrack.Position := 0;
     //set shaders
     OcclusionTrack.Position := 25;
     MeshAlphaTrack.Position := 100;
     MeshBlendTrack.Position:= 0;
     LightElevTrack.Position:= 25;
     LightAziTrack.Position := 0;
     ShaderDrop.ItemIndex:= 0;
     ShaderDropChange(Sender);
end;

procedure TGLForm1.RestrictEdgeMenuClick(Sender: TObject);
begin
 gNode.nodePrefs.isNoPosEdge:=false;
 gNode.nodePrefs.isNoNegEdge:=false;
 if (sender as TMenuItem).tag = 1 then
    gNode.nodePrefs.isNoNegEdge:=true;
 if (sender as TMenuItem).tag = 2 then
    gNode.nodePrefs.isNoPosEdge:=true;
 gNode.isRebuildList := true;
 GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.RestrictHideNodesWithoutEdgesClick(Sender: TObject);
begin
 gNode.nodePrefs.isNoNodeWithoutEdge := RestrictHideNodesWithoutEdges.checked;
 if length(gNode.nodes) < 1 then exit;
 gNode.isRebuildList := true;
 GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.RestrictMenuClick(Sender: TObject);
begin
 gNode.nodePrefs.isNoLeftNodes:=false;
 gNode.nodePrefs.isNoRightNodes:=false;
 if (sender as TMenuItem).tag = 1 then
    gNode.nodePrefs.isNoRightNodes:=true;
 if (sender as TMenuItem).tag = 2 then
    gNode.nodePrefs.isNoLeftNodes:=true;
 if length(gNode.nodes) < 1 then exit;
 gNode.isRebuildList := true;
 GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.SimplifyMeshMenuClick(Sender: TObject);

var
  nTri: integer;
  msStart: Dword;
  s: string;
  r: single;
begin
 msStart := gettickcount();
 nTri := length(gMesh.Faces);
 s := '.3';
 if not inputquery('Track simplify', 'Enter reduction factor (e.g. 0.2 will decimate 80% of all triangles)', s) then exit;
 r := StrToFloatDef(s, 0.5);
 if (r <= 0.0) or (r > 1.0) then begin
    showmessage('Error: reduction factor should be BETWEEN 0 and 1');
    exit;
 end;
 if not ReducePatch(gMesh.faces, gMesh.vertices, r) then exit;
 caption := format('Faces %d -> %d (%.3f, %d ms)', [ nTri, length(gMesh.Faces), length(gMesh.Faces)/nTri , gettickcount() - msStart]) ;
 gMesh.isRebuildList:=true;
 GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.SwapYZMenuClick(Sender: TObject);
begin
 if gPrefs.ZDimIsUp then
     gMesh.SwapYZ
 else
     gMesh.SwapZY;
 GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.ReverseFacesMenuClick(Sender: TObject);
begin
  gMesh.ReverseFaces;
  GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Row, Col: integer;
  CanSelect: boolean;
begin
  if (gMesh.OpenOverlays < 1) then exit;
  Row := GLForm1.StringGrid1.DefaultRowHeight div 2;
  Row := round((Y-Row)/GLForm1.StringGrid1.DefaultRowHeight);
  if (Row > 0) and (Row <= gMesh.OpenOverlays) then
      StringGrid1.Hint := 'Click on name to hide, control+click to reverse palette for '+GLForm1.StringGrid1.Cells[0, Row]
  else begin
       StringGrid1.Hint := 'Click on name to hide, control+click to reverse palette';
       exit;
  end;
     //StringGrid1.Hint := format('%s %g..%g',[GLForm1.StringGrid1.Cells[0, Row], gMesh.overlay[Row].minIntensity, gMesh.overlay[Row].maxIntensity]);
  if (X >  (GLForm1.StringGrid1.DefaultColWidth *2)) then
    exit; //not one of the first two colums
  Col := X div GLForm1.StringGrid1.DefaultColWidth;
  If (Col = kLUT) then begin //hide overlay
     StringGrid1SelectCell(Sender, Col, Row, CanSelect);
     exit;
  end;
  GLForm1.LUTdrop.visible := false;
  if (Row < 1) or (Row > gMesh.OpenOverlays) then exit;
  if (ssCtrl in Shift) then begin
     (*gMesh.Overlay[Row].LUTreverse := not gMesh.Overlay[Row].LUTreverse;
     UpdateOverlaySpread;
     gMesh.overlay[Row].LUT := UpdateTransferFunction (gMesh.Overlay[Row].LUTindex, gMesh.Overlay[Row].LUTreverse);
        xxx
     OverlayTimerStart;*)
   OverlayInvert(Row, not gMesh.Overlay[Row].LUTinvert);
     exit;
  end;
  If (Col = kFname) or  ((ssRight in Shift) or (ssShift in Shift)) then begin //toggle overlay from opaque, translucent, and invisible
     if gMesh.Overlay[Row].LUTvisible = kLUTOpaque then
        gMesh.Overlay[Row].LUTvisible := kLUTTranslucent
     else if gMesh.Overlay[Row].LUTvisible = kLUTTranslucent then
          gMesh.Overlay[Row].LUTvisible := kLUTinvisible
     else
         gMesh.Overlay[Row].LUTvisible := kLUTOpaque;
     OverlayVisible(Row, gMesh.Overlay[Row].LUTvisible );
      OverlayTimerStart;
      exit;
  end;

  if (gMesh.OpenOverlays < 2) then
    exit; //can not shuffle order of a single item!
  //DemoteOrder(Row); //TO DO
end;

procedure TGLForm1.UpdateImageIntensity;
var
  i: integer;
begin
     //gTypeInCell := false;
     if gMesh.OpenOverlays > 0 then begin
       Memo1.Lines.clear;
        for i := 1 to gMesh.OpenOverlays do begin
            Memo1.Lines.Add(format('Overlay %d: %s',[i, extractfilename(gMesh.overlay[i].filename)]));
            Memo1.Lines.Add(format(' range min..max %.4g..%.4g',[gMesh.overlay[i].minIntensity, gMesh.overlay[i].maxIntensity]));
            Memo1.Lines.Add(format(' view min..max %.4g..%.4g',[gMesh.overlay[i].windowScaledMin, gMesh.overlay[i].windowScaledMax]));
        end;
     end;
     OverlayTimerStart;
end;

procedure TGLForm1.LUTdropChange(Sender: TObject);
var intRow: Integer;
begin
  inherited;
 if GLForm1.Lutdrop.Tag < 1 then
     exit;
  //intRow := GLForm1.StringGrid1.Row;
  //if intRow < 0 then
    intRow := GLForm1.Lutdrop.Tag;
  if (intRow < 1) or (intRow > kMaxOverlays) then
    exit;
  UpdateLUT(intRow,GLForm1.LUTdrop.ItemIndex,true);
  OverlayTimerStart;
  GLForm1.StringGrid1.Selection:=TGridRect(Rect(-1,-1,-1,-1));
  LutDrop.visible := false;
end;

procedure TGLForm1.UpdateLUT(lOverlay,lLUTIndex: integer; lChangeDrop: boolean);
begin
  if (gMesh.OpenOverlays > kMaxOverlays)  then
    exit;
  if lLUTIndex >= LUTdrop.Items.Count then
    gMesh.Overlay[lOverlay].LUTindex:= 0
  else
    gMesh.Overlay[lOverlay].LUTindex:= lLUTIndex;
  if lChangeDrop then begin
    StringGrid1.Cells[kLUT, lOverlay] := LUTdrop.Items[gMesh.Overlay[lOverlay].LUTindex];
    //LUTdrop.ItemIndex := gOverlayImg[lOverlay].LUTindex;
  end;
  gMesh.overlay[lOverlay].LUT := UpdateTransferFunction (gMesh.Overlay[lOverlay].LUTindex, gMesh.Overlay[lOverlay].LUTinvert);
  //LUTdropLoad(gMesh.Overlay[lOverlay].LUTindex, gMesh.Overlay[lOverlay].LUT, LUTdrop.Items[lLUTindex], gOverlayCLUTrec[lOverlay]);
end;

procedure TGLForm1.StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
var R: TRect;
begin
  //if (gTypeInCell) then UpdateImageIntensity;
  if (ACol < kLUT) or (ACol > kMax) or (ARow < 1) or (ARow > gMesh.OpenOverlays) then
     exit;
  //ReadCell(gPrevCol,gPrevRow, false);
  if (ACol = kLUT) and  (ARow <> 0) then begin
    //Size and position the combo box to fit the cell
    R := StringGrid1.CellRect(ACol, ARow);
    R.Left := R.Left + GLForm1.StringGrid1.Left;
    R.Right := R.Right + GLForm1.StringGrid1.Left;
    R.Top := R.Top + GLForm1.StringGrid1.Top;
    R.Bottom := R.Bottom + GLForm1.StringGrid1.Top;
    //Show the combobox
    with GLForm1.LUTdrop do begin
      Left := R.Left + 1;
      Top := R.Top + 1;
      Width := (R.Right + 1) - R.Left;
      Height := (R.Bottom + 1) - R.Top;
      {$IFDEF LCLcocoa}
      Left := R.Left-1;
      Top := R.Top-1;
      Width := (R.Right + 3) - R.Left;
      Height := (R.Bottom + 3) - R.Top;
      {$ENDIF}
      Visible := True;
      Tag := ARow;
      SetFocus;
      ItemIndex := Items.IndexOf(GLForm1.StringGrid1.Cells[ACol, ARow]);

      exit;
    end;
  end else begin
      GLForm1.LUTdrop.visible := false;
      //ReadCell(ACol,ARow, false);
      //gEnterCell := true;
  end;
  CanSelect := True;
end;

procedure TGLForm1.TrackBoxChange(Sender: TObject);
begin
  gTrack.minFiberLength := TrackLengthTrack.position;
  gTrack.LineWidth := TrackWidthTrack.Position;
  gTrack.ditherColorFrac := TrackDitherTrack.Position / TrackDitherTrack.Max;
  Memo1.Lines.clear;
  Memo1.Lines.Add(format('Track min length %d',[TrackLengthTrack.position]));
  Memo1.Lines.Add(format('Track line width %d',[TrackWidthTrack.Position]));
  Memo1.Lines.Add(format('Track dither %.2g',[gTrack.ditherColorFrac]));
  gTrack.isRebuildList:= true;
  GLBoxRequestUpdate(Sender);
end;



procedure TGLForm1.ReadCell (ACol,ARow: integer; Update: boolean);
var
  lF: single;
  lS: string;
begin
  if (ARow < GLForm1.StringGrid1.FixedRows) or (ARow > kMaxOverlays) or (ARow >= GLForm1.StringGrid1.RowCount) then  //2015
    exit;
  if (ACol <> kMin) and (ACol <> kMax) then
    exit;
  lS := StringGrid1.Cells[ACol,ARow];
  if not HasDigit(lS) then
    exit;
  try
    lF := strtofloatDef(lS, 0);
  except
          exit;
  end; {except}
  if ACol = kMin then
    gMesh.Overlay[ARow].WindowScaledMin := lF
  else
    gMesh.Overlay[ARow].WindowScaledMax := lF;
  if Update then UpdateImageIntensity;
end;

procedure TGLForm1.OVERLAYMINMAX (lOverlay: integer; lMin,lMax: single);
begin
  if (gMesh.OpenOverlays < 1) or (lOverlay > gMesh.OpenOverlays)  then exit;
  gMesh.Overlay[lOverlay].WindowScaledMin := lMin;
  gMesh.Overlay[lOverlay].WindowScaledMax := lMax;
  UpdateOverlaySpread;

end;


procedure TGLForm1.CreateRender(w,h: integer; isToScreen: boolean);
var
  origin: TPoint3f;
  isMultiSample: boolean;
  meshAlpha, meshBlend, ambientOcclusionFrac, scale: single;
begin
  if (h < 1) or (w < 1) then exit;
  if gNode.isBusy or gMesh.isBusy or isBusy then begin //come back later
     UpdateTimer.enabled := true;
     exit;
  end;
  if (length(gShader.VertexProgram) > 0) then gTrack.isRebuildList:= true; //666Demo
  InitGLSL(false);
  origin := GetOrigin(scale);
  //glUseProgram(gShader.program3d);
  {$IFNDEF COREGL}
  SetLighting(gPrefs);
  {$ENDIF}
  //nDrawScene(w, h, true, false, gPrefs, origin, lightPos, ClipPlane, scale, gShader.Distance, gelevation, gazimuth, gMesh,gNode, gTrack);
  if (gPrefs.RenderQuality <> kRenderPoor) and (gPrefs.SupportBetterRenderQuality)  then begin;
    meshAlpha := meshAlphaTrack.position/meshAlphaTrack.max;
    meshBlend := MeshBlendTrack.position/MeshBlendTrack.max;
    ambientOcclusionFrac := occlusionTrack.Position/occlusionTrack.max;

    //first pass: 3D draw all items: framebuffer f1
    isMultiSample := setFrame (w, h, gShader.f1, true );
    DrawScene(w,h, gPrefs.OverlayClip, true,isMultiSample, gPrefs, origin, ClipPlane, scale, gDistance, gElevation, gAzimuth, gMesh,gNode, gTrack);
    //second pass: 3D draw overlay items only: framebuffer f2
    isMultiSample := setFrame (w, h, gShader.f2, true );
    DrawScene(w,h, gPrefs.OverlayClip, false,isMultiSample, gPrefs, origin,  ClipPlane, scale, gDistance, gElevation, gAzimuth, gMesh,gNode, gTrack);
    if (isToScreen)  then begin
       releaseFrame; //GOOD: multipass, multisampling
       Set2DDraw (w,h, red(gPrefs.BackColor) ,green(gPrefs.BackColor), blue(gPrefs.BackColor));
       RunAoGLSL( gShader.f1,  gShader.f2, 1,  meshAlpha, meshBlend, ambientOcclusionFrac, gDistance);
    end else begin  //SCREENSHOT - multipass, multisampling, supersampled
        setFrame (w, h, gShader.fScreenShot, true );
        Set2DDraw (w,h, red(gPrefs.BackColor) ,green(gPrefs.BackColor), blue(gPrefs.BackColor));
        RunAoGLSL( gShader.f1,  gShader.f2, gPrefs.ScreenCaptureZoom,  meshAlpha,meshBlend,ambientOcclusionFrac,gDistance);
    end;
  end else begin //else POOR quality : do not use framebuffers (single pass)
      //if isToScreen then
         releaseFrame;
      //else
      //    setFrame (w, h, gShader.fScreenShot, true ); //SCREENSHOT - supersampled
      DrawScene(w, h, gPrefs.OverlayClip, true, false, gPrefs, origin, ClipPlane, scale, gDistance, gelevation, gazimuth, gMesh,gNode, gTrack);
  end;
  if gPrefs.OrientCube then
     DrawCube (w, h,  gAzimuth, gElevation);
//glViewport( 0, 0, w, h); //required when bitmap zoom <> 1
  if (gPrefs.Colorbar)  then begin
    //RunOffGLSL; //turn off shading
    if (gMesh.OpenOverlays > 0) and ((gTrack.n_count < 1) or (not gPrefs.ColorBarPrecedenceTracksNotOverlays)) then
       DrawCLUT( gPrefs.ColorBarPos, 0.01, gPrefs, gMesh, w, h) //color bar based on overlays
    else if (gTrack.n_count > 0) and (gTrack.scalarSelected >= 0) and (gTrack.scalarSelected < length(gTrack.scalars))  then
          DrawCLUTtrk(gPrefs.ColorBarPos, 0.01, gTrack.scalars[gTrack.scalarSelected].mnView, gTrack.scalars[gTrack.scalarSelected].mxView, gPrefs, gTrack.scalarLUT, w, h) //color bar based on overlays
          //DrawCLUTtrk ( lU: TUnitRect; lBorder, lMin, lMax: single; var lPrefs: TPrefs; LUT: TLUT;window_width, window_height: integer );
    else
       DrawCLUT( gPrefs.ColorBarPos, 0.01, gPrefs, gNode, w, h); //color bar based on nodes
  end;

  //if (gTrack.scalarSelected < 0) or (gTrack.scalarSelected >= length(gTrack.scalars)) then exit;
 //ScalarPref(gTrack.scalars[gTrack.scalarSelected].mnView, gTrack.scalars[gTrack.scalarSelected].mxView);
  //TestColorBar(gPrefs, w, h);
  //DrawText (gPrefs, w, h);
  if (isToScreen) then
             GLbox.SwapBuffers;
  //nDraw;
    isBusy := false;
end;

procedure TGLForm1.GLboxPaint(Sender: TObject);
begin
 CreateRender(GLBox.Width, GLBox.Height, true);
 if UpdateTimer.enabled then
    UpdateTimerTimer(Sender);

end;

function TGLForm1.ScreenShot: TBitmap;
var
  RawImage: TRawImage;
  p: array of byte;
  zoom, w, h, x, y, BytePerPixel,trackLineWidth: integer;
  z:longword;
  DestPtr: PInteger;
  maxXY : array[0..1] of GLuint;
begin
 GLBox.MakeCurrent;
 glGetIntegerv(GL_MAX_VIEWPORT_DIMS, @maxXY);
 //caption := inttostr(maxXY[0]) +'x'+inttostr(maxXY[1]);
 w := GLbox.Width * gPrefs.ScreenCaptureZoom;
 h := GLbox.Height * gPrefs.ScreenCaptureZoom;
 if (w > maxXY[0]) or (h > maxXY[1]) or (gPrefs.RenderQuality = kRenderPoor) or (not (gPrefs.SupportBetterRenderQuality)) then begin
  w := GLbox.Width;
  h := GLbox.Height;
  zoom := 1
 end else
     zoom := gPrefs.ScreenCaptureZoom;
 trackLineWidth := gTrack.LineWidth;
 if (gTrack.n_count > 0) and (not gTrack.isTubes) then begin  //tracks are drawn in pixels, so zoom appropriately!
     gTrack.LineWidth := 2 * gTrack.LineWidth * zoom;
     gTrack.isRebuildList:= true;
  end;
  Result:=TBitmap.Create;
  Result.Width:=w;
  Result.Height:=h;

  if gPrefs.ScreenCaptureTransparentBackground then
    Result.PixelFormat := pf32bit
  else
      Result.PixelFormat := pf24bit; //if pf32bit the background color is wrong, e.g. when alpha = 0
  RawImage := Result.RawImage;
  BytePerPixel := RawImage.Description.BitsPerPixel div 8;
  setlength(p, 4*w* h);
  //GLBox.MakeCurrent;
  CreateRender(w, h, false); //draw to framebuffer fScreenShot
  {$IFDEF Darwin} //http://lists.apple.com/archives/mac-opengl/2006/Nov/msg00196.html
  glReadPixels(0, 0, w, h, $80E1, $8035, @p[0]); //OSX-Darwin   GL_BGRA = $80E1;  GL_UNSIGNED_INT_8_8_8_8_EXT = $8035;
  {$ELSE}
   {$IFDEF Linux}
     glReadPixels(0, 0, w, h, GL_RGBA, GL_UNSIGNED_BYTE, @p[0]); //Linux-Windows   GL_RGBA = $1908; GL_UNSIGNED_BYTE
   {$ELSE}
    glReadPixels(0, 0, w, h, $80E1, GL_UNSIGNED_BYTE, @p[0]); //Linux-Windows   GL_RGBA = $1908; GL_UNSIGNED_BYTE
   {$ENDIF}
  {$ENDIF}
  setFrame (2, 2, gShader.fScreenShot, false ); // <- release huge framebuffer
  GLbox.ReleaseContext;
  z := 0;
  if BytePerPixel <> 4 then begin
    for y:= h-1 downto 0 do begin
         DestPtr := PInteger(RawImage.Data);
         Inc(PByte(DestPtr), y * RawImage.Description.BytesPerLine );
         for x := 1 to w do begin
             DestPtr^ := p[z] + (p[z+1] shl 8) + (p[z+2] shl 16);
             Inc(PByte(DestPtr), BytePerPixel);
             z := z + 4;
         end;
     end; //for y : each line in image
  end else begin
      for y:= h-1 downto 0 do begin
          DestPtr := PInteger(RawImage.Data);
          Inc(PByte(DestPtr), y * RawImage.Description.BytesPerLine );
          System.Move(p[z], DestPtr^, w * BytePerPixel );
          z := z + ( w * 4 );
    end; //for y : each line in image
  end;
  setlength(p, 0);
  if (gTrack.n_count > 0) and (not gTrack.isTubes)  then begin  //reset for un-zoomed tracks
     gTrack.LineWidth := trackLineWidth;
     gTrack.isRebuildList:= true;
  end;
  GLboxRequestUpdate(GLForm1);
end;

procedure ScreenRes(var lVidX,lVidY: integer);
{$IFDEF FPC}
begin
    lVidX := Screen.Width;
    lVidY := Screen.Height;
end;
{$ELSE}
var
   DC: HDC;
begin
  DC := GetDC(0);
  try
   lVidX :=(GetDeviceCaps(DC, HORZRES));
   lVidY :=(GetDeviceCaps(DC, VERTRES));
  finally
       ReleaseDC(0, DC);
  end; // of try/finally
end;//screenres
{$ENDIF}

procedure TGLForm1.AdjustFormPos (var lForm: TForm);
{$IFDEF FPC}
const
     kBorderHt = 30;
     kBorderWid = 10;
{$ELSE}
const
     kBorderHt = 0;
     kBorderWid = 0;
{$ENDIF}
const
{$IFDEF FPC}
kExtra = 8;
{$ELSE}
kExtra = 0;
{$ENDIF}
var
  lPos: integer;
  lVidX,lVidY,lLeft,lTop: integer;
begin
  ScreenRes(lVidX,lVidY);
  lPos := lForm.Tag;
  if odd(lPos) then begin//form on left
    lLeft := GLForm1.Left-lForm.Width-kBorderWid;
    if lLeft < 0 then //try putting the form on the right
       lLeft := GLForm1.Left+GLForm1.Width+kExtra; //form on right
  end else begin
    lLeft := GLForm1.Left+GLForm1.Width+kExtra;//-default: right
    if ((lLeft+ lForm.Width) > lVidX) then
       lLeft := GLForm1.Left-lForm.Width-kBorderWid; //try on right
  end;
  if lPos < 3 then begin //align with top
    lTop := GLForm1.Top; //default - align with top
    if lTop < 0 then //backup - top of screen
       lTop := 0;
  end else if lPos > 4 then begin //align with vertical middle
    lTop := GLForm1.Top+(GLForm1.Height div 2)-(lForm.Height div 2)+kBorderHt; //default - align with bottom
    if ((lTop+lForm.Height) > lVidY) then
       lTop := GLForm1.Top; //backup - align with top
    if lTop < 0 then
       lTop := 0;
  end else begin //align with bottom
    lTop := GLForm1.Top+GLForm1.Height-lForm.Height+kBorderHt; //default - align with bottom
    if ((lTop+lForm.Height) > lVidY) then
       lTop := GLForm1.Top; //backup - align with top
    if lTop < 0 then
       lTop := 0;
  end;
  if (lPos = 0) or ((lLeft+ lForm.Width) > lVidX) or (lLeft < 0)
    or (lTop < 0) or ((lTop+lForm.Height) > lVidY) then
    lForm.Position := poScreenCenter
  else begin
    lForm.Position := poDesigned;
    lForm.Left := lLeft;
    lForm.Top := lTop;
  end;
end;

procedure TGLForm1.ScriptMenuClick(Sender: TObject);
begin
 AdjustFormPos(TForm(ScriptForm));
 ScriptForm.Show;
 //doScript;
end;

procedure TGLForm1.Quit2TextEditor;
{$IFDEF UNIX}
var
  AProcess: TProcess;
  {$IFDEF LINUX} I: integer; EditorFName : string; {$ENDIF}
begin
    {$IFDEF LINUX}
    EditorFName := FindDefaultExecutablePath('gedit');
   if EditorFName = '' then
     EditorFName := FindDefaultExecutablePath('tea');
    if EditorFName = '' then
      EditorFName := FindDefaultExecutablePath('nano');
    if EditorFName = '' then
      EditorFName := FindDefaultExecutablePath('pico');
    if EditorFName = '' then begin
       Showmessage(ExtractFilename(paramstr(0))+' will now quit. You can then use a text editor to modify the file '+IniName);
       Clipboard.AsText := EditorFName;
    end else begin
      EditorFName := '"'+EditorFName +'" "'+IniName+'"';
      Showmessage(ExtractFilename(paramstr(0))+' will now quit. Modify the settings with the command "'+EditorFName+'"');
         AProcess := TProcess.Create(nil);
         AProcess.InheritHandles := False;
         AProcess.Options := [poNewProcessGroup, poNewConsole];
         AProcess.ShowWindow := swoShow;
        for I := 1 to GetEnvironmentVariableCount do
            AProcess.Environment.Add(GetEnvironmentString(I));
         AProcess.Executable := EditorFName;
         AProcess.Execute;
         AProcess.Free;
    end;
    Clipboard.AsText := EditorFName;
    GLForm1.close;
    exit;
    {$ENDIF}
    Showmessage('Preferences will be opened in a text editor. The program '+ExtractFilename(paramstr(0))+' will now quit, so that the file will not be overwritten.');
    AProcess := TProcess.Create(nil);
    {$IFDEF UNIX}
      //AProcess.CommandLine := 'open -a TextEdit '+IniName;
      AProcess.Executable := 'open';
      AProcess.Parameters.Add('-e');
      AProcess.Parameters.Add(IniName);
    {$ELSE}
      AProcess.CommandLine := 'notepad '+IniName;
    {$ENDIF}
   Clipboard.AsText := AProcess.CommandLine;
  //AProcess.Options := AProcess.Options + [poWaitOnExit];
  AProcess.Execute;
  AProcess.Free;
  GLForm1.close;
end;

{$ELSE} //ShellExecute(Handle,'open', 'c:\windows\notepad.exe','c:\SomeText.txt', nil, SW_SHOWNORMAL) ;
begin
  gPrefs.SkipPrefWriting := true;
    Showmessage('Preferences will be opened in a text editor. The program '+ExtractFilename(paramstr(0))+' will now quit, so that the file will not be overwritten.');
   //GLForm1.SavePrefs;
    ShellExecute(Handle,'open', 'notepad.exe',PAnsiChar(AnsiString(IniName)), nil, SW_SHOWNORMAL) ;
  //WritePrefsOnQuit.checked := false;
  GLForm1.close;
end;
{$ENDIF}

procedure TGLForm1.DepthLabelDblClick(Sender: TObject);
begin
  gPrefs.OverlayClip := not gPrefs.OverlayClip;
  GLBoxRequestUpdate(Sender);
end;



procedure TGLForm1.CurvMenuClick(Sender: TObject);
var
  fnm: string;
  isTemp: boolean;
begin
    if length(gMesh.Faces) < 1 then begin
       showmessage('Unable to compute curvature: no mesh is loaded (use File/Open).');
       exit;
    end;
    //isTemp := (MessageDlg('Temporary CURV file?', mtConfirmation, [mbNo, mbYes], 0) = mrYes);
    isTemp := (Sender as TMenuItem).Tag = 1;

    fnm := changefileext(gPrefs.PrevFilename[1],'.curv');
    if isTemp then begin
       fnm := DesktopFolder + ExtractFileName(fnm);

    end;
    if fileexists(fnm) then begin
       showmessage('File already exists '+fnm);
       exit;
    end;
    GenerateCurv(fnm, gMesh.faces, gMesh.vertices);
    OpenOverlay(fnm);
    if isTemp then
      deletefile(fnm);
end;

procedure TGLForm1.NewWindow1Click(Sender: TObject);
{$IFNDEF UNIX}
begin
   ShellExecute(handle,'open',PChar(paramstr(0)), '','',SW_SHOWNORMAL); //uses ShellApi;
end;
{$ELSE}
var
    AProcess: TProcess;
    i : integer;
    //http://wiki.freepascal.org/Executing_External_Programs
begin
  IniFile(false,IniName,gPrefs);  //load new window with latest settings
  AProcess := TProcess.Create(nil);
  AProcess.InheritHandles := False;
  //AProcess.Options := [poNoConsole];  //poNoConsole is Windows only! http://lazarus-ccr.sourceforge.net/docs/fcl/process/tprocess.options.html
  //AProcess.ShowWindow := swoShow; //Windows only http://www.freepascal.org/docs-html/fcl/process/tprocess.showwindow.html
  for I := 1 to GetEnvironmentVariableCount do
      AProcess.Environment.Add(GetEnvironmentString(I));
  {$IFDEF Darwin}
  AProcess.Executable := 'open';
  AProcess.Parameters.Add('-n');
  AProcess.Parameters.Add('-a');
  AProcess.Parameters.Add(paramstr(0));
  {$ELSE}
  AProcess.Executable := paramstr(0);
  {$ENDIF}
  //AProcess.Parameters.Add('/Users/rorden/Documents/osx/MRIcroGL.app/Contents/MacOS/MRIcroGL');
  AProcess.Execute;
  AProcess.Free;
end;
{$ENDIF}


procedure TGLForm1.CenterMeshMenuClick(Sender: TObject);
begin
 gMesh.CenterOrigin;
 GLBoxRequestUpdate(Sender);
end;

{$IFDEF Darwin}
function GetHardwareVersion: string;
//returns number of CPUs for MacOSX computer
//example - will return 4 if the computer has two dual core CPUs
//requires Process in Uses Clause
//see http://wiki.lazarus.freepascal.org/Executing_External_Programs
var
   lProcess: TProcess;
   lStringList: TStringList;
begin
     Result := '';
     lProcess := TProcess.Create(nil);
     lStringList := TStringList.Create;
     lProcess.CommandLine := 'sysctl hw.model';
     lProcess.Options := lProcess.Options + [poWaitOnExit, poUsePipes];
     lProcess.Execute;
     lStringList.LoadFromStream(lProcess.Output);
     if lStringList.Count > 0 then
       result := lStringList.Strings[0];
     lStringList.Free;
     lProcess.Free;
end;

function GetOSVersion: string;
//returns number of CPUs for MacOSX computer
//example - will return 4 if the computer has two dual core CPUs
//requires Process in Uses Clause
//see http://wiki.lazarus.freepascal.org/Executing_External_Programs
var
   lProcess: TProcess;
   lStringList: TStringList;
begin
     Result := '';
     lProcess := TProcess.Create(nil);
     lStringList := TStringList.Create;
     lProcess.CommandLine := 'sw_vers';
     lProcess.Options := lProcess.Options + [poWaitOnExit, poUsePipes];
     lProcess.Execute;
     lStringList.LoadFromStream(lProcess.Output);
     if lStringList.Count > 1 then
       result := lStringList.Strings[1];
     lStringList.Free;
     lProcess.Free;
end;
{$ENDIF}

procedure TGLForm1.AboutMenuClick(Sender: TObject);
const
  kSamp = 36;
var
  TrackStr, MeshStr, str: string;
  s: dword;
  i: integer;
  scale: single;
  origin: TPoint3f;
begin
    MeshStr := '';
    if length(gMesh.vertices) > 0 then begin
       MeshStr := LineEnding + format('    %.4f..%.4f  %.4f..%.4f %.4f..%.4f',[gMesh.mnV.X, gMesh.mxV.X, gMesh.mnV.Y, gMesh.mxV.Y, gMesh.mnV.Z, gMesh.mxV.Z]);
    end;
    TrackStr := '';
    if (gTrack.n_count > 0) then begin
     if not gTrack.isWorldSpaceMM then
       TrackStr := 'Spatial Properties Underspecified';
     TrackStr := LineEnding + format('   %s %.4f..%.4f  %.4f..%.4f %.4f..%.4f',[TrackStr, gTrack.mnV.X, gTrack.mxV.X, gTrack.mnV.Y, gTrack.mxV.Y, gTrack.mnV.Z, gTrack.mxV.Z]);
 end;
 s := gettickcount();
 for i := 1 to kSamp do begin
     gAzimuth := (gAzimuth + 10) mod 360;
     GLbox.Repaint;
  end;
  origin := GetOrigin(scale);
  str :=  'Surf Ice '+' 7 February 2017 '
   {$IFDEF CPU64} + '64-bit'
   {$ELSE} + '32-bit'
   {$ENDIF}
   {$IFDEF LCLCarbon} + ' Carbon'{$ENDIF}
   {$IFDEF LCLCocoa} + ' Cocoa'{$ENDIF}
   {$IFDEF Linux} + ' Linux'{$ENDIF}
   {$IFDEF Windows} + ' Windows'{$ENDIF}
   {$IFDEF DGL} + ' DGL'{$ENDIF}
   {$IFNDEF COREGL}+' (Legacy OpenGL)'{$ENDIF}
   {$IFDEF Darwin}
           +LineEnding+' '+ GetOSVersion
           +LineEnding+' @: '+ AppDir2
           +LineEnding+' '+GetHardwareVersion
   {$ENDIF}
   +LineEnding+' www.mricro.com :: BSD 2-Clause License (opensource.org/licenses/BSD-2-Clause)'
   +LineEnding+' FPS ' +inttostr(round( (kSamp*1000)/(gettickcount-s)))
   +LineEnding+format(' Scale %.4f',[scale])
   +LineEnding+format(' Origin %.4fx%.4fx%.4f',[origin.X, origin.Y, origin.Z])
   +LineEnding+' Mesh Vertices '+inttostr(length(gMesh.vertices))+' Faces '+  inttostr(length(gMesh.faces)) +' Colors '+  inttostr(length(gMesh.vertexRGBA))
   +MeshStr
   +LineEnding+' Track Vertices '+inttostr(gTrack.n_vertices)+' Faces '+  inttostr(gTrack.n_faces) +' Count ' +inttostr(gTrack.n_count)
   +TrackStr
   +LineEnding+' Node Vertices '+inttostr(length(gNode.vertices))+' Faces '+  inttostr(length(gNode.faces))
   +LineEnding+' GPU '+gShader.Vendor
   +LineEnding+'Press "Abort" to quit and open settings '+ininame;
  ClipBoard.AsText:= str;
  i := MessageDlg(str,mtInformation,[mbAbort, mbOK],0);
  if i  = mrAbort then Quit2TextEditor;
end;

procedure TGLForm1.AddNodesMenuClick(Sender: TObject);
const
  kNodeFilter = 'BrainNet Node/Edge|*.node;*.nodz;*.edge|Any file|*.*';
var
  ext, f2: string;
begin
     if Fileexists(gPrefs.PrevNodename) then begin
        OpenDialog.InitialDir := ExtractFileDir(gPrefs.PrevNodename);
        OpenDialog.Filename := gPrefs.PrevNodename;
     end;
     OpenDialog.Filter := kNodeFilter;
     OpenDialog.Title := 'Select Node/Edge file';
     if not OpenDialog.Execute then exit;
     //OpenDialog.FileName := '/Users/rorden/Desktop/obj/myNodes.node';
     ext := UpperCase(ExtractFileExt(OpenDialog.Filename));
     if (ext = '.EDGE') and (length(gNode.nodes) < 1) then begin
        f2 := changefileext(OpenDialog.FileName, '.node');
        if fileexists(f2) then
           OpenNode(f2)
        else begin
             showmessage('Please load your NODE file before loading an edge file');
             exit;
        end;
     end;
     if (ext = '.EDGE') then
         OpenEdge(OpenDialog.FileName)
     else
         OpenNode(OpenDialog.FileName);
     //OpenEdge('/Users/rorden/Desktop/obj/Edge_Brodmann82.edge');
     UpdateToolbar;
end;

procedure TGLForm1.AddOverlayMenuClick(Sender: TObject);
const
{$IFDEF FOREIGNVOL}
 //kVolFilter = 'Neuroimaging (*.nii)|*.hdr;*.nii;*.nii.gz;*.voi;*.HEAD;*.mgh;*.mgz;*.mha;*.mhd;*.nhdr;*.nrrd';
 kOverlayFilter = 'Mesh (e.g. GIfTI) or Volume (e.g. NIfTI) |*.*';
{$ELSE}
kOverlayFilter = 'Mesh or NIfTI|*.*';
{$ENDIF}
begin
  OpenDialog.Filter := kOverlayFilter;
  OpenDialog.Title := 'Select overlay file';
  if Fileexists(gPrefs.PrevOverlayname) then begin
        OpenDialog.InitialDir := ExtractFileDir(gPrefs.PrevOverlayname);
        OpenDialog.FileName := gPrefs.PrevOverlayname;
  end;
  if not OpenDialog.Execute then exit;
  //OpenDialog.FileName := ('/Users/rorden/Desktop/Surf_Ice/other/motor_4t95vol.nii.gz');
  //OpenDialog.FileName := ('/Users/rorden/Desktop/Surf_Ice/other/motor_4t95mesh.gii');
  OpenOverlay(OpenDialog.FileName);
end;

procedure TGLForm1.AddTracksMenuClick(Sender: TObject);
begin
 OpenDialog.Filter := kTrackFilter;
 OpenDialog.Title := 'Select track file';
 if Fileexists(gPrefs.PrevTrackname) then begin
    OpenDialog.InitialDir := ExtractFileDir(gPrefs.PrevTrackname);
    OpenDialog.Filename := gPrefs.PrevTrackname;
 end;
 if not OpenDialog.Execute then exit;
 //OpenDialog.Filename := '/Users/rorden/Desktop/Surf_Ice/sample/stroke.trk';
 OpenTrack(OpenDialog.FileName);
end;

procedure TGLForm1.AzimuthLabelClick(Sender: TObject);
begin
 IncTrackBar(ClipAziTrack, false);
end;

procedure TGLForm1.BackColorMenuClick(Sender: TObject);
begin
 If (ssShift in KeyDataToShiftState(vk_Shift)) then begin
    if green(gPrefs.BackColor) > 128 then
       gPrefs.BackColor := RGBToColor(0,0,0)
    else
        gPrefs.BackColor := RGBToColor(255,255,255);
     GLBoxRequestUpdate(Sender);
     exit;
  end;
  ColorDialog1.color := gPrefs.BackColor;
  if not ColorDialog1.Execute then exit;
  gPrefs.BackColor := ColorDialog1.Color;
  GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.CollapseToolPanelBtnClick(Sender: TObject);
begin
  ToolPanel.Visible := not ToolPanel.Visible;
  CollapsedToolPanel.Visible := not CollapsedToolPanel.Visible;
  Self.ActiveControl := nil;
end;

procedure TGLForm1.ColorBarMenuClick(Sender: TObject);
begin
  gPrefs.Colorbar := not gPrefs.Colorbar;
  ColorBarMenu.Checked := gPrefs.Colorbar;
  GLBox.Invalidate;
end;

procedure TGLForm1.CopyMenuClick(Sender: TObject);
var
 bmp: TBitmap;
begin
 bmp := ScreenShot();
 Clipboard.Assign(bmp);
 bmp.Free;
end;

procedure TGLForm1.DepthLabelClick(Sender: TObject);
begin
     if ClipTrack.Position > 900 then
        ClipTrack.Position := 0
     else
          ClipTrack.Position := 100 * ((ClipTrack.Position +100) div 100);
end;

procedure TGLForm1.DisplayMenuClick(Sender: TObject);
begin
     case (Sender as TMenuItem).tag of
          0: gAzimuth := 270; //left
          1: gAzimuth := 90; //right
          3: gAzimuth := 180;//anterior
          4: gAzimuth := 180;//inferior
          else gAzimuth := 0; //posterior, inferior, superior
     end;
     case (Sender as TMenuItem).tag of
          4: gElevation := -90; //inferior
          5: gElevation := 90;//superior
          else gElevation := 0; //other
     end;
     GLBox.Invalidate;
end;

procedure TGLForm1.ElevationLabelClick(Sender: TObject);
begin
  IncTrackBar(ClipElevTrack, false);
end;

procedure TGLForm1.ErrorTimerTimer(Sender: TObject);
begin
  ErrorTimer.Enabled := false;
  Showmessage(GLError);
  GLerror := '';
end;

procedure TGLForm1.SetDistance(Distance: single);
begin
     gDistance := Distance;
     if gDistance > kMaxDistance then gDistance := kMaxDistance;
     if gDistance < 0.5 then gDistance := 0.5;
     GLBox.Invalidate;
end;

procedure TGLForm1.GLBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
 if abs(WheelDelta) < 5 then exit;
  if WheelDelta < 0 then
     SetDistance(gDistance * 0.9)
  else
    SetDistance(gDistance * 1.1);
end;

function TGLForm1.ComboBoxName2Index(var lCombo: TComboBox; lName: string): integer;
var
    lNameU, lItem : string;
    i: integer;
begin
     result := 0;
     if lCombo.Items.Count < 2 then exit;
     lNameU := uppercase(lName);
     i := 0;
     while i < lCombo.Items.Count do begin
         lItem := uppercase (lCombo.Items[i]);
         if (lItem = lNameU) then begin
            result := i;
            i := maxint-1;
         end;
         i := i + 1;
 end;//for each shader
end;

procedure TGLForm1.OVERLAYCOLORNAME(lOverlay: integer; lFilename: string);
//var
   //lLUTIndex, i: integer;
   //lName, lItem : string;
begin
 if (gMesh.OpenOverlays < 1) or (lOverlay > gMesh.OpenOverlays)  then exit;

 (*if GLForm1.LUTdrop.Items.Count < 2 then exit;
 lLUTIndex := 0;
 lName := uppercase(lFilename);
 for i := 0 to (GLForm1.LUTdrop.Items.Count-1) do begin
     lItem := uppercase (GLForm1.LUTdrop.Items[i]);
     if (lItem = lName) then
       lLUTindex := i;
 end;//for each shader
 UpdateLUT(lOverlay,lLUTIndex,true); *)
 UpdateLUT(lOverlay,ComboBoxName2Index(LUTdrop, lFilename),true);
end;

procedure TGLForm1.NodePrefChange(Sender: TObject);
var
  lo, hi: single;
begin
  gNode.nodePrefs.scaleNodeSize := NodeScaleTrack.Position / 10;
  gNode.nodePrefs.nodeLUTindex := LUTdropNode.itemIndex;
  //gNode.nodePrefs.isNodeSizeVaries := NodeSizeVariesCheck.checked;
  gNode.nodePrefs.isEdgeSizeVaries := EdgeSizeVariesCheck.checked;
  gNode.nodePrefs.isNodeColorVaries := NodeColorVariesCheck.checked;
  gNode.nodePrefs.isEdgeColorVaries := EdgeColorVariesCheck.checked;
  lo := nodeMinEdit.Value;
  hi := nodeMaxEdit.value;
  sortsingle(lo, hi);
  gNode.nodePrefs.minNodeThresh := lo;
  gNode.nodePrefs.maxNodeThresh := hi;
  gNode.nodePrefs.edgeLUTindex:= LUTdropEdge.itemIndex;
  gNode.nodePrefs.scaleEdgeSize:= edgeScaleTrack.Position / 10;
  lo := edgeMinEdit.Value;
  hi := edgeMaxEdit.value;
  sortsingle(lo, hi);
  gNode.nodePrefs.minEdgeThresh := lo;
  gNode.nodePrefs.maxEdgeThresh := hi;
  Memo1.Lines.clear;
  Memo1.Lines.Add(format('Node size range min..max %.4g..%.4g',[gNode.NodePrefs.minNodeSize, gNode.nodePrefs.maxNodeSize]));
  Memo1.Lines.Add(format('Node color range min..max %.4g..%.4g',[gNode.NodePrefs.minNodeColor, gNode.nodePrefs.maxNodeColor]));
  Memo1.Lines.Add(format('Node scale %.2g',[gNode.nodePrefs.scaleNodeSize]));
  Memo1.Lines.Add(format('Node color table %d',[gNode.nodePrefs.nodeLUTindex]) );
  if NodeThreshDrop.ItemIndex = 0 then begin
     gNode.nodePrefs.isNodeThresholdBySize := true;
     Memo1.Lines.Add(format('Node size threshold min..max %.4g..%.4g',[gNode.NodePrefs.minNodeThresh, gNode.nodePrefs.maxNodeThresh]));
  end else begin
    gNode.nodePrefs.isNodeThresholdBySize := false;
    Memo1.Lines.Add(format('Node color threshold min..max %.4g..%.4g',[gNode.NodePrefs.minNodeThresh, gNode.nodePrefs.maxNodeThresh]));
  end;
  Memo1.Lines.Add(format('Edge range min..max %.4g..%.4g',[gNode.NodePrefs.minEdge, gNode.nodePrefs.maxEdge]));
  Memo1.Lines.Add(format('Edge threshold min..max %.4g..%.4g',[gNode.NodePrefs.minEdgeThresh, gNode.nodePrefs.maxEdgeThresh]));
  Memo1.Lines.Add(format('Edge color table %d',[gNode.nodePrefs.edgeLUTindex]) );
  Memo1.Lines.Add(format('Edge scale %.2g',[gNode.nodePrefs.scaleEdgeSize]) );
  gNode.isRebuildList := true;
  GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.OrientCubeMenuClick(Sender: TObject);
begin
 gPrefs.OrientCube := OrientCubeMenu.Checked;
 GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  IniFile(false,IniName,gPrefs);
end;

procedure TGLForm1.ExitMenuClick(Sender: TObject);
begin
  //GLForm1.Close;
  Self.Close;
  //Application.Terminate;
end;

procedure TGLForm1.ObjectColorMenuClick(Sender: TObject);
begin
  ColorDialog1.color := gPrefs.ObjColor;
  if not ColorDialog1.Execute then exit;
  gPrefs.objColor := ColorDialog1.Color;
    {$IFDEF COREGL}
  gMesh.isRebuildList := true;
  {$ENDIF}
  GLBoxRequestUpdate(Sender);
end;

procedure TGLForm1.OpenMenuClick(Sender: TObject);
const
     kMeshFilter = 'Mesh (GIfTI, PLY, FreeSurfer, etc)|*.*';
begin
 OpenDialog.Filter := kMeshFilter;
 OpenDialog.Title := 'Select mesh file';
 if Fileexists(gPrefs.PrevFilename[1]) then begin
    OpenDialog.InitialDir := ExtractFileDir(gPrefs.PrevFilename[1]);
    OpenDialog.Filename := gPrefs.PrevFilename[1];
  end;
  if not OpenDialog.Execute then exit;
  OpenMesh(OpenDialog.Filename);
end;

procedure TGLForm1.OverlayBoxCreate;
var
   lSearchRec: TSearchRec;
   lStr: string;
begin
 StringGrid1.Selection := TGridRect(Rect(-1, -1, -1, -1));
 StringGrid1.DefaultRowHeight := LUTdrop.Height+1;
 StringGrid1.DefaultColWidth := (StringGrid1.width div 4)-2;
  {$IFDEF FPC} {$IFNDEF UNIX}
 if Screen.PixelsPerInch <> 96 then begin
     StringGrid1.DefaultColWidth := round(StringGrid1.width* (Screen.PixelsPerInch/96) * 0.25) - 2;
 end;
{$ENDIF}{$ENDIF}
  StringGrid1.Cells[kFname, 0] := 'Name';
  StringGrid1.Cells[kLUT, 0] := 'Color';
  StringGrid1.Cells[kMin, 0] := 'Min';
  StringGrid1.Cells[kMax, 0] := 'Max';
  LUTdrop.Items.Clear;
  LUTdrop.Items.Add('Grayscale');
  LUTdrop.Items.Add('Red-Yellow');
  LUTdrop.Items.Add('Blue-Green');
  LUTdrop.Items.Add('Red');
  LUTdrop.Items.Add('Green');
  LUTdrop.Items.Add('Blue');
  LUTdrop.Items.Add('Violet [r+b]');
  LUTdrop.Items.Add('Yellow [r+g]');
  LUTdrop.Items.Add('Cyan [g+b]');
  LUTdrop.Items.Add('Hot');
  LUTdrop.Items.Add('Bone');
  LUTdrop.Items.Add('Winter');
  LUTdrop.Items.Add('GE');
  LUTdrop.Items.Add('ACTC');
  LUTdrop.Items.Add('X-Rain');
  LUTdrop.Items.Add('FreeSurfer1');
  LUTdrop.Items.Add('FreeSurfer2');
  LUTdrop.Items.Add('FreeSurfer3');
  LUTdrop.Items.Add('FreeSurfer4');
  if DirectoryExists(ClutDir) then  begin
     if FindFirst(CLUTdir+pathdelim+'*.clut', faAnyFile, lSearchRec) = 0 then
	 repeat
               lStr := ChangeFileExt (ExtractFileName (lSearchRec.Name), '');
               if (length(lStr) > 0) and (lStr[1] <> '.') then
                  LUTdrop.Items.Add(lStr);
	 until (FindNext(lSearchRec) <> 0);
     FindClose(lSearchRec);
  end;
  LUTdropNode.Items := LUTdrop.Items;
  LUTdropEdge.Items := LUTdrop.Items;
  LUTdropNode.ItemIndex := 3;
  LUTdropEdge.ItemIndex := 1;
  //Copy names for tracks
  TrackScalarLUTdrop.Items.Clear;
  TrackScalarLUTdrop.Items := LUTdrop.Items;
  TrackScalarLUTdrop.ItemIndex := 1;
  //TrackScalarLUTdrop.Items.AddStrings := LUTdrop.Items;
end;

procedure TGLForm1.OverlayTimerTimer(Sender: TObject);
begin
     OverlayTimer.Enabled := false;
     gMesh.isRebuildList:= true;
     gMesh.isAdditiveOverlay := gPrefs.AdditiveOverlay;
     GLbox.Invalidate;
end;

procedure TGLForm1.SaveBitmap(FilenameIn: string);
 var
    bmp: TBitmap;
    png: TPortableNetworkGraphic;
    p,n,x,filename: string;
 begin
  FilenameParts (FilenameIn,p,n,x);
  if (p ='') or (not directoryexists(p)) then
     p := DesktopFolder;
  if (n = '') then n := 'SurfIce';
  if (x = '') then x := '.png';
  Filename := p+n+x;
  bmp := ScreenShot;
   png := TPortableNetworkGraphic.Create;
   try
     png.Assign(bmp);    //Convert data into png
     png.SaveToFile(changefileext(Filename,'.png'));
   finally
     png.Free;
   end;
   bmp.Free;
end;

procedure TGLForm1.SaveMenuClick(Sender: TObject);
begin
  if not SaveBitmapDialog.execute then exit;
  SaveBitmap(SaveBitmapDialog.Filename);
end;

procedure TGLForm1.SaveMz3(var mesh: TMesh; isSaveOverlays: boolean);
var
   i : integer;
   nam: string;
begin
  Mesh.SaveMz3(SaveMeshDialog.Filename);
  if not isSaveOverlays then exit;
  for i :=  1 to gMesh.OpenOverlays do begin
        nam := changefileext(SaveMeshDialog.Filename, '_'+inttostr(i)+extractfileext(SaveMeshDialog.Filename));
        gMesh.SaveOverlay(nam, i);
  end;
end;

procedure TGLForm1.SaveMesh(var mesh: TMesh; isSaveOverlays: boolean);
const
      kMeshFilter = 'OBJ (Widely supported)|*.obj|GIfTI (Neuroimaging)|*.gii|MZ3 (Small and fast)|*.mz3|PLY (Widely supported)|*.ply';
var
   nam, ext, x: string;
begin
  if length(mesh.Faces) < 1 then begin
     showmessage('Unable to save: no mesh is loaded (use File/Open).');
     exit;
  end;
  SaveMeshDialog.Filter  := kMeshFilter;
  SaveMeshDialog.FilterIndex := gPrefs.SaveAsFormat + 1;
  if gPrefs.SaveAsFormat = 4 then
     ext := '.ply'
  else if gPrefs.SaveAsFormat = 0 then
     ext := '.obj'
  else if gPrefs.SaveAsFormat = 1 then
    ext := '.gii'
  else
    ext := '.mz3';
  SaveMeshDialog.DefaultExt := ext;
  if (fileexists(gPrefs.PrevFilename[1])) or (not isSaveOverlays) then begin

     if isSaveOverlays then
      nam := gPrefs.PrevFilename[1]
    else
      nam := SaveMeshDialog.Filename;
    SaveMeshDialog.InitialDir:= ExtractFileDir(nam);
    nam := ChangeFileExtX(extractfilename (nam), ext);
    SaveMeshDialog.Filename := nam;
  end else
      SaveMeshDialog.Filename := '';
  if not SaveMeshDialog.Execute then exit;
  if length(SaveMeshDialog.Filename) < 1 then exit;
  x := UpperCase(ExtractFileExt(SaveMeshDialog.Filename));
  if (x <> '.MZ3') and (x <> '.PLY') and (x <> '.OBJ')  and (x <> '.GII') then begin
     x := ext;
     SaveMeshDialog.Filename := SaveMeshDialog.Filename + x;
  end;
  if (x = '.MZ3') then
     SaveMz3(mesh, isSaveOverlays)
  else if (x = '.GII') then
     mesh.SaveGii(SaveMeshDialog.Filename)
  else if (x = '.PLY') then
     mesh.SavePly(SaveMeshDialog.Filename)
  else
      mesh.SaveObj(SaveMeshDialog.Filename);
end;

procedure TGLForm1.SaveMeshMenuClick(Sender: TObject);
begin
     SaveMesh(gMesh, true);
end;

(*procedure TGLForm1.SaveMeshMenuClick(Sender: TObject);
const
      kMeshFilter = 'OBJ (Widely supported)|*.obj|GIfTI (Neuroimaging)|*.gii|MZ3 (Small and fast)|*.mz3|PLY (Widely supported)|*.ply';
var
   nam, ext, x: string;
begin
  if length(gMesh.Faces) < 1 then begin
     showmessage('Unable to save: no mesh is loaded (use File/Open).');
     exit;
  end;
  SaveMeshDialog.Filter  := kMeshFilter;
  SaveMeshDialog.FilterIndex := gPrefs.SaveAsFormat + 1;
  if gPrefs.SaveAsFormat = 4 then
     ext := '.ply'
  else if gPrefs.SaveAsFormat = 0 then
     ext := '.obj'
  else if gPrefs.SaveAsFormat = 1 then
    ext := '.gii'
  else
    ext := '.mz3';
  SaveMeshDialog.DefaultExt := ext;
  if fileexists(gPrefs.PrevFilename[1]) then begin
    nam := gPrefs.PrevFilename[1];
    nam := changeFileExt(nam, ext);
    SaveMeshDialog.Filename := nam;
  end else
      SaveMeshDialog.Filename := '';
  if not SaveMeshDialog.Execute then exit;
  if length(SaveMeshDialog.Filename) < 1 then exit;
  x := UpperCase(ExtractFileExt(SaveMeshDialog.Filename));
  if (x <> '.MZ3') and (x <> '.PLY') and (x <> '.OBJ')  and (x <> '.GII') then begin
     x := ext;
     SaveMeshDialog.Filename := SaveMeshDialog.Filename + x;
  end;
  if (x = '.MZ3') then
     SaveMz3
  else if (x = '.GII') then
     gMesh.SaveGii(SaveMeshDialog.Filename)
  else if (x = '.PLY') then
     gMesh.SavePly(SaveMeshDialog.Filename)
  else
      gMesh.SaveObj(SaveMeshDialog.Filename);
end;  *)

procedure TGLForm1.UniformChange(Sender: TObject);
begin
  SurfaceAppearanceChange(Sender);
 //ZUniformChange(Sender);
  //Updatetimer.enabled := true;
end;

procedure TGLForm1.UpdateTimerTimer(Sender: TObject);
begin
  if isBusy or gMesh.isBusy then exit; //defer
  Updatetimer.enabled := false;

  GLbox.Invalidate;
end;

//{$DEFINE RELOADTRACK}


procedure TGLForm1.FormCreate(Sender: TObject);
var
  i: integer;
  s : string;
  c: char;
  forceReset: boolean = false;
begin
  //check if user includes parameters
  gPrefs.initScript := ''; //e.g. 'c:\dir\script.gls'
  i := 1;
  while i <= ParamCount do begin
     s := ParamStr(i);
     if (length(s)> 1) and (s[1]='-') then begin
         c := upcase(s[2]);
         if c='R' then
            forceReset := true
         else if (i < paramcount) and (c='S') then begin
           inc(i);
           gPrefs.InitScript := ParamStr(i);
         end;
     end; //length > 1 char
     inc(i);
   end; //for each parameter
  //writeln('OK'+inttostr(ParamCount)+ ' *' + gPrefs.initScript+'*' );
  //launch program
  CreateMRU;
  gPrefs.RenderQuality:= kRenderBetter;// kRenderPoor; ;
  if (not ResetIniDefaults) and (not forceReset) then
    IniFile(true,IniName,gPrefs)
  else begin
    SetDefaultPrefs(gPrefs,true);//reset everything to defaults!
    if MessageDlg('Use advanced graphics? Press "Yes" for better quality. Press "Cancel" for old hardware.', mtConfirmation, [mbYes, mbCancel], 0) = mrCancel then
      gPrefs.RenderQuality:= kRenderPoor;
  end;
  DefaultFormatSettings.DecimalSeparator := '.'; //OBJ/GII/Etc write real numbers as 1.23 not 1,23
  OverlayBoxCreate;//after we read defaults
  {$IFDEF Darwin} Application.OnDropFiles:= AppDropFiles; {$ENDIF}
  {$IFDEF Windows}
          StringGrid1.DefaultRowHeight := ScaleY(28,96);
  {$ENDIF}
  {$IFDEF LCLCarbon}
  GLForm1.OnDropFiles:= nil; //avoid drop for form and application
  {$ENDIF}
  clipPlane.X := 2;
  gMesh := TMesh.Create;
  gMesh.isBusy := true;
  gNode := TMesh.Create;
  gMesh.isZDimIsUp := gPrefs.ZDimIsUp;
  gNode.isZDimIsUp := gPrefs.ZDimIsUp;
  gTrack := TTrack.Create;
  if (gPrefs.TrackTubeSlices > 2) and (gPrefs.TrackTubeSlices < 22) then
     gTrack.TrackTubeSlices := gPrefs.TrackTubeSlices;
  gTrack.isTubes := gPrefs.TracksAreTubes;
  Application.ShowButtonGlyphs:= sbgNever;
  {$IFDEF COREGL}
  GLbox.OpenGLMajorVersion:= 3;
  GLbox.OpenGLMinorVersion:= 3;
  {$ELSE}
  GLbox.OpenGLMajorVersion:= 2;
  GLbox.OpenGLMinorVersion:= 1;
  {$ENDIF}
  GLbox.AutoResizeViewport:= true;   // http://www.delphigl.com/forum/viewtopic.php?f=10&t=11311
  if gPrefs.MultiSample then
  GLBox.MultiSampling:= 4;
  GLBox.OnMouseDown := GLboxMouseDown;
  GLBox.OnMouseMove := GLboxMouseMove;
  GLBox.OnMouseUp := GLboxMouseUp;
  //GLBox.OnMouseWheel := GLboxMouseWheel;
  GLBox.OnPaint := GLboxPaint;
  FormCreateShaders;
  UpdateMRU;
  if (gPrefs.OcclusionAmount <> occlusionTrack.Position) and (gPrefs.OcclusionAmount >= 0) and (gPrefs.OcclusionAmount <= 100) then
     occlusionTrack.Position:= gPrefs.OcclusionAmount;
  ColorBarMenu.Checked := gPrefs.Colorbar;
  AdditiveOverlayMenu.Checked := gPrefs.AdditiveOverlay;
  gMesh.isAdditiveOverlay := gPrefs.AdditiveOverlay;
  if gPrefs.InitScript <> '' then
     gMesh.MakePyramid
  else begin
    if (gPrefs.LoadTrackOnLaunch) and fileexists(gPrefs.PrevTrackname) then
      OpenTrack(gPrefs.PrevTrackname)
    else if fileexists(gPrefs.PrevFilename[1]) then
      OpenMesh(gPrefs.PrevFilename[1])
    else
      gMesh.MakePyramid;
  end;
  gMesh.isBusy := false;
  isBusy := false;
  {$IFDEF Darwin}
  CurvMenuTemp.ShortCut:= ShortCut(Word('K'), [ssMeta]); ;
  CloseMenu.ShortCut :=  ShortCut(Word('W'), [ssMeta]);
  SwapYZMenu.ShortCut :=  ShortCut(Word('X'), [ssMeta]);
  ScriptMenu.ShortCut :=  ShortCut(Word('Z'), [ssMeta]);
  OpenMenu.ShortCut :=  ShortCut(Word('O'), [ssMeta]);
  SaveMenu.ShortCut :=  ShortCut(Word('S'), [ssMeta]);
  CopyMenu.ShortCut :=  ShortCut(Word('C'), [ssMeta]);
  (* //these are now done by pressing single key (e.g. "L" instead of "Ctrl+L")
  LeftMenu.ShortCut :=  ShortCut(Word('L'), [ssMeta]);
  RightMenu.ShortCut :=  ShortCut(Word('R'), [ssMeta]);
  AnteriorMenu.ShortCut :=  ShortCut(Word('A'), [ssMeta]);
  PosteriorMenu.ShortCut :=  ShortCut(Word('P'), [ssMeta]);
  InferiorMenu.ShortCut :=  ShortCut(Word('D'), [ssMeta]);
  SuperiorMenu.ShortCut :=  ShortCut(Word('U'), [ssMeta]);  *)
  ExitMenu.Visible:= false;
  HelpMenu.Visible := false;
  {$ELSE}
  AppleMenu.Visible := false;
  {$ENDIF}
  {$IFDEF COREGL} {$IFDEF LCLCarbon} ERROR - Carbon does not support OpenGL core profile: either switch to Cocoa or comment out "COREGL" in opts.inc{$ENDIF} {$ENDIF}
  {$IFDEF LCLCocoa}
  //EditMenu.Visible := false;  //Broken prior to svn 50307
  {$ENDIF}
  OrientCubeMenu.Checked :=  gPrefs.OrientCube;
  GLBox.MakeCurrent(false);
  gPrefs.SupportBetterRenderQuality := InitGLSL(true);
  GLBox.ReleaseContext;
  MultiPassRenderingToolsUpdate;
  ShaderDropChange(sender);
  //AddNodesMenuClick(sender);
  //AddOverlayMenuClick(sender);
  //AddTracksMenuClick(sender);
  //VolumeToMeshMenuClick(sender);
  //caption := format('%dx%d %dx%d %d', [screen.Height, screen.width, GLForm1.Height, GLForm1.width, Screen.PixelsPerInch]);
end;

procedure TGLForm1.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
begin
   OpenMesh(Filenames[0]);
end;

procedure TGLForm1.GLBoxClick(Sender: TObject);
begin

end;

procedure TGLForm1.AppDropFiles(Sender: TObject; const FileNames: array of String);
begin
 OpenMesh(Filenames[0]);
end;

end.

