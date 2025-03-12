^+9::
  ; JSON (UTF-8)
  readPathUtf8 := A_ScriptDir . "\Samples\Sample To Read UTF8.json"
  parsed := Json.ReadFile(readPathUtf8)
  MsgBox, 1. Read the JSON file (UTF-8). Check the garbled result.
  strParsed := GetStringFromObject(parsed)
  MsgBox, %strParsed%

  FormatTime, strDate, R, yyyy-MM-dd
  parsed.newRootObj := "Write with AHK script at " . strDate

  wrotePath := A_ScriptDir . "\Samples\Sample To Write UTF8.json"
  Json.WriteFile(parsed, wrotePath)
  MsgBox, Finished to write data to the JSON file (UTF-8). Check the file.

  ; JSON (UTF-8 with BOM)
  readPathUtf8Bom := A_ScriptDir . "\Samples\Sample To Read UTF8_BOM.json"
  parsed := Json.ReadFile(readPathUtf8Bom)
  MsgBox, 2. Read the JSON file (UTF-8 with BOM). Check the readable result.
  strParsed := GetStringFromObject(parsed)
  MsgBox, %strParsed%

  FormatTime, strDate, R, yyyy-MM-dd
  parsed.newRootObj := "Write with AHK script at " . strDate

	; Write with escapeUnicode=True
  wrotePath := A_ScriptDir . "\Samples\Sample To Write UTF8_BOM_UnicodeChar.json"
  Json.WriteFile(parsed, wrotePath)

	; Write with escapeUnicode=False
  wrotePath := A_ScriptDir . "\Samples\Sample To Write UTF8_BOM.json"
  Json.WriteFile(parsed, wrotePath, False)
  MsgBox, Finished to write data to the JSON file (UTF-8 with BOM). Check the file.

  ; JSON (Shift_JIS)
  readPathSjis := A_ScriptDir . "\Samples\Sample To Read Shift_JIS.json"
  parsedSjis := Json.ReadFile(readPathSjis)
  MsgBox, 3. Read the JSON file (Shift_JIS). Check the readable result.
  strParsedSjis := GetStringFromObject(parsedSjis)
  MsgBox, %strParsedSjis%

  parsedSjis.newRootObj := "Write with AHK script at " . strDate

  wrotePathSjis := A_ScriptDir . "\Samples\Sample To Write Shift_JIS.json"
  Json.WriteFile(parsedSjis, wrotePathSjis, False)
  MsgBox, Finished to write data to the JSON file (Shift_JIS). Check the file.

  ExitApp, 0
