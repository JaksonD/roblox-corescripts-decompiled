local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedContent");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useAnimateScrollViewToSelection_0 = require(l_Parent_0.AppBlox).useAnimateScrollViewToSelection;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local v8 = require(l_Parent_0.AppCommonLib);
local v9 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.SduiCompat);
local v11 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsField_0 = v11.findAnalyticsField;
local l_getSduiComponentWrapper_0 = v11.getSduiComponentWrapper;
local l_SduiBuilder_0 = v11.SduiBuilder;
local l_SduiErrors_0 = v11.SduiErrors;
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
local v17 = require(l_script_FirstAncestor_0.Components.useVerticalScrolledToEndThreshold);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagSduiV2PaginationSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2PaginationSupport;
local l_FFlagSduiVerticalFeedLayoutOrder_0 = require(l_Parent_0.SharedFlags).FFlagSduiVerticalFeedLayoutOrder;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local v24 = {};
return v2.memo(function(v25) --[[ Line: 62 ]] --[[ Name: SduiVerticalFeed ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v8 (copy), v9 (copy), l_CollectionItemSize_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), l_useLastInputMode_0 (copy), l_FFlagSduiV2PaginationSupport_0 (copy), v17 (copy), l_findAnalyticsField_0 (copy), v24 (copy), l_SduiBuilder_0 (copy), l_SduiErrors_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiVerticalFeedLayoutOrder_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_View_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy)
    local l_analyticsContext_0 = v25.analyticsContext;
    local l_sduiContext_0 = v25.sduiContext;
    local l_feedItems_0 = v25.feedItems;
    local l_debugName_0 = v25.debugName;
    local v30 = l_useTokens_0();
    local v31 = v2.useRef(nil);
    local v32 = v2.useRef(nil);
    if v32.current == nil then
        v32.current = v8.Signal.new();
    end;
    local v33 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v32 (copy)
        v32.current:fire();
    end, {});
    local v34 = v9.useSignalState(l_sduiContext_0.getPageLayoutConfig(l_CollectionItemSize_0.Small));
    local l_sideMargin_0 = v34.sideMargin;
    local v36 = v25.gapBetweenFeedItems or v34.verticalPadding;
    local v37 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v25.scrollingFrameRef or v31 else v31;
    if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then
        v2.useEffect(function() --[[ Line: 98 ]]
            -- upvalues: v25 (copy), v33 (copy)
            if not v25.scrollingFrameRef or not v25.scrollingFrameRef.current then
                return nil;
            else
                local l_current_0 = v25.scrollingFrameRef.current;
                local v39 = {
                    l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v33), 
                    l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v33)
                };
                return function() --[[ Line: 109 ]]
                    -- upvalues: v39 (copy)
                    for _, v41 in v39 do
                        v41:Disconnect();
                    end;
                end;
            end;
        end, {
            v25.scrollingFrameRef, 
            v33
        });
    end;
    l_useAnimateScrollViewToSelection_0(v37, 0.4);
    local v42 = l_useLastInputMode_0() ~= "Cursor";
    if l_FFlagSduiV2PaginationSupport_0 then
        local v43 = v25.thresholdFromEnd or 600;
        v17(v37, v43, v25.onScrollToEnd);
    end;
    local v52 = v2.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: l_feedItems_0 (copy), v2 (ref), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v25 (copy), v36 (copy), l_findAnalyticsField_0 (ref), v24 (ref), l_SduiBuilder_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), l_debugName_0 (copy), l_getSduiComponentWrapper_0 (ref), l_FFlagSduiVerticalFeedLayoutOrder_0 (ref), v32 (copy), v31 (copy), l_sideMargin_0 (copy), l_FFlagSduiServerCompat_0 (ref), l_analyticsContext_0 (copy)
        if l_feedItems_0 == nil then
            return nil;
        else
            local v44 = {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v25.pageBottomPadding or 80 else 80)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v36)
                })
            };
            for v45, v46 in l_feedItems_0 do
                local v47 = l_findAnalyticsField_0("componentType", v46.analyticsData or v24) or l_SduiBuilder_0.getComponentType(v46, l_sduiContext_0);
                if not v47 then
                    l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                        componentType = "VerticalFeed", 
                        name = l_debugName_0, 
                        message = ("Nil componentType in VerticalFeed at feedItem index %*"):format(v45)
                    }, l_sduiContext_0.appPage);
                else
                    local v48 = {
                        feedItemPosition = v45, 
                        itemComponentType = v47, 
                        componentType = v47
                    };
                    local v49 = ("feedItem%*"):format(v45);
                    local v50 = l_getSduiComponentWrapper_0(v46);
                    local v51 = nil;
                    if l_FFlagSduiVerticalFeedLayoutOrder_0 then
                        v51 = if v46.props and v46.props.layoutOrder ~= nil then v46.props.layoutOrder else v45;
                    end;
                    v44[v49] = v2.createElement(v50, {
                        debugName = v49, 
                        componentConfig = v46, 
                        sduiContext = l_sduiContext_0, 
                        localAnalyticsData = v48, 
                        extraLocalProps = {
                            scrollViewPositionChangedSignal = v32.current, 
                            verticalScrollingFrameRef = v31, 
                            pageSideMargin = l_sideMargin_0, 
                            startRow = 1, 
                            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v51 else nil, 
                            layoutOrder = if l_FFlagSduiServerCompat_0 then v51 else nil
                        }, 
                        parentAnalyticsContext = if v46.__isClientBinding then nil else l_analyticsContext_0
                    });
                end;
            end;
            return v44;
        end;
    end, {
        l_feedItems_0, 
        l_debugName_0, 
        v31, 
        v32, 
        l_sduiContext_0, 
        l_sideMargin_0, 
        l_analyticsContext_0, 
        v36
    });
    if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v25.scrollingFrameRef ~= nil then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = v25.layoutOrder
        }, v52);
    else
        return v2.createElement("ScrollingFrame", {
            LayoutOrder = v25.layoutOrder, 
            ref = v31, 
            [v2.Change.CanvasPosition] = v33, 
            [v2.Change.CanvasSize] = v33, 
            BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v25.backgroundStyle then v25.backgroundStyle.Color3 else v30.Color.Surface.Surface_0.Color3, 
            BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v25.backgroundStyle then v25.backgroundStyle.Transparency else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            ScrollingEnabled = not v42, 
            ClipsDescendants = not l_FFlagSduiCoreBadgeDetailsSupport_0 and nil
        }, v52);
    end;
end);