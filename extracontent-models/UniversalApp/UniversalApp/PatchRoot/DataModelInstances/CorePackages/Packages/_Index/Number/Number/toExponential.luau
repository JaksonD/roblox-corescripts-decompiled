return function(v0, v1) --[[ Line: 17 ]]
    local l_v0_0 = v0;
    if typeof(v0) == "string" then
        l_v0_0 = tonumber(v0) or (0/0);
    end;
    if typeof(l_v0_0) ~= "number" then
        return "nan";
    else
        if v1 ~= nil then
            if typeof(v1) ~= "number" then
                error("TypeError: fractionDigits must be a number between 0 and 100");
            end;
            if v1 < 0 or v1 > 100 then
                error("RangeError: fractionDigits must be between 0 and 100");
            end;
        end;
        local v3 = nil;
        v3 = v1 == nil and "%e" or "%." .. tostring(v1) .. "e";
        return (string.format(v3, l_v0_0):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e"));
    end;
end;