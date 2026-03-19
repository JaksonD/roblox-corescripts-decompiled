return function(v0, v1) --[[ Line: 4 ]] --[[ Name: shallowEqual ]]
    for v2, v3 in v0 do
        if v1[v2] ~= v3 then
            return false;
        end;
    end;
    for v4, v5 in v1 do
        if v0[v4] ~= v5 then
            return false;
        end;
    end;
    return true;
end;