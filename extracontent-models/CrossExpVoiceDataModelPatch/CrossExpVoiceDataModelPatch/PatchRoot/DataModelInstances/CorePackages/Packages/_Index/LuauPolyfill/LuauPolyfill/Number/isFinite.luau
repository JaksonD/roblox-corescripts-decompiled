return function(v0) --[[ Line: 2 ]]
    local v1 = false;
    if typeof(v0) == "number" then
        v1 = false;
        if v0 == v0 then
            v1 = false;
            if v0 ~= 1e999 then
                v1 = v0 ~= -1e999;
            end;
        end;
    end;
    return v1;
end;