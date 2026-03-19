local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v5 = {
    getSuggestionNameTypeStrings = function(v4) --[[ Line: 8 ]]
        -- upvalues: v2 (copy), v3 (copy)
        v2.isType(v4.type, "number", "entry.type");
        if v4.type == v3.EntryType.Keyword then
            v2.isType(v4.searchQuery, "string", "entry.searchQuery");
            return {
                name = v4.searchQuery, 
                type = "kwd"
            };
        elseif v4.type == v3.EntryType.Rich then
            v2.isType(v4.canonicalTitle, "string", "entry.canonicalTitle");
            return {
                name = v4.canonicalTitle, 
                type = "rich"
            };
        else
            return {
                name = "unknown", 
                type = "unknown"
            };
        end;
    end
};
v5.convertSuggestionsToString = function(v6) --[[ Line: 20 ]]
    -- upvalues: v2 (copy), v5 (copy)
    v2.isType(v6, "table", "suggestions");
    if not v6 then
        return "";
    else
        local v7 = {};
        for v8 = 1, #v6 do
            local v9 = v5.getSuggestionNameTypeStrings(v6[v8]);
            table.insert(v7, v9.name .. "|" .. v9.type);
        end;
        return table.concat(v7, ",");
    end;
end;
return v5;