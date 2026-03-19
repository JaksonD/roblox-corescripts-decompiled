return function(v0, v1) --[[ Line: 12 ]] --[[ Name: mapLast ]]
    for v2 = #v0, 1, -1 do
        local v3 = v1(v0[v2], v2);
        if v3 ~= nil then
            return v3;
        end;
    end;
    return nil;
end;