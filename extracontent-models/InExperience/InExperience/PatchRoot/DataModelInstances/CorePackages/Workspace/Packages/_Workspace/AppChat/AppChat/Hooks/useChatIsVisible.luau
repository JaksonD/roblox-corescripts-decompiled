local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Selectors_0 = require(l_Parent_0.NavigationRodux).Selectors;
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 13 ]]
    -- upvalues: l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AppPage_0 (copy)
    return l_useSelector_0(function(v5) --[[ Line: 14 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AppPage_0 (ref)
        if not v5.Navigation then
            return true;
        elseif l_FFlagUseNavigationSelectors_0 then
            return l_Selectors_0.selectCurrentPageName(v5) == l_AppPage_0.Chat;
        else
            local l_history_0 = v5.Navigation.history;
            if not l_history_0 then
                return false;
            else
                local v7 = l_history_0[#l_history_0];
                return (v7[#v7] and v7[#v7].name) == l_AppPage_0.Chat;
            end;
        end;
    end);
end;