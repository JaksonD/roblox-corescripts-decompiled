local l_Parent_0 = script.Parent;
return function(v1, v2) --[[ Line: 19 ]] --[[ Name: formatValue ]]
    -- upvalues: l_Parent_0 (copy)
    local v3 = v2 or "";
    local v4, v5 = v3:find("[A-Za-z#?]+");
    if v4 then
        local v6 = v3:sub(v4, v5);
        local v7 = "%" .. v3:sub(1, v4 - 1) .. v3:sub(v5 + 1) .. "s";
        local v8 = require(l_Parent_0.pretty);
        if v6 == "#?" then
            return v7:format(v8(v1, {
                multiline = true
            }));
        elseif v6 == "?" then
            return v7:format(v8(v1));
        else
            return ("%" .. v3):format(v1);
        end;
    else
        local v9 = "s";
        if type(v1) == "number" then
            local _, v11 = math.modf(v1);
            v9 = v11 == 0 and "d" or "f";
        end;
        return ("%" .. v3 .. v9):format((tostring(v1)));
    end;
end;