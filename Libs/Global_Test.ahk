DumpObjectToString(obj, indent="")
{
  local newIndent .= indent . "  "
  local rtnStr := "{`n"

  For k, v in obj
  {
    if (IsObject(v)) {
      rtnStr .= newIndent . k . ": " . DumpObjectToString(v, newIndent)
    } else {
      rtnStr .= newIndent . k . ": " . v . "`n"
    }
  }

  rtnStr .= indent . "}`n"

  Return rtnStr
}

MsgBox, Press [Ctrl] + [Shift] + [9], Run the test.
