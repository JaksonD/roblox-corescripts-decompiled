local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigationCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_createNavigator_0 = require(l_Parent_0.RoactNavigation).createNavigator;
local _ = require(l_Parent_0.Navigation);
local v4 = require(l_script_FirstAncestor_0.Views.AdaptiveStackView);
local v5 = require(l_script_FirstAncestor_0.Routers.createLuaAppStackRouter);
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: createAdaptiveStackNavigator ]]
    -- upvalues: v5 (copy), l_createNavigator_0 (copy), v4 (copy)
    local v8 = v5(v6, v7);
    return l_createNavigator_0(v4, v8, v7);
end;