return function(v0, v1) --[[ Line: 5 ]] --[[ Name: normalizeKeyword ]]
    local v2 = v0:gsub("\239\191\188", ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "");
    if v1 then
        v2 = v2:lower();
    end;
    return v2;
end;