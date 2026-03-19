return function(v0, v1) --[[ Line: 12 ]] --[[ Name: mapFirst ]]
    for v2, v3 in ipairs(v0) do
        local v4 = v1(v3, v2);
        if v4 ~= nil then
            return v4;
        end;
    end;
    return nil;
end;