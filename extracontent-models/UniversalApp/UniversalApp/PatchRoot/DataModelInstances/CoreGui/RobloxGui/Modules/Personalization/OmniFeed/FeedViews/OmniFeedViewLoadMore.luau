local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v7 = require(l_CorePackages_0.Packages.Promise);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useLastInputMode_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMode;
local v12 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedTypes_0 = v12.OmniFeedTypes;
local l_OmniFeedConstants_0 = v12.OmniFeedConstants;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_useAnimateScrollViewToSelection_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection;
local l_ScrollDetector_0 = require(l_CorePackages_0.Workspace.Packages.ScrollTelemetry).ScrollDetector;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_isSduiGameOmniFeedItem_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_FeedItemModel_0 = l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel;
local l_OmniFeedProps_0 = l_Modules_0.Personalization.OmniFeed.OmniFeedProps;
local l_OmniFeedImpressionsDetector_0 = l_Modules_0.Personalization.OmniFeed.OmniFeedImpressionsDetector;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v28 = require(l_Modules_1.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v29 = require(l_Modules_1.Personalization.OmniFeed.OmniFeedItem);
local v30 = require(l_Modules_1.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent);
local v31 = require(l_Modules_1.LuaApp.Constants);
local v32 = require(script.Parent.OmniFeedItemsContainer);
local v33 = require(l_Modules_1.Personalization.Flags.FIntLuaJoinYourFriendsRefreshInterval);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local v35 = require(l_Modules_1.Personalization.Flags.FFlagUpdateDividerStartBounds);
local l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeForAll;
local l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeWithIxp;
local v38 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v38.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v38.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 = v38.FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding;
local l_FFlagLuaAppMigrateToOmniFeedItemsContainer_0 = v38.FFlagLuaAppMigrateToOmniFeedItemsContainer;
local l_FFlagLuaAppChartsStickyHeader_0 = v38.FFlagLuaAppChartsStickyHeader;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v38.FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagUseOmniFeedDividerOverrides_0 = v38.FFlagUseOmniFeedDividerOverrides;
local l_FIntOmniFeedDividerHeightOverride_0 = v38.FIntOmniFeedDividerHeightOverride;
local l_FIntOmniFeedDividerPaddingOverride_0 = v38.FIntOmniFeedDividerPaddingOverride;
local v48 = game:DefineFastInt("LuaAppOmniFeedInitialNumRows", 6);
local v49 = game:DefineFastInt("LuaAppOmniFeedLoadNumRows", 3);
local l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 = v12.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER;
local l_SORT_SELECTION_ORDER_BASE_0 = v12.Constants.SORT_SELECTION_ORDER_BASE;
local function _(v52, v53) --[[ Line: 70 ]] --[[ Name: scaleSizeForPlatform ]]
    return v52 * v53.Global.Stroke_100;
end;
local function _(v55) --[[ Line: 74 ]] --[[ Name: isGridTile ]]
    -- upvalues: l_OmniFeedConstants_0 (copy)
    local v56 = v55.treatmentProps.topicLayoutData and v55.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
    local v57 = true;
    if v56 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
        v57 = v56 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
    end;
    return v57;
end;
local l_FStringLuaAppSortsWithDividers_0 = v38.FStringLuaAppSortsWithDividers;
local l_FFlagLuaAppUseSortsWithDividersFString_0 = v38.FFlagLuaAppUseSortsWithDividersFString;
local v61 = {};
if l_FFlagLuaAppUseSortsWithDividersFString_0 then
    for v62 in l_FStringLuaAppSortsWithDividers_0:gmatch("(%w+)") do
        v61[v62] = true;
    end;
end;
local v63 = game:DefineFastInt("LuaAppOmniFeedScrollAnimDurationMs", 400) / 1000;
local v64 = if l_FFlagLuaAppChartsStickyHeader_0 then {} else nil;
local function _(v65, v66) --[[ Line: 96 ]] --[[ Name: isGameTreatmentType ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v67 = true;
    if v65 ~= l_OmniFeedTypes_0.HomeGameGrid then
        v67 = true;
        if v65 ~= l_OmniFeedTypes_0.Carousel then
            v67 = true;
            if v65 ~= l_OmniFeedTypes_0.SearchGameGrid then
                v67 = l_isSduiGameOmniFeedItem_0(v65, v66);
            end;
        end;
    end;
    return v67;
end;
local function v82(v69, v70, v71, v72) --[[ Line: 106 ]] --[[ Name: getNumItemsForRows ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v73 = 0;
    local v74 = 0;
    for v75 = v70, #v69 do
        local v76 = v69[v75];
        local v77 = v76 and v76.treatmentProps and v76.treatmentProps.numberOfRows or 1;
        if v77 == -1 then
            v77 = 1;
        end;
        v74 = v74 + 1;
        v73 = v73 + v77;
        local v78 = nil;
        if v76 then
            if v76.treatmentProps and v76.treatmentProps.topicId then
                v78 = v76.treatmentProps.topicId;
            elseif v76.itemId and v76.itemId.topicId then
                v78 = v76.itemId.topicId;
            end;
        end;
        if v71 <= v73 then
            return v74;
        elseif v72 then
            local l_treatmentType_0 = v76.treatmentType;
            local l_v78_0 = v78;
            local v81 = true;
            if l_treatmentType_0 ~= l_OmniFeedTypes_0.HomeGameGrid then
                v81 = true;
                if l_treatmentType_0 ~= l_OmniFeedTypes_0.Carousel then
                    v81 = true;
                    if l_treatmentType_0 ~= l_OmniFeedTypes_0.SearchGameGrid then
                        v81 = l_isSduiGameOmniFeedItem_0(l_treatmentType_0, l_v78_0);
                    end;
                end;
            end;
            if v81 then
                break;
            end;
        end;
    end;
    return v74;
end;
return function(v83) --[[ Line: 171 ]]
    -- upvalues: l_useStyle_0 (copy), l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v2 (copy), l_Signal_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useLastInputMode_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v82 (copy), v48 (copy), l_useDesignTokens_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_OmniFeedConstants_0 (copy), v31 (copy), v30 (copy), v33 (copy), v64 (copy), l_FFlagLuaAppMigrateToOmniFeedItemsContainer_0 (copy), l_FFlagUseOmniFeedDividerOverrides_0 (copy), l_FIntOmniFeedDividerPaddingOverride_0 (copy), l_FIntOmniFeedDividerHeightOverride_0 (copy), l_FeedItemModel_0 (copy), l_SORT_SELECTION_ORDER_BASE_0 (copy), l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 (copy), l_OmniFeedProps_0 (copy), v4 (copy), l_OmniFeedTypes_0 (copy), v1 (copy), v29 (copy), l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 (copy), v35 (copy), l_FFlagLuaAppUseSortsWithDividersFString_0 (copy), v61 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_AppPage_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), v63 (copy), v49 (copy), l_DiscoveryAppLaunchTracker_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), v28 (copy), v7 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v32 (copy), l_OmniFeedImpressionsDetector_0 (copy), l_ScrollDetector_0 (copy)
    local v84 = l_useStyle_0();
    local v86 = l_useAppPolicy_0(function(v85) --[[ Line: 173 ]]
        return v85.useGridPageLayout();
    end);
    local v88 = l_useAppPolicy_0(function(v87) --[[ Line: 176 ]]
        return v87.getMountAllOmniFeedItems();
    end);
    local v89 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v86 = v86 and not v89;
    local v90 = v2.useRef(l_Signal_0.new());
    local v91 = v2.useRef(l_Signal_0.new());
    local v92 = v2.useRef(0);
    local v93 = v2.useRef(false);
    local v94 = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else v83.scrollingFrameRef;
    local v95 = l_useLastInputMode_0() == "Cursor";
    local v96 = v83.shouldStopAfterOneGameSort and not v88;
    local v97 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v98 = nil;
        v94 = v2.useRef(nil);
        local v99 = nil;
        local v100, v101 = v2.useState(nil);
        v99 = v100;
        v98 = v101;
        if type(v83.scrollingFrameRef) == "table" then
            v94 = v83.scrollingFrameRef;
        end;
        do
            local l_v98_0 = v98;
            v97 = v2.useCallback(function(v103) --[[ Line: 204 ]]
                -- upvalues: v94 (ref), l_v98_0 (ref), v83 (copy)
                v94.current = v103;
                l_v98_0(v103);
                if type(v83.scrollingFrameRef) == "function" then
                    v83.scrollingFrameRef(v103);
                end;
            end, {
                v83.scrollingFrameRef
            });
        end;
    end;
    local v108 = if l_FFlagLuaAppChartsStickyHeader_0 then v2.useMemo(function() --[[ Line: 214 ]]
        -- upvalues: v83 (copy)
        local l_omniFeedItems_0 = v83.omniFeedItems;
        local v105 = {};
        for _, v107 in l_omniFeedItems_0 do
            if v107.pageSection == v83.omniFeedPageSection then
                table.insert(v105, v107);
            end;
        end;
        return v105;
    end, {
        v83.omniFeedItems, 
        v83.omniFeedPageSection
    }) else nil;
    local v109, v110 = v2.useState(function() --[[ Line: 226 ]]
        -- upvalues: v88 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v108 (copy), v83 (copy), v82 (ref), v48 (ref), v96 (copy)
        if v88 then
            return #if l_FFlagLuaAppChartsStickyHeader_0 then v108 else v83.omniFeedItems;
        else
            return (v82(if l_FFlagLuaAppChartsStickyHeader_0 then v108 else v83.omniFeedItems, 1, v48, v96));
        end;
    end);
    local l_pageContext_0 = v83.pageContext;
    local l_impressionsTag_0 = v83.impressionsTag;
    local l_omniFeedItems_1 = v83.omniFeedItems;
    local l_Theme_0 = v84.Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local l_Color_1 = l_Theme_0.BackgroundContrast.Color;
    local v118 = nil;
    v118 = v86 and 4 or 0;
    local v119 = l_useDesignTokens_0();
    l_Color_0 = v119.LuaApps.App.Page.BackgroundColor;
    l_Transparency_0 = v119.LuaApps.App.Page.BackgroundTransparency;
    local v120 = v2.useMemo(function() --[[ Line: 257 ]]
        -- upvalues: v119 (copy), v86 (ref)
        return v119.LuaApps.HomeOmniFeed.getLayoutSpacing(v86);
    end, l_dependencyArray_0(v86, v119));
    local v121 = v83.topPadding or v120.topMargin;
    local v122 = if v83.loadMoreButtonText then v119.Global.Size_600 else 80;
    local v123 = v83.bottomPadding or v122;
    local v125 = l_useSelector_0(function(v124) --[[ Line: 265 ]]
        return v124.Personalization.OmniItemsGlobalLayoutData;
    end);
    local v126 = v125 and (v125[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == "true" or v125[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == true);
    local v129 = v2.useCallback(function(v127) --[[ Line: 274 ]]
        -- upvalues: v92 (copy), v91 (copy), l_OmniFeedConstants_0 (ref), v83 (copy)
        v92.current = tick();
        v91.current:fire();
        local v128 = nil;
        v128 = if v127 then l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.FriendPresenceChange else l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.ManualRefresh;
        return v83.refresh(v128);
    end);
    local function _() --[[ Line: 285 ]]
        -- upvalues: v93 (copy), v94 (ref), v31 (ref), v129 (copy)
        v93.current = false;
        if v94.current then
            local l_Y_0 = v94.current.CanvasPosition.Y;
            local l_Height_0 = v31.JoinYourFriendsTile.Height;
            if l_Y_0 >= 0 and l_Y_0 <= l_Height_0 then
                v129(true);
            end;
        end;
    end;
    v2.useEffect(function() --[[ Line: 295 ]]
        -- upvalues: v126 (copy), v30 (ref), v93 (copy), v92 (copy), v33 (ref), v94 (ref), v31 (ref), v129 (copy)
        local v133 = nil;
        if v126 then
            v133 = v30.Event:Connect(function() --[[ Line: 298 ]]
                -- upvalues: v93 (ref), v92 (ref), v33 (ref), v94 (ref), v31 (ref), v129 (ref)
                if v93.current then
                    return;
                else
                    local v134 = tick() - v92.current;
                    local v135 = v33 - v134;
                    if v135 < 0 then
                        v93.current = false;
                        if v94.current then
                            local l_Y_1 = v94.current.CanvasPosition.Y;
                            local l_Height_1 = v31.JoinYourFriendsTile.Height;
                            if l_Y_1 >= 0 and l_Y_1 <= l_Height_1 then
                                v129(true);
                                return;
                            end;
                        end;
                    else
                        v93.current = true;
                        task.delay(v135, function() --[[ Line: 309 ]]
                            -- upvalues: v93 (ref), v94 (ref), v31 (ref), v129 (ref)
                            v93.current = false;
                            if v94.current then
                                local l_Y_2 = v94.current.CanvasPosition.Y;
                                local l_Height_2 = v31.JoinYourFriendsTile.Height;
                                if l_Y_2 >= 0 and l_Y_2 <= l_Height_2 then
                                    v129(true);
                                end;
                            end;
                        end);
                    end;
                    return;
                end;
            end);
        end;
        return function() --[[ Line: 315 ]]
            -- upvalues: v133 (ref)
            if v133 then
                v133:Disconnect();
                v133 = nil;
            end;
        end;
    end, {
        v83.refresh
    });
    local v141 = l_useSelector_0(function(v140) --[[ Line: 323 ]]
        -- upvalues: l_pageContext_0 (copy)
        return v140.OmniRecommendations[l_pageContext_0];
    end);
    local v142 = v141 and v141.sorts or if l_FFlagLuaAppChartsStickyHeader_0 then v64 else {};
    local l_sduiContext_0 = v83.sduiContext;
    local v167 = if l_FFlagLuaAppMigrateToOmniFeedItemsContainer_0 then nil else v2.useMemo(function() --[[ Line: 353 ]]
        -- upvalues: v2 (ref), v120 (copy), l_FFlagUseOmniFeedDividerOverrides_0 (ref), l_FIntOmniFeedDividerPaddingOverride_0 (ref), v119 (copy), l_FIntOmniFeedDividerHeightOverride_0 (ref), l_omniFeedItems_1 (copy), v109 (copy), l_FeedItemModel_0 (ref), l_SORT_SELECTION_ORDER_BASE_0 (ref), l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 (ref), l_OmniFeedProps_0 (ref), v90 (copy), v91 (copy), l_pageContext_0 (copy), v94 (ref), l_sduiContext_0 (copy), v83 (copy), v4 (ref), l_OmniFeedTypes_0 (ref), v142 (copy), v1 (ref), v29 (ref), l_impressionsTag_0 (copy), l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 (ref), v35 (ref), v89 (copy), l_FFlagLuaAppUseSortsWithDividersFString_0 (ref), v61 (ref), l_isSubjectToDesktopPolicies_0 (ref), l_OmniFeedConstants_0 (ref), l_AppPage_0 (ref), l_Color_1 (copy), v121 (copy), v123 (copy)
        local v144 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        local v145 = 1;
        local l_layoutPadding_0 = v120.layoutPadding;
        local v147 = v120.layoutPadding / 2;
        if l_FFlagUseOmniFeedDividerOverrides_0 then
            if l_FIntOmniFeedDividerPaddingOverride_0 >= 0 then
                l_layoutPadding_0 = l_FIntOmniFeedDividerPaddingOverride_0 * v119.Global.Stroke_100;
            end;
            if l_FIntOmniFeedDividerHeightOverride_0 >= 0 then
                v147 = l_FIntOmniFeedDividerHeightOverride_0 * v119.Global.Stroke_100;
            end;
        end;
        local v148 = 1;
        for v149, v150 in ipairs(l_omniFeedItems_1) do
            if v109 >= v149 then
                local v151 = v150.treatmentProps or {};
                local v152 = l_FeedItemModel_0.getUniqueNameForAnalytics(v150);
                local v153 = l_SORT_SELECTION_ORDER_BASE_0 + v149 * l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0;
                local v154 = l_OmniFeedProps_0.new(v149, v148, v90.current, v91.current, l_pageContext_0, v94, l_sduiContext_0, v153, v83.defaultContainerSize);
                v151 = v4.Dictionary.join({
                    [l_OmniFeedProps_0.key] = v154
                }, v151);
                if v148 then
                    local v155 = l_FeedItemModel_0.getNumberOfRows(v150);
                    if not v155 then
                        v148 = nil;
                    else
                        v148 = v148 + v155;
                    end;
                end;
                local v156 = v149 > 1;
                local v157 = v156 and v150.treatmentType == l_OmniFeedTypes_0.UpsellCard;
                local v158 = if v150.itemId then v150.itemId.sortIndex else nil;
                local v159 = if v158 then v142[v158] else nil;
                if v159 and (not v159.topic or v159.topic == "") then
                    v156 = false;
                end;
                if v156 then
                    v144["feedPaddingTop_" .. tostring(v149)] = v1.createElement("Frame", {
                        Size = if v157 then UDim2.new(1, 0, 0, v119.Global.Space_150) else UDim2.new(1, 0, 0, l_layoutPadding_0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v145
                    });
                    v145 = v145 + 1;
                end;
                v144["feedItem_" .. tostring(v149)] = v2.createElement(v29, {
                    omniFeedItemType = v150.treatmentType, 
                    layoutOrder = v145, 
                    feedItemNameId = v152, 
                    itemProps = v151, 
                    itemIndex = v149, 
                    impressionsTag = l_impressionsTag_0, 
                    zIndex = v109 - v149
                });
                v145 = v145 + 1;
                if not l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 then
                    local v160 = nil;
                    local v161 = false;
                    if (v35 and 0 or v89 and 0 or 1) < v149 and v149 < #l_omniFeedItems_1 then
                        local v162 = l_omniFeedItems_1[v149 - 1];
                        local v163 = l_omniFeedItems_1[v149];
                        local v164 = l_omniFeedItems_1[v149 + 1];
                        if l_FFlagLuaAppUseSortsWithDividersFString_0 and (v163.itemId and v163.itemId.topicId and v61[v163.itemId.topicId] or v164.itemId and v164.itemId.topicId and v61[v164.itemId.topicId]) then
                            v161 = true;
                        end;
                        if v150.treatmentType == l_OmniFeedTypes_0.HomeGameGrid and v164.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid or v150.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid and v162 and v162.treatmentType == l_OmniFeedTypes_0.HomeGameGrid and v164.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                            v161 = true;
                        elseif v89 then
                            v160 = true;
                        elseif l_isSubjectToDesktopPolicies_0() then
                            local v165 = false;
                            if v150.treatmentType == l_OmniFeedTypes_0.Carousel then
                                v165 = false;
                                if v164.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                                    local v166 = v150.treatmentProps.topicLayoutData and v150.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                                    v165 = true;
                                    if v166 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                                        v165 = v166 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
                                    end;
                                    if v165 then
                                        v166 = v164.treatmentProps.topicLayoutData and v164.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                                        v165 = true;
                                        if v166 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                                            v165 = v166 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
                                        end;
                                    end;
                                end;
                            end;
                            v160 = v165;
                        end;
                    end;
                    if l_pageContext_0 == l_AppPage_0.SearchPage and v149 < #l_omniFeedItems_1 then
                        v161 = true;
                    end;
                    if v161 or v160 then
                        v144["feedPaddingBottom_" .. tostring(v149)] = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, l_layoutPadding_0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v145
                        });
                        v145 = v145 + 1;
                    end;
                    if v161 then
                        v144["feedDivider_" .. tostring(v149)] = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v147), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = l_Color_1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v145
                        });
                        v145 = v145 + 1;
                    end;
                end;
                if v149 == v109 and v83.hasNextPage then
                    v144["loadingBlank_" .. tostring(v149)] = v1.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 10), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v145
                    });
                    v145 = v145 + 1;
                end;
            else
                break;
            end;
        end;
        v144.Padding = v2.createElement(v2.Fragment, nil, {
            PaddingTop = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v121), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }), 
            PaddingBottom = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v123), 
                BackgroundTransparency = 1, 
                LayoutOrder = v145
            })
        });
        return v144;
    end, l_dependencyArray_0(l_omniFeedItems_1, v142, v109, v94, l_sduiContext_0));
    l_useAnimateScrollViewToSelection_0(v94, v63);
    local v168 = v2.useCallback(function() --[[ Line: 557 ]]
        -- upvalues: v90 (copy)
        v90.current:fire();
    end);
    local v169 = nil;
    v169 = function() --[[ Line: 562 ]]
        -- upvalues: v109 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v108 (copy), l_omniFeedItems_1 (copy), v88 (copy), v82 (ref), v49 (ref), v96 (copy), v110 (copy)
        if v109 < #if l_FFlagLuaAppChartsStickyHeader_0 then v108 else l_omniFeedItems_1 then
            local v170 = nil;
            v170 = if v88 then #if l_FFlagLuaAppChartsStickyHeader_0 then v108 else l_omniFeedItems_1 else v109 + v82(if l_FFlagLuaAppChartsStickyHeader_0 then v108 else l_omniFeedItems_1, v109 + 1, v49, v96);
            v110(v170);
            return true;
        else
            return false;
        end;
    end;
    v2.useEffect(function() --[[ Line: 586 ]]
        -- upvalues: v96 (copy), v169 (ref)
        if not v96 then
            v169();
        end;
    end, {
        l_omniFeedItems_1, 
        v96
    });
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackFeedRender();
        l_DiscoveryAppLaunchTracker_0.default:trackNumFeedItems(v109);
    end;
    local v171 = if l_FFlagLuaAppMigrateToOmniFeedItemsContainer_0 then nil else if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v83.enableRelativeGui and "RelativeGui" or "Frame" else "Frame";
    return v1.createElement(v28, {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        ScrollBarThickness = if v83.scrollBarThickness then v83.scrollBarThickness else v118, 
        onLoadMore = function() --[[ Line: 613 ]] --[[ Name: onLoadMore ]]
            -- upvalues: v169 (ref), v7 (ref), v83 (copy)
            if v169() then
                return v7.reject();
            else
                local l_loadNext_0 = v83.loadNext;
                if l_loadNext_0 then
                    return l_loadNext_0();
                else
                    return v7.resolve();
                end;
            end;
        end, 
        refresh = v129, 
        parentAppPage = l_pageContext_0, 
        onAbsoluteSizeChangedCallback = v83.onAbsoluteSizeChanged, 
        onCanvasSizeChangedCallback = v168, 
        onCanvasPositionChangedCallback = v168, 
        useAutomaticSizeContentFrame = true, 
        [v1.Ref] = if l_FFlagLuaAppLayoutParamsInContext_0 then v97 else v94, 
        createEndOfScrollElement = v83.createEndOfScrollElement, 
        onScrollDirectionChanged = v83.onScrollDirectionChanged, 
        ScrollingEnabled = v95, 
        onAbsoluteContentSizeChanged = if l_FFlagSearchOmniAutocompletePage_0 then v83.onAbsoluteContentSizeChanged else nil, 
        loadMoreButtonText = if v83.loadMoreButtonText and v83.hasNextPage and v83.loadNext ~= nil then v83.loadMoreButtonText else nil, 
        canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v83.canvasTopPadding else nil, 
        shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
            left = false, 
            top = false, 
            right = true, 
            bottom = true
        } else nil
    }, {
        OmniFeed = if l_FFlagLuaAppMigrateToOmniFeedItemsContainer_0 then v2.createElement(v32, {
            omniFeedItems = l_omniFeedItems_1, 
            pageContext = l_pageContext_0, 
            sduiContext = l_sduiContext_0, 
            impressionsTag = l_impressionsTag_0, 
            numberOfItemsToBeRendered = v109, 
            topMargin = v121, 
            bottomMargin = v123, 
            layoutPadding = v120.layoutPadding, 
            onItemsUpdatedSignalRef = v90, 
            refreshSignalRef = v91, 
            scrollingFrameRef = v94, 
            defaultContainerSize = v83.defaultContainerSize, 
            sortsData = v142, 
            hasNextPage = v83.hasNextPage, 
            omniFeedPageSection = v83.omniFeedPageSection, 
            enableRelativeGui = v83.enableRelativeGui
        }) else v2.createElement(v171, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v167), 
        OmniFeedImpressionsDetector = v2.createElement(l_OmniFeedImpressionsDetector_0, {
            onItemsUpdatedSignal = v90.current, 
            impressionsTag = l_impressionsTag_0, 
            omniFeedItems = l_omniFeedItems_1, 
            eventContext = v83.analyticsContext
        }), 
        ScrollDetector = if v83.sendScrollEvent then v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v94, 
            sendScrollEvent = v83.sendScrollEvent
        }) else nil
    });
end;