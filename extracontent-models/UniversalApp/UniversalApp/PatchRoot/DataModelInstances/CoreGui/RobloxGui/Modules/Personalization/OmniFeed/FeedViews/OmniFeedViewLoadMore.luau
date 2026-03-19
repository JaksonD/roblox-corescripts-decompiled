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
local v33 = game:DefineFastInt("LuaAppOmniFeedInitialNumRows", 6);
local v34 = game:DefineFastInt("LuaAppOmniFeedLoadNumRows", 3);
local l_FStringLuaAppSortsWithDividers_0 = v28.FStringLuaAppSortsWithDividers;
local l_FFlagLuaAppUseSortsWithDividersFString_0 = v28.FFlagLuaAppUseSortsWithDividersFString;
local v37 = {};
if l_FFlagLuaAppUseSortsWithDividersFString_0 then
    for v38 in l_FStringLuaAppSortsWithDividers_0:gmatch("(%w+)") do
        v37[v38] = true;
    end;
end;
local v39 = game:DefineFastInt("LuaAppOmniFeedScrollAnimDurationMs", 400) / 1000;
local v40 = if l_FFlagLuaAppChartsStickyHeader_0 then {} else nil;
local function _(v41, v42) --[[ Line: 65 ]] --[[ Name: isGameTreatmentType ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v43 = true;
    if v41 ~= l_OmniFeedTypes_0.HomeGameGrid then
        v43 = true;
        if v41 ~= l_OmniFeedTypes_0.Carousel then
            v43 = true;
            if v41 ~= l_OmniFeedTypes_0.SearchGameGrid then
                v43 = l_isSduiGameOmniFeedItem_0(v41, v42);
            end;
        end;
    end;
    return v43;
end;
local function v58(v45, v46, v47, v48) --[[ Line: 75 ]] --[[ Name: getNumItemsForRows ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v49 = 0;
    local v50 = 0;
    for v51 = v46, #v45 do
        local v52 = v45[v51];
        local v53 = v52 and v52.treatmentProps and v52.treatmentProps.numberOfRows or 1;
        if v53 == -1 then
            v53 = 1;
        end;
        v50 = v50 + 1;
        v49 = v49 + v53;
        local v54 = nil;
        if v52 then
            if v52.treatmentProps and v52.treatmentProps.topicId then
                v54 = v52.treatmentProps.topicId;
            elseif v52.itemId and v52.itemId.topicId then
                v54 = v52.itemId.topicId;
            end;
        end;
        if v47 <= v49 then
            return v50;
        elseif v48 then
            local l_treatmentType_0 = v52.treatmentType;
            local l_v54_0 = v54;
            local v57 = true;
            if l_treatmentType_0 ~= l_OmniFeedTypes_0.HomeGameGrid then
                v57 = true;
                if l_treatmentType_0 ~= l_OmniFeedTypes_0.Carousel then
                    v57 = true;
                    if l_treatmentType_0 ~= l_OmniFeedTypes_0.SearchGameGrid then
                        v57 = l_isSduiGameOmniFeedItem_0(l_treatmentType_0, l_v54_0);
                    end;
                end;
            end;
            if v57 then
                break;
            end;
        end;
    end;
    return v50;
end;
return function(v59) --[[ Line: 140 ]]
    -- upvalues: l_useStyle_0 (copy), l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v2 (copy), l_Signal_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useLastInputMode_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v58 (copy), v33 (copy), l_useDesignTokens_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_OmniFeedConstants_0 (copy), v24 (copy), v23 (copy), v26 (copy), v40 (copy), l_useAnimateScrollViewToSelection_0 (copy), v39 (copy), v34 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v1 (copy), v22 (copy), v6 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v25 (copy), l_OmniFeedImpressionsDetector_0 (copy), l_ScrollDetector_0 (copy)
    local v60 = l_useStyle_0();
    local v62 = l_useAppPolicy_0(function(v61) --[[ Line: 142 ]]
        return v61.useGridPageLayout();
    end);
    local v64 = l_useAppPolicy_0(function(v63) --[[ Line: 145 ]]
        return v63.getMountAllOmniFeedItems();
    end);
    local v65 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v62 = v62 and not v65;
    local v66 = v2.useRef(l_Signal_0.new());
    local v67 = v2.useRef(l_Signal_0.new());
    local v68 = v2.useRef(0);
    local v69 = v2.useRef(false);
    local v70 = if l_FFlagLuaAppLayoutParamsInContext_0 then nil else v59.scrollingFrameRef;
    local v71 = l_useLastInputMode_0() == "Cursor";
    local v72 = v59.shouldStopAfterOneGameSort and not v64;
    local v73 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v74 = nil;
        v70 = v2.useRef(nil);
        local v75 = nil;
        local v76, v77 = v2.useState(nil);
        v75 = v76;
        v74 = v77;
        if type(v59.scrollingFrameRef) == "table" then
            v70 = v59.scrollingFrameRef;
        end;
        do
            local l_v74_0 = v74;
            v73 = v2.useCallback(function(v79) --[[ Line: 173 ]]
                -- upvalues: v70 (ref), l_v74_0 (ref), v59 (copy)
                v70.current = v79;
                l_v74_0(v79);
                if type(v59.scrollingFrameRef) == "function" then
                    v59.scrollingFrameRef(v79);
                end;
            end, {
                v59.scrollingFrameRef
            });
        end;
    end;
    local v84 = if l_FFlagLuaAppChartsStickyHeader_0 then v2.useMemo(function() --[[ Line: 183 ]]
        -- upvalues: v59 (copy)
        local l_omniFeedItems_0 = v59.omniFeedItems;
        local v81 = {};
        for _, v83 in l_omniFeedItems_0 do
            if v83.pageSection == v59.omniFeedPageSection then
                table.insert(v81, v83);
            end;
        end;
        return v81;
    end, {
        v59.omniFeedItems, 
        v59.omniFeedPageSection
    }) else nil;
    local v85, v86 = v2.useState(function() --[[ Line: 195 ]]
        -- upvalues: v64 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v84 (copy), v59 (copy), v58 (ref), v33 (ref), v72 (copy)
        if v64 then
            return #if l_FFlagLuaAppChartsStickyHeader_0 then v84 else v59.omniFeedItems;
        else
            return (v58(if l_FFlagLuaAppChartsStickyHeader_0 then v84 else v59.omniFeedItems, 1, v33, v72));
        end;
    end);
    local l_pageContext_0 = v59.pageContext;
    local l_impressionsTag_0 = v59.impressionsTag;
    local l_omniFeedItems_1 = v59.omniFeedItems;
    local l_Theme_0 = v60.Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local v93 = nil;
    v93 = v62 and 4 or 0;
    local v94 = l_useDesignTokens_0();
    l_Color_0 = v94.LuaApps.App.Page.BackgroundColor;
    l_Transparency_0 = v94.LuaApps.App.Page.BackgroundTransparency;
    local v95 = v2.useMemo(function() --[[ Line: 225 ]]
        -- upvalues: v94 (copy), v62 (ref)
        return v94.LuaApps.HomeOmniFeed.getLayoutSpacing(v62);
    end, l_dependencyArray_0(v62, v94));
    local v96 = v59.topPadding or v95.topMargin;
    local v97 = if v59.loadMoreButtonText then v94.Global.Size_600 else 80;
    local v98 = v59.bottomPadding or v97;
    local v100 = l_useSelector_0(function(v99) --[[ Line: 233 ]]
        return v99.Personalization.OmniItemsGlobalLayoutData;
    end);
    local v101 = v100 and (v100[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == "true" or v100[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == true);
    local v104 = v2.useCallback(function(v102) --[[ Line: 242 ]]
        -- upvalues: v68 (copy), v67 (copy), l_OmniFeedConstants_0 (ref), v59 (copy)
        v68.current = tick();
        v67.current:fire();
        local v103 = nil;
        v103 = if v102 then l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.FriendPresenceChange else l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.ManualRefresh;
        return v59.refresh(v103);
    end);
    local function _() --[[ Line: 253 ]]
        -- upvalues: v69 (copy), v70 (ref), v24 (ref), v104 (copy)
        v69.current = false;
        if v70.current then
            local l_Y_0 = v70.current.CanvasPosition.Y;
            local l_Height_0 = v24.JoinYourFriendsTile.Height;
            if l_Y_0 >= 0 and l_Y_0 <= l_Height_0 then
                v104(true);
            end;
        end;
    end;
    v2.useEffect(function() --[[ Line: 263 ]]
        -- upvalues: v101 (copy), v23 (ref), v69 (copy), v68 (copy), v26 (ref), v70 (ref), v24 (ref), v104 (copy)
        local v108 = nil;
        if v101 then
            v108 = v23.Event:Connect(function() --[[ Line: 266 ]]
                -- upvalues: v69 (ref), v68 (ref), v26 (ref), v70 (ref), v24 (ref), v104 (ref)
                if v69.current then
                    return;
                else
                    local v109 = tick() - v68.current;
                    local v110 = v26 - v109;
                    if v110 < 0 then
                        v69.current = false;
                        if v70.current then
                            local l_Y_1 = v70.current.CanvasPosition.Y;
                            local l_Height_1 = v24.JoinYourFriendsTile.Height;
                            if l_Y_1 >= 0 and l_Y_1 <= l_Height_1 then
                                v104(true);
                                return;
                            end;
                        end;
                    else
                        v69.current = true;
                        task.delay(v110, function() --[[ Line: 277 ]]
                            -- upvalues: v69 (ref), v70 (ref), v24 (ref), v104 (ref)
                            v69.current = false;
                            if v70.current then
                                local l_Y_2 = v70.current.CanvasPosition.Y;
                                local l_Height_2 = v24.JoinYourFriendsTile.Height;
                                if l_Y_2 >= 0 and l_Y_2 <= l_Height_2 then
                                    v104(true);
                                end;
                            end;
                        end);
                    end;
                    return;
                end;
            end);
        end;
        return function() --[[ Line: 283 ]]
            -- upvalues: v108 (ref)
            if v108 then
                v108:Disconnect();
                v108 = nil;
            end;
        end;
    end, {
        v59.refresh
    });
    local v116 = l_useSelector_0(function(v115) --[[ Line: 291 ]]
        -- upvalues: l_pageContext_0 (copy)
        return v115.OmniRecommendations[l_pageContext_0];
    end);
    local v117 = v116 and v116.sorts or if l_FFlagLuaAppChartsStickyHeader_0 then v40 else {};
    local l_sduiContext_0 = v59.sduiContext;
    l_useAnimateScrollViewToSelection_0(v70, v39);
    local v119 = v2.useCallback(function() --[[ Line: 302 ]]
        -- upvalues: v66 (copy)
        v66.current:fire();
    end);
    local v120 = nil;
    v120 = function() --[[ Line: 307 ]]
        -- upvalues: v85 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v84 (copy), l_omniFeedItems_1 (copy), v64 (copy), v58 (ref), v34 (ref), v72 (copy), v86 (copy)
        if v85 < #if l_FFlagLuaAppChartsStickyHeader_0 then v84 else l_omniFeedItems_1 then
            local v121 = nil;
            v121 = if v64 then #if l_FFlagLuaAppChartsStickyHeader_0 then v84 else l_omniFeedItems_1 else v85 + v58(if l_FFlagLuaAppChartsStickyHeader_0 then v84 else l_omniFeedItems_1, v85 + 1, v34, v72);
            v86(v121);
            return true;
        else
            return false;
        end;
    end;
    v2.useEffect(function() --[[ Line: 331 ]]
        -- upvalues: v72 (copy), v120 (ref)
        if not v72 then
            v120();
        end;
    end, {
        l_omniFeedItems_1, 
        v72
    });
    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
        l_DiscoveryAppLaunchTracker_0.default:trackFeedRender();
        l_DiscoveryAppLaunchTracker_0.default:trackNumFeedItems(v85);
    end;
    return v1.createElement(v22, {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        ScrollBarThickness = if v59.scrollBarThickness then v59.scrollBarThickness else v93, 
        onLoadMore = function() --[[ Line: 352 ]] --[[ Name: onLoadMore ]]
            -- upvalues: v120 (ref), v6 (ref), v59 (copy)
            if v120() then
                return v6.reject();
            else
                local l_loadNext_0 = v59.loadNext;
                if l_loadNext_0 then
                    return l_loadNext_0();
                else
                    return v6.resolve();
                end;
            end;
        end, 
        refresh = v104, 
        parentAppPage = l_pageContext_0, 
        onAbsoluteSizeChangedCallback = v59.onAbsoluteSizeChanged, 
        onCanvasSizeChangedCallback = v119, 
        onCanvasPositionChangedCallback = v119, 
        useAutomaticSizeContentFrame = true, 
        [v1.Ref] = if l_FFlagLuaAppLayoutParamsInContext_0 then v73 else v70, 
        createEndOfScrollElement = v59.createEndOfScrollElement, 
        onScrollDirectionChanged = v59.onScrollDirectionChanged, 
        ScrollingEnabled = v71, 
        onAbsoluteContentSizeChanged = if l_FFlagSearchOmniAutocompletePage_0 then v59.onAbsoluteContentSizeChanged else nil, 
        loadMoreButtonText = if v59.loadMoreButtonText and v59.hasNextPage and v59.loadNext ~= nil then v59.loadMoreButtonText else nil, 
        canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v59.canvasTopPadding else nil, 
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
            numberOfItemsToBeRendered = v85, 
            topMargin = v96, 
            bottomMargin = v98, 
            layoutPadding = v95.layoutPadding, 
            onItemsUpdatedSignalRef = v66, 
            refreshSignalRef = v67, 
            scrollingFrameRef = v70, 
            defaultContainerSize = v59.defaultContainerSize, 
            sortsData = v117, 
            hasNextPage = v59.hasNextPage, 
            omniFeedPageSection = v59.omniFeedPageSection, 
            enableRelativeGui = v59.enableRelativeGui
        }), 
        OmniFeedImpressionsDetector = v2.createElement(l_OmniFeedImpressionsDetector_0, {
            onItemsUpdatedSignal = v66.current, 
            impressionsTag = l_impressionsTag_0, 
            omniFeedItems = l_omniFeedItems_1, 
            eventContext = v59.analyticsContext
        }), 
        ScrollDetector = if v59.sendScrollEvent then v2.createElement(l_ScrollDetector_0, {
            scrollingFrameRef = v70, 
            sendScrollEvent = v59.sendScrollEvent
        }) else nil
    });
end;