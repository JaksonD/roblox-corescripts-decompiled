return function(v0) --[[ Line: 1 ]] --[[ Name: getUserIdsFromString ]]
    local v1 = string.split(v0, ",");
    local v2 = {};
    for _, v4 in v1 do
        if tonumber(v4) then
            v2[v4] = true;
        end;
    end;
    return v2;
end;