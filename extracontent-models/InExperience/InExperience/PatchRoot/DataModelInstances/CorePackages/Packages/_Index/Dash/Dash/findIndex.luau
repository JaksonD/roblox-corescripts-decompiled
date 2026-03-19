return function(v0, v1) --[[ Line: 10 ]] --[[ Name: findIndex ]]
    for v2, v3 in ipairs(v0) do
        if v1(v3, v2) then
            return v2;
        end;
    end;
    return nil;
end;