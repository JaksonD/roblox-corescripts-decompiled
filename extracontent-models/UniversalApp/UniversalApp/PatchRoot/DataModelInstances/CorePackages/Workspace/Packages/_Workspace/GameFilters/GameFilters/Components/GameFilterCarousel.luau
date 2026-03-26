local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local v5 = require(l_Parent_0.React);
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_VariableItemWidthCarousel_0 = require(l_Parent_0.VariableItemWidthCarousel).VariableItemWidthCarousel;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCollectionImpressionsSignal_0 = require(l_Parent_0.CollectionViews).useCollectionImpressionsSignal;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v13 = require(l_script_FirstAncestor_0.Components.GameFilterPill);
local v14 = require(l_script_FirstAncestor_0.Analytics.sendFilterImpressions);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions;
return function(v17) --[[ Line: 38 ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useCollectionImpressionsSignal_0 (copy), v14 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v13 (copy), v3 (copy), l_VariableItemWidthCarousel_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v18 = l_useTokens_0();
    local v19, v20 = v5.useState({});
    local v21 = v5.useRef(nil);
    local v22 = l_useRoactService_0(l_AppEventIngestService_0);
    local v23 = "GameFilterCarousel_" .. v17.sortIndex;
    local v24, v25 = l_useCollectionImpressionsSignal_0(v17.scrollViewPositionChangedSignal);
    local v27 = v5.useCallback(function(v26) --[[ Line: 54 ]]
        -- upvalues: v14 (ref), v22 (copy), v17 (copy)
        v14(v22, v26, v17.filters, v17.pageContext, v17.analyticsInfo);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v22, 
        v17.filters, 
        v17.pageContext, 
        v17.analyticsInfo
    } else l_dependencyArray_0(v22, v17.filters, v17.pageContext, v17.analyticsInfo));
    local v30 = if v17.title then v5.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v18 (copy), v5 (ref), v17 (copy)
        local l_BodyMedium_0 = v18.Typography.BodyMedium;
        local l_Muted_0 = v18.Color.Content.Muted;
        return v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v17.title, 
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
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v17.title, 
        v18
    } else l_dependencyArray_0(v17.title, v18)) else "";
    local v34 = v5.useCallback(function(v31, v32) --[[ Line: 92 ]]
        -- upvalues: v5 (ref), v13 (ref), v17 (copy), v23 (copy), v20 (copy), v3 (ref), v19 (copy)
        return v5.createElement(v13, {
            analyticsInfo = v17.analyticsInfo, 
            filter = v31, 
            impressionsTag = v23, 
            index = v32, 
            onFilterApplied = v17.onFilterApplied, 
            onAbsoluteSizeChanged = function(v33) --[[ Line: 99 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v20 (ref), v3 (ref), v19 (ref), v32 (copy)
                if v33 then
                    v20(v3.Dictionary.join(v19, {
                        [v32] = v33.AbsoluteSize.X
                    }));
                end;
            end, 
            pageContext = v17.pageContext
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v17.analyticsInfo, 
        v23, 
        v17.onFilterApplied, 
        v19, 
        v17.pageContext
    } else l_dependencyArray_0(v17.analyticsInfo, v23, v17.onFilterApplied, v19, v17.pageContext));
    local v36 = v5.useCallback(function(v35) --[[ Line: 120 ]]
        -- upvalues: v19 (copy)
        return v19[v35] or 0;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v19
    } else l_dependencyArray_0(v19));
    return v5.createElement(v5.Fragment, nil, {
        FilterCarousel = v5.createElement(l_VariableItemWidthCarousel_0, {
            title = v30, 
            items = v17.filters, 
            renderItem = v34, 
            onCanvasPositionChanged = v25, 
            calculateItemWidth = v36, 
            itemHeight = v18.Size.Size_800, 
            headerContentPadding = v18.Padding.XSmall, 
            itemPadding = v18.Padding.XSmall, 
            sideMargin = v17.sideMargin, 
            LayoutOrder = v17.sortIndex, 
            scrollButtonEnabled = true, 
            scrollingFrameRef = v21, 
            ref = v17.containerRef
        }), 
        ImpressionsTracker = v5.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
            impressionsTag = v23, 
            pageContext = v17.pageContext, 
            parentRef = v21, 
            scrollViewPositionChangedSignal = v24, 
            sendImpressions = v27, 
            dataUpdatedTimestamp = v17.dataUpdatedTimestamp
        })
    });
end;