return function(v0, v1) --[[ Line: 8 ]] --[[ Name: map ]]
    local v2 = {};
    for v3, v4 in v0 do
        local v5, v6 = v1(v4, v3);
        local v7 = if v6 == nil then v3 else v6;
        if v5 ~= nil then
            v2[v7] = v5;
        end;
    end;
    return v2;
end;