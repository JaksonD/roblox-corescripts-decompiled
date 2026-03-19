local function _(v0) --[[ Line: 1 ]] --[[ Name: toPascalCase ]]
    if type(v0) ~= "string" then
        return (tostring(v0));
    else
        return v0:gsub("^%l", string.upper);
    end;
end;
local function v2(v3) --[[ Line: 10 ]] --[[ Name: convertToPascalCase ]]
    -- upvalues: v2 (copy)
    local v4 = {};
    for v5, v6 in v3 do
        if type(v5) ~= "string" then
            v4[v5] = v6;
        else
            local v7 = if type(v5) ~= "string" then tostring(v5) else v5:gsub("^%l", string.upper);
            if type(v6) == "table" then
                v4[v7] = v2(v6);
            else
                v4[v7] = v6;
            end;
        end;
    end;
    return v4;
end;
return v2;