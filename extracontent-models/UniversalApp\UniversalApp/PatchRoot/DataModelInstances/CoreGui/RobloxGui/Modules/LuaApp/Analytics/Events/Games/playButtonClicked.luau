local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy)
    v2.isType(v5, "string", "playSource");
    v2.isType(v6, "string", "response");
    v3:setRBXEventStream(v4, "playButtonClicked", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        playSource = v5, 
        response = v6
    });
end;