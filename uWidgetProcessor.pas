unit uWidgetProcessor;

interface

type
  TWidgetRecorderProc = reference to procedure(const aCount: integer);

type
  TWidgetProcessor = class
  private
    FWidgetRecorder: TWidgetRecorderProc;
  public
    constructor Create(aWidgetRecorder: TWidgetRecorderProc);
    procedure ProcessWidgets(aNumberToProcess: integer);
    property WidgetRecorder: TWidgetRecorderProc read FWidgetRecorder write FWidgetRecorder;
  end;

procedure ProcessSomeWidgetsAndRecordToConsole;
procedure ProcessSomeWidgetsAndRecordToFile;

//  RecorderProc := procedure(const aCount: integer)
//                  begin
//                     // Do nothing, as this is a stub for testing purposes
//                  end;



implementation

uses
      System.Classes
    , System.SysUtils
    , System.IOUtils
    ;

procedure ProcessSomeWidgetsAndRecordToConsole;
var
  WidgetProcessor: TWidgetProcessor;
  RecorderProc: TWidgetRecorderProc;
begin
  RecorderProc := procedure(const aCount: integer)
                  begin
                    Writeln('The Widget Recorder recorded ', aCount, ' widgets');
                  end;


  WidgetProcessor := TWidgetProcessor.Create(RecorderProc);
  try
    WidgetProcessor.ProcessWidgets(Random(100));
  finally
    WidgetProcessor.Free;
  end;
end;

procedure ProcessSomeWidgetsAndRecordToFile;
var
  WidgetProcessor: TWidgetProcessor;
  RecorderProc: TWidgetRecorderProc;
const
  cFilename = 'WidgetRecord.txt';
begin
  RecorderProc := procedure(const aCount: integer)
                  var
                    SL: TStringList;
                    S: string;
                  begin
                    SL := TStringList.Create;
                    try
                      if TFile.Exists(cFilename) then
                      begin
                        SL.LoadFromFile(cFilename);
                      end;
                      S := Format('%s: %d widgets processed', [DateTimeToStr(Now), aCount]);
                      SL.Add(S);
                      SL.SaveToFile(cFilename);
                    finally
                      SL.Free;
                    end;
                  end;

  WidgetProcessor := TWidgetProcessor.Create(RecorderProc);
  try
    WidgetProcessor.ProcessWidgets(Random(100));
  finally
    WidgetProcessor.Free;
  end;
end;

constructor TWidgetProcessor.Create(aWidgetRecorder: TWidgetRecorderProc);
begin
  inherited Create;
  FWidgetRecorder := aWidgetRecorder;
end;

procedure TWidgetProcessor.ProcessWidgets(aNumberToProcess: integer);
begin
  WriteLn('Processing ', aNumberToProcess, ' widgets.');
  WidgetRecorder(aNumberToProcess);
end;

initialization
  Randomize;

end.
