return function(v0) --[[ Line: 2 ]]
    local v1 = true;
    if v0 ~= nil then
        v1 = true;
        if v0 ~= "" then
            v1 = true;
            if v0 ~= -1 then
                v1 = false;
                if typeof(v0) == "table" then
                    v1 = next(v0) == nil;
                end;
            end;
        end;
    end;
    return v1;
end;