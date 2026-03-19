local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.Foundation);
local l_ItemCardAnimationStateIndicator_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardAnimationStateIndicator;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(script.Parent.useCatalogItemCardAnimationIndicatorViewModel);
return v2.memo(function(v7) --[[ Line: 25 ]] --[[ Name: CatalogItemCardAnimationIndicatorContainer ]]
    -- upvalues: v6 (copy), v2 (copy), l_ItemCardAnimationStateIndicator_0 (copy)
    local v8 = v6(v7.bundleInfo);
    return v2.createElement(l_ItemCardAnimationStateIndicator_0, {
        states = v8.states, 
        ZIndex = v7.ZIndex, 
        paddingTop = v7.paddingTop, 
        paddingBottom = v7.paddingBottom, 
        paddingLeft = v7.paddingLeft, 
        paddingRight = v7.paddingRight
    });
end);