local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.SearchEventUtil);
return function(v5, v6, v7, v8, v9, v10) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), v4 (copy), l_LocalizationService_0 (copy)
    v2.isType(v6, "string", "eventContext");
    v2.isType(v7, "string", "kwd");
    v2.isType(v9, "string", "page");
    local v11 = 0;
    if v8 == true then
        v11 = 1;
    end;
    local v12 = "";
    if v10 then
        v12 = v4.convertSuggestionsToString(v10);
    end;
    v5:sendEventDeferred(v6, "catalogSearch", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        kwd = v7, 
        autoCompleteFlag = v11, 
        previousPage = v9, 
        suggestions = v12
    });
end;