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
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableWidgetsTTI);
local v42 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v43 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v10.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v45 = game:DefineFastFlag("AXUseRendererInfoConditionalHookBacktraceError", false);
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableDecreaseWidgetPaddingSizing);
local v47 = require(l_Modules_0.AvatarExperience.Flags.GetFIntWidgetPaddingSizing);
local l_Utils_0 = v13.Utils;
local l_getUseSelectorDeepEquals_0 = v19.Utils.getUseSelectorDeepEquals;
local v50 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames);
local l_FFlagAXCatalogCategoriesStore_0 = v16.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v16.FFlagAXCatalogCategoriesStoreImprovePerf;
local v53 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v16.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v16.FFlagAXMoveAllTabToWidgetOnly;
local function v60(v57, v58) --[[ Line: 144 ]] --[[ Name: getBreakpointFromRowWidth ]]
    -- upvalues: l_WidgetListBreakPointEnum_0 (copy)
    local v59 = v58 or 1;
    if not v57 then
        return l_WidgetListBreakPointEnum_0.Default;
    elseif v57 <= 330 * v59 then
        return l_WidgetListBreakPointEnum_0.XSmall;
    elseif v57 <= 570 * v59 then
        return l_WidgetListBreakPointEnum_0.Small;
    elseif v57 <= 654 * v59 then
        return l_WidgetListBreakPointEnum_0.Medium;
    elseif v57 <= 884 * v59 then
        return l_WidgetListBreakPointEnum_0.Large;
    elseif v57 <= 1116 * v59 then
        return l_WidgetListBreakPointEnum_0.XLarge;
    else
        return l_WidgetListBreakPointEnum_0.X2Large;
    end;
end;
local function _(v61) --[[ Line: 156 ]] --[[ Name: getUIScaleFromTokens ]]
    if v61 and v61.Config and v61.Config.UI and v61.Config.UI.Scale then
        return v61.Config.UI.Scale;
    else
        return 1;
    end;
end;
local function v75(v63, v64, v65, v66, v67, v68) --[[ Line: 163 ]] --[[ Name: getRowInfoToInsertWidgets ]]
    -- upvalues: v4 (copy)
    local v69 = {};
    local v70 = v4.fieldCount(v64);
    for _, v72 in v63 do
        local v73 = v65[tostring(v72)];
        if (not v66 or v73.id == v66) and (v72 <= v67 or not v68) then
            local v74 = v70 + #v69;
            if v74 < v72 then
                v72 = v74 + 1;
            end;
            table.insert(v69, {
                rowNum = v72, 
                widgetInfo = v73
            });
        end;
    end;
    return v69;
end;
local function v81(v76) --[[ Line: 202 ]] --[[ Name: separateOrganicContentTemplatesFromWidgets ]]
    -- upvalues: v31 (copy)
    local v77 = {};
    local v78 = {};
    for v79, v80 in v76 do
        if v80.type == v31.Types.OrganicContent then
            v77[v79] = v80;
        else
            v78[v79] = v80;
        end;
    end;
    return v77, v78;
end;
local function v83(v82) --[[ Line: 218 ]] --[[ Name: selectSearchesParameters ]]
    return v82.SearchesParameters;
end;
local function v85(v84) --[[ Line: 222 ]] --[[ Name: selectCategoryId ]]
    return v84.AvatarExperience.Catalog.Categories.categoryId;
end;
local function v87(v86) --[[ Line: 226 ]] --[[ Name: selectSubcategoryId ]]
    return v86.AvatarExperience.Catalog.Categories.subcategoryId;
end;
local function v94(v88, v89, v90, v91, v92, v93) --[[ Line: 230 ]] --[[ Name: constructWidgetAnalyticsInfo ]]
    -- upvalues: v35 (copy)
    return {
        requestId = if v88 then v88.requestId else nil, 
        widgetPosition = v89, 
        widgetId = if v88 then v88.id else nil, 
        widgetType = if v88 then v88.type else nil, 
        widgetAbsPosition = (v89 - 1) * v92, 
        query = if v90 then v90.searchKeyword else nil, 
        organicResultIds = v91, 
        widgetItemIds = v35(v88, v92), 
        handleThumbnailsLoaded = v93
    };
end;
local function v102(v95) --[[ Line: 251 ]] --[[ Name: constructWidgetRenderInfo ]]
    -- upvalues: v94 (copy), v2 (copy), v22 (copy), v41 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy)
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    v96 = function() --[[ Line: 253 ]]
        -- upvalues: v95 (copy)
        if v95.onWidgetFocusAcquired then
            v95.onWidgetFocusAcquired(v95.widgetInfo);
        end;
    end;
    v97 = v95.focusedWidget and v95.widgetInfo.id == v95.focusedWidget;
    v98 = v95.widgetInfo.template.previewColumns;
    v99 = v95.widgetInfo.template.previewRows;
    v100 = v94(v95.widgetInfo, v95.rowIndex, v95.searchParameters, v95.organicResultIds, v98);
    return {
        key = v95.key, 
        render = function(_) --[[ Line: 273 ]]
            -- upvalues: v2 (ref), v22 (ref), v95 (copy), v98 (ref), v99 (ref), v100 (ref), v97 (ref), v96 (ref), v41 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref)
            return v2.createElement(v22, {
                widgetRow = v95.rowIndex, 
                widgetInfo = v95.widgetInfo, 
                itemsPerRow = v98, 
                rowCount = v99, 
                rowHeight = v95.itemSize.Y, 
                itemSize = v95.itemSize, 
                ref = v95.ref, 
                NextSelectionUp = v95.nextSelectionUp, 
                NextSelectionDown = v95.nextSelectionDown, 
                widgetAnalyticsInfo = v100, 
                widgetFocused = v97, 
                requestWidgetAcquireFocus = v96, 
                requestWidgetReleaseFocus = v95.onWidgetFocusReleased, 
                itemDetailsPeekViewRefs = v95.itemDetailsPeekViewRefs, 
                gridRef = v95.gridRef, 
                gamepadNavigationFocusPos = v95.gamepadNavigationFocusPos, 
                setGamepadNavigationFocusPos = v95.setGamepadNavigationFocusPos, 
                includeBottomDivider = v95.includeBottomDivider, 
                widgetConfiguration = v95.widgetConfiguration, 
                rowWidth = v95.rowWidth, 
                onThumbnailLoaded = if v41() then v95.onThumbnailLoaded else nil, 
                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v95.selectedCategory else nil, 
                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v95.selectedSubcategory else nil, 
                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v95.selectedCategoryInfo else nil
            });
        end
    };
end;
local function v104(v103) --[[ Line: 315 ]] --[[ Name: selectHydratedWidgetData ]]
    return v103.AvatarExperience.Common.Widgets.HydratedWidgetData;
end;
return function(v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130) --[[ Line: 325 ]] --[[ Name: useRenderInfo ]]
    -- upvalues: v2 (copy), l_useTokens_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_Utils_0 (copy), l_useAvatarRoute_0 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_useNavigation_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v53 (copy), l_useSignalState_0 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), l_useSelector_0 (copy), v85 (copy), l_getUseSelectorDeepEquals_0 (copy), v87 (copy), l_AvatarScreen_0 (copy), v31 (copy), v26 (copy), v83 (copy), l_useWidgetListInfoViewModel_0 (copy), v60 (copy), v81 (copy), v41 (copy), v104 (copy), v39 (copy), v50 (copy), v40 (copy), v37 (copy), v25 (copy), v23 (copy), v43 (copy), v42 (copy), v45 (copy), v24 (copy), v38 (copy), v4 (copy), v34 (copy), v33 (copy), v3 (copy), v20 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v46 (copy), v47 (copy), v21 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v102 (copy), v75 (copy), v28 (copy), v36 (copy), v30 (copy), v29 (copy)
    local v131, v132 = v2.useBinding(1);
    local v133, v134 = v2.useBinding(Vector2.new(1, 1));
    local v135 = l_useTokens_0();
    local v136 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_Utils_0.getUIScaleFromTokens(v135) else if v135 and v135.Config and v135.Config.UI and v135.Config.UI.Scale then v135.Config.UI.Scale else 1;
    local v137 = l_useAvatarRoute_0();
    local v138 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then l_useNavigation_0() else nil;
    local v139 = nil;
    local v140 = nil;
    local v141 = nil;
    local v142 = nil;
    local v143 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v144 = v53.getCatalogSelectionStore();
        v139 = l_useSignalState_0(v144.selectedCategoryId);
        v140 = l_useSignalState_0(v144.selectedSubcategoryId);
        if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then
            v141 = l_useSignalState_0(v144.selectedCategory);
            v142 = l_useSignalState_0(v144.selectedSubcategory);
            v143 = l_useSignalState_0(v144.selectedCategoryInfo);
        end;
    else
        v139 = l_useSelector_0(v85, l_getUseSelectorDeepEquals_0());
        v140 = l_useSelector_0(v87, l_getUseSelectorDeepEquals_0());
    end;
    local v145 = nil;
    if v137 and v137.opaque and v137.opaque.name == l_AvatarScreen_0.MySharedAvatars then
        v145 = v31.ContextWidgets.MySharedAvatars.Context;
    elseif l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v137 and v137.opaque and v137.opaque.name == l_AvatarScreen_0.SearchLandingFocusedWidgetPage then
        local v146 = v138.getParam("widgetType");
        v145 = (v31.ContextWidgets[v146] or {}).Context;
    elseif v139 then
        v145 = v26.getContextForWidgetsById(v137.opaque.name, v139, v140);
    end;
    local v147 = l_useSelector_0(v83, l_getUseSelectorDeepEquals_0())[v108];
    local v148 = v147 and v147.searchKeyword ~= nil;
    local v149 = nil;
    v149 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_useWidgetListInfoViewModel_0(v108, v145, l_Utils_0.getBreakpointFromRowWidth(v129, v136)) else l_useWidgetListInfoViewModel_0(v108, v145, (v60(v129, v136)));
    local l_widgets_0 = v149.widgets;
    local l_configuration_0 = v149.configuration;
    local v152, v153 = v81(l_widgets_0);
    local v154 = if v41() then l_useSelector_0(v104, l_getUseSelectorDeepEquals_0()) else nil;
    local v155 = if v41() then v39({
        hydratedWidgetData = v154, 
        widgetInfoDetails = l_widgets_0, 
        selectedWidgetIndex = 1
    }) else nil;
    local v156 = v50();
    if v40() then
        local v157 = v41() and v155 and next(v155) ~= nil;
        v37(v108, v109, v157);
    end;
    local v158 = l_useSelector_0(v25, l_getUseSelectorDeepEquals_0());
    local v159 = v23(v108, v110, v112);
    local v160 = if v43.isEnabled() then v42.readTestVariable(v43.EnabledForUser) else nil;
    local v161 = nil;
    v161 = if v45 and v43.isEnabled() then v24() else if v160 then v24() else nil;
    local v162 = if v41() then v2.useRef(false) else nil;
    local v163 = if v41() then v38(v108) else nil;
    local v164 = if v41() and v162 then v162.current else nil;
    local v169 = if v41() then v2.useCallback(function(v165) --[[ Line: 463 ]]
        -- upvalues: v162 (copy), v155 (copy), v163 (copy)
        if v162 and not v162.current and v155 and next(v155) ~= nil then
            local v166 = next(v155) and select(2, next(v155));
            if v166 then
                for _, v168 in v166 do
                    if tostring(v168.id) == v165 then
                        v162.current = true;
                        v163.fireTileLoadingLatencyTracker(v163, true, true);
                        return;
                    end;
                end;
            end;
        end;
    end, {
        v155, 
        v163
    }) else nil;
    return (v2.useMemo(function() --[[ Line: 486 ]]
        -- upvalues: v111 (copy), v106 (ref), l_configuration_0 (ref), v109 (copy), v4 (ref), v34 (ref), v33 (ref), v147 (copy), v3 (ref), v148 (copy), v145 (ref), v158 (copy), v20 (ref), v159 (copy), v153 (copy), v115 (copy), v120 (copy), v2 (ref), v108 (copy), v112 (copy), v119 (copy), v121 (copy), v124 (copy), v123 (copy), v122 (copy), v131 (copy), v132 (copy), v133 (copy), v134 (copy), v152 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), l_widgets_0 (copy), v46 (ref), v135 (copy), v47 (ref), v156 (copy), v26 (ref), v21 (ref), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v105 (copy), v125 (copy), v126 (copy), v127 (copy), v160 (copy), v161 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref), v141 (ref), v142 (ref), v143 (ref), v102 (ref), v107 (copy), v116 (copy), v117 (copy), v129 (copy), v41 (ref), v164 (copy), v169 (copy), v75 (ref), v118 (copy), v110 (copy), v28 (ref), v130 (copy), v113 (ref), v36 (ref), v128 (copy), v30 (ref), v29 (ref), v114 (copy)
        local v170 = {};
        for _ = 1, v111 do
            table.insert(v170, {});
        end;
        v106 = if l_configuration_0 and l_configuration_0.defaultItemGroupTemplate then l_configuration_0.defaultItemGroupTemplate.previewColumns or 1 else 1;
        local v172 = v109 or v170;
        local v173 = math.ceil(v4.fieldCount(v172) / v106);
        local v174 = v34(v172, v173, v106);
        local v175 = v33(v172);
        local v176 = v147 and v147.categoryInfo or {};
        local v177 = not v3.isEmpty(v176) and v176.ShowWidgets or v148;
        if v145 and not v148 then
            v177 = true;
        end;
        if v158 > 0 then
            v177 = false;
        end;
        if v148 then
            v177 = v3.isEmpty(v176) or v176.ShowWidgets;
        end;
        local v178 = {};
        local v179 = 1;
        local v180 = 1;
        local v181 = v20(v159);
        local function _() --[[ Line: 545 ]] --[[ Name: maybeReserveWidgetRefCacheIndex ]]
            -- upvalues: v177 (ref), v153 (ref), v180 (ref)
            while v177 and v153 and v153[tostring(v180)] do
                v180 = v180 + 1;
            end;
        end;
        local v183 = v181.getNext();
        if not v115 then
            for v184, v185 in v174 do
                while v183 and v183.row == v179 do
                    local l_component_0 = v183.component;
                    local l_v180_0 = v180;
                    local v188 = v120[l_v180_0 - 1];
                    if l_v180_0 <= 1 then
                        v188 = nil;
                    end;
                    while v177 and v153 and v153[tostring(v180)] do
                        v180 = v180 + 1;
                    end;
                    do
                        local l_v188_0 = v188;
                        v178[v179] = {
                            key = "localWidget_" .. l_v180_0, 
                            render = function() --[[ Line: 569 ]] --[[ Name: render ]]
                                -- upvalues: v2 (ref), l_component_0 (copy), v108 (ref), v112 (ref), v106 (ref), v119 (ref), v121 (ref), v124 (ref), v123 (ref), v122 (ref), l_v188_0 (ref), v120 (ref), l_v180_0 (copy), v131 (ref), v132 (ref), v133 (ref), v134 (ref), l_configuration_0 (ref)
                                return v2.createElement(l_component_0, {
                                    searchUuid = v108, 
                                    fromSearch = v112, 
                                    itemsPerRow = v106, 
                                    itemDetailsPeekViewRefs = v119, 
                                    gridRef = v121, 
                                    scrollingFrameRef = v124(), 
                                    requestImpressionsSignal = v123, 
                                    onFocusGained = v122, 
                                    NextSelectionUp = l_v188_0, 
                                    NextSelectionDown = v120[l_v180_0 + 1], 
                                    ref = v120[l_v180_0], 
                                    rowIndex = l_v180_0, 
                                    gamepadNavigationColumn = v131, 
                                    setGamepadNavigationColumn = v132, 
                                    gamepadNavigationFocusPos = v133, 
                                    setGamepadNavigationFocusPos = v134, 
                                    widgetConfiguration = l_configuration_0
                                });
                            end
                        };
                        v179 = v179 + 1;
                        v180 = v180 + 1;
                        v183 = v181.getNext();
                    end;
                end;
                while v177 and v153 and v153[tostring(v180)] do
                    v180 = v180 + 1;
                end;
                local l_v180_1 = v180;
                local v191 = v152[tostring(v180)];
                if l_FFlagAXLookAndFeelBackgrounds_0 and not v191 then
                    v191 = {
                        template = if l_configuration_0 then l_configuration_0.defaultItemGroupTemplate else {}
                    };
                end;
                if not v177 then
                    v191 = nil;
                end;
                local v192 = if not l_FFlagAXMoveAllTabToWidgetOnly_0 then v191 and l_widgets_0 and l_widgets_0[tostring(v180 + 1)] == nil else nil;
                local v193 = nil;
                if v46() then
                    local v194 = {
                        [32] = v135.Size.Size_800, 
                        [24] = v135.Size.Size_600, 
                        [20] = v135.Size.Size_500, 
                        [16] = v135.Size.Size_400
                    };
                    v193 = if v194[v47()] == nil then v135.Size.Size_800 else v194[v47()];
                end;
                if v112 and v156 and v156.catalogSearchCategory == "Avatars" then
                    local v195, v196 = v26.removeItemFootersFromConfigs(l_configuration_0, v191, false, true, false);
                    l_configuration_0 = v195;
                    v191 = v196;
                end;
                do
                    local l_v191_0, l_v193_0 = v191, v193;
                    v178[v179] = {
                        key = "organicContentRow_" .. l_v180_1, 
                        render = function(v199) --[[ Line: 645 ]] --[[ Name: render ]]
                            -- upvalues: v2 (ref), v21 (ref), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), l_v191_0 (ref), l_configuration_0 (ref), l_FFlagAXLookAndFeelBackgrounds_0 (ref), v108 (ref), v184 (copy), v192 (copy), v46 (ref), l_v193_0 (ref), v135 (ref), v185 (copy), v106 (ref), v105 (ref), v112 (ref), v119 (ref), v121 (ref), v122 (ref), v131 (ref), v132 (ref), v133 (ref), v134 (ref), v120 (ref), l_v180_1 (copy), v125 (ref), v126 (ref), v127 (ref), v160 (ref), v161 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref), v141 (ref), v142 (ref), v143 (ref)
                            return v2.createElement(v21, {
                                template = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if l_v191_0 then l_v191_0.template else if l_configuration_0 then l_configuration_0.defaultItemGroupTemplate else {} else nil, 
                                titleKey = if l_v191_0 then l_v191_0.template.title else nil, 
                                titleText = if l_v191_0 then l_v191_0.template.localizedTitle else nil, 
                                descriptionKey = if l_v191_0 then l_v191_0.template.description else nil, 
                                descriptionText = if l_v191_0 then l_v191_0.template.localizedDescription else nil, 
                                cardStyle = if l_FFlagAXLookAndFeelBackgrounds_0 and l_v191_0 then l_v191_0.template.cardStyle else nil, 
                                searchUuid = v108, 
                                entryRowIndex = v184, 
                                catalogRowIndex = if v199 and v199.index then v199.index - 1 else nil, 
                                padding = if not l_v191_0 or v192 then {
                                    bottom = UDim.new(0, v135.Size.Size_400)
                                } else {
                                    bottom = UDim.new(0, if v46() then l_v193_0 else v135.Size.Size_800)
                                }, 
                                row = v185, 
                                itemsPerRow = v106, 
                                itemSize = v105, 
                                fromSearch = v112, 
                                itemDetailsPeekViewRefs = v119, 
                                gridRef = v121, 
                                onFocusGained = v122, 
                                gamepadNavigationColumn = v131, 
                                setGamepadNavigationColumn = v132, 
                                gamepadNavigationFocusPos = v133, 
                                setGamepadNavigationFocusPos = v134, 
                                NextSelectionUp = v120[l_v180_1 - 1], 
                                NextSelectionDown = v120[l_v180_1 + 1], 
                                ref = v120[l_v180_1], 
                                thumbnailAspectRatio = v125, 
                                thumbnailScaleType = v126, 
                                thumbnailSize = v127, 
                                widgetConfiguration = l_configuration_0, 
                                onThumbnailLoaded = if v160 then v161 else nil, 
                                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v141 else nil, 
                                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil, 
                                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v143 else nil
                            });
                        end
                    };
                    v179 = v179 + 1;
                    v180 = v180 + 1;
                end;
            end;
        end;
        if v177 and v153 then
            local v200 = {};
            if v145 and v153[v145] and v115 == v153[v145].id then
                local v201 = v153[v145];
                table.insert(v178, 1, (v102({
                    key = "widget_" .. v145, 
                    ref = v120[v145], 
                    searchParameters = v147, 
                    organicResultIds = v175, 
                    rowIndex = 1, 
                    widgetInfo = v201, 
                    widgetsPerRow = v107, 
                    itemSize = v105, 
                    widgetRefCache = v120, 
                    focusedWidget = v115, 
                    onWidgetFocusAcquired = v116, 
                    onWidgetFocusReleased = v117, 
                    itemDetailsPeekViewRefs = v119, 
                    gridRef = v121, 
                    gamepadNavigationFocusPos = v133, 
                    setGamepadNavigationFocusPos = v134, 
                    includeBottomDivider = false, 
                    widgetConfiguration = l_configuration_0, 
                    rowWidth = v129, 
                    onThumbnailLoaded = if not v41() or v164 then nil else v169, 
                    selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v141 else nil, 
                    selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil, 
                    selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v143 else nil
                })));
            end;
            for v202, _ in v153 do
                if tonumber(v202) ~= nil then
                    table.insert(v200, (tonumber(v202)));
                end;
            end;
            table.sort(v200);
            local v204 = v75(v200, v178, v153, v115, v173, v118);
            for v205, v206 in v204 do
                local l_rowNum_0 = v206.rowNum;
                local l_widgetInfo_0 = v206.widgetInfo;
                local v209 = false;
                if v205 < #v204 then
                    v209 = v204[v205 + 1].rowNum ~= l_rowNum_0 + 1;
                end;
                local v210 = false;
                if v205 == #v204 then
                    v210 = l_rowNum_0 < #v178;
                end;
                table.insert(v178, l_rowNum_0, (v102({
                    key = "widget_" .. l_rowNum_0, 
                    ref = v120[l_rowNum_0], 
                    nextSelectionUp = v120[l_rowNum_0 - 1], 
                    nextSelectionDown = v120[l_rowNum_0 + 1], 
                    organicResultIds = v175, 
                    searchParameters = v147, 
                    rowIndex = l_rowNum_0, 
                    widgetInfo = l_widgetInfo_0, 
                    widgetsPerRow = v107, 
                    itemSize = v105, 
                    widgetRefCache = v120, 
                    focusedWidget = v115, 
                    onWidgetFocusAcquired = v116, 
                    onWidgetFocusReleased = v117, 
                    itemDetailsPeekViewRefs = v119, 
                    gridRef = v121, 
                    gamepadNavigationFocusPos = v133, 
                    setGamepadNavigationFocusPos = v134, 
                    includeBottomDivider = v209 or v210, 
                    widgetConfiguration = l_configuration_0, 
                    rowWidth = v129, 
                    onThumbnailLoaded = if not v41() or v164 then nil else v169, 
                    selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v141 else nil, 
                    selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v142 else nil, 
                    selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v143 else nil
                })));
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 and v183 and #v178 >= 11 then
                local l_component_1 = v183.component;
                table.insert(v178, 11, {
                    key = "localWidget_sponsored", 
                    render = function() --[[ Line: 839 ]] --[[ Name: render ]]
                        -- upvalues: v2 (ref), l_component_1 (copy), v108 (ref), v112 (ref), v106 (ref), v119 (ref), v121 (ref), v124 (ref), v123 (ref), v122 (ref), v120 (ref), v131 (ref), v132 (ref), v133 (ref), v134 (ref), l_configuration_0 (ref)
                        return v2.createElement(l_component_1, {
                            searchUuid = v108, 
                            fromSearch = v112, 
                            itemsPerRow = v106, 
                            itemDetailsPeekViewRefs = v119, 
                            gridRef = v121, 
                            scrollingFrameRef = v124(), 
                            requestImpressionsSignal = v123, 
                            onFocusGained = v122, 
                            NextSelectionUp = v120[9], 
                            NextSelectionDown = v120[11], 
                            ref = v120[10], 
                            rowIndex = 10, 
                            gamepadNavigationColumn = v131, 
                            setGamepadNavigationColumn = v132, 
                            gamepadNavigationFocusPos = v133, 
                            setGamepadNavigationFocusPos = v134, 
                            widgetConfiguration = l_configuration_0
                        });
                    end
                });
                v183 = v181.getNext();
            end;
        end;
        if v112 and v110 then
            local v212 = v115 ~= nil;
            local l_v212_0 = v212 --[[ copy: 14 -> 26 ]];
            table.insert(v178, 1, {
                key = "header", 
                render = function() --[[ Line: 871 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v28 (ref), v108 (ref), l_v212_0 (copy), v130 (ref)
                    return v2.createElement(v28, {
                        searchUuid = v108, 
                        hideResultsHeader = l_v212_0, 
                        pillBarVisible = v130
                    });
                end
            });
        else
            v113 = (v113 or 0) + v36.WidgetListVerticalMargin;
        end;
        if v128 then
            local l_v180_2 = v180;
            table.insert(v178, {
                key = "loadMoreButton_" .. l_v180_2, 
                render = function() --[[ Line: 890 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v30 (ref), v128 (ref), v120 (ref), l_v180_2 (copy)
                    return v2.createElement(v30, {
                        onActivated = v128, 
                        ref = v120[l_v180_2], 
                        NextSelectionUp = v120[l_v180_2 - 1]
                    });
                end
            });
        end;
        if v113 then
            table.insert(v178, 1, {
                key = "topSpacer", 
                render = function() --[[ Line: 907 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v29 (ref), v113 (ref)
                    return v2.createElement(v29, {
                        height = v113
                    });
                end
            });
        end;
        if v114 then
            table.insert(v178, {
                key = "bottomSpacer", 
                render = function() --[[ Line: 916 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v29 (ref), v114 (ref)
                    return v2.createElement(v29, {
                        height = v114
                    });
                end
            });
        end;
        return v178;
    end, {
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
        v124, 
        v153, 
        v147, 
        v148, 
        v125, 
        v126, 
        v127, 
        v145, 
        v128, 
        v135, 
        if v45 and v43.isEnabled() or v160 then v161 else nil, 
        v129
    }));
end;