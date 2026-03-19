local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "string", "SetAnimationPreview: assetId");
    v2.isType(v4, "string", "SetAnimationPreview: assetTypeIdString");
    return {
        assetId = v3, 
        assetTypeIdString = v4
    };
end);