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
local v31 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
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
local function v59(v56, v57) --[[ Line: 143 ]] --[[ Name: getBreakpointFromRowWidth ]]
    -- upvalues: l_WidgetListBreakPointEnum_0 (copy)
    local v58 = v57 or 1;
    if not v56 then
        return l_WidgetListBreakPointEnum_0.Default;
    elseif v56 <= 330 * v58 then
        return l_WidgetListBreakPointEnum_0.XSmall;
    elseif v56 <= 570 * v58 then
        return l_WidgetListBreakPointEnum_0.Small;
    elseif v56 <= 654 * v58 then
        return l_WidgetListBreakPointEnum_0.Medium;
    elseif v56 <= 884 * v58 then
        return l_WidgetListBreakPointEnum_0.Large;
    elseif v56 <= 1116 * v58 then
        return l_WidgetListBreakPointEnum_0.XLarge;
    else
        return l_WidgetListBreakPointEnum_0.X2Large;
    end;
end;
local function _(v60) --[[ Line: 155 ]] --[[ Name: getUIScaleFromTokens ]]
    if v60 and v60.Config and v60.Config.UI and v60.Config.UI.Scale then
        return v60.Config.UI.Scale;
    else
        return 1;
    end;
end;
local function v74(v62, v63, v64, v65, v66, v67) --[[ Line: 162 ]] --[[ Name: getRowInfoToInsertWidgets ]]
    -- upvalues: v4 (copy)
    local v68 = {};
    local v69 = v4.fieldCount(v63);
    for _, v71 in v62 do
        local v72 = v64[tostring(v71)];
        if (not v65 or v72.id == v65) and (v71 <= v66 or not v67) then
            local v73 = v69 + #v68;
            if v73 < v71 then
                v71 = v73 + 1;
            end;
            table.insert(v68, {
                rowNum = v71, 
                widgetInfo = v72
            });
        end;
    end;
    return v68;
end;
local function v80(v75) --[[ Line: 201 ]] --[[ Name: separateOrganicContentTemplatesFromWidgets ]]
    -- upvalues: v31 (copy)
    local v76 = {};
    local v77 = {};
    for v78, v79 in v75 do
        if v79.type == v31.Types.OrganicContent then
            v76[v78] = v79;
        else
            v77[v78] = v79;
        end;
    end;
    return v76, v77;
end;
local function v82(v81) --[[ Line: 217 ]] --[[ Name: selectSearchesParameters ]]
    return v81.SearchesParameters;
end;
local function v84(v83) --[[ Line: 221 ]] --[[ Name: selectCategoryId ]]
    return v83.AvatarExperience.Catalog.Categories.categoryId;
end;
local function v86(v85) --[[ Line: 225 ]] --[[ Name: selectSubcategoryId ]]
    return v85.AvatarExperience.Catalog.Categories.subcategoryId;
end;
local function v93(v87, v88, v89, v90, v91, v92) --[[ Line: 229 ]] --[[ Name: constructWidgetAnalyticsInfo ]]
    -- upvalues: v35 (copy)
    return {
        requestId = if v87 then v87.requestId else nil, 
        widgetPosition = v88, 
        widgetId = if v87 then v87.id else nil, 
        widgetType = if v87 then v87.type else nil, 
        widgetAbsPosition = (v88 - 1) * v91, 
        query = if v89 then v89.searchKeyword else nil, 
        organicResultIds = v90, 
        widgetItemIds = v35(v87, v91), 
        handleThumbnailsLoaded = v92
    };
end;
local function v101(v94) --[[ Line: 250 ]] --[[ Name: constructWidgetRenderInfo ]]
    -- upvalues: v93 (copy), v2 (copy), v22 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy)
    local v95 = nil;
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    v95 = function() --[[ Line: 252 ]]
        -- upvalues: v94 (copy)
        if v94.onWidgetFocusAcquired then
            v94.onWidgetFocusAcquired(v94.widgetInfo);
        end;
    end;
    v96 = v94.focusedWidget and v94.widgetInfo.id == v94.focusedWidget;
    v97 = v94.widgetInfo.template.previewColumns;
    v98 = v94.widgetInfo.template.previewRows;
    v99 = v93(v94.widgetInfo, v94.rowIndex, v94.searchParameters, v94.organicResultIds, v97);
    return {
        key = v94.key, 
        render = function(_) --[[ Line: 272 ]]
            -- upvalues: v2 (ref), v22 (ref), v94 (copy), v97 (ref), v98 (ref), v99 (ref), v96 (ref), v95 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref)
            return v2.createElement(v22, {
                widgetRow = v94.rowIndex, 
                widgetInfo = v94.widgetInfo, 
                itemsPerRow = v97, 
                rowCount = v98, 
                rowHeight = v94.itemSize.Y, 
                itemSize = v94.itemSize, 
                ref = v94.ref, 
                NextSelectionUp = v94.nextSelectionUp, 
                NextSelectionDown = v94.nextSelectionDown, 
                widgetAnalyticsInfo = v99, 
                widgetFocused = v96, 
                requestWidgetAcquireFocus = v95, 
                requestWidgetReleaseFocus = v94.onWidgetFocusReleased, 
                itemDetailsPeekViewRefs = v94.itemDetailsPeekViewRefs, 
                gridRef = v94.gridRef, 
                gamepadNavigationFocusPos = v94.gamepadNavigationFocusPos, 
                setGamepadNavigationFocusPos = v94.setGamepadNavigationFocusPos, 
                includeBottomDivider = v94.includeBottomDivider, 
                widgetConfiguration = v94.widgetConfiguration, 
                rowWidth = v94.rowWidth, 
                onThumbnailLoaded = v94.onThumbnailLoaded, 
                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v94.selectedCategory else nil, 
                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v94.selectedSubcategory else nil, 
                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v94.selectedCategoryInfo else nil
            });
        end
    };
end;
local function v103(v102) --[[ Line: 314 ]] --[[ Name: selectHydratedWidgetData ]]
    return v102.AvatarExperience.Common.Widgets.HydratedWidgetData;
end;
return function(v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129) --[[ Line: 324 ]] --[[ Name: useRenderInfo ]]
    -- upvalues: v2 (copy), l_useTokens_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_Utils_0 (copy), l_useAvatarRoute_0 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_useNavigation_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v52 (copy), l_useSignalState_0 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), l_useSelector_0 (copy), v84 (copy), l_getUseSelectorDeepEquals_0 (copy), v86 (copy), l_AvatarScreen_0 (copy), v31 (copy), v26 (copy), v82 (copy), l_useWidgetListInfoViewModel_0 (copy), v59 (copy), v80 (copy), v103 (copy), v39 (copy), v49 (copy), v40 (copy), v37 (copy), v25 (copy), v23 (copy), v42 (copy), v41 (copy), v44 (copy), v24 (copy), v38 (copy), v4 (copy), v34 (copy), v33 (copy), v3 (copy), v20 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v45 (copy), v46 (copy), v21 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v101 (copy), v74 (copy), v28 (copy), v36 (copy), v30 (copy), v29 (copy)
    local v130, v131 = v2.useBinding(1);
    local v132, v133 = v2.useBinding(Vector2.new(1, 1));
    local v134 = l_useTokens_0();
    local v135 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_Utils_0.getUIScaleFromTokens(v134) else if v134 and v134.Config and v134.Config.UI and v134.Config.UI.Scale then v134.Config.UI.Scale else 1;
    local v136 = l_useAvatarRoute_0();
    local v137 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then l_useNavigation_0() else nil;
    local v138 = nil;
    local v139 = nil;
    local v140 = nil;
    local v141 = nil;
    local v142 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v143 = v52.getCatalogSelectionStore();
        v138 = l_useSignalState_0(v143.selectedCategoryId);
        v139 = l_useSignalState_0(v143.selectedSubcategoryId);
        if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then
            v140 = l_useSignalState_0(v143.selectedCategory);
            v141 = l_useSignalState_0(v143.selectedSubcategory);
            v142 = l_useSignalState_0(v143.selectedCategoryInfo);
        end;
    else
        v138 = l_useSelector_0(v84, l_getUseSelectorDeepEquals_0());
        v139 = l_useSelector_0(v86, l_getUseSelectorDeepEquals_0());
    end;
    local v144 = nil;
    if v136 and v136.opaque and v136.opaque.name == l_AvatarScreen_0.MySharedAvatars then
        v144 = v31.ContextWidgets.MySharedAvatars.Context;
    elseif l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v136 and v136.opaque and v136.opaque.name == l_AvatarScreen_0.SearchLandingFocusedWidgetPage then
        local v145 = v137.getParam("widgetType");
        v144 = (v31.ContextWidgets[v145] or {}).Context;
    elseif v138 then
        v144 = v26.getContextForWidgetsById(v136.opaque.name, v138, v139);
    end;
    local v146 = l_useSelector_0(v82, l_getUseSelectorDeepEquals_0())[v107];
    local v147 = v146 and v146.searchKeyword ~= nil;
    local v148 = nil;
    v148 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_useWidgetListInfoViewModel_0(v107, v144, l_Utils_0.getBreakpointFromRowWidth(v128, v135)) else l_useWidgetListInfoViewModel_0(v107, v144, (v59(v128, v135)));
    local l_widgets_0 = v148.widgets;
    local l_configuration_0 = v148.configuration;
    local v151, v152 = v80(l_widgets_0);
    local v153 = l_useSelector_0(v103, l_getUseSelectorDeepEquals_0());
    local v154 = v39({
        hydratedWidgetData = v153, 
        widgetInfoDetails = l_widgets_0, 
        selectedWidgetIndex = 1
    });
    local v155 = v49();
    if v40() then
        local v156 = v154 and next(v154) ~= nil;
        v37(v107, v108, v156);
    end;
    local v157 = l_useSelector_0(v25, l_getUseSelectorDeepEquals_0());
    local v158 = v23(v107, v109, v111);
    local v159 = if v42.isEnabled() then v41.readTestVariable(v42.EnabledForUser) else nil;
    local v160 = nil;
    v160 = if v44 and v42.isEnabled() then v24() else if v159 then v24() else nil;
    local v161 = v2.useRef(false);
    local v162 = v38(v107);
    local v163 = if v161 then v161.current else nil;
    local v168 = v2.useCallback(function(v164) --[[ Line: 451 ]]
        -- upvalues: v161 (copy), v154 (copy), v162 (copy)
        if v161 and not v161.current and v154 and next(v154) ~= nil then
            local v165 = next(v154) and select(2, next(v154));
            if v165 then
                for _, v167 in v165 do
                    if tostring(v167.id) == v164 then
                        v161.current = true;
                        v162.fireTileLoadingLatencyTracker(v162, true, true);
                        return;
                    end;
                end;
            end;
        end;
    end, {
        v154, 
        v162
    });
    return (v2.useMemo(function() --[[ Line: 473 ]]
        -- upvalues: v110 (copy), v105 (ref), l_configuration_0 (ref), v108 (copy), v4 (ref), v34 (ref), v33 (ref), v146 (copy), v3 (ref), v147 (copy), v144 (ref), v157 (copy), v20 (ref), v158 (copy), v152 (copy), v114 (copy), v119 (copy), v2 (ref), v107 (copy), v111 (copy), v118 (copy), v120 (copy), v123 (copy), v122 (copy), v121 (copy), v130 (copy), v131 (copy), v132 (copy), v133 (copy), v151 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), l_widgets_0 (copy), v45 (ref), v134 (copy), v46 (ref), v155 (copy), v26 (ref), v21 (ref), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v104 (copy), v124 (copy), v125 (copy), v126 (copy), v159 (copy), v160 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref), v140 (ref), v141 (ref), v142 (ref), v101 (ref), v106 (copy), v115 (copy), v116 (copy), v128 (copy), v163 (copy), v168 (copy), v74 (ref), v117 (copy), v109 (copy), v28 (ref), v129 (copy), v112 (ref), v36 (ref), v127 (copy), v30 (ref), v29 (ref), v113 (copy)
        local v169 = {};
        for _ = 1, v110 do
            table.insert(v169, {});
        end;
        v105 = if l_configuration_0 and l_configuration_0.defaultItemGroupTemplate then l_configuration_0.defaultItemGroupTemplate.previewColumns or 1 else 1;
        local v171 = v108 or v169;
        local v172 = math.ceil(v4.fieldCount(v171) / v105);
        local v173 = v34(v171, v172, v105);
        local v174 = v33(v171);
        local v175 = v146 and v146.categoryInfo or {};
        local v176 = not v3.isEmpty(v175) and v175.ShowWidgets or v147;
        if v144 and not v147 then
            v176 = true;
        end;
        if v157 > 0 then
            v176 = false;
        end;
        if v147 then
            v176 = v3.isEmpty(v175) or v175.ShowWidgets;
        end;
        local v177 = {};
        local v178 = 1;
        local v179 = 1;
        local v180 = v20(v158);
        local function _() --[[ Line: 532 ]] --[[ Name: maybeReserveWidgetRefCacheIndex ]]
            -- upvalues: v176 (ref), v152 (ref), v179 (ref)
            while v176 and v152 and v152[tostring(v179)] do
                v179 = v179 + 1;
            end;
        end;
        local v182 = v180.getNext();
        if not v114 then
            for v183, v184 in v173 do
                while v182 and v182.row == v178 do
                    local l_component_0 = v182.component;
                    local l_v179_0 = v179;
                    local v187 = v119[l_v179_0 - 1];
                    if l_v179_0 <= 1 then
                        v187 = nil;
                    end;
                    while v176 and v152 and v152[tostring(v179)] do
                        v179 = v179 + 1;
                    end;
                    do
                        local l_v187_0 = v187;
                        v177[v178] = {
                            key = "localWidget_" .. l_v179_0, 
                            render = function() --[[ Line: 556 ]] --[[ Name: render ]]
                                -- upvalues: v2 (ref), l_component_0 (copy), v107 (ref), v111 (ref), v105 (ref), v118 (ref), v120 (ref), v123 (ref), v122 (ref), v121 (ref), l_v187_0 (ref), v119 (ref), l_v179_0 (copy), v130 (ref), v131 (ref), v132 (ref), v133 (ref), l_configuration_0 (ref)
                                return v2.createElement(l_component_0, {
                                    searchUuid = v107, 
                                    fromSearch = v111, 
                                    itemsPerRow = v105, 
                                    itemDetailsPeekViewRefs = v118, 
                                    gridRef = v120, 
                                    scrollingFrameRef = v123(), 
                                    requestImpressionsSignal = v122, 
                                    onFocusGained = v121, 
                                    NextSelectionUp = l_v187_0, 
                                    NextSelectionDown = v119[l_v179_0 + 1], 
                                    ref = v119[l_v179_0], 
                                    rowIndex = l_v179_0, 
                                    gamepadNavigationColumn = v130, 
                                    setGamepadNavigationColumn = v131, 
                                    gamepadNavigationFocusPos = v132, 
                                    setGamepadNavigationFocusPos = v133, 
                                    widgetConfiguration = l_configuration_0
                                });
                            end
                        };
                        v178 = v178 + 1;
                        v179 = v179 + 1;
                        v182 = v180.getNext();
                    end;
                end;
                while v176 and v152 and v152[tostring(v179)] do
                    v179 = v179 + 1;
                end;
                local l_v179_1 = v179;
                local v190 = v151[tostring(v179)];
                if l_FFlagAXLookAndFeelBackgrounds_0 and not v190 then
                    v190 = {
                        template = if l_configuration_0 then l_configuration_0.defaultItemGroupTemplate else {}
                    };
                end;
                if not v176 then
                    v190 = nil;
                end;
                local v191 = if not l_FFlagAXMoveAllTabToWidgetOnly_0 then v190 and l_widgets_0 and l_widgets_0[tostring(v179 + 1)] == nil else nil;
                local v192 = nil;
                if v45() then
                    local v193 = {
                        [32] = v134.Size.Size_800, 
                        [24] = v134.Size.Size_600, 
                        [20] = v134.Size.Size_500, 
                        [16] = v134.Size.Size_400
                    };
                    v192 = if v193[v46()] == nil then v134.Size.Size_800 else v193[v46()];
                end;
                if v111 and v155 and v155.catalogSearchCategory == "Avatars" then
                    local v194, v195 = v26.removeItemFootersFromConfigs(l_configuration_0, v190, false, true, false);
                    l_configuration_0 = v194;
                    v190 = v195;
                end;
                do
                    local l_v190_0, l_v192_0 = v190, v192;
                    v177[v178] = {
                        key = "organicContentRow_" .. l_v179_1, 
                        render = function(v198) --[[ Line: 632 ]] --[[ Name: render ]]
                            -- upvalues: v2 (ref), v21 (ref), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), l_v190_0 (ref), l_configuration_0 (ref), l_FFlagAXLookAndFeelBackgrounds_0 (ref), v107 (ref), v183 (copy), v191 (copy), v45 (ref), l_v192_0 (ref), v134 (ref), v184 (copy), v105 (ref), v104 (ref), v111 (ref), v118 (ref), v120 (ref), v121 (ref), v130 (ref), v131 (ref), v132 (ref), v133 (ref), v119 (ref), l_v179_1 (copy), v124 (ref), v125 (ref), v126 (ref), v159 (ref), v160 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref), v140 (ref), v141 (ref), v142 (ref)
                            return v2.createElement(v21, {
                                template = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if l_v190_0 then l_v190_0.template else if l_configuration_0 then l_configuration_0.defaultItemGroupTemplate else {} else nil, 
                                titleKey = if l_v190_0 then l_v190_0.template.title else nil, 
                                titleText = if l_v190_0 then l_v190_0.template.localizedTitle else nil, 
                                descriptionKey = if l_v190_0 then l_v190_0.template.description else nil, 
                                descriptionText = if l_v190_0 then l_v190_0.template.localizedDescription else nil, 
                                cardStyle = if l_FFlagAXLookAndFeelBackgrounds_0 and l_v190_0 then l_v190_0.template.cardStyle else nil, 
                                searchUuid = v107, 
                                entryRowIndex = v183, 
                                catalogRowIndex = if v198 and v198.index then v198.index - 1 else nil, 
                                padding = if not l_v190_0 or v191 then {
                                    bottom = UDim.new(0, v134.Size.Size_400)
                                } else {
                                    bottom = UDim.new(0, if v45() then l_v192_0 else v134.Size.Size_800)
                                }, 
                                row = v184, 
                                itemsPerRow = v105, 
                                itemSize = v104, 
                                fromSearch = v111, 
                                itemDetailsPeekViewRefs = v118, 
                                gridRef = v120, 
                                onFocusGained = v121, 
                                gamepadNavigationColumn = v130, 
                                setGamepadNavigationColumn = v131, 
                                gamepadNavigationFocusPos = v132, 
                                setGamepadNavigationFocusPos = v133, 
                                NextSelectionUp = v119[l_v179_1 - 1], 
                                NextSelectionDown = v119[l_v179_1 + 1], 
                                ref = v119[l_v179_1], 
                                thumbnailAspectRatio = v124, 
                                thumbnailScaleType = v125, 
                                thumbnailSize = v126, 
                                widgetConfiguration = l_configuration_0, 
                                onThumbnailLoaded = if v159 then v160 else nil, 
                                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v140 else nil, 
                                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v141 else nil, 
                                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil
                            });
                        end
                    };
                    v178 = v178 + 1;
                    v179 = v179 + 1;
                end;
            end;
        end;
        if v176 and v152 then
            local v199 = {};
            if v144 and v152[v144] and v114 == v152[v144].id then
                local v200 = v152[v144];
                table.insert(v177, 1, (v101({
                    key = "widget_" .. v144, 
                    ref = v119[v144], 
                    searchParameters = v146, 
                    organicResultIds = v174, 
                    rowIndex = 1, 
                    widgetInfo = v200, 
                    widgetsPerRow = v106, 
                    itemSize = v104, 
                    widgetRefCache = v119, 
                    focusedWidget = v114, 
                    onWidgetFocusAcquired = v115, 
                    onWidgetFocusReleased = v116, 
                    itemDetailsPeekViewRefs = v118, 
                    gridRef = v120, 
                    gamepadNavigationFocusPos = v132, 
                    setGamepadNavigationFocusPos = v133, 
                    includeBottomDivider = false, 
                    widgetConfiguration = l_configuration_0, 
                    rowWidth = v128, 
                    onThumbnailLoaded = if not v163 then v168 else nil, 
                    selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v140 else nil, 
                    selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v141 else nil, 
                    selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil
                })));
            end;
            for v201, _ in v152 do
                if tonumber(v201) ~= nil then
                    table.insert(v199, (tonumber(v201)));
                end;
            end;
            table.sort(v199);
            local v203 = v74(v199, v177, v152, v114, v172, v117);
            for v204, v205 in v203 do
                local l_rowNum_0 = v205.rowNum;
                local l_widgetInfo_0 = v205.widgetInfo;
                local v208 = false;
                if v204 < #v203 then
                    v208 = v203[v204 + 1].rowNum ~= l_rowNum_0 + 1;
                end;
                local v209 = false;
                if v204 == #v203 then
                    v209 = l_rowNum_0 < #v177;
                end;
                table.insert(v177, l_rowNum_0, (v101({
                    key = "widget_" .. l_rowNum_0, 
                    ref = v119[l_rowNum_0], 
                    nextSelectionUp = v119[l_rowNum_0 - 1], 
                    nextSelectionDown = v119[l_rowNum_0 + 1], 
                    organicResultIds = v174, 
                    searchParameters = v146, 
                    rowIndex = l_rowNum_0, 
                    widgetInfo = l_widgetInfo_0, 
                    widgetsPerRow = v106, 
                    itemSize = v104, 
                    widgetRefCache = v119, 
                    focusedWidget = v114, 
                    onWidgetFocusAcquired = v115, 
                    onWidgetFocusReleased = v116, 
                    itemDetailsPeekViewRefs = v118, 
                    gridRef = v120, 
                    gamepadNavigationFocusPos = v132, 
                    setGamepadNavigationFocusPos = v133, 
                    includeBottomDivider = v208 or v209, 
                    widgetConfiguration = l_configuration_0, 
                    rowWidth = v128, 
                    onThumbnailLoaded = if not v163 then v168 else nil, 
                    selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v140 else nil, 
                    selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v141 else nil, 
                    selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil
                })));
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 and v182 and #v177 >= 11 then
                local l_component_1 = v182.component;
                table.insert(v177, 11, {
                    key = "localWidget_sponsored", 
                    render = function() --[[ Line: 822 ]] --[[ Name: render ]]
                        -- upvalues: v2 (ref), l_component_1 (copy), v107 (ref), v111 (ref), v105 (ref), v118 (ref), v120 (ref), v123 (ref), v122 (ref), v121 (ref), v119 (ref), v130 (ref), v131 (ref), v132 (ref), v133 (ref), l_configuration_0 (ref)
                        return v2.createElement(l_component_1, {
                            searchUuid = v107, 
                            fromSearch = v111, 
                            itemsPerRow = v105, 
                            itemDetailsPeekViewRefs = v118, 
                            gridRef = v120, 
                            scrollingFrameRef = v123(), 
                            requestImpressionsSignal = v122, 
                            onFocusGained = v121, 
                            NextSelectionUp = v119[9], 
                            NextSelectionDown = v119[11], 
                            ref = v119[10], 
                            rowIndex = 10, 
                            gamepadNavigationColumn = v130, 
                            setGamepadNavigationColumn = v131, 
                            gamepadNavigationFocusPos = v132, 
                            setGamepadNavigationFocusPos = v133, 
                            widgetConfiguration = l_configuration_0
                        });
                    end
                });
                v182 = v180.getNext();
            end;
        end;
        if v111 and v109 then
            local v211 = v114 ~= nil;
            local l_v211_0 = v211 --[[ copy: 14 -> 26 ]];
            table.insert(v177, 1, {
                key = "header", 
                render = function() --[[ Line: 854 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v28 (ref), v107 (ref), l_v211_0 (copy), v129 (ref)
                    return v2.createElement(v28, {
                        searchUuid = v107, 
                        hideResultsHeader = l_v211_0, 
                        pillBarVisible = v129
                    });
                end
            });
        else
            v112 = (v112 or 0) + v36.WidgetListVerticalMargin;
        end;
        if v127 then
            local l_v179_2 = v179;
            table.insert(v177, {
                key = "loadMoreButton_" .. l_v179_2, 
                render = function() --[[ Line: 873 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v30 (ref), v127 (ref), v119 (ref), l_v179_2 (copy)
                    return v2.createElement(v30, {
                        onActivated = v127, 
                        ref = v119[l_v179_2], 
                        NextSelectionUp = v119[l_v179_2 - 1]
                    });
                end
            });
        end;
        if v112 then
            table.insert(v177, 1, {
                key = "topSpacer", 
                render = function() --[[ Line: 890 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v29 (ref), v112 (ref)
                    return v2.createElement(v29, {
                        height = v112
                    });
                end
            });
        end;
        if v113 then
            table.insert(v177, {
                key = "bottomSpacer", 
                render = function() --[[ Line: 899 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v29 (ref), v113 (ref)
                    return v2.createElement(v29, {
                        height = v113
                    });
                end
            });
        end;
        return v177;
    end, {
        v104, 
        v105, 
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
        v152, 
        v146, 
        v147, 
        v124, 
        v125, 
        v126, 
        v144, 
        v127, 
        v134, 
        if v44 and v42.isEnabled() or v159 then v160 else nil, 
        v128
    }));
end;