# AhkJson

## Overview

AhkJson is a JSON handler for AutoHotkey. It is originally derived from [cocobelgica/AutoHotkey-JSON](https://github.com/cocobelgica/AutoHotkey-JSON) and has been adapted for additional features and improvements.  
This library allows you to parse JSON strings into AutoHotkey data structures and convert AutoHotkey objects back into JSON text, supporting advanced features like a "reviver" function (similar to JavaScript).

**Requirements**:  

- AutoHotkey v1.1.x (officially tested)  
- Not confirmed to work on v2.0 or newer.

## Installation

1. **Download or clone the repository**  
   - Clone this repository into a folder named `AhkJson` (or any name you prefer).  
2. **Include the class in your AutoHotkey script**  
   - Use `#Include` to import the file `Class_Json.ahk`:

     ```ahk
     #Include %A_ScriptDir%\AhkJson\Libs\Class_Json.ahk
     ```

3. **Verify your AutoHotkey version**  
   - Ensure you are running AutoHotkey v1.1.x. 
   - v2 compatibility is not guaranteed.

## Usage

Once included, you can call methods from the `JSON` class:

- **JSON.Parse(string)**  
  Converts a JSON string into an AutoHotkey object or array.  

  ```ahk
  parsed := JSON.Parse(jsonText)
  ```

- **JSON.Stringify(value)**  
  Converts an AutoHotkey value (object, array, string, number) into a JSON string.  

  ```ahk
  jsonText := JSON.Stringify(someObject)
  ```

- **JSON.ReadFile(filePath)**  
  Reads a `.json` file into an AutoHotkey object.  

  ```ahk
  data := JSON.ReadFile("C:\\path\\to\\file.json")
  ```

- **JSON.WriteFile(obj, filePath [, escapeUnicode])**  
  Writes an AutoHotkey object to a `.json` file.  

  ```ahk
  result := JSON.WriteFile(data, "C:\\path\\to\\new.json", false)
  ```

## Examples

Here is a minimal usage example:

```ahk
#Include %A_ScriptDir%\AhkJson\Libs\Class_Json.ahk

; Suppose we have a JSON string:
jsonText := "{""name"":""AutoHotkey"",""version"":1}"

; Parse it into an AHK object:
obj := JSON.Parse(jsonText)
MsgBox, Name: % obj.name " - Version: " obj.version

; Modify and serialize back to JSON
obj.release := "stable"
newJson := JSON.Stringify(obj, , 4)  ; Use indentation of 4 spaces
MsgBox, %newJson%

; Read from a file:
parsed := JSON.ReadFile(A_ScriptDir "\Samples\example.json")
MsgBox, Read from file: % JSON.Stringify(parsed)

; Write to a file:
JSON.WriteFile(obj, A_ScriptDir "\Samples\output.json", false)
MsgBox, Wrote JSON to output.json
```

## License

This project is licensed under the [MIT License](./LICENSE). You are free to use, modify, and distribute it.

## Contact

- **Author**: Tuckn  
- **X (Twitter)**: [https://x.com/Tuckn333](https://x.com/Tuckn333)

Feel free to open issues or pull requests on GitHub if you have any questions, suggestions, or bug reports.
