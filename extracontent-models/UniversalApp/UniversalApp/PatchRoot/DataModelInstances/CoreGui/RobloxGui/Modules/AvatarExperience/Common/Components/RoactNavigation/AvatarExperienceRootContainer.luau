local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v4.Enums.AvatarScreen;
local l_AvatarRouteContext_0 = v4.AvatarRoute.Context.AvatarRouteContext;
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.makeAvatarRoute);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceAlwaysMounted);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootNavigator);
local v13 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v14 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v19 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.loadtime");
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v21 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local v23 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v24 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v26 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local v27 = v3.Component:extend("AvatarExperienceRootContainer");
local v28 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useUnifiedEventListener_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListener;
local l_ProviderContainer_0 = v23.Components.ProviderContainer;
local l_AXCatalogStoreContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Context.AXCatalogStoreContext;
local l_getCatalogStores_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Stores.getCatalogStores;
local v33 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_AvatarEditorStores_0 = v33.Context.AvatarEditorStores;
local v35 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories);
local l_createAvatarEditorStores_0 = v33.Stores.createAvatarEditorStores;
local l_AnimatedVisibilityProvider_0 = v9.Stores.AnimatedVisibilityStore.AnimatedVisibilityProvider;
local v38 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.GetTopLevelPageFPSCounterName);
local v40 = game:DefineFastInt("AvatarExperienceFPSDuration", 6);
local l_GetFFlagAXFPSEventStreamAndCounters_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAXFPSEventStreamAndCounters;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXPhotoboothFunctionality_0 = v7.FFlagAXPhotoboothFunctionality;
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusLayerExposureLogger);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_FFlagAXPhotoboothExposure_0 = v7.FFlagAXPhotoboothExposure;
local l_FFlagAXHideMenuOnScroll_0 = v7.FFlagAXHideMenuOnScroll;
local v49 = game:DefineFastFlag("AXGamepadNoHarmExposureLogging", false);
local v50 = game:DefineFastFlag("AXUseFlagLinkedUserLayerExposure", false);
local l_FFlagAXDurablesSupportExposureLogging_0 = v7.FFlagAXDurablesSupportExposureLogging;
local l_FStringAXDurablesSupportExposureLayer_0 = v7.FStringAXDurablesSupportExposureLayer;
local l_FFlagAXSlotsDesignUpdatesExposureLogging_0 = v7.FFlagAXSlotsDesignUpdatesExposureLogging;
local function v54() --[[ Line: 148 ]]
    -- upvalues: l_useUnifiedEventListener_0 (copy)
    l_useUnifiedEventListener_0();
    return nil;
end;
v27.init = function(v55) --[[ Line: 153 ]] --[[ Name: init ]]
    -- upvalues: v28 (copy), v10 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_createAvatarEditorStores_0 (copy), v35 (copy), l_getCatalogStores_0 (copy)
    v55.namedRefs = v28.createRefCache();
    v55.startAXLatencyTimer = os.clock();
    v55.isNavigating = false;
    local l_navigation_0 = v55.props.navigation;
    v55:trackTopLevelPageFPS((v10(l_navigation_0, false)));
    if l_FFlagAXAvatarEditorStoresContext_0 then
        v55.avatarEditorStores = l_createAvatarEditorStores_0();
        v55.avatarEditorStores.categoryInventoryStores = v35();
    end;
    v55.catalogStores = l_getCatalogStores_0();
end;
v27.getProviders = function(v57) --[[ Line: 172 ]] --[[ Name: getProviders ]]
    -- upvalues: l_FFlagAXPhotoboothFunctionality_0 (copy), v8 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_AnimatedVisibilityProvider_0 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_AvatarEditorStores_0 (copy), l_AXCatalogStoreContext_0 (copy)
    local v58 = {};
    if l_FFlagAXPhotoboothFunctionality_0 then
        table.insert(v58, {
            class = v8.Context.PhotoboothContextProvider
        });
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        table.insert(v58, {
            class = l_AnimatedVisibilityProvider_0
        });
    end;
    if l_FFlagAXAvatarEditorStoresContext_0 then
        table.insert(v58, {
            class = l_AvatarEditorStores_0.Provider, 
            props = {
                value = v57.avatarEditorStores
            }
        });
    end;
    table.insert(v58, {
        class = l_AXCatalogStoreContext_0.Provider, 
        props = {
            value = v57.catalogStores
        }
    });
    return v58;
end;
v27.render = function(v59) --[[ Line: 200 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v13 (copy), v14 (copy), l_AvatarScreen_0 (copy), v22 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), l_FFlagAXDurablesSupportExposureLogging_0 (copy), l_FFlagAXSlotsDesignUpdatesExposureLogging_0 (copy), l_FStringAXDurablesSupportExposureLayer_0 (copy), l_FFlagAXPhotoboothExposure_0 (copy), v45 (copy), l_AppUserLayers_0 (copy)
    return v3.createElement(v13.Consumer, {
        render = function(v60) --[[ Line: 204 ]] --[[ Name: render ]]
            -- upvalues: v3 (ref), v14 (ref), v59 (copy), l_AvatarScreen_0 (ref), v22 (ref), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (ref), l_FFlagAXDurablesSupportExposureLogging_0 (ref), l_FFlagAXSlotsDesignUpdatesExposureLogging_0 (ref), l_FStringAXDurablesSupportExposureLayer_0 (ref), l_FFlagAXPhotoboothExposure_0 (ref), v45 (ref), l_AppUserLayers_0 (ref)
            return v3.createElement(v14.Consumer, {
                render = function(v61) --[[ Line: 206 ]] --[[ Name: render ]]
                    -- upvalues: v59 (ref), v60 (copy), l_AvatarScreen_0 (ref), v3 (ref), v22 (ref), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (ref), l_FFlagAXDurablesSupportExposureLogging_0 (ref), l_FFlagAXSlotsDesignUpdatesExposureLogging_0 (ref), l_FStringAXDurablesSupportExposureLayer_0 (ref), l_FFlagAXPhotoboothExposure_0 (ref), v45 (ref), l_AppUserLayers_0 (ref)
                    local v62 = v59.props.screenProps and v59.props.screenProps.isVisible or v61 and v60 == l_AvatarScreen_0.AvatarExperienceRoot or false;
                    return v3.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Visible = v62
                    }, {
                        AvatarExperienceRoot = v59:renderWithVisibility(v62), 
                        OnFocusExperimentExposureLogger = v3.createElement(v22, {
                            ixpTests = {
                                if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 else nil
                            }, 
                            flagIXPTestLayers = if not not l_FFlagAXDurablesSupportExposureLogging_0 or l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then {
                                if l_FFlagAXDurablesSupportExposureLogging_0 then l_FStringAXDurablesSupportExposureLayer_0 else nil
                            } else nil
                        }), 
                        OnFocusLayerExposureLogger = if l_FFlagAXPhotoboothExposure_0 then v3.createElement(v45, {
                            ixpLayers = {
                                l_AppUserLayers_0.AvatarExperienceUAAllViews
                            }
                        }) else nil
                    });
                end
            });
        end
    });
end;
v27.renderWithVisibility = function(v63, v64) --[[ Line: 252 ]] --[[ Name: renderWithVisibility ]]
    -- upvalues: v10 (copy), v3 (copy), l_AvatarRouteContext_0 (copy), l_ProviderContainer_0 (copy), v26 (copy), v12 (copy), v11 (copy), v54 (copy)
    local l_navigation_1 = v63.props.navigation;
    local v66 = v10(l_navigation_1, v64);
    local v67 = v63:getProviders();
    return v3.createElement(l_AvatarRouteContext_0.Provider, {
        value = v66
    }, {
        ProviderContainer = v3.createElement(l_ProviderContainer_0, {
            providers = v67
        }, {
            AvatarExperienceRootWithProviders = v3.createElement(v26.Provider, {
                value = v63.namedRefs
            }, {
                RootNavigator = v3.createElement(v12, {
                    navigation = l_navigation_1, 
                    avatarRoute = v66
                }), 
                AlwaysMounted = v3.createElement(v11, {
                    navigation = l_navigation_1, 
                    avatarRoute = v66
                }), 
                Analytics = v3.createElement(v54)
            })
        })
    });
end;
local function v70(v68) --[[ Line: 280 ]] --[[ Name: getPageErrorCounterMap ]]
    -- upvalues: v15 (copy), l_AvatarScreen_0 (copy)
    local l_TopLevelErrors_0 = v15.Counter.TopLevelErrors;
    return {
        [l_AvatarScreen_0.Catalog] = l_TopLevelErrors_0.CatalogViewError, 
        [l_AvatarScreen_0.CatalogSearch] = l_TopLevelErrors_0.SearchViewError, 
        [l_AvatarScreen_0.AvatarEditor] = l_TopLevelErrors_0.EditorViewError, 
        [l_AvatarScreen_0.ItemDetails] = v68 and l_TopLevelErrors_0.SearchItemDetailsViewError or l_TopLevelErrors_0.CatalogItemDetailsViewError, 
        [l_AvatarScreen_0.SortAndFilters] = v68 and l_TopLevelErrors_0.SearchFiltersViewError or l_TopLevelErrors_0.CatalogFiltersViewError
    };
end;
local function v76(v71, v72) --[[ Line: 299 ]] --[[ Name: trackTopLevelErrorCounters ]]
    -- upvalues: v16 (copy), l_AvatarScreen_0 (copy), v70 (copy), v15 (copy)
    local l_name_0 = v71.current.name;
    local v74 = v16.isWithinViewContext(v71, l_AvatarScreen_0.CatalogSearch);
    local v75 = v70(v74)[l_name_0] or v15.Counter.TopLevelErrors.UnknownViewError;
    task.spawn(function() --[[ Line: 308 ]]
        -- upvalues: v72 (copy), v75 (copy)
        v72.sendAXCounter(v75);
    end);
end;
local function v79(v77) --[[ Line: 313 ]] --[[ Name: getPageLatencyCountersMap ]]
    -- upvalues: v15 (copy), l_AvatarScreen_0 (copy)
    local l_TopLevelLatency_0 = v15.Counter.TopLevelLatency;
    return {
        [l_AvatarScreen_0.Catalog] = l_TopLevelLatency_0.CatalogViewLatency, 
        [l_AvatarScreen_0.CatalogSearch] = l_TopLevelLatency_0.SearchViewLatency, 
        [l_AvatarScreen_0.AvatarEditor] = l_TopLevelLatency_0.EditorViewLatency, 
        [l_AvatarScreen_0.ItemDetails] = v77 and l_TopLevelLatency_0.SearchItemDetailsViewLatency or l_TopLevelLatency_0.CatalogItemDetailsViewLatency, 
        [l_AvatarScreen_0.SortAndFilters] = v77 and l_TopLevelLatency_0.SearchFiltersViewLatency or l_TopLevelLatency_0.CatalogFiltersViewLatency
    };
end;
v27.trackTopLevelPageLatency = function(v80) --[[ Line: 326 ]] --[[ Name: trackTopLevelPageLatency ]]
    -- upvalues: v10 (copy), v16 (copy), l_AvatarScreen_0 (copy), v79 (copy), v15 (copy), v19 (copy), v21 (copy)
    local l_navigation_2 = v80.props.navigation;
    local v82 = v10(l_navigation_2, false);
    local l_appAnalytics_0 = v80.props.appAnalytics;
    local l_name_1 = v82.current.name;
    local v85 = v16.isWithinViewContext(v82, l_AvatarScreen_0.CatalogSearch);
    local v86 = v79(v85)[l_name_1] or v15.Counter.TopLevelLatency.UnknownViewLatency;
    local v87 = (os.clock() - v80.startAXLatencyTimer) * 1000;
    v19:info("Avatar experirence load time: {} ms", v87);
    local v88 = v86 .. "_" .. v21.getDeviceType();
    l_appAnalytics_0.Diag:reportStats(v88, v87);
    v80.props.catalogAnalytics.sendAXStat(v15.Counter.TopLevelLatency.Name, v87, {
        Page = v86
    });
    v80.startAXLatencyTimer = nil;
end;
v27.trackTopLevelPageFPS = function(_, v90) --[[ Line: 353 ]] --[[ Name: trackTopLevelPageFPS ]]
    -- upvalues: v39 (copy), v40 (ref), l_IntervalPerformanceTracker_0 (copy), l_GetFFlagAXFPSEventStreamAndCounters_0 (copy)
    local v91 = v39(v90.current.name, v90);
    if not v40 or v40 <= 0 then
        v40 = 1;
    end;
    l_IntervalPerformanceTracker_0:startTracking(v91, v40, nil, l_GetFFlagAXFPSEventStreamAndCounters_0() and true or nil, l_GetFFlagAXFPSEventStreamAndCounters_0() and true or nil);
end;
v27.componentDidCatch = function(v92, v93, _) --[[ Line: 374 ]] --[[ Name: componentDidCatch ]]
    -- upvalues: v10 (copy), v76 (copy)
    local l_navigation_3 = v92.props.navigation;
    local v96 = v10(l_navigation_3, false);
    local l_catalogAnalytics_0 = v92.props.catalogAnalytics;
    v76(v96, l_catalogAnalytics_0);
    error(v93);
end;
v27.didMount = function(v98) --[[ Line: 386 ]] --[[ Name: didMount ]]
    -- upvalues: v49 (copy), v50 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), v24 (copy)
    v98:trackTopLevelPageLatency();
    if v49 then
        if v50 then
            l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.AvatarExperienceUAAllViews);
            return;
        else
            v24.logLayerExposure(l_AppUserLayers_0.AvatarExperienceUAAllViews);
        end;
    end;
end;
v27.willUpdate = function(v99, v100) --[[ Line: 400 ]] --[[ Name: willUpdate ]]
    -- upvalues: v10 (copy)
    local l_navigation_4 = v100.navigation;
    local v102 = v10(l_navigation_4, false);
    local l_name_2 = v102.current.name;
    local l_navigation_5 = v99.props.navigation;
    if l_name_2 ~= v10(l_navigation_5, false).current.name then
        v99.startAXLatencyTimer = os.clock();
        v99.isNavigating = true;
        v99:trackTopLevelPageFPS(v102);
    end;
end;
v27.didUpdate = function(v105, v106) --[[ Line: 417 ]] --[[ Name: didUpdate ]]
    -- upvalues: v10 (copy)
    local l_navigation_6 = v105.props.navigation;
    local v108 = v10(l_navigation_6, false);
    local l_navigation_7 = v106.navigation;
    local l_name_3 = v10(l_navigation_7, false).current.name;
    local l_name_4 = v108.current.name;
    if v105.isNavigating and l_name_4 ~= l_name_3 then
        v105:trackTopLevelPageLatency();
        v105.isNavigating = false;
    end;
end;
v27 = l_RoactServices_0.connect({
    catalogAnalytics = v18, 
    appAnalytics = v38
})(v27);
v27.router = v12.router;
return v27;