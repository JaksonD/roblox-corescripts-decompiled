return function(v0, v1) --[[ Line: 13 ]] --[[ Name: find ]]
    for v2, v3 in v0 do
        if v1(v3, v2) then
            return v3;
        end;
    end;
    return nil;
end;