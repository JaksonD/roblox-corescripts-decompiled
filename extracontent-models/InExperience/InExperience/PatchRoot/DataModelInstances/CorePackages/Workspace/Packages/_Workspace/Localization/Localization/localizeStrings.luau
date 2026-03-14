local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: localizeStrings ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for v5, v6 in pairs(v3) do
        if typeof(v6) == "table" then
            if typeof(v6[1]) == "string" then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
                    -- upvalues: v2 (copy), v6 (copy)
                    return v2:Format(v6[1], v6);
                end);
                v1.isEqual(l_status_0, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", v5, v6[1]));
                v4[v5] = l_status_0 and l_result_0 or "";
            else
                error(string.format("%s[1] in stringsToBeLocalized must be a string, got %s instead", v5, (typeof(v6[1]))));
            end;
        elseif typeof(v6) == "string" then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 37 ]]
                -- upvalues: v2 (copy), v6 (copy)
                return v2:Format(v6);
            end);
            v1.isEqual(l_status_1, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", v5, v6));
            v4[v5] = l_status_1 and l_result_1 or "";
        else
            error(string.format("%s in stringsToBeLocalized must be a string or table, got %s instead", v5, (typeof(v6))));
        end;
    end;
    return v4;
end;