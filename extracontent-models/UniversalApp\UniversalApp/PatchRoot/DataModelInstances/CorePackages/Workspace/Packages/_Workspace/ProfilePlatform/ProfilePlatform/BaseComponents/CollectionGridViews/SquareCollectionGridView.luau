local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.CollectionViews);
local l_CollectionGrid_0 = v3.CollectionGrid;
local l_CollectionItemSize_0 = v3.CollectionViewTypes.CollectionItemSize;
local l_useCollectionLayoutParams_0 = v3.useCollectionLayoutParams;
local l_useCollectionImpressionsSignal_0 = v3.useCollectionImpressionsSignal;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v10 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v12 = require(script.Parent.ProfileCollectionGridConfig);
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
return function(v14) --[[ Line: 28 ]] --[[ Name: SquareCollectionsGridView ]]
    -- upvalues: v2 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v9 (copy), l_useCollectionImpressionsSignal_0 (copy), v12 (copy), v10 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_CollectionGrid_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_AppPage_0 (copy)
    local v15, v16 = v2.useState(nil);
    local v17 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useRef(nil) else nil;
    local v18 = if l_FFlagProfilePlatformEnableImpressions_0 then v9() else nil;
    local v19 = nil;
    local v20 = nil;
    if l_FFlagProfilePlatformEnableImpressions_0 then
        local v21, v22 = l_useCollectionImpressionsSignal_0(v18.scrollViewPositionChangedSignal);
        v19 = v21;
        v20 = v22;
    end;
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v14 (copy), v15 (copy), l_FFlagProfilePlatformEnableImpressions_0 (ref), v17 (copy)
        if v14.setForwardRef then
            v14.setForwardRef(v15);
        end;
        if l_FFlagProfilePlatformEnableImpressions_0 then
            v17.current = v15;
        end;
    end, {
        v15
    });
    local v23 = v14.maxNumRows or v12.Constants.DEFAULT_MAX_NUM_ROWS;
    local v24 = {
        sideMargin = 0
    };
    local v25, v26 = v10();
    local v27 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Small, v15, false, v24);
    local v29 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useCallback(function(v28) --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v20 (ref)
        if v14.onContainerSizeChanged then
            v14.onContainerSizeChanged(v28);
        end;
        v20();
    end, {
        v14.onContainerSizeChanged, 
        v20
    }) else nil;
    local v32 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useCallback(function(v30, v31) --[[ Line: 67 ]]
        -- upvalues: v14 (copy), v20 (ref)
        if v14.onViewableItemsChanged then
            v14.onViewableItemsChanged(v30, v31);
        end;
        v20();
    end, {
        v14.onViewableItemsChanged, 
        v20
    }) else nil;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v14.layoutOrder, 
        [v2.Change.AbsoluteSize] = v26
    }, {
        CollectionGrid = v2.createElement(l_CollectionGrid_0, {
            columnGap = v27.columnGap, 
            containerRef = v16, 
            getItemHeight = v14.getItemHeight, 
            headerButtonText = v14.headerButtonText, 
            hideHeaderButton = v14.hideHeaderButton, 
            items = v14.items, 
            LayoutOrder = v14.layoutOrder, 
            maxNumRows = v23, 
            numColumns = v14.overrides and v14.overrides.numColumns or v27.numColumns, 
            onActivateHeader = v14.onActivateHeader, 
            onActivateInfoIcon = v14.onActivateInfoIcon, 
            onContainerSizeChanged = if l_FFlagProfilePlatformEnableImpressions_0 then v29 else v14.onContainerSizeChanged, 
            onViewableItemsChanged = if l_FFlagProfilePlatformEnableImpressions_0 then v32 else v14.onViewableItemsChanged, 
            verticalScrollingFrameRef = v14.verticalScrollingFrameRef, 
            renderItem = v14.renderItem, 
            sideMargin = v25, 
            subtitle = v14.subtitle, 
            title = v14.title, 
            tooltipInfoText = v14.tooltipInfoText, 
            verticalPadding = v27.verticalPadding
        }), 
        ScreenSizeImpressionsTracker = if l_FFlagProfilePlatformEnableImpressions_0 and v14.impressionsTag and v14.sendImpressions then v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            pageContext = l_AppPage_0.ProfilePlatform, 
            parentRef = v17, 
            impressionsTag = v14.impressionsTag, 
            scrollViewPositionChangedSignal = v19, 
            sendImpressions = v14.sendImpressions
        }) else nil
    });
end;