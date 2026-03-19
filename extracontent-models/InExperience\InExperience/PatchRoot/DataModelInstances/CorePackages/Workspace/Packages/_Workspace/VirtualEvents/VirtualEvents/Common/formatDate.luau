return function(v0, v1) --[[ Line: 1 ]] --[[ Name: formatDate ]]
    local v2 = DateTime.now();
    local v3 = nil;
    v3 = v0:ToLocalTime().Year > v2:ToLocalTime().Year and "ll" or "ddd, MMM DD";
    if v1 then
        return ("%s at %s"):format(v0:FormatLocalTime(v3, "en-us"), v0:FormatLocalTime("LT", "en-us"));
    else
        return ("%s AT %s"):format(v0:FormatLocalTime(v3, "en-us"), v0:FormatLocalTime("LT", "en-us")):upper();
    end;
end;