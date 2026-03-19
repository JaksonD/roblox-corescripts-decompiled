local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local v5 = require(l_Parent_0.React);
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_VariableItemWidthCarousel_0 = require(l_Parent_0.VariableItemWidthCarousel).VariableItemWidthCarousel;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCollectionImpressionsSignal_0 = require(l_Parent_0.CollectionViews).useCollectionImpressionsSignal;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v12 = require(l_script_FirstAncestor_0.Components.GameFilterPill);
local v13 = require(l_script_FirstAncestor_0.Analytics.sendFilterImpressions);
return function(v14) --[[ Line: 34 ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useCollectionImpressionsSignal_0 (copy), v13 (copy), l_dependencyArray_0 (copy), v12 (copy), v3 (copy), l_VariableItemWidthCarousel_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v15 = l_useTokens_0();
    local v16, v17 = v5.useState({});
    local v18 = v5.useRef(nil);
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    local v20 = "GameFilterCarousel_" .. v14.sortIndex;
    local v21, v22 = l_useCollectionImpressionsSignal_0(v14.scrollViewPositionChangedSignal);
    local v24 = v5.useCallback(function(v23) --[[ Line: 49 ]]
        -- upvalues: v13 (ref), v19 (copy), v14 (copy)
        v13(v19, v23, v14.filters, v14.pageContext, v14.analyticsInfo);
    end, l_dependencyArray_0(v19, v14.filters, v14.pageContext, v14.analyticsInfo));
    local v27 = if v14.title then v5.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v5 (ref), v14 (copy)
        local l_BodyMedium_0 = v15.Typography.BodyMedium;
        local l_Muted_0 = v15.Color.Content.Muted;
        return v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v14.title, 
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_BodyMedium_0.Font, 
            TextSize = l_BodyMedium_0.FontSize, 
            TextTransparency = l_Muted_0.Transparency, 
            TextColor3 = l_Muted_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1
        });
    end, l_dependencyArray_0(v14.title, v15)) else "";
    local v31 = v5.useCallback(function(v28, v29) --[[ Line: 77 ]]
        -- upvalues: v5 (ref), v12 (ref), v14 (copy), v20 (copy), v17 (copy), v3 (ref), v16 (copy)
        return v5.createElement(v12, {
            analyticsInfo = v14.analyticsInfo, 
            filter = v28, 
            impressionsTag = v20, 
            index = v29, 
            onFilterApplied = v14.onFilterApplied, 
            onAbsoluteSizeChanged = function(v30) --[[ Line: 84 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v17 (ref), v3 (ref), v16 (ref), v29 (copy)
                if v30 then
                    v17(v3.Dictionary.join(v16, {
                        [v29] = v30.AbsoluteSize.X
                    }));
                end;
            end, 
            pageContext = v14.pageContext
        });
    end, l_dependencyArray_0(v14.analyticsInfo, v20, v14.onFilterApplied, v16, v14.pageContext));
    local v33 = v5.useCallback(function(v32) --[[ Line: 95 ]]
        -- upvalues: v16 (copy)
        return v16[v32] or 0;
    end, l_dependencyArray_0(v16));
    return v5.createElement(v5.Fragment, nil, {
        FilterCarousel = v5.createElement(l_VariableItemWidthCarousel_0, {
            title = v27, 
            items = v14.filters, 
            renderItem = v31, 
            onCanvasPositionChanged = v22, 
            calculateItemWidth = v33, 
            itemHeight = v15.Size.Size_800, 
            headerContentPadding = v15.Padding.XSmall, 
            itemPadding = v15.Padding.XSmall, 
            sideMargin = v14.sideMargin, 
            LayoutOrder = v14.sortIndex, 
            scrollButtonEnabled = true, 
            scrollingFrameRef = v18, 
            ref = v14.containerRef
        }), 
        ImpressionsTracker = v5.createElement(l_ScreenSizeImpressionsTracker_0, {
            impressionsTag = v20, 
            pageContext = v14.pageContext, 
            parentRef = v18, 
            scrollViewPositionChangedSignal = v21, 
            sendImpressions = v24, 
            dataUpdatedTimestamp = v14.dataUpdatedTimestamp
        })
    });
end;