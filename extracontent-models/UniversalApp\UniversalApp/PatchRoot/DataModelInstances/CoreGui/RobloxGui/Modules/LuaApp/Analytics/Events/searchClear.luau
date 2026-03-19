local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy)
    v2.isType(v4, "string", "eventContext");
    v2.isType(v5, "string", "kwd");
    v2.isType(v6, "string", "searchType");
    v3:setRBXEventStream(v4, "searchClear", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        kwd = v5, 
        searchType = v6
    });
end;