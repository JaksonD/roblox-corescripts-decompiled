local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local _ = require(l_script_FirstAncestor_0.Parent.Navigation);
local _ = require(l_script_FirstAncestor_0.types);
local function _(v3) --[[ Line: 13 ]] --[[ Name: selectNavigationState ]]
    return v3.Navigation;
end;
return {
    selectCurrentRoactNavigationRoute = function(v5) --[[ Line: 17 ]] --[[ Name: selectCurrentRoactNavigationRoute ]]
        return v5.Navigation.currentRoute;
    end, 
    selectLegacyHistory = function(v6) --[[ Line: 21 ]] --[[ Name: selectLegacyHistory ]]
        return v6.Navigation.history;
    end, 
    selectNavigationLocked = function(v7) --[[ Line: 35 ]] --[[ Name: selectNavigationLocked ]]
        return v7.Navigation.lockNavigationActions;
    end, 
    selectBackNavigationDisableCounter = function(v8) --[[ Line: 39 ]] --[[ Name: selectBackNavigationDisableCounter ]]
        return v8.Navigation.backNavigationDisableCounter;
    end, 
    selectCurrentPageName = function(v9) --[[ Line: 43 ]] --[[ Name: selectCurrentPageName ]]
        local l_history_0 = v9.Navigation.history;
        local v11 = l_history_0[#l_history_0];
        return v11[#v11].name;
    end, 
    selectCurrentLegacyRoute = function(v12) --[[ Line: 25 ]] --[[ Name: selectCurrentLegacyRoute ]]
        local l_history_1 = v12.Navigation.history;
        return l_history_1[#l_history_1];
    end, 
    selectCurrentLegacyPage = function(v14) --[[ Line: 30 ]] --[[ Name: selectCurrentLegacyPage ]]
        local l_history_2 = v14.Navigation.history;
        local v16 = l_history_2[#l_history_2];
        return v16[#v16];
    end
};