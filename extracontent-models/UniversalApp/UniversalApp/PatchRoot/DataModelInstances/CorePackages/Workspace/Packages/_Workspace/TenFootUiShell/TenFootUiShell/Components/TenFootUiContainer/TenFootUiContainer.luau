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
local v23 = game:DefineFastFlag("EnableProgressLoadingAssetsTenFoot", false);
local _ = nil;
local v25 = nil;
if v23 then
    v25 = require(l_Parent_0.ProgressLoading).ProgressLoadingAssetsScreenGui;
end;
local v26 = game:DefineFastFlag("EnableSduiRegistriesforTenFootUiContainer", false);
local l_FFlagLuaAppUseOverlayInAppContainer_0 = v19.FFlagLuaAppUseOverlayInAppContainer;
local function v38(v28) --[[ Line: 53 ]] --[[ Name: RootViewContainer ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), v3 (copy), v2 (copy), v22 (copy), v4 (copy), v5 (copy), l_useNavigation_0 (copy)
    if l_FFlagLuaAppCompositionSupport_0 then
        local v29 = v3.useContext(v2.ContainerRef);
        local l_v29_0 = v29 --[[ copy: 1 -> 5 ]];
        v3.useEffect(function() --[[ Line: 56 ]]
            -- upvalues: l_v29_0 (copy), v22 (ref)
            local v31 = if l_v29_0 then l_v29_0.current else nil;
            if not v31 then
                return;
            else
                local v32 = v22.getMainCollectionLayoutStore(false);
                if v32.setDefaultContentRegionWidth then
                    v32.setDefaultContentRegionWidth(v31.AbsoluteSize.X);
                end;
                local v33 = v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 65 ]]
                    -- upvalues: v32 (copy), v31 (copy)
                    if v32.setDefaultContentRegionWidth then
                        v32.setDefaultContentRegionWidth(v31.AbsoluteSize.X);
                    end;
                end);
                return function() --[[ Line: 70 ]]
                    -- upvalues: v33 (copy)
                    v33:Disconnect();
                end;
            end;
        end, {
            v29
        });
    end;
    local v34 = v4();
    local v35 = v5();
    local v36 = l_useNavigation_0();
    local v37 = v3.createElement(v28.dependencies.RootNavigator, {
        navigation = v36, 
        screenProps = {
            surfaceGuiContainer = v34, 
            worldContainer = v35
        }
    });
    return (v3.createElement(v3.Fragment, nil, {
        ResponsiveContainerFrame = v3.createElement(v2.ResponsiveContainerFrame), 
        NavigatorView = v37
    }));
end;
return function(v39) --[[ Line: 94 ]] --[[ Name: TenFootUiContainer ]]
    -- upvalues: l_FFlagLuaAppUseOverlayInAppContainer_0 (copy), l_useOverlay_0 (copy), v4 (copy), v5 (copy), v3 (copy), v12 (copy), v38 (copy), l_GlobalNavContainer_0 (copy), l_AppShortcutBarContainer_0 (copy), v23 (copy), v25 (ref), v6 (copy), l_SduiSharedRegister_0 (copy), v26 (copy), l_SduiDiscoveryDependencyUpdater_0 (copy), l_FFlagEnableAvatarExperienceSdui_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_TenFootUiContext_0 (copy), l_AppShortcutBarContext_0 (copy), l_ProviderContainer_0 (copy)
    if l_FFlagLuaAppUseOverlayInAppContainer_0 then
        l_useOverlay_0();
    end;
    local v40 = v4();
    local v41 = v5();
    local v42 = v3.createElement(v3.Fragment, nil, {
        Toast = v39.toast, 
        CentralOverlay = v39.centralOverlay, 
        TenFootUiLayout = v3.createElement(v12, {
            adorneeParent = v41, 
            surfaceGuiParent = v40, 
            rootViewSlot = v3.createElement(v38, v39), 
            globalNavSlot = v3.createElement(l_GlobalNavContainer_0), 
            controllerBarSlot = v3.createElement(l_AppShortcutBarContainer_0)
        }), 
        ProgressLoadingAssetsScreenGui = if v23 then v3.createElement(v25) else nil, 
        GlobalEffects = v3.createElement(v6), 
        SduiSharedRegister = v3.createElement(l_SduiSharedRegister_0), 
        SduiDiscoveryDependencyUpdater = if v26 then v3.createElement(l_SduiDiscoveryDependencyUpdater_0) else nil, 
        SduiAvatarExperienceRegister = if v26 and l_FFlagEnableAvatarExperienceSdui_0 then v3.createElement(l_SduiAvatarExperienceRegister_0) else nil
    });
    local v43 = {};
    table.insert(v43, {
        class = l_TenFootUiContext_0.Provider, 
        props = {
            value = v39.dependencies
        }
    });
    table.insert(v43, {
        class = l_AppShortcutBarContext_0.Provider
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v43
    }, v42);
end;