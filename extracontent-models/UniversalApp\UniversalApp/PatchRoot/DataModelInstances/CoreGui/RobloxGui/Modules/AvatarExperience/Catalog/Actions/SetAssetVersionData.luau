local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
return v1.makeActionCreator(script.Name, function(v4, v5) --[[ Line: 20 ]]
    -- upvalues: v2 (copy)
    v2.isType(v4, "string", "expect assetId to be a string");
    v2.isType(v5, "table", "expect assetVersionData to be a table");
    return {
        assetId = v4, 
        assetVersionData = v5
    };
end);