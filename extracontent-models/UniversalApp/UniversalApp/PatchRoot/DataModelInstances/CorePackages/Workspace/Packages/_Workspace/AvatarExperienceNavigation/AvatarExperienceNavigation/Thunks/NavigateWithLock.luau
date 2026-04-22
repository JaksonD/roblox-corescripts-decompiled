local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceNavigation").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.NavigationRodux);
local l_ApplySetNavigationLocked_0 = v2.Actions.ApplySetNavigationLocked;
local l_Selectors_0 = v2.Selectors;
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
return function(v6) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_ApplySetNavigationLocked_0 (copy)
    v1.isType(v6, "function", "navigationCallback");
    return function(v7) --[[ Line: 21 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_ApplySetNavigationLocked_0 (ref), v6 (copy)
        local v8 = v7:getState();
        if if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectNavigationLocked(v8) else v8.Navigation.lockNavigationActions then
            return;
        else
            v7:dispatch(l_ApplySetNavigationLocked_0(true));
            v6();
            return;
        end;
    end;
end;