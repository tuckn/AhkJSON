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
}
