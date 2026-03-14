local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Navigation);
local l_GetFFlagLuaAppRefactorSelectRoute_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppRefactorSelectRoute;
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_script_FirstAncestor_0.Utils).getLegacyRouteFromRoactNavigationState;
local _ = require(l_script_FirstAncestor_0.types);
local function _(v6) --[[ Line: 17 ]] --[[ Name: selectNavigationState ]]
    return v6.Navigation;
end;
local function v9(v8) --[[ Line: 21 ]] --[[ Name: selectRoactNavigationState ]]
    return v8.Navigation.roactNavigationState;
end;
local function v11(v10) --[[ Line: 25 ]] --[[ Name: selectCurrentRoactNavigationRoute ]]
    return v10.Navigation.currentRoute;
end;
local function _(v12) --[[ Line: 29 ]] --[[ Name: selectLegacyHistory ]]
    return v12.Navigation.history;
end;
return {
    selectRoactNavigationState = v9, 
    selectCurrentRoactNavigationRoute = v11, 
    selectCurrentLegacyRoute = function(v14) --[[ Line: 33 ]] --[[ Name: selectCurrentLegacyRoute ]]
        -- upvalues: l_GetFFlagLuaAppRefactorSelectRoute_0 (copy), l_getLegacyRouteFromRoactNavigationState_0 (copy)
        if l_GetFFlagLuaAppRefactorSelectRoute_0() then
            return l_getLegacyRouteFromRoactNavigationState_0(v14.Navigation.roactNavigationState);
        else
            local l_history_0 = v14.Navigation.history;
            return l_history_0[#l_history_0];
        end;
    end, 
    selectCurrentLegacyPage = function(v16) --[[ Line: 42 ]] --[[ Name: selectCurrentLegacyPage ]]
        -- upvalues: l_GetFFlagLuaAppRefactorSelectRoute_0 (copy), l_getLegacyRouteFromRoactNavigationState_0 (copy)
        local v17;
        if l_GetFFlagLuaAppRefactorSelectRoute_0() then
            v17 = l_getLegacyRouteFromRoactNavigationState_0(v16.Navigation.roactNavigationState);
        else
            local l_history_1 = v16.Navigation.history;
            v17 = l_history_1[#l_history_1];
        end;
        return v17[#v17];
    end
};