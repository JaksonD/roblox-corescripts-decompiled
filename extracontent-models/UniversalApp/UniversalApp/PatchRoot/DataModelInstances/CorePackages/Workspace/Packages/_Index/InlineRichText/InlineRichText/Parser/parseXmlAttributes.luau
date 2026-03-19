return function(v0) --[[ Line: 1 ]] --[[ Name: parseXmlAttributes ]]
    local v1 = v0:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]*)\"%s*");
    local v2 = v0:gmatch("%s*([A-Za-z0-9_-]+)='([^']*)'%s*");
    local v3 = {};
    for v4, v5 in v1 do
        v3[v4] = v5 or "";
    end;
    for v6, v7 in v2 do
        v3[v6] = v7 or "";
    end;
    return v3;
end;