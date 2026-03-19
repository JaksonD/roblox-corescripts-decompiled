return function(v0, v1) --[[ Line: 12 ]] --[[ Name: some ]]
    for v2, v3 in v0 do
        if v1(v3, v2) then
            return true;
        end;
    end;
    return false;
end;