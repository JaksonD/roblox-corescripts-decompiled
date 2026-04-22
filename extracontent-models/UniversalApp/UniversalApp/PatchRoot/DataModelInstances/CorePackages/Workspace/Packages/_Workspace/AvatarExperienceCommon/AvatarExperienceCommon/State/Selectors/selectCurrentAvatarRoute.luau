local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_Parent_0.NavigationRodux).Selectors;
return function(v3) --[[ Line: 6 ]] --[[ Name: selectCurrentAvatarRoute ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v4 = if l_FFlagUseNavigationSelectors_0 then v3.Navigation and l_Selectors_0.selectCurrentRoactNavigationRoute(v3) else v3.Navigation and v3.Navigation.currentRoute;
    local v5 = v4 and v4.params and v4.params.fromAvatarRoute;
    return v5 and v5.current;
end;