local l_HttpService_0 = game:GetService("HttpService");
local function _(v1) --[[ Line: 11 ]] --[[ Name: replaceLeadingQuote ]]
    v1 = string.gsub(v1, "\n\"", "\n`");
    if v1:sub(1, 1) == "\"" then
        return "`" .. string.sub(v1, 2);
    else
        return v1;
    end;
end;
local function _(v3) --[[ Line: 19 ]] --[[ Name: replaceTrailingQuote ]]
    v3 = string.gsub(v3, "\"\n", "`\n");
    if v3:sub(-1) == "\"" then
        return string.sub(v3, 1, -2) .. "`";
    else
        return v3;
    end;
end;
return {
    inspectStr = function(v5) --[[ Line: 30 ]] --[[ Name: inspectStr ]]
        -- upvalues: l_HttpService_0 (copy)
        if v5 == nil then
            return "nil";
        else
            local v6 = l_HttpService_0:JSONEncode(v5);
            v6 = string.gsub(v6, "\n\"", "\n`");
            local v7 = if v6:sub(1, 1) == "\"" then "`" .. string.sub(v6, 2) else v6;
            v7 = string.gsub(v7, "\"\n", "`\n");
            v5 = if v7:sub(-1) == "\"" then string.sub(v7, 1, -2) .. "`" else v7;
            v5 = string.gsub(v5, "\\\"", "\"");
            return (string.gsub(v5, "\\\\", "\\"));
        end;
    end
};