return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: lastIndexOf ]]
    local v3 = string.len(v0);
    local v4 = nil;
    v4 = v2 or v3;
    if v2 and v2 < 1 then
        v4 = 1;
    end;
    if v2 and v3 < v2 then
        v4 = v3;
    end;
    if v1 == "" then
        return v4;
    else
        local v5 = nil;
        local v6 = nil;
        local v7 = 0;
        repeat
            v5 = v6;
            local v8, v9 = string.find(v0, v1, v7 + 1, true);
            v6 = v8;
            v7 = v9;
        until v6 == nil or v4 < v6;
        if v5 == nil then
            return -1;
        else
            return v5;
        end;
    end;
end;