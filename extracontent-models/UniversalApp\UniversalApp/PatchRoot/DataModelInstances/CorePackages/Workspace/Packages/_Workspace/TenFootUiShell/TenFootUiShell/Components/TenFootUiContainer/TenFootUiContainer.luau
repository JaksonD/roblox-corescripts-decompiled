local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Responsive);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.getOrCreateSurfaceGuiContainer);
local v5 = require(l_script_FirstAncestor_0.getOrCreateWorkSpaceContainer);
local v6 = require(l_script_FirstAncestor_0.Components.TenFootUiGlobalEffects);
local l_GlobalNavContainer_0 = require(l_Parent_0.TenFootUiGlobalNav).GlobalNavContainer;
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local v9 = require(l_Parent_0.AppShortcutBar);
local l_AppShortcutBarContainer_0 = v9.AppShortcutBarContainer;
local l_AppShortcutBarContext_0 = v9.AppShortcutBarContext;
local v12 = require(script.Parent.TenFootUiLayout);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_useOverlay_0 = require(l_Parent_0.Foundation).Hooks.useOverlay;
local l_SduiDiscoveryDependencyUpdater_0 = require(l_Parent_0.ServerDrivenUi).SduiDiscoveryDependencyUpdater;
local l_SduiAvatarExperienceRegister_0 = require(l_Parent_0.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister;
local l_SduiSharedRegister_0 = require(l_Parent_0.SduiSharedContent).SduiSharedRegister;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v19 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableAvatarExperienceSdui_0 = v19.FFlagEnableAvatarExperienceSdui;
local v21 = game:DefineFastFlag("EnableSduiRegistriesforTenFootUiContainer", false);
local l_FFlagLuaAppUseOverlayInAppContainer_0 = v19.FFlagLuaAppUseOverlayInAppContainer;
local function v28(v23) --[[ Line: 42 ]] --[[ Name: RootViewContainer ]]
    -- upvalues: v4 (copy), v5 (copy), l_useNavigation_0 (copy), v3 (copy), v2 (copy)
    local v24 = v4();
    local v25 = v5();
    local v26 = l_useNavigation_0();
    local v27 = v3.createElement(v23.dependencies.RootNavigator, {
        navigation = v26, 
        screenProps = {
            surfaceGuiContainer = v24, 
            worldContainer = v25
        }
    });
    return (v3.createElement(v3.Fragment, nil, {
        ResponsiveContainerFrame = v3.createElement(v2.ResponsiveContainerFrame), 
        NavigatorView = v27
    }));
end;
return function(v29) --[[ Line: 61 ]] --[[ Name: TenFootUiContainer ]]
    -- upvalues: l_FFlagLuaAppUseOverlayInAppContainer_0 (copy), l_useOverlay_0 (copy), v4 (copy), v5 (copy), v3 (copy), v12 (copy), v28 (copy), l_GlobalNavContainer_0 (copy), l_AppShortcutBarContainer_0 (copy), v6 (copy), l_SduiSharedRegister_0 (copy), v21 (copy), l_SduiDiscoveryDependencyUpdater_0 (copy), l_FFlagEnableAvatarExperienceSdui_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_TenFootUiContext_0 (copy), l_AppShortcutBarContext_0 (copy), l_ProviderContainer_0 (copy)
    if l_FFlagLuaAppUseOverlayInAppContainer_0 then
        l_useOverlay_0();
    end;
    local v30 = v4();
    local v31 = v5();
    local v32 = v3.createElement(v3.Fragment, nil, {
        Toast = v29.toast, 
        CentralOverlay = v29.centralOverlay, 
        TenFootUiLayout = v3.createElement(v12, {
            adorneeParent = v31, 
            surfaceGuiParent = v30, 
            rootViewSlot = v3.createElement(v28, v29), 
            globalNavSlot = v3.createElement(l_GlobalNavContainer_0), 
            controllerBarSlot = v3.createElement(l_AppShortcutBarContainer_0)
        }), 
        GlobalEffects = v3.createElement(v6), 
        SduiSharedRegister = v3.createElement(l_SduiSharedRegister_0), 
        SduiDiscoveryDependencyUpdater = if v21 then v3.createElement(l_SduiDiscoveryDependencyUpdater_0) else nil, 
        SduiAvatarExperienceRegister = if v21 and l_FFlagEnableAvatarExperienceSdui_0 then v3.createElement(l_SduiAvatarExperienceRegister_0) else nil
    });
    local v33 = {};
    table.insert(v33, {
        class = l_TenFootUiContext_0.Provider, 
        props = {
            value = v29.dependencies
        }
    });
    table.insert(v33, {
        class = l_AppShortcutBarContext_0.Provider
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v33
    }, v32);
end;