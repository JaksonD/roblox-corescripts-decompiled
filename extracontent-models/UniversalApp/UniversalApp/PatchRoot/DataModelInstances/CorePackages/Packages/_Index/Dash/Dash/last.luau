return function(v0, v1) --[[ Line: 13 ]] --[[ Name: last ]]
    for v2 = #v0, 1, -1 do
        local v3 = v0[v2];
        if not v1 then
            return v3;
        elseif v1 and v1(v3, v2) then
            return v3;
        end;
    end;
    return nil;
end;