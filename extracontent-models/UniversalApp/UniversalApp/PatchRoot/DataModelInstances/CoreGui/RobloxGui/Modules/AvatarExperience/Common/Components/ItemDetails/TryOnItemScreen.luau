local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v9 = require(l_CorePackages_0.Packages.Dash);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetails);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetails_DEPRECATED);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsPeekView);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v15 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v18.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local v22 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v23 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = v23.FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
local l_FFlagAXTryOnScreenImprovements_0 = v23.FFlagAXTryOnScreenImprovements;
local v28 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXMigrateTryOnItemScreenToAutofocus", false);
local l_useEffectOnMount_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount;
local l_useEffect_0 = v3.useEffect;
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useTryOnAvatarAnimations);
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local l_useSelectorSignal_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Hooks.useSelectorSignal;
local v34 = require(l_CorePackages_0.Packages.tutils);
local v35 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave);
local v36 = if l_FFlagAXTryOnScreenImprovements_0 then v35.Selectors.selectCharacterData else nil;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local function v41(v38) --[[ Line: 69 ]] --[[ Name: useHideTabBarForHomeTryOn ]]
    -- upvalues: l_useDispatch_0 (copy), l_useEffect_0 (copy), l_SetTabBarVisible_0 (copy)
    local v39 = l_useDispatch_0();
    local v40 = nil;
    if v38.navigation and v38.navigation.state and v38.navigation.state.params then
        v40 = v38.navigation.state.params;
    end;
    l_useEffect_0(function() --[[ Line: 77 ]]
        -- upvalues: v40 (ref), v39 (copy), l_SetTabBarVisible_0 (ref)
        if v40 and v40.fromHome then
            v39(l_SetTabBarVisible_0(false));
        end;
    end, {
        v40
    });
end;
local function v45(v42) --[[ Line: 84 ]] --[[ Name: useHideTabBarParam ]]
    -- upvalues: l_FFlagAXTryOnScreenImprovements_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), l_SetTabBarVisible_0 (copy)
    if not l_FFlagAXTryOnScreenImprovements_0 then
        return;
    else
        local v43 = l_useDispatch_0();
        local v44 = nil;
        if v42.navigation and v42.navigation.state and v42.navigation.state.params then
            v44 = v42.navigation.state.params;
        end;
        l_useEffect_0(function() --[[ Line: 95 ]]
            -- upvalues: v44 (ref), v43 (copy), l_SetTabBarVisible_0 (ref)
            if v44 and v44.hideTab then
                v43(l_SetTabBarVisible_0(false));
            end;
        end, {
            v44
        });
        return;
    end;
end;
return v14(function(v46) --[[ Line: 102 ]] --[[ Name: TryOnItemScreen ]]
    -- upvalues: l_useDispatch_0 (copy), v15 (copy), v7 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_useSelectorSignal_0 (copy), v36 (copy), v34 (copy), v3 (copy), v5 (copy), v31 (copy), l_useAvatarRoute_0 (copy), v16 (copy), v6 (copy), v45 (copy), v41 (copy), l_PeekViewState_0 (copy), l_useEffectOnMount_0 (copy), l_sendAXCounterV2_0 (copy), v17 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v22 (copy), v28 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v2 (copy), v13 (copy), v12 (copy), l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 (copy), v10 (copy), v11 (copy), v9 (copy)
    local v47 = l_useDispatch_0();
    local v48 = v15(v7);
    local v49 = if l_FFlagAXTryOnScreenImprovements_0 then l_useSelectorSignal_0(v36, v34.deepEqual) else nil;
    if not l_FFlagAXTryOnScreenImprovements_0 then
        v3.useEffect(function() --[[ Line: 116 ]]
            -- upvalues: v47 (copy), v5 (ref)
            return function() --[[ Line: 117 ]]
                -- upvalues: v47 (ref), v5 (ref)
                v47(v5());
            end;
        end, {});
    end;
    local v50 = v31();
    local v51 = nil;
    local v52 = nil;
    local v53 = l_useAvatarRoute_0();
    local v54 = v15(v16);
    local v55 = nil;
    local v56 = nil;
    if v46.navigation and v46.navigation.state and v46.navigation.state.params then
        v55 = v46.navigation.state.params;
        if v55 and (l_FFlagAXTryOnScreenImprovements_0 or v55.fromHome) then
            v51 = v55.itemType;
        end;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v56 = v55.simpleView == nil or v55.simpleView;
        end;
    end;
    if l_FFlagAXTryOnScreenImprovements_0 then
        v3.useEffect(function() --[[ Line: 151 ]]
            -- upvalues: v49 (copy), v47 (copy), v5 (ref), v6 (ref), v54 (copy), v48 (copy), v46 (copy), v50 (copy)
            local v57 = v49(false);
            return function() --[[ Line: 154 ]]
                -- upvalues: v47 (ref), v5 (ref), v57 (copy), v6 (ref), v54 (ref), v48 (ref), v46 (ref), v50 (ref)
                v47(v5());
                for _, v59 in v57.tryOn.OutfitTryOn.TryOnItems do
                    v47(v6(v54, v48, v59.itemType, v59.itemSubType, v59.itemId, true, nil, v46.navigation));
                    if v50 then
                        v50(v59.itemId, v59.itemType, v59.itemSubType);
                    end;
                end;
            end;
        end, {});
    end;
    if l_FFlagAXTryOnScreenImprovements_0 then
        v45(v46);
    else
        v41(v46);
    end;
    v52 = {
        avatarRoute = v53, 
        navigation = v46.navigation, 
        isTryOn = true, 
        initialPeekViewState = l_PeekViewState_0.SuperBrief, 
        showPeekViewInSuperBrief = true
    };
    l_useEffectOnMount_0(function() --[[ Line: 192 ]]
        -- upvalues: l_FFlagAXTryOnScreenImprovements_0 (ref), l_sendAXCounterV2_0 (ref), v17 (ref), v55 (ref), v48 (copy), v51 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v47 (copy), v22 (ref), v54 (copy), l_PeekViewState_0 (ref), v6 (ref), v46 (copy), v50 (copy)
        if l_FFlagAXTryOnScreenImprovements_0 then
            l_sendAXCounterV2_0(v17.Counter.TryOnItemView);
        end;
        if not l_FFlagAXTryOnScreenImprovements_0 and (v55 == nil or not v55.fromHome) then
            return;
        else
            if not l_FFlagAXTryOnScreenImprovements_0 then
                v48.homepageWidgetItemClick(v55.itemId, v55.itemType);
            end;
            local l_itemId_0 = v55.itemId;
            local l_itemSubType_0 = v55.itemSubType;
            local l_itemSubTypeName_0 = v55.itemSubTypeName;
            if l_itemSubType_0 == nil then
                if v51 == "Asset" then
                    l_itemSubType_0 = v17.AssetTypeIdStrings[l_itemSubTypeName_0];
                elseif v51 == "Bundle" then
                    l_itemSubType_0 = v17.BundleTypeNameToIdStringForCatalogHydration[l_itemSubTypeName_0];
                end;
            end;
            if v51 == "Look" then
                local v63 = {
                    itemId = l_itemId_0, 
                    itemType = v51, 
                    surface = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then v55.fromSurface else nil
                };
                v47(v22(v54, nil, v63, l_itemId_0, l_PeekViewState_0.SuperBrief));
                return;
            else
                if l_itemId_0 and v51 and l_itemSubType_0 then
                    v47(v6(v54, v48, v51, l_itemSubType_0, l_itemId_0, true, nil, v46.navigation));
                    if v50 then
                        v50(l_itemId_0, v51, l_itemSubType_0);
                    end;
                end;
                return;
            end;
        end;
    end);
    local v64 = nil;
    if v28 then
        v64 = v3.useRef(nil);
        l_useFocusNavigableSurfaceRegistryConnection_0(v64.current, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, true);
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        SceneInteractionFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 1
        }, v2.createElement(v13)), 
        ItemDetails = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2, 
            ref = if v28 then v64 else nil
        }, {
            Content = if v51 == "Look" then v2.createElement(v12, v52) else v2.createElement(if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v10 else v11, if l_FFlagAXTryOnScreenImprovements_0 then v9.join(v46, {
                simpleView = v56
            }) else v46)
        })
    });
end);