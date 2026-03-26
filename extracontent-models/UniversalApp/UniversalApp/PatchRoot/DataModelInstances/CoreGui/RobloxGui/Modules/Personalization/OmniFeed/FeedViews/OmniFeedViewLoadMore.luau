local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v6 = require(l_CorePackages_0.Packages.Promise);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useLastInputMode_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMode;
local v10 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedTypes_0 = v10.OmniFeedTypes;
local l_OmniFeedConstants_0 = v10.OmniFeedConstants;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_useAnimateScrollViewToSelection_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection;
local l_ScrollDetector_0 = require(l_CorePackages_0.Workspace.Packages.ScrollTelemetry).ScrollDetector;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_isSduiGameOmniFeedItem_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem;
local l_OmniFeedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v22 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v23 = require(l_Modules_0.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent);
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(script.Parent.OmniFeedItemsContainer);
local v26 = require(l_Modules_0.Personalization.Flags.FIntLuaJoinYourFriendsRefreshInterval);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v28.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v28.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppChartsStickyHeader_0 = v28.FFlagLuaAppChartsStickyHeader;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v28.FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagLuaAppCompositionSupport_0 = v28.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v28.FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = v28.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v36 = game:DefineFastInt("LuaAppOmniFeedInitialNumRows", 6);
local v37 = game:DefineFastInt("LuaAppOmniFeedLoadNumRows", 3);
local l_FStringLuaAppSortsWithDividers_0 = v28.FStringLuaAppSortsWithDividers;
local l_FFlagLuaAppUseSortsWithDividersFString_0 = v28.FFlagLuaAppUseSortsWithDividersFString;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v28.FFlagRemoveDependencyArrayAntipattern;
local v41 = {};
if l_FFlagLuaAppUseSortsWithDividersFString_0 then
    for v42 in l_FStringLuaAppSortsWithDividers_0:gmatch("(%w+)") do
        v41[v42] = true;
    end;
end;
local v43 = game:DefineFastInt("LuaAppOmniFeedScrollAnimDurationMs", 400) / 1000;
local v44 = if l_FFlagLuaAppChartsStickyHeader_0 then {} else nil;
local function _(v45, v46) --[[ Line: 70 ]] --[[ Name: isGameTreatmentType ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v47 = true;
    if v45 ~= l_OmniFeedTypes_0.HomeGameGrid then
        v47 = true;
        if v45 ~= l_OmniFeedTypes_0.Carousel then
            v47 = true;
            if v45 ~= l_OmniFeedTypes_0.SearchGameGrid then
                v47 = l_isSduiGameOmniFeedItem_0(v45, v46);
            end;
        end;
    end;
    return v47;
end;
local function v62(v49, v50, v51, v52) --[[ Line: 80 ]] --[[ Name: getNumItemsForRows ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v53 = 0;
    local v54 = 0;
    for v55 = v50, #v49 do
        local v56 = v49[v55];
        local v57 = v56 and v56.treatmentProps and v56.treatmentProps.numberOfRows or 1;
        if v57 == -1 then
            v57 = 1;
        end;
        v54 = v54 + 1;
        v53 = v53 + v57;
        local v58 = nil;
        if v56 then
            if v56.treatmentProps and v56.treatmentProps.topicId then
                v58 = v56.treatmentProps.topicId;
            elseif v56.itemId and v56.itemId.topicId then
                v58 = v56.itemId.topicId;
            end;
        end;
        if v51 <= v53 then
            return v54;
        elseif v52 then
            local l_treatmentType_0 = v56.treatmentType;
            local l_v58_0 = v58;
            local v61 = true;
            if l_treatmentType_0 ~= l_OmniFeedTypes_0.HomeGameGrid then
                v61 = true;
                if l_treatmentType_0 ~= l_OmniFeedTypes_0.Carousel then
                    v61 = true;
                    if l_treatmentType_0 ~= l_OmniFeedTypes_0.SearchGameGrid then
                        v61 = l_isSduiGameOmniFeedItem_0(l_treatmentType_0, l_v58_0);
                    end;
                end;
            end;
            if v61 then
                break;
            end;
        end;
    end;
    return v54;
end;
return function(v63) --[[ Line: 150 ]]
    -- upvalues: l_useStyle_0 (copy), l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v2 (copy), l_Signal_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useLastInputMode_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v62 (copy), v36 (copy), l_useDesignTokens_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_OmniFeedConstants_0 (copy), v24 (copy), v23 (copy), v26 (copy), v44 (copy), l_useAnimateScrollViewToSelection_0 (copy), v43 (copy), v37 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v1 (copy), v22 (copy), v6 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v25 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_OmniFeedImpressionsDetector_0 (copy), l_ScrollDetector_0 (copy)
    local v64 = l_useStyle_0();
    local v66 = l_useAppPolicy_0(function(v65) --[[ Line: 152 ]]
        return v65.useGridPageLayout();
    end);
    local v68 = l_useAppPolicy_0(function(v67) --[[ Line: 155 ]]
        return v67.getMountAllOmniFeedItems();
    end);
    local v69 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v66 = v66 and not v69;
    local v70 = v2.useRef(l_Signal_0.new());
    local v71 = v2.useRef(l_Signal_0.new());
    local v72 = v2.useRef(0);
    local v73 = v2.useRef(false);
    local v74 = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else v63.scrollingFrameRef;
    local v75 = l_useLastInputMode_0() == "Cursor";
    local v76 = v63.shouldStopAfterOneGameSort and not v68;
    local v77 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v78 = nil;
        v74 = v2.useRef(nil);
        local v79 = nil;
        local v80, v81 = v2.useState(nil);
        v79 = v80;
        v78 = v81;
        if type(v63.scrollingFrameRef) == "table" then
            v74 = v63.scrollingFrameRef;
        end;
        do
            local l_v78_0 = v78;
            v77 = v2.useCallback(function(v83) --[[ Line: 183 ]]
                -- upvalues: v74 (ref), l_v78_0 (ref), v63 (copy)
                v74.current = v83;
                l_v78_0(v83);
                if type(v63.scrollingFrameRef) == "function" then
                    v63.scrollingFrameRef(v83);
                end;
            end, {
                v63.scrollingFrameRef
            });
        end;
    end;
    local v88 = if l_FFlagLuaAppChartsStickyHeader_0 then v2.useMemo(function() --[[ Line: 193 ]]
        -- upvalues: v63 (copy)
        local l_omniFeedItems_0 = v63.omniFeedItems;
        local v85 = {};
        for _, v87 in l_omniFeedItems_0 do
            if v87.pageSection == v63.omniFeedPageSection then
                table.insert(v85, v87);
            end;
        end;
        return v85;
    end, {
        v63.omniFeedItems, 
        v63.omniFeedPageSection
    }) else nil;
    local v89, v90 = v2.useState(function() --[[ Line: 205 ]]
        -- upvalues: v68 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v88 (copy), v63 (copy), v62 (ref), v36 (ref), v76 (copy)
        if v68 then
            return #if l_FFlagLuaAppChartsStickyHeader_0 then v88 else v63.omniFeedItems;
        else
            return (v62(if l_FFlagLuaAppChartsStickyHeader_0 then v88 else v63.omniFeedItems, 1, v36, v76));
        end;
    end);
    local l_pageContext_0 = v63.pageContext;
    local l_impressionsTag_0 = v63.impressionsTag;
    local l_omniFeedItems_1 = v63.omniFeedItems;
    local l_Theme_0 = v64.Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local v97 = nil;
    v97 = v66 and 4 or 0;
    local v98 = l_useDesignTokens_0();
    l_Color_0 = v98.LuaApps.App.Page.BackgroundColor;
    l_Transparency_0 = v98.LuaApps.App.Page.BackgroundTransparency;
    local v99 = v2.useMemo(function() --[[ Line: 237 ]]
        -- upvalues: v98 (copy), v66 (ref)
        return v98.LuaApps.HomeOmniFeed.getLayoutSpacing(v66);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v66, 
        v98
    } else l_dependencyArray_0(v66, v98));
    local v100 = v63.topPadding or v99.topMargin;
    local v101 = if v63.loadMoreButtonText then v98.Global.Size_600 else 80;
    local v102 = v63.bottomPadding or v101;
    local v104 = l_useSelector_0(function(v103) --[[ Line: 249 ]]
        return v103.Personalization.OmniItemsGlobalLayoutData;
    end);
    local v105 = v104 and (v104[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == "true" or v104[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == true);
    local v108 = v2.useCallback(function(v106) --[[ Line: 258 ]]
        -- upvalues: v72 (copy), v71 (copy), l_OmniFeedConstants_0 (ref), v63 (copy)
        v72.current = tick();
        v71.current:fire();
        local v107 = nil;
        v107 = if v106 then l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.FriendPresenceChange else l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.ManualRefresh;
        return v63.refresh(v107);
    end);
    local function _() --[[ Line: 269 ]]
        -- upvalues: v73 (copy), v74 (ref), v24 (ref), v108 (copy)
        v73.current = false;
        if v74.current then
            local l_Y_0 = v74.current.CanvasPosition.Y;
            local l_Height_0 = v24.JoinYourFriendsTile.Height;
            if l_Y_0 >= 0 and l_Y_0 <= l_Height_0 then
                v108(true);
            end;
        end;
    end;
    v2.useEffect(function() --[[ Line: 279 ]]
        -- upvalues: v105 (copy), v23 (ref), v73 (copy), v72 (copy), v26 (ref), v74 (ref), v24 (ref), v108 (copy)
        local v112 = nil;
        if v105 then
            v112 = v23.Event:Connect(function() --[[ Line: 282 ]]
                -- upvalues: v73 (ref), v72 (ref), v26 (ref), v74 (ref), v24 (ref), v108 (ref)
                if v73.current then
                    return;
                else
                    local v113 = tick() - v72.current;
                    local v114 = v26 - v113;
                    if v114 < 0 then
                        v73.current = false;
                        if v74.current then
                            local l_Y_1 = v74.current.CanvasPosition.Y;
                            local l_Height_1 = v24.JoinYourFriendsTile.Height;
                            if l_Y_1 >= 0 and l_Y_1 <= l_Height_1 then
                                v108(true);
                                return;
                            end;
                        end;
                    else
                        v73.current = true;
                        task.delay(v114, function() --[[ Line: 293 ]]
                            -- upvalues: v73 (ref), v74 (ref), v24 (ref), v108 (ref)
                            v73.current = false;
                            if v74.current then
                                local l_Y_2 = v74.current.CanvasPosition.Y;
                                local l_Height_2 = v24.JoinYourFriendsTile.Height;
                                if l_Y_2 >= 0 and l_Y_2 <= l_Height_2 then
                                    v108(true);
                                end;
                            end;
                        end);
                    end;
                    return;
                end;
            end);
        end;
        return function() --[[ Line: 299 ]]
            -- upvalues: v112 (ref)
            if v112 then
                v112:Disconnect();
                v112 = nil;
            end;
        end;
    end, {
        v63.refresh
    });
    local v120 = l_useSelector_0(function(v119) --[[ Line: 307 ]]
        -- upvalues: l_pageContext_0 (copy)
        return v119.OmniRecommendations[l_pageContext_0];
    end);
    local v121 = v120 and v120.sorts or if l_FFlagLuaAppChartsStickyHeader_0 then v44 else {};
    local l_sduiContext_0 = v63.sduiContext;
    l_useAnimateScrollViewToSelection_0(v74, v43);
    local v123 = v2.useCallback(function() --[[ Line: 318 ]]
        -- upvalues: v70 (copy)
        v70.current:fire();
    end);
    local v124 = nil;
    v124 = function() --[[ Line: 323 ]]
        -- upvalues: v89 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v88 (copy), l_omniFeedItems_1 (copy), v68 (copy), v62 (ref), v37 (ref), v76 (copy), v90 (copy)
        if v89 < #if l_FFlagLuaAppChartsStickyHeader_0 then v88 else l_omniFeedItems_1 then
            local v125 = nil;
            v125 = if v68 then #if l_FFlagLuaAppChartsStickyHeader_0 then v88 else l_omniFeedItems_1 else v89 + v62(if l_FFlagLuaAppChartsStickyHeader_0 then v88 else l_omniFeedItems_1, v89 + 1, v37, v76);
            v90(v125);
            return true;
        else
            return false;
        end;
    end;
    v2.useEffect(function() --[[ Line: 347 ]]
        -- upvalues: v76 (copy), v124 (ref)
        if not v76 then
            v124();
        end;
    end, {
        l_omniFeedItems_1, 
        v76
    });
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackFeedRender();
        l_DiscoveryAppLaunchTracker_0.default:trackNumFeedItems(v89);
    end;
    return v1.createElement(v22, {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        ScrollBarThickness = if v63.scrollBarThickness then v63.scrollBarThickness else v97, 
        onLoadMore = function() --[[ Line: 368 ]] --[[ Name: onLoadMore ]]
            -- upvalues: v124 (ref), v6 (ref), v63 (copy)
            if v124() then
                return v6.reject();
            else
                local l_loadNext_0 = v63.loadNext;
                if l_loadNext_0 then
                    return l_loadNext_0();
                else
                    return v6.resolve();
                end;
            end;
        end, 
        refresh = v108, 
        parentAppPage = l_pageContext_0, 
        onAbsoluteSizeChangedCallback = v63.onAbsoluteSizeChanged, 
        onCanvasSizeChangedCallback = v123, 
        onCanvasPositionChangedCallback = v123, 
        useAutomaticSizeContentFrame = true, 
        [v1.Ref] = if l_FFlagLuaAppLayoutParamsInContext_0 then v77 else v74, 
        createEndOfScrollElement = v63.createEndOfScrollElement, 
        onScrollDirectionChanged = v63.onScrollDirectionChanged, 
        ScrollingEnabled = v75, 
        onAbsoluteContentSizeChanged = if l_FFlagSearchOmniAutocompletePage_0 then v63.onAbsoluteContentSizeChanged else nil, 
        loadMoreButtonText = if v63.loadMoreButtonText and v63.hasNextPage and v63.loadNext ~= nil then v63.loadMoreButtonText else nil, 
        canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v63.canvasTopPadding else nil, 
        shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
            left = false, 
            top = false, 
            right = true, 
            bottom = true
        } else nil
    }, {
        OmniFeed = v2.createElement(v25, {
            omniFeedItems = l_omniFeedItems_1, 
            pageContext = l_pageContext_0, 
            sduiContext = l_sduiContext_0, 
            impressionsTag = l_impressionsTag_0, 
            numberOfItemsToBeRendered = v89, 
            topMargin = v100, 
            bottomMargin = v102, 
            layoutPadding = v99.layoutPadding, 
            onItemsUpdatedSignalRef = v70, 
            refreshSignalRef = v71, 
            scrollingFrameRef = v74, 
            defaultContainerSize = v63.defaultContainerSize, 
            sortsData = v121, 
            hasNextPage = v63.hasNextPage, 
            omniFeedPageSection = v63.omniFeedPageSection, 
            enableRelativeGui = v63.enableRelativeGui, 
            appCompositionEnabled = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v63.appCompositionEnabled else nil, 
            contentTag = if l_FFlagLuaAppCompositionSupport_0 then v63.contentTag else nil, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v63.onTileImageLoaded else nil
        }), 
        OmniFeedImpressionsDetector = v2.createElement(l_OmniFeedImpressionsDetector_0, {
            onItemsUpdatedSignal = v70.current, 
            impressionsTag = l_impressionsTag_0, 
            omniFeedItems = l_omniFeedItems_1, 
            eventContext = v63.analyticsContext
        }), 
        ScrollDetector = if v63.sendScrollEvent then v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v74, 
            sendScrollEvent = v63.sendScrollEvent
        }) else nil
    });
end;