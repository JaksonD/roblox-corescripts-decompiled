return function(v0) --[[ Line: 7 ]]
    local v1 = false;
    local v2 = false;
    local v3 = true;
    local v4 = 1;
    for v5, _ in pairs(v0) do
        if type(v5) == "string" then
            v2 = true;
        elseif type(v5) == "number" then
            if v4 ~= v5 then
                v3 = false;
            end;
            v1 = true;
        else
            return false;
        end;
        if v2 and v1 then
            return false;
        else
            v4 = v4 + 1;
        end;
    end;
    if v1 then
        return v3;
    else
        return true;
    end;
end;