#Include %A_ScriptDir%\..\JSON.ahk

MsgBox, Press [Ctrl] + [Shift] + [9], Run it.

^+9::
  ; JSON (UTF-8)
  readPathUtf8 := A_ScriptDir . "\sample-to-read_UTF8.json"
  parsed := JSON.ReadFile(readPathUtf8)
  MsgBox, 1. Read the JSON file (UTF-8). Check the garbled result.
  strParsed := GetStringFromObject(parsed)
  MsgBox, %strParsed%

  FormatTime, strDate, R, yyyy-MM-dd
  parsed.newRootObj := "Write with AHK script at " . strDate

  wrotePath := A_ScriptDir . "\sample-to-write_UTF8.json"
  JSON.WriteFile(parsed, wrotePath)
  MsgBox, Finished to write data to the JSON file (UTF-8). Check the file.

  ; JSON (UTF-8 with BOM)
  readPathUtf8Bom := A_ScriptDir . "\sample-to-read_UTF8_BOM.json"
  parsed := JSON.ReadFile(readPathUtf8Bom)
  MsgBox, 2. Read the JSON file (UTF-8 with BOM). Check the readable result.
  strParsed := GetStringFromObject(parsed)
  MsgBox, %strParsed%

  FormatTime, strDate, R, yyyy-MM-dd
  parsed.newRootObj := "Write with AHK script at " . strDate

	; Write with codePointing=True
  wrotePath := A_ScriptDir . "\sample-to-write_UTF8_BOM_UnicodeChar.json"
  JSON.WriteFile(parsed, wrotePath)

	; Write with codePointing=False
  wrotePath := A_ScriptDir . "\sample-to-write_UTF8_BOM.json"
  JSON.WriteFile(parsed, wrotePath, False)
  MsgBox, Finished to write data to the JSON file (UTF-8 with BOM). Check the file.

  ; JSON (Shift_JIS)
  readPathSjis := A_ScriptDir . "\sample-to-read_Shift_JIS.json"
  parsedSjis := JSON.ReadFile(readPathSjis)
  MsgBox, 3. Read the JSON file (Shift_JIS). Check the readable result.
  strParsedSjis := GetStringFromObject(parsedSjis)
  MsgBox, %strParsedSjis%

  parsedSjis.newRootObj := "Write with AHK script at " . strDate

  wrotePathSjis := A_ScriptDir . "\sample-to-write_Shift_JIS.json"
  JSON.WriteFile(parsedSjis, wrotePathSjis, False)
  MsgBox, Finished to write data to the JSON file (Shift_JIS). Check the file.

  ExitApp

GetStringFromObject(obj, indent="")
{
  newIndent .= indent . "  "
  rtnStr := "{`n"

  For k, v in obj
  {
    if (IsObject(v)) {
      rtnStr .= newIndent . k . ": " . GetStringFromObject(v, newIndent)
    } else {
      rtnStr .= newIndent . k . ": " . v . "`n"
    }
  }

  rtnStr .= indent . "}`n"

  Return rtnStr
} ; }}}
