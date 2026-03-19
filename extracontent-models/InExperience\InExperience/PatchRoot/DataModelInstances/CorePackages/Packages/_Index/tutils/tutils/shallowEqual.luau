return function(v0, v1, v2) --[[ Line: 5 ]]
    if not v0 or not v1 then
        return false;
    elseif v0 == v1 then
        return true;
    else
        if not v2 then
            v2 = {};
        end;
        for v3, v4 in pairs(v0) do
            if v1[v3] ~= v4 and not v2[v3] then
                return false;
            end;
        end;
        for v5, v6 in pairs(v1) do
            if v0[v5] ~= v6 and not v2[v5] then
                return false;
            end;
        end;
        return true;
    end;
end;