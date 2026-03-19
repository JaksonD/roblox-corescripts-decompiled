return function(v0, v1, v2) --[[ Line: 12 ]] --[[ Name: tryGetPathFromData ]]
    if v0 == nil or v1 == nil then
        return false, nil;
    else
        local l_v0_0 = v0;
        for v4 = v2 or 1, #v1 do
            local v5 = v1[v4];
            if l_v0_0 == nil then
                return false, nil;
            else
                l_v0_0 = l_v0_0[v5];
            end;
        end;
        return l_v0_0 ~= nil, l_v0_0;
    end;
end;