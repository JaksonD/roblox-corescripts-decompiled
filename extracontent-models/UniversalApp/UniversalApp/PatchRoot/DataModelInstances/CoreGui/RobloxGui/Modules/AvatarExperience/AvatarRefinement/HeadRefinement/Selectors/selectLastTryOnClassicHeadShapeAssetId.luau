local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_HeadShapeProperties_0 = v2.Enums.HeadShapeProperties;
local v5 = require(script.Parent.selectLastTryOnClassicHeadShape);
return function(v6) --[[ Line: 11 ]] --[[ Name: selectLastTryOnClassicHeadShapeAssetId ]]
    -- upvalues: v5 (copy), l_HeadShapeProperties_0 (copy)
    local v7 = v5(v6);
    return v7 and l_HeadShapeProperties_0[v7] and l_HeadShapeProperties_0[v7].assetId;
end;