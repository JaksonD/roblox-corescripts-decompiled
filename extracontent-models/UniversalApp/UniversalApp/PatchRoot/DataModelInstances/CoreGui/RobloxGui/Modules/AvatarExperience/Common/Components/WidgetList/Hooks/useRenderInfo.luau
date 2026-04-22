local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.tutils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_useWidgetListInfoViewModel_0 = v13.Components.ResultsList.useWidgetListInfoViewModel;
local l_WidgetListBreakPointEnum_0 = v13.Components.ResultsList.WidgetListBreakPointEnum;
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXLookAndFeelBackgrounds_0 = v16.FFlagAXLookAndFeelBackgrounds;
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v16.FFlagAXCatalogItemCardFooterBackendDriven;
local v19 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v20 = require(l_Modules_0.AvatarExperience.Common.Util.getIterator);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.OrganicContentRow);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.CatalogGridWidget);
local v23 = require(l_Modules_0.AvatarExperience.Common.Hooks.useLocalWidgets);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useHandleThumbnailsLoaded);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Components.WidgetListResultsHeader);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Components.WidgetListSpacer);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Components.WidgetListLoadMoreButton);
local l_WidgetConstants_0 = v13.WidgetConstants;
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getOrganicResultIdsFromEntries);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getEntriesAsRows);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetItemIdsFromWidgetInfo);
local v36 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v37 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileLatencyTracker);
local v38 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useGetHydratedWidgets);
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v41 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v42 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v10.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v44 = game:DefineFastFlag("AXUseRendererInfoConditionalHookBacktraceError", false);
local v45 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableDecreaseWidgetPaddingSizing);
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFIntWidgetPaddingSizing);
local l_Utils_0 = v13.Utils;
local l_getUseSelectorDeepEquals_0 = v19.Utils.getUseSelectorDeepEquals;
local v49 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames);
local l_FFlagAXCatalogCategoriesStore_0 = v16.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v16.FFlagAXCatalogCategoriesStoreImprovePerf;
local v52 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v16.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v16.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v16.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_WidgetsPercievedTTIManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager;
local function v61(v58, v59) --[[ Line: 147 ]] --[[ Name: getBreakpointFromRowWidth ]]
    -- upvalues: l_WidgetListBreakPointEnum_0 (copy)
    local v60 = v59 or 1;
    if not v58 then
        return l_WidgetListBreakPointEnum_0.Default;
    elseif v58 <= 330 * v60 then
        return l_WidgetListBreakPointEnum_0.XSmall;
    elseif v58 <= 570 * v60 then
        return l_WidgetListBreakPointEnum_0.Small;
    elseif v58 <= 654 * v60 then
        return l_WidgetListBreakPointEnum_0.Medium;
    elseif v58 <= 884 * v60 then
        return l_WidgetListBreakPointEnum_0.Large;
    elseif v58 <= 1116 * v60 then
        return l_WidgetListBreakPointEnum_0.XLarge;
    else
        return l_WidgetListBreakPointEnum_0.X2Large;
    end;
end;
local function _(v62) --[[ Line: 159 ]] --[[ Name: getUIScaleFromTokens ]]
    if v62 and v62.Config and v62.Config.UI and v62.Config.UI.Scale then
        return v62.Config.UI.Scale;
    else
        return 1;
    end;
end;
local function v76(v64, v65, v66, v67, v68, v69) --[[ Line: 166 ]] --[[ Name: getRowInfoToInsertWidgets ]]
    -- upvalues: v4 (copy)
    local v70 = {};
    local v71 = v4.fieldCount(v65);
    for _, v73 in v64 do
        local v74 = v66[tostring(v73)];
        if (not v67 or v74.id == v67) and (v73 <= v68 or not v69) then
            local v75 = v71 + #v70;
            if v75 < v73 then
                v73 = v75 + 1;
            end;
            table.insert(v70, {
                rowNum = v73, 
                widgetInfo = v74
            });
        end;
    end;
    return v70;
end;
local function v82(v77) --[[ Line: 205 ]] --[[ Name: separateOrganicContentTemplatesFromWidgets ]]
    -- upvalues: l_WidgetConstants_0 (copy)
    local v78 = {};
    local v79 = {};
    for v80, v81 in v77 do
        if v81.type == l_WidgetConstants_0.Types.OrganicContent then
            v78[v80] = v81;
        else
            v79[v80] = v81;
        end;
    end;
    return v78, v79;
end;
local function v84(v83) --[[ Line: 221 ]] --[[ Name: selectSearchesParameters ]]
    return v83.SearchesParameters;
end;
local function v86(v85) --[[ Line: 225 ]] --[[ Name: selectCategoryId ]]
    return v85.AvatarExperience.Catalog.Categories.categoryId;
end;
local function v88(v87) --[[ Line: 229 ]] --[[ Name: selectSubcategoryId ]]
    return v87.AvatarExperience.Catalog.Categories.subcategoryId;
end;
local function v95(v89, v90, v91, v92, v93, v94) --[[ Line: 233 ]] --[[ Name: constructWidgetAnalyticsInfo ]]
    -- upvalues: v35 (copy)
    return {
        requestId = if v89 then v89.requestId else nil, 
        widgetPosition = v90, 
        widgetId = if v89 then v89.id else nil, 
        widgetType = if v89 then v89.type else nil, 
        widgetAbsPosition = (v90 - 1) * v93, 
        query = if v91 then v91.searchKeyword else nil, 
        organicResultIds = v92, 
        widgetItemIds = v35(v89, v93), 
        handleThumbnailsLoaded = v94
    };
end;
local function v103(v96) --[[ Line: 254 ]] --[[ Name: constructWidgetRenderInfo ]]
    -- upvalues: v95 (copy), v2 (copy), v22 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy)
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    v97 = function() --[[ Line: 256 ]]
        -- upvalues: v96 (copy)
        if v96.onWidgetFocusAcquired then
            v96.onWidgetFocusAcquired(v96.widgetInfo);
        end;
    end;
    v98 = v96.focusedWidget and v96.widgetInfo.id == v96.focusedWidget;
    v99 = v96.widgetInfo.template.previewColumns;
    v100 = v96.widgetInfo.template.previewRows;
    v101 = v95(v96.widgetInfo, v96.rowIndex, v96.searchParameters, v96.organicResultIds, v99);
    return {
        key = v96.key, 
        render = function(_) --[[ Line: 276 ]]
            -- upvalues: v2 (ref), v22 (ref), v96 (copy), v99 (ref), v100 (ref), v101 (ref), v98 (ref), v97 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref)
            return v2.createElement(v22, {
                widgetRow = v96.rowIndex, 
                widgetInfo = v96.widgetInfo, 
                itemsPerRow = v99, 
                rowCount = v100, 
                rowHeight = v96.itemSize.Y, 
                itemSize = v96.itemSize, 
                ref = v96.ref, 
                NextSelectionUp = v96.nextSelectionUp, 
                NextSelectionDown = v96.nextSelectionDown, 
                widgetAnalyticsInfo = v101, 
                widgetFocused = v98, 
                requestWidgetAcquireFocus = v97, 
                requestWidgetReleaseFocus = v96.onWidgetFocusReleased, 
                itemDetailsPeekViewRefs = v96.itemDetailsPeekViewRefs, 
                gridRef = v96.gridRef, 
                gamepadNavigationFocusPos = v96.gamepadNavigationFocusPos, 
                setGamepadNavigationFocusPos = v96.setGamepadNavigationFocusPos, 
                includeBottomDivider = v96.includeBottomDivider, 
                widgetConfiguration = v96.widgetConfiguration, 
                rowWidth = v96.rowWidth, 
                onThumbnailLoaded = v96.onThumbnailLoaded, 
                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v96.selectedCategory else nil, 
                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v96.selectedSubcategory else nil, 
                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v96.selectedCategoryInfo else nil
            });
        end
    };
end;
local function v105(v104) --[[ Line: 318 ]] --[[ Name: selectHydratedWidgetData ]]
    return v104.AvatarExperience.Common.Widgets.HydratedWidgetData;
end;
return function(v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131) --[[ Line: 328 ]] --[[ Name: useRenderInfo ]]
    -- upvalues: v2 (copy), l_useTokens_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_Utils_0 (copy), l_useAvatarRoute_0 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_useNavigation_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v52 (copy), l_useSignalState_0 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), l_useSelector_0 (copy), v86 (copy), l_getUseSelectorDeepEquals_0 (copy), v88 (copy), l_AvatarScreen_0 (copy), l_WidgetConstants_0 (copy), v26 (copy), v84 (copy), l_useWidgetListInfoViewModel_0 (copy), v61 (copy), v82 (copy), v105 (copy), v39 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_WidgetsPercievedTTIManager_0 (copy), v49 (copy), v40 (copy), v37 (copy), v25 (copy), v23 (copy), v42 (copy), v41 (copy), v44 (copy), v24 (copy), v38 (copy), v4 (copy), v34 (copy), v33 (copy), v3 (copy), v20 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v45 (copy), v46 (copy), v21 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v103 (copy), v76 (copy), v28 (copy), v36 (copy), v30 (copy), v29 (copy)
    local v132, v133 = v2.useBinding(1);
    local v134, v135 = v2.useBinding(Vector2.new(1, 1));
    local v136 = l_useTokens_0();
    local v137 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_Utils_0.getUIScaleFromTokens(v136) else if v136 and v136.Config and v136.Config.UI and v136.Config.UI.Scale then v136.Config.UI.Scale else 1;
    local v138 = l_useAvatarRoute_0();
    local v139 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then l_useNavigation_0() else nil;
    local v140 = nil;
    local v141 = nil;
    local v142 = nil;
    local v143 = nil;
    local v144 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v145 = v52.getCatalogSelectionStore();
        v140 = l_useSignalState_0(v145.selectedCategoryId);
        v141 = l_useSignalState_0(v145.selectedSubcategoryId);
        if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then
            v142 = l_useSignalState_0(v145.selectedCategory);
            v143 = l_useSignalState_0(v145.selectedSubcategory);
            v144 = l_useSignalState_0(v145.selectedCategoryInfo);
        end;
    else
        v140 = l_useSelector_0(v86, l_getUseSelectorDeepEquals_0());
        v141 = l_useSelector_0(v88, l_getUseSelectorDeepEquals_0());
    end;
    local v146 = nil;
    if v138 and v138.opaque and v138.opaque.name == l_AvatarScreen_0.MySharedAvatars then
        v146 = l_WidgetConstants_0.ContextWidgets.MySharedAvatars.Context;
    elseif l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v138 and v138.opaque and v138.opaque.name == l_AvatarScreen_0.SearchLandingFocusedWidgetPage then
        local v147 = v139.getParam("widgetType");
        v146 = (l_WidgetConstants_0.ContextWidgets[v147] or {}).Context;
    elseif v140 then
        v146 = v26.getContextForWidgetsById(v138.opaque.name, v140, v141);
    end;
    local v148 = l_useSelector_0(v84, l_getUseSelectorDeepEquals_0())[v109];
    local v149 = v148 and v148.searchKeyword ~= nil;
    local v150 = nil;
    v150 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_useWidgetListInfoViewModel_0(v109, v146, l_Utils_0.getBreakpointFromRowWidth(v130, v137)) else l_useWidgetListInfoViewModel_0(v109, v146, (v61(v130, v137)));
    local l_widgets_0 = v150.widgets;
    local l_configuration_0 = v150.configuration;
    local v153, v154 = v82(l_widgets_0);
    local v155 = l_useSelector_0(v105, l_getUseSelectorDeepEquals_0());
    local v156 = v39({
        hydratedWidgetData = v155, 
        widgetInfoDetails = l_widgets_0, 
        selectedWidgetIndex = 1
    });
    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_WidgetsPercievedTTIManager_0 then
        local v157 = v2.useRef(false);
        local l_v157_0 = v157 --[[ copy: 50 -> 59 ]];
        v2.useEffect(function() --[[ Line: 432 ]]
            -- upvalues: l_v157_0 (copy), v156 (copy), l_WidgetsPercievedTTIManager_0 (ref)
            if l_v157_0.current then
                return;
            elseif not v156 or next(v156) == nil then
                return;
            else
                l_v157_0.current = true;
                l_WidgetsPercievedTTIManager_0.L2.primaryDataReady();
                l_WidgetsPercievedTTIManager_0.L3.responseReceived();
                l_WidgetsPercievedTTIManager_0.L3.requestFetchHydratedWidgets();
                return;
            end;
        end, {
            v156
        });
    end;
    local v159 = v49();
    if v40() then
        local v160 = v156 and next(v156) ~= nil;
        v37(v109, v110, v160);
    end;
    local v161 = l_useSelector_0(v25, l_getUseSelectorDeepEquals_0());
    local v162 = v23(v109, v111, v113);
    local v163 = if v42.isEnabled() then v41.readTestVariable(v42.EnabledForUser) else nil;
    local v164 = nil;
    v164 = if v44 and v42.isEnabled() then v24() else if v163 then v24() else nil;
    local v165 = v2.useRef(false);
    local v166 = v38(v109);
    local v167 = if v165 then v165.current else nil;
    local v172 = v2.useCallback(function(v168) --[[ Line: 473 ]]
        -- upvalues: v165 (copy), v156 (copy), v166 (copy)
        if v165 and not v165.current and v156 and next(v156) ~= nil then
            local v169 = next(v156) and select(2, next(v156));
            if v169 then
                for _, v171 in v169 do
                    if tostring(v171.id) == v168 then
                        v165.current = true;
                        v166.fireTileLoadingLatencyTracker(v166, true, true);
                        return;
                    end;
                end;
            end;
        end;
    end, {
        v156, 
        v166
    });
    return (v2.useMemo(function() --[[ Line: 495 ]]
        -- upvalues: v112 (copy), v107 (ref), l_configuration_0 (ref), v110 (copy), v4 (ref), v34 (ref), v33 (ref), v148 (copy), v3 (ref), v149 (copy), v146 (ref), v161 (copy), v20 (ref), v162 (copy), v154 (copy), v116 (copy), v121 (copy), v2 (ref), v109 (copy), v113 (copy), v120 (copy), v122 (copy), v125 (copy), v124 (copy), v123 (copy), v132 (copy), v133 (copy), v134 (copy), v135 (copy), v153 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), l_widgets_0 (copy), v45 (ref), v136 (copy), v46 (ref), v159 (copy), v26 (ref), v21 (ref), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v106 (copy), v126 (copy), v127 (copy), v128 (copy), v163 (copy), v164 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref), v142 (ref), v143 (ref), v144 (ref), v103 (ref), v108 (copy), v117 (copy), v118 (copy), v130 (copy), v167 (copy), v172 (copy), v76 (ref), v119 (copy), v111 (copy), v28 (ref), v131 (copy), v114 (ref), v36 (ref), v129 (copy), v30 (ref), v29 (ref), v115 (copy)
        local v173 = {};
        for _ = 1, v112 do
            table.insert(v173, {});
        end;
        v107 = if l_configuration_0 and l_configuration_0.defaultItemGroupTemplate then l_configuration_0.defaultItemGroupTemplate.previewColumns or 1 else 1;
        local v175 = v110 or v173;
        local v176 = math.ceil(v4.fieldCount(v175) / v107);
        local v177 = v34(v175, v176, v107);
        local v178 = v33(v175);
        local v179 = v148 and v148.categoryInfo or {};
        local v180 = not v3.isEmpty(v179) and v179.ShowWidgets or v149;
        if v146 and not v149 then
            v180 = true;
        end;
        if v161 > 0 then
            v180 = false;
        end;
        if v149 then
            v180 = v3.isEmpty(v179) or v179.ShowWidgets;
        end;
        local v181 = {};
        local v182 = 1;
        local v183 = 1;
        local v184 = v20(v162);
        local function _() --[[ Line: 554 ]] --[[ Name: maybeReserveWidgetRefCacheIndex ]]
            -- upvalues: v180 (ref), v154 (ref), v183 (ref)
            while v180 and v154 and v154[tostring(v183)] do
                v183 = v183 + 1;
            end;
        end;
        local v186 = v184.getNext();
        if not v116 then
            for v187, v188 in v177 do
                while v186 and v186.row == v182 do
                    local l_component_0 = v186.component;
                    local l_v183_0 = v183;
                    local v191 = v121[l_v183_0 - 1];
                    if l_v183_0 <= 1 then
                        v191 = nil;
                    end;
                    while v180 and v154 and v154[tostring(v183)] do
                        v183 = v183 + 1;
                    end;
                    do
                        local l_v191_0 = v191;
                        v181[v182] = {
                            key = "localWidget_" .. l_v183_0, 
                            render = function() --[[ Line: 578 ]] --[[ Name: render ]]
                                -- upvalues: v2 (ref), l_component_0 (copy), v109 (ref), v113 (ref), v107 (ref), v120 (ref), v122 (ref), v125 (ref), v124 (ref), v123 (ref), l_v191_0 (ref), v121 (ref), l_v183_0 (copy), v132 (ref), v133 (ref), v134 (ref), v135 (ref), l_configuration_0 (ref)
                                return v2.createElement(l_component_0, {
                                    searchUuid = v109, 
                                    fromSearch = v113, 
                                    itemsPerRow = v107, 
                                    itemDetailsPeekViewRefs = v120, 
                                    gridRef = v122, 
                                    scrollingFrameRef = v125(), 
                                    requestImpressionsSignal = v124, 
                                    onFocusGained = v123, 
                                    NextSelectionUp = l_v191_0, 
                                    NextSelectionDown = v121[l_v183_0 + 1], 
                                    ref = v121[l_v183_0], 
                                    rowIndex = l_v183_0, 
                                    gamepadNavigationColumn = v132, 
                                    setGamepadNavigationColumn = v133, 
                                    gamepadNavigationFocusPos = v134, 
                                    setGamepadNavigationFocusPos = v135, 
                                    widgetConfiguration = l_configuration_0
                                });
                            end
                        };
                        v182 = v182 + 1;
                        v183 = v183 + 1;
                        v186 = v184.getNext();
                    end;
                end;
                while v180 and v154 and v154[tostring(v183)] do
                    v183 = v183 + 1;
                end;
                local l_v183_1 = v183;
                local v194 = v153[tostring(v183)];
                if l_FFlagAXLookAndFeelBackgrounds_0 and not v194 then
                    v194 = {
                        template = if l_configuration_0 then l_configuration_0.defaultItemGroupTemplate else {}
                    };
                end;
                if not v180 then
                    v194 = nil;
                end;
                local v195 = if not l_FFlagAXMoveAllTabToWidgetOnly_0 then v194 and l_widgets_0 and l_widgets_0[tostring(v183 + 1)] == nil else nil;
                local v196 = nil;
                if v45() then
                    local v197 = {
                        [32] = v136.Size.Size_800, 
                        [24] = v136.Size.Size_600, 
                        [20] = v136.Size.Size_500, 
                        [16] = v136.Size.Size_400
                    };
                    v196 = if v197[v46()] == nil then v136.Size.Size_800 else v197[v46()];
                end;
                if v113 and v159 and v159.catalogSearchCategory == "Avatars" then
                    local v198, v199 = v26.removeItemFootersFromConfigs(l_configuration_0, v194, false, true, false);
                    l_configuration_0 = v198;
                    v194 = v199;
                end;
                do
                    local l_v194_0, l_v196_0 = v194, v196;
                    v181[v182] = {
                        key = "organicContentRow_" .. l_v183_1, 
                        render = function(v202) --[[ Line: 654 ]] --[[ Name: render ]]
                            -- upvalues: v2 (ref), v21 (ref), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), l_v194_0 (ref), l_configuration_0 (ref), l_FFlagAXLookAndFeelBackgrounds_0 (ref), v109 (ref), v187 (copy), v195 (copy), v45 (ref), l_v196_0 (ref), v136 (ref), v188 (copy), v107 (ref), v106 (ref), v113 (ref), v120 (ref), v122 (ref), v123 (ref), v132 (ref), v133 (ref), v134 (ref), v135 (ref), v121 (ref), l_v183_1 (copy), v126 (ref), v127 (ref), v128 (ref), v163 (ref), v164 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref), v142 (ref), v143 (ref), v144 (ref)
                            return v2.createElement(v21, {
                                template = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if l_v194_0 then l_v194_0.template else if l_configuration_0 then l_configuration_0.defaultItemGroupTemplate else {} else nil, 
                                titleKey = if l_v194_0 then l_v194_0.template.title else nil, 
                                titleText = if l_v194_0 then l_v194_0.template.localizedTitle else nil, 
                                descriptionKey = if l_v194_0 then l_v194_0.template.description else nil, 
                                descriptionText = if l_v194_0 then l_v194_0.template.localizedDescription else nil, 
                                cardStyle = if l_FFlagAXLookAndFeelBackgrounds_0 and l_v194_0 then l_v194_0.template.cardStyle else nil, 
                                searchUuid = v109, 
                                entryRowIndex = v187, 
                                catalogRowIndex = if v202 and v202.index then v202.index - 1 else nil, 
                                padding = if not l_v194_0 or v195 then {
                                    bottom = UDim.new(0, v136.Size.Size_400)
                                } else {
                                    bottom = UDim.new(0, if v45() then l_v196_0 else v136.Size.Size_800)
                                }, 
                                row = v188, 
                                itemsPerRow = v107, 
                                itemSize = v106, 
                                fromSearch = v113, 
                                itemDetailsPeekViewRefs = v120, 
                                gridRef = v122, 
                                onFocusGained = v123, 
                                gamepadNavigationColumn = v132, 
                                setGamepadNavigationColumn = v133, 
                                gamepadNavigationFocusPos = v134, 
                                setGamepadNavigationFocusPos = v135, 
                                NextSelectionUp = v121[l_v183_1 - 1], 
                                NextSelectionDown = v121[l_v183_1 + 1], 
                                ref = v121[l_v183_1], 
                                thumbnailAspectRatio = v126, 
                                thumbnailScaleType = v127, 
                                thumbnailSize = v128, 
                                widgetConfiguration = l_configuration_0, 
                                onThumbnailLoaded = if v163 then v164 else nil, 
                                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil, 
                                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v143 else nil, 
                                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v144 else nil
                            });
                        end
                    };
                    v182 = v182 + 1;
                    v183 = v183 + 1;
                end;
            end;
        end;
        if v180 and v154 then
            local v203 = {};
            if v146 and v154[v146] and v116 == v154[v146].id then
                local v204 = v154[v146];
                table.insert(v181, 1, (v103({
                    key = "widget_" .. v146, 
                    ref = v121[v146], 
                    searchParameters = v148, 
                    organicResultIds = v178, 
                    rowIndex = 1, 
                    widgetInfo = v204, 
                    widgetsPerRow = v108, 
                    itemSize = v106, 
                    widgetRefCache = v121, 
                    focusedWidget = v116, 
                    onWidgetFocusAcquired = v117, 
                    onWidgetFocusReleased = v118, 
                    itemDetailsPeekViewRefs = v120, 
                    gridRef = v122, 
                    gamepadNavigationFocusPos = v134, 
                    setGamepadNavigationFocusPos = v135, 
                    includeBottomDivider = false, 
                    widgetConfiguration = l_configuration_0, 
                    rowWidth = v130, 
                    onThumbnailLoaded = if not v167 then v172 else nil, 
                    selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil, 
                    selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v143 else nil, 
                    selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v144 else nil
                })));
            end;
            for v205, _ in v154 do
                if tonumber(v205) ~= nil then
                    table.insert(v203, (tonumber(v205)));
                end;
            end;
            table.sort(v203);
            local v207 = v76(v203, v181, v154, v116, v176, v119);
            for v208, v209 in v207 do
                local l_rowNum_0 = v209.rowNum;
                local l_widgetInfo_0 = v209.widgetInfo;
                local v212 = false;
                if v208 < #v207 then
                    v212 = v207[v208 + 1].rowNum ~= l_rowNum_0 + 1;
                end;
                local v213 = false;
                if v208 == #v207 then
                    v213 = l_rowNum_0 < #v181;
                end;
                table.insert(v181, l_rowNum_0, (v103({
                    key = "widget_" .. l_rowNum_0, 
                    ref = v121[l_rowNum_0], 
                    nextSelectionUp = v121[l_rowNum_0 - 1], 
                    nextSelectionDown = v121[l_rowNum_0 + 1], 
                    organicResultIds = v178, 
                    searchParameters = v148, 
                    rowIndex = l_rowNum_0, 
                    widgetInfo = l_widgetInfo_0, 
                    widgetsPerRow = v108, 
                    itemSize = v106, 
                    widgetRefCache = v121, 
                    focusedWidget = v116, 
                    onWidgetFocusAcquired = v117, 
                    onWidgetFocusReleased = v118, 
                    itemDetailsPeekViewRefs = v120, 
                    gridRef = v122, 
                    gamepadNavigationFocusPos = v134, 
                    setGamepadNavigationFocusPos = v135, 
                    includeBottomDivider = v212 or v213, 
                    widgetConfiguration = l_configuration_0, 
                    rowWidth = v130, 
                    onThumbnailLoaded = if not v167 then v172 else nil, 
                    selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil, 
                    selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v143 else nil, 
                    selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v144 else nil
                })));
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 and v186 and #v181 >= 11 then
                local l_component_1 = v186.component;
                table.insert(v181, 11, {
                    key = "localWidget_sponsored", 
                    render = function() --[[ Line: 844 ]] --[[ Name: render ]]
                        -- upvalues: v2 (ref), l_component_1 (copy), v109 (ref), v113 (ref), v107 (ref), v120 (ref), v122 (ref), v125 (ref), v124 (ref), v123 (ref), v121 (ref), v132 (ref), v133 (ref), v134 (ref), v135 (ref), l_configuration_0 (ref)
                        return v2.createElement(l_component_1, {
                            searchUuid = v109, 
                            fromSearch = v113, 
                            itemsPerRow = v107, 
                            itemDetailsPeekViewRefs = v120, 
                            gridRef = v122, 
                            scrollingFrameRef = v125(), 
                            requestImpressionsSignal = v124, 
                            onFocusGained = v123, 
                            NextSelectionUp = v121[9], 
                            NextSelectionDown = v121[11], 
                            ref = v121[10], 
                            rowIndex = 10, 
                            gamepadNavigationColumn = v132, 
                            setGamepadNavigationColumn = v133, 
                            gamepadNavigationFocusPos = v134, 
                            setGamepadNavigationFocusPos = v135, 
                            widgetConfiguration = l_configuration_0
                        });
                    end
                });
                v186 = v184.getNext();
            end;
        end;
        if v113 and v111 then
            local v215 = v116 ~= nil;
            local l_v215_0 = v215 --[[ copy: 14 -> 26 ]];
            table.insert(v181, 1, {
                key = "header", 
                render = function() --[[ Line: 876 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v28 (ref), v109 (ref), l_v215_0 (copy), v131 (ref)
                    return v2.createElement(v28, {
                        searchUuid = v109, 
                        hideResultsHeader = l_v215_0, 
                        pillBarVisible = v131
                    });
                end
            });
        else
            v114 = (v114 or 0) + v36.WidgetListVerticalMargin;
        end;
        if v129 then
            local l_v183_2 = v183;
            table.insert(v181, {
                key = "loadMoreButton_" .. l_v183_2, 
                render = function() --[[ Line: 895 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v30 (ref), v129 (ref), v121 (ref), l_v183_2 (copy)
                    return v2.createElement(v30, {
                        onActivated = v129, 
                        ref = v121[l_v183_2], 
                        NextSelectionUp = v121[l_v183_2 - 1]
                    });
                end
            });
        end;
        if v114 then
            table.insert(v181, 1, {
                key = "topSpacer", 
                render = function() --[[ Line: 912 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v29 (ref), v114 (ref)
                    return v2.createElement(v29, {
                        height = v114
                    });
                end
            });
        end;
        if v115 then
            table.insert(v181, {
                key = "bottomSpacer", 
                render = function() --[[ Line: 921 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v29 (ref), v115 (ref)
                    return v2.createElement(v29, {
                        height = v115
                    });
                end
            });
        end;
        return v181;
    end, {
        v106, 
        v107, 
        v108, 
        v109, 
        v110, 
        v111, 
        v112, 
        v113, 
        v114, 
        v115, 
        v116, 
        v117, 
        v118, 
        v119, 
        v120, 
        v121, 
        v122, 
        v123, 
        v124, 
        v125, 
        v154, 
        v148, 
        v149, 
        v126, 
        v127, 
        v128, 
        v146, 
        v129, 
        v136, 
        if v44 and v42.isEnabled() or v163 then v164 else nil, 
        v130
    }));
end;