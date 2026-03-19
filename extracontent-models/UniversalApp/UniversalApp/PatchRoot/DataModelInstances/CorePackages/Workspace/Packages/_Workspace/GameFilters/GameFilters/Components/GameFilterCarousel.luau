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
local l_FFlagLuaAppChartsHandheldFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsHandheldFixes;
return function(v15) --[[ Line: 38 ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useCollectionImpressionsSignal_0 (copy), v13 (copy), l_dependencyArray_0 (copy), v12 (copy), v3 (copy), l_VariableItemWidthCarousel_0 (copy), l_FFlagLuaAppChartsHandheldFixes_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v16 = l_useTokens_0();
    local v17, v18 = v5.useState({});
    local v19 = v5.useRef(nil);
    local v20 = l_useRoactService_0(l_AppEventIngestService_0);
    local v21 = "GameFilterCarousel_" .. v15.sortIndex;
    local v22, v23 = l_useCollectionImpressionsSignal_0(v15.scrollViewPositionChangedSignal);
    local v25 = v5.useCallback(function(v24) --[[ Line: 53 ]]
        -- upvalues: v13 (ref), v20 (copy), v15 (copy)
        v13(v20, v24, v15.filters, v15.pageContext, v15.analyticsInfo);
    end, l_dependencyArray_0(v20, v15.filters, v15.pageContext, v15.analyticsInfo));
    local v28 = if v15.title then v5.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v16 (copy), v5 (ref), v15 (copy)
        local l_BodyMedium_0 = v16.Typography.BodyMedium;
        local l_Muted_0 = v16.Color.Content.Muted;
        return v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v15.title, 
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
    end, l_dependencyArray_0(v15.title, v16)) else "";
    local v32 = v5.useCallback(function(v29, v30) --[[ Line: 81 ]]
        -- upvalues: v5 (ref), v12 (ref), v15 (copy), v21 (copy), v18 (copy), v3 (ref), v17 (copy)
        return v5.createElement(v12, {
            analyticsInfo = v15.analyticsInfo, 
            filter = v29, 
            impressionsTag = v21, 
            index = v30, 
            onFilterApplied = v15.onFilterApplied, 
            onAbsoluteSizeChanged = function(v31) --[[ Line: 88 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v18 (ref), v3 (ref), v17 (ref), v30 (copy)
                if v31 then
                    v18(v3.Dictionary.join(v17, {
                        [v30] = v31.AbsoluteSize.X
                    }));
                end;
            end, 
            pageContext = v15.pageContext
        });
    end, l_dependencyArray_0(v15.analyticsInfo, v21, v15.onFilterApplied, v17, v15.pageContext));
    local v34 = v5.useCallback(function(v33) --[[ Line: 99 ]]
        -- upvalues: v17 (copy)
        return v17[v33] or 0;
    end, l_dependencyArray_0(v17));
    return v5.createElement(v5.Fragment, nil, {
        FilterCarousel = v5.createElement(l_VariableItemWidthCarousel_0, {
            title = v28, 
            items = v15.filters, 
            renderItem = v32, 
            onCanvasPositionChanged = v23, 
            calculateItemWidth = v34, 
            itemHeight = if l_FFlagLuaAppChartsHandheldFixes_0 then v16.Size.Size_800 else 32, 
            headerContentPadding = v16.Padding.XSmall, 
            itemPadding = v16.Padding.XSmall, 
            sideMargin = v15.sideMargin, 
            LayoutOrder = v15.sortIndex, 
            scrollButtonEnabled = true, 
            scrollingFrameRef = v19, 
            ref = v15.containerRef
        }), 
        ImpressionsTracker = v5.createElement(l_ScreenSizeImpressionsTracker_0, {
            impressionsTag = v21, 
            pageContext = v15.pageContext, 
            parentRef = v19, 
            scrollViewPositionChangedSignal = v22, 
            sendImpressions = v25, 
            dataUpdatedTimestamp = v15.dataUpdatedTimestamp
        })
    });
end;