return function(v0, v1, v2) --[[ Line: 1 ]]
    if not v0 then
        return false;
    else
        local v3 = #v0;
        if v2 then
            v3 = v3 - 1;
        end;
        for v4 = 1, v3 do
            if v0[v4].name == v1 then
                return true;
            end;
        end;
        return false;
    end;
end;