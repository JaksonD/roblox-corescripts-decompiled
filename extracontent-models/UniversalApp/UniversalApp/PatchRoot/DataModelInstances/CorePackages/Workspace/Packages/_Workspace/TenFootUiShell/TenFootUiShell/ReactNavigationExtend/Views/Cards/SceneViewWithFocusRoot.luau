local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.TenFootUiCommon);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v6.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local v9 = require(l_script_FirstAncestor_0.Hooks.useRootFocusNavigationBindings);
local l_SceneView_0 = v4.SceneView;
local _ = require(l_Parent_0.Navigation);
local l_FFlagFix10ftGlobalNavSelection_0 = require(l_Parent_0.SharedFlags).FFlagFix10ftGlobalNavSelection;
return function(v13) --[[ Line: 26 ]] --[[ Name: SceneViewWithFocusRoot ]]
    -- upvalues: v3 (copy), v9 (copy), v5 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagFix10ftGlobalNavSelection_0 (copy), l_SceneView_0 (copy)
    local v14, v15 = v3.useState(nil);
    local v16 = v9(v15);
    local v17 = v13.shouldRestoreFocus == nil or v13.shouldRestoreFocus;
    local v18 = v5.useMostRecentFocusBehavior(v16);
    local v19 = if v17 then v18 else v16;
    local l_isFocusable_0 = v13.isFocusable;
    l_useFocusNavigableSurfaceRegistryConnection_0(v14, l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, l_isFocusable_0);
    return v3.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionGroup = l_FFlagFix10ftGlobalNavSelection_0 and true or nil, 
        SelectionBehaviorLeft = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorRight = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        ref = v19
    }, v3.createElement(l_SceneView_0, {
        navigation = v13.navigation, 
        component = v13.component, 
        screenProps = v13.screenProps
    }));
end;