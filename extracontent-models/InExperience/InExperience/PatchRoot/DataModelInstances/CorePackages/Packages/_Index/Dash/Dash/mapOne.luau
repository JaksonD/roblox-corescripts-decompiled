return function(v0, v1) --[[ Line: 14 ]] --[[ Name: mapOne ]]
    for v2, v3 in v0 do
        local v4 = nil;
        v4 = if v1 then v1(v3, v2) else v3;
        if v4 ~= nil then
            return v4;
        end;
    end;
    return nil;
end;