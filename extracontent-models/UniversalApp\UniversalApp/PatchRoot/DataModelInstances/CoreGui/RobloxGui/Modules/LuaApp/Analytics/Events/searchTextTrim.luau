local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v3, v4, v5, v6, v7) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy)
    v2.isType(v4, "string", "eventContext");
    v2.isType(v5, "string", "kwd");
    v2.isType(v6, "string", "resultingKwd");
    v2.isType(v7, "string", "searchType");
    v3:setRBXEventStream(v4, "searchTextTrim", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        kwd = v5, 
        resultingKwd = v6, 
        searchType = v7
    });
end;