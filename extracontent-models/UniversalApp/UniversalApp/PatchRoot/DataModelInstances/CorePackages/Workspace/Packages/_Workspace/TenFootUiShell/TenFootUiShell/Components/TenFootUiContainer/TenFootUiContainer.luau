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
local l_FFlagLuaAppCompositionSupport_0 = v19.FFlagLuaAppCompositionSupport;
local v22 = require(l_Parent_0.CollectionViews);
local v23 = game:DefineFastFlag("EnableSduiRegistriesforTenFootUiContainer", false);
local l_FFlagLuaAppUseOverlayInAppContainer_0 = v19.FFlagLuaAppUseOverlayInAppContainer;
local function v35(v25) --[[ Line: 45 ]] --[[ Name: RootViewContainer ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), v3 (copy), v2 (copy), v22 (copy), v4 (copy), v5 (copy), l_useNavigation_0 (copy)
    if l_FFlagLuaAppCompositionSupport_0 then
        local v26 = v3.useContext(v2.ContainerRef);
        local l_v26_0 = v26 --[[ copy: 1 -> 5 ]];
        v3.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: l_v26_0 (copy), v22 (ref)
            local v28 = if l_v26_0 then l_v26_0.current else nil;
            if not v28 then
                return;
            else
                local v29 = v22.getMainCollectionLayoutStore(false);
                if v29.setDefaultContentRegionWidth then
                    v29.setDefaultContentRegionWidth(v28.AbsoluteSize.X);
                end;
                local v30 = v28:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 57 ]]
                    -- upvalues: v29 (copy), v28 (copy)
                    if v29.setDefaultContentRegionWidth then
                        v29.setDefaultContentRegionWidth(v28.AbsoluteSize.X);
                    end;
                end);
                return function() --[[ Line: 62 ]]
                    -- upvalues: v30 (copy)
                    v30:Disconnect();
                end;
            end;
        end, {
            v26
        });
    end;
    local v31 = v4();
    local v32 = v5();
    local v33 = l_useNavigation_0();
    local v34 = v3.createElement(v25.dependencies.RootNavigator, {
        navigation = v33, 
        screenProps = {
            surfaceGuiContainer = v31, 
            worldContainer = v32
        }
    });
    return (v3.createElement(v3.Fragment, nil, {
        ResponsiveContainerFrame = v3.createElement(v2.ResponsiveContainerFrame), 
        NavigatorView = v34
    }));
end;
return function(v36) --[[ Line: 86 ]] --[[ Name: TenFootUiContainer ]]
    -- upvalues: l_FFlagLuaAppUseOverlayInAppContainer_0 (copy), l_useOverlay_0 (copy), v4 (copy), v5 (copy), v3 (copy), v12 (copy), v35 (copy), l_GlobalNavContainer_0 (copy), l_AppShortcutBarContainer_0 (copy), v6 (copy), l_SduiSharedRegister_0 (copy), v23 (copy), l_SduiDiscoveryDependencyUpdater_0 (copy), l_FFlagEnableAvatarExperienceSdui_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_TenFootUiContext_0 (copy), l_AppShortcutBarContext_0 (copy), l_ProviderContainer_0 (copy)
    if l_FFlagLuaAppUseOverlayInAppContainer_0 then
        l_useOverlay_0();
    end;
    local v37 = v4();
    local v38 = v5();
    local v39 = v3.createElement(v3.Fragment, nil, {
        Toast = v36.toast, 
        CentralOverlay = v36.centralOverlay, 
        TenFootUiLayout = v3.createElement(v12, {
            adorneeParent = v38, 
            surfaceGuiParent = v37, 
            rootViewSlot = v3.createElement(v35, v36), 
            globalNavSlot = v3.createElement(l_GlobalNavContainer_0), 
            controllerBarSlot = v3.createElement(l_AppShortcutBarContainer_0)
        }), 
        GlobalEffects = v3.createElement(v6), 
        SduiSharedRegister = v3.createElement(l_SduiSharedRegister_0), 
        SduiDiscoveryDependencyUpdater = if v23 then v3.createElement(l_SduiDiscoveryDependencyUpdater_0) else nil, 
        SduiAvatarExperienceRegister = if v23 and l_FFlagEnableAvatarExperienceSdui_0 then v3.createElement(l_SduiAvatarExperienceRegister_0) else nil
    });
    local v40 = {};
    table.insert(v40, {
        class = l_TenFootUiContext_0.Provider, 
        props = {
            value = v36.dependencies
        }
    });
    table.insert(v40, {
        class = l_AppShortcutBarContext_0.Provider
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v40
    }, v39);
end;