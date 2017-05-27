unit WordUtils;
(*************************************************************
Copyright � 2012 Toby Allen (http://github.com/tobya)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the �Software�), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sub-license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice, and every other copyright notice found in this software, and all the attributions in every file, and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED �AS IS�, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****************************************************************)
interface
uses Classes, MainUtils, ResourceUtils,  ActiveX, ComObj, WinINet, Variants, sysutils, Types, StrUtils;

type

TWordDocConverter = Class(TDocumentConverter)
Private
    FWordVersion : String;
    WordApp : OleVariant;
public
    Constructor Create();
    function CreateOfficeApp() : boolean;  override;
    function DestroyOfficeApp() : boolean; override;
    function ExecuteConversion(fileToConvert: String; OutputFilename: String; OutputFileFormat : Integer): string; override;
    function AvailableFormats() : TStringList; override;
    function FormatsExtensions(): TStringList; override;
    function OfficeAppVersion() : String; override;
End;





implementation

function TWordDocConverter.AvailableFormats() : TStringList;
var
  Formats : TStringList;

begin
  Formats := Tstringlist.Create();
  LoadStringListFromResource('WORDFORMATS',Formats);

  result := Formats;
end;

function TWordDocConverter.FormatsExtensions() : TStringList;
var
  Extensions : TStringList;

begin
  Extensions := Tstringlist.Create();
  LoadStringListFromResource('EXTENSIONS',Extensions);

  result := Extensions;
end;





function TWordDocConverter.OfficeAppVersion: String;
var
  WdVersion: String;
  decimalPos : integer;
begin
  if FWordVersion = '' then
  begin
    CreateOfficeApp();
    WdVersion := Wordapp.Version;
    log('WordVersion:' + WdVersion,VERBOSE);

    //Get Major version as that is all we are interested in and strtofloat causes errors Issue#31
    decimalPos := pos('.',WdVersion);
    FWordVersion  := LeftStr(WdVersion,decimalPos -1);
    log('WordVersion Major:' + FWordVersion,VERBOSE);
  end;
  result := FWordVersion;
end;

{ TWordDocConverter }

constructor TWordDocConverter.Create;
begin
  inherited;
  InputExtension := '.doc*';
  LogFilename := 'DocTo.Log';
end;

function TWordDocConverter.CreateOfficeApp: boolean;
begin

  if  VarIsEmpty(WordApp) then
  begin
    Wordapp :=  CreateOleObject('Word.Application');
    Wordapp.Visible := false;
  end;
  Result := true;
end;

function TWordDocConverter.DestroyOfficeApp: boolean;
begin
  if not VarIsEmpty(WordApp) then
  begin
    WordApp.Quit();
  end;
  Result := true;
end;

function TWordDocConverter.ExecuteConversion(fileToConvert: String; OutputFilename: String; OutputFileFormat : Integer): string;
var
  wdEncoding : OleVariant;
begin

        if IsURLInput then
        begin

           Wordapp.documents.Open( 'D:\Development\GitHub\DocTo\exe\BaseTemplate.dotx', false, true);

              {make sure selection is not more than 0 characters.}
    WordApp.selection.Start := WordApp.selection.end;
//    WordApp.Selection.TypeParagraph;   {put in return }
    {Insert the next document into our}
    WordApp.Selection.InsertFile(  filetoConvert,
                                    '',
                                    False,
                                    False,
                                    False);
        end
        else
        begin
         //Open doc and save in requested format.
        Wordapp.documents.Open( FileToConvert, false, true);
        end;




        if Encoding = -1 then
        begin
           wdEncoding := EmptyParam;
        end
        else
        begin
           wdEncoding := Encoding;
        end;

    try
        //SaveAs2 was introducted in 2010 V 14 by this list
        //http://stackoverflow.com/a/29077879/6244
        if (strtoint( OfficeAppVersion) < 14) then
        begin
              log('Version < 14 Using Saveas Function', VERBOSE);
              Wordapp.activedocument.Saveas(OutputFilename ,
                                            OutputFileFormat,
                                            EmptyParam, //LockComments,
                                            EmptyParam, //Password,
                                            EmptyParam, //AddToRecentFiles,
                                            EmptyParam, //WritePassword,
                                            EmptyParam, //ReadOnlyRecommended,
                                            EmptyParam, //EmbedTrueTypeFonts,
                                            EmptyParam, //SaveNativePictureFormat,
                                            EmptyParam, //SaveFormsData,
                                            EmptyParam, //SaveAsAOCELetter,
                                            wdEncoding, //Encoding,
                                            EmptyParam, //InsertLineBreaks,
                                            EmptyParam, //AllowSubstitutions,
                                            EmptyParam, //LineEnding,
                                            EmptyParam //AddBiDiMarks
                                            );

        end
        else
        begin
              log('Version >= 14 Using Saveas2 Function', VERBOSE);
              Wordapp.activedocument.Saveas2(OutputFilename ,OutputFileFormat,
                                        EmptyParam,  //LockComments
                                        EmptyParam,  //Password
                                        EmptyParam,  //AddToRecentFiles
                                        EmptyParam,  //WritePassword
                                        EmptyParam,  //ReadOnlyRecommended
                                        EmptyParam,  //EmbedTrueTypeFonts
                                        EmptyParam,  //SaveNativePictureFo
                                        EmptyParam,  //SaveFormsData
                                        EmptyParam,  //SaveAsAOCELetter
                                        wdEncoding,  //Encoding
                                        EmptyParam,  //InsertLineBreaks
                                        EmptyParam,  //AllowSubstitutions
                                        EmptyParam,  //LineEnding
                                        EmptyParam,  //AddBiDiMarks
                                        CompatibilityMode  //CompatibilityMode
                                        );
        end;
    finally

            Wordapp.activedocument.Close;
    end;


end;



end.
