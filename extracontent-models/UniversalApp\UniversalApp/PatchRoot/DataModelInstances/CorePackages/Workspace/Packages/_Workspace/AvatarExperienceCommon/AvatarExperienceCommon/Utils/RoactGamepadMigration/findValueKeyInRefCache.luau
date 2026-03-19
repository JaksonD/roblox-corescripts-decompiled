return function(v0, v1) --[[ Line: 1 ]] --[[ Name: findValueKeyInRefCache ]]
    for v2, v3 in v1 do
        if v3.current == v0 then
            return v2;
        end;
    end;
    return nil;
end;