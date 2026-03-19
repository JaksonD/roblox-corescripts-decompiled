local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v4 = require(script.Parent.useColorAdjustmentPageProps);
local v5 = require(script.Parent.ColorAdjustmentPage);
local v7 = v3(function() --[[ Line: 10 ]] --[[ Name: ColorAdjustmentPageContainer ]]
    -- upvalues: v4 (copy), v1 (copy), v5 (copy)
    local v6 = v4();
    return v1.createElement(v5, v6);
end);
return v1.memo(v7);