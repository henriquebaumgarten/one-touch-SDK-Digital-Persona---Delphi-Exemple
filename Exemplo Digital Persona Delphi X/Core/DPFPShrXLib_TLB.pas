unit DPFPShrXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 09/05/2016 11:08:28 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll (1)
// LIBID: {B8FAC44B-A9C5-478E-A9BF-566419996CAE}
// LCID: 0
// Helpfile: 
// HelpString: DigitalPersona One Touch for Windows Shared components 1.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Error creating palette bitmap of (TDPFPFeatureSet) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll contains no icons
//   Error creating palette bitmap of (TDPFPSample) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll contains no icons
//   Error creating palette bitmap of (TDPFPTemplate) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DPFPShrXLibMajorVersion = 1;
  DPFPShrXLibMinorVersion = 0;

  LIBID_DPFPShrXLib: TGUID = '{B8FAC44B-A9C5-478E-A9BF-566419996CAE}';

  IID_IDPFPData: TGUID = '{518B0981-E805-4734-809C-D9F03637183A}';
  IID_IDPFPSample: TGUID = '{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}';
  IID_IDPFPFeatureSet: TGUID = '{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}';
  IID_IDPFPTemplate: TGUID = '{737FD7A9-75EF-4B22-9014-8F13A10C48F2}';
  CLASS_DPFPFeatureSet: TGUID = '{A93BFBD6-93A0-4DBD-92F8-0D2DD80F0824}';
  CLASS_DPFPSample: TGUID = '{D005543B-EA11-499D-B3EA-37266D74BE79}';
  CLASS_DPFPTemplate: TGUID = '{3926DADA-23CD-42BD-818E-2AAA37522307}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum DPFPCaptureFeedbackEnum
type
  DPFPCaptureFeedbackEnum = TOleEnum;
const
  CaptureFeedbackGood = $00000000;
  CaptureFeedbackNone = $00000001;
  CaptureFeedbackTooLight = $00000002;
  CaptureFeedbackTooDark = $00000003;
  CaptureFeedbackTooNoisy = $00000004;
  CaptureFeedbackLowContrast = $00000005;
  CaptureFeedbackNotEnoughFtrs = $00000006;
  CaptureFeedbackNoCentralRgn = $00000007;
  CaptureFeedbackNoFinger = $00000008;
  CaptureFeedbackTooHigh = $00000009;
  CaptureFeedbackTooLow = $0000000A;
  CaptureFeedbackTooLeft = $0000000B;
  CaptureFeedbackTooRight = $0000000C;
  CaptureFeedbackTooStrange = $0000000D;
  CaptureFeedbackTooFast = $0000000E;
  CaptureFeedbackTooSkewed = $0000000F;
  CaptureFeedbackTooShort = $00000010;
  CaptureFeedbackTooSlow = $00000011;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDPFPData = interface;
  IDPFPDataDisp = dispinterface;
  IDPFPSample = interface;
  IDPFPSampleDisp = dispinterface;
  IDPFPFeatureSet = interface;
  IDPFPFeatureSetDisp = dispinterface;
  IDPFPTemplate = interface;
  IDPFPTemplateDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DPFPFeatureSet = IDPFPFeatureSet;
  DPFPSample = IDPFPSample;
  DPFPTemplate = IDPFPTemplate;


// *********************************************************************//
// Interface: IDPFPData
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {518B0981-E805-4734-809C-D9F03637183A}
// *********************************************************************//
  IDPFPData = interface(IDispatch)
    ['{518B0981-E805-4734-809C-D9F03637183A}']
    function Serialize: OleVariant; safecall;
    procedure Deserialize(RawData: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDPFPDataDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {518B0981-E805-4734-809C-D9F03637183A}
// *********************************************************************//
  IDPFPDataDisp = dispinterface
    ['{518B0981-E805-4734-809C-D9F03637183A}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPSample
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {7E0097FF-7B58-46F9-BBD6-3F91C53757A0}
// *********************************************************************//
  IDPFPSample = interface(IDPFPData)
    ['{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}']
  end;

// *********************************************************************//
// DispIntf:  IDPFPSampleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {7E0097FF-7B58-46F9-BBD6-3F91C53757A0}
// *********************************************************************//
  IDPFPSampleDisp = dispinterface
    ['{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPFeatureSet
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5929F2D9-8E34-4350-ADD7-F865ED9A19FD}
// *********************************************************************//
  IDPFPFeatureSet = interface(IDPFPData)
    ['{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}']
  end;

// *********************************************************************//
// DispIntf:  IDPFPFeatureSetDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5929F2D9-8E34-4350-ADD7-F865ED9A19FD}
// *********************************************************************//
  IDPFPFeatureSetDisp = dispinterface
    ['{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPTemplate
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {737FD7A9-75EF-4B22-9014-8F13A10C48F2}
// *********************************************************************//
  IDPFPTemplate = interface(IDPFPData)
    ['{737FD7A9-75EF-4B22-9014-8F13A10C48F2}']
  end;

// *********************************************************************//
// DispIntf:  IDPFPTemplateDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {737FD7A9-75EF-4B22-9014-8F13A10C48F2}
// *********************************************************************//
  IDPFPTemplateDisp = dispinterface
    ['{737FD7A9-75EF-4B22-9014-8F13A10C48F2}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// The Class CoDPFPFeatureSet provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPFeatureSet exposed by              
// the CoClass DPFPFeatureSet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPFeatureSet = class
    class function Create: IDPFPFeatureSet;
    class function CreateRemote(const MachineName: string): IDPFPFeatureSet;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPFeatureSet
// Help String      : Fingerprint Feature Set Class
// Default Interface: IDPFPFeatureSet
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TDPFPFeatureSet = class(TOleServer)
  private
    FIntf: IDPFPFeatureSet;
    function GetDefaultInterface: IDPFPFeatureSet;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPFeatureSet);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPFeatureSet read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoDPFPSample provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPSample exposed by              
// the CoClass DPFPSample. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPSample = class
    class function Create: IDPFPSample;
    class function CreateRemote(const MachineName: string): IDPFPSample;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPSample
// Help String      : Fingerprint Sample Class
// Default Interface: IDPFPSample
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TDPFPSample = class(TOleServer)
  private
    FIntf: IDPFPSample;
    function GetDefaultInterface: IDPFPSample;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPSample);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPSample read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoDPFPTemplate provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPTemplate exposed by              
// the CoClass DPFPTemplate. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPTemplate = class
    class function Create: IDPFPTemplate;
    class function CreateRemote(const MachineName: string): IDPFPTemplate;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPTemplate
// Help String      : Fingerprint Template Class
// Default Interface: IDPFPTemplate
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TDPFPTemplate = class(TOleServer)
  private
    FIntf: IDPFPTemplate;
    function GetDefaultInterface: IDPFPTemplate;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPTemplate);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPTemplate read GetDefaultInterface;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoDPFPFeatureSet.Create: IDPFPFeatureSet;
begin
  Result := CreateComObject(CLASS_DPFPFeatureSet) as IDPFPFeatureSet;
end;

class function CoDPFPFeatureSet.CreateRemote(const MachineName: string): IDPFPFeatureSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPFeatureSet) as IDPFPFeatureSet;
end;

procedure TDPFPFeatureSet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A93BFBD6-93A0-4DBD-92F8-0D2DD80F0824}';
    IntfIID:   '{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPFeatureSet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPFeatureSet;
  end;
end;

procedure TDPFPFeatureSet.ConnectTo(svrIntf: IDPFPFeatureSet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPFeatureSet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPFeatureSet.GetDefaultInterface: IDPFPFeatureSet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDPFPFeatureSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDPFPFeatureSet.Destroy;
begin
  inherited Destroy;
end;

class function CoDPFPSample.Create: IDPFPSample;
begin
  Result := CreateComObject(CLASS_DPFPSample) as IDPFPSample;
end;

class function CoDPFPSample.CreateRemote(const MachineName: string): IDPFPSample;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPSample) as IDPFPSample;
end;

procedure TDPFPSample.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D005543B-EA11-499D-B3EA-37266D74BE79}';
    IntfIID:   '{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPSample.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPSample;
  end;
end;

procedure TDPFPSample.ConnectTo(svrIntf: IDPFPSample);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPSample.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPSample.GetDefaultInterface: IDPFPSample;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDPFPSample.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDPFPSample.Destroy;
begin
  inherited Destroy;
end;

class function CoDPFPTemplate.Create: IDPFPTemplate;
begin
  Result := CreateComObject(CLASS_DPFPTemplate) as IDPFPTemplate;
end;

class function CoDPFPTemplate.CreateRemote(const MachineName: string): IDPFPTemplate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPTemplate) as IDPFPTemplate;
end;

procedure TDPFPTemplate.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3926DADA-23CD-42BD-818E-2AAA37522307}';
    IntfIID:   '{737FD7A9-75EF-4B22-9014-8F13A10C48F2}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPTemplate.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPTemplate;
  end;
end;

procedure TDPFPTemplate.ConnectTo(svrIntf: IDPFPTemplate);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPTemplate.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPTemplate.GetDefaultInterface: IDPFPTemplate;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDPFPTemplate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDPFPTemplate.Destroy;
begin
  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDPFPFeatureSet, TDPFPSample, TDPFPTemplate]);
end;

end.
