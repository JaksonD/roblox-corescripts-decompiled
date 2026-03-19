return function(v0) --[[ Line: 1 ]]
    local v1 = false;
    if v0 ~= nil then
        v1 = false;
        if v0 ~= "" then
            v1 = tonumber(v0) > 0;
        end;
    end;
    return v1;
end;