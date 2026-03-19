local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
return v1.makeActionCreator(script.Name, function(v4, v5) --[[ Line: 14 ]]
    -- upvalues: v2 (copy)
    v2.isType(v4, "string", "assetId");
    v2.isType(v5, "number", "priceInRobux");
    return {
        assetId = v4, 
        priceInRobux = v5
    };
end);