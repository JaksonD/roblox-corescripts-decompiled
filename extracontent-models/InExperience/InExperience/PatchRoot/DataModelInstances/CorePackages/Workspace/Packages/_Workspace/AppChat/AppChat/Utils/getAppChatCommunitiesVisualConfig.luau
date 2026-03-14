local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_GetFFlagUseCommunitiesTranslation_0 = require(l_Parent_0.SharedFlags).GetFFlagUseCommunitiesTranslation;
return function() --[[ Line: 13 ]]
    -- upvalues: l_GetFFlagUseCommunitiesTranslation_0 (copy)
    local v2 = "CommonUI.Features.Label.sGroups";
    if l_GetFFlagUseCommunitiesTranslation_0() then
        v2 = "Feature.SocialTab.Label.Groups";
    end;
    return {
        label = v2, 
        icon = "icons/menu/groups", 
        iconLarge = "icons/menu/groups_large"
    };
end;