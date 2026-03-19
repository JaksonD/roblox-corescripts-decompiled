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
local l_FFlagSduiVerticalFeedLayoutOrder_0 = require(l_Parent_0.SharedFlags).FFlagSduiVerticalFeedLayoutOrder;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local v23 = {};
return v2.memo(function(v24) --[[ Line: 61 ]] --[[ Name: SduiVerticalFeed ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v8 (copy), v9 (copy), l_CollectionItemSize_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_useAnimateScrollViewToSelection_0 (copy), l_useLastInputMode_0 (copy), v17 (copy), l_findAnalyticsField_0 (copy), v23 (copy), l_SduiBuilder_0 (copy), l_SduiErrors_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiVerticalFeedLayoutOrder_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_View_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy)
    local l_analyticsContext_0 = v24.analyticsContext;
    local l_sduiContext_0 = v24.sduiContext;
    local l_feedItems_0 = v24.feedItems;
    local l_debugName_0 = v24.debugName;
    local v29 = l_useTokens_0();
    local v30 = v2.useRef(nil);
    local v31 = v2.useRef(nil);
    if v31.current == nil then
        v31.current = v8.Signal.new();
    end;
    local v32 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v31 (copy)
        v31.current:fire();
    end, {});
    local v33 = v9.useSignalState(l_sduiContext_0.getPageLayoutConfig(l_CollectionItemSize_0.Small));
    local l_sideMargin_0 = v33.sideMargin;
    local v35 = v24.gapBetweenFeedItems or v33.verticalPadding;
    local v36 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v24.scrollingFrameRef or v30 else v30;
    if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then
        v2.useEffect(function() --[[ Line: 97 ]]
            -- upvalues: v24 (copy), v32 (copy)
            if not v24.scrollingFrameRef or not v24.scrollingFrameRef.current then
                return nil;
            else
                local l_current_0 = v24.scrollingFrameRef.current;
                local v38 = {
                    l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v32), 
                    l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v32)
                };
                return function() --[[ Line: 108 ]]
                    -- upvalues: v38 (copy)
                    for _, v40 in v38 do
                        v40:Disconnect();
                    end;
                end;
            end;
        end, {
            v24.scrollingFrameRef, 
            v32
        });
    end;
    l_useAnimateScrollViewToSelection_0(v36, 0.4);
    local v41 = l_useLastInputMode_0() ~= "Cursor";
    local v42 = v24.thresholdFromEnd or 600;
    v17(v36, v42, v24.onScrollToEnd);
    local v51 = v2.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: l_feedItems_0 (copy), v2 (ref), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v24 (copy), v35 (copy), l_findAnalyticsField_0 (ref), v23 (ref), l_SduiBuilder_0 (ref), l_sduiContext_0 (copy), l_SduiErrors_0 (ref), l_debugName_0 (copy), l_getSduiComponentWrapper_0 (ref), l_FFlagSduiVerticalFeedLayoutOrder_0 (ref), v31 (copy), v30 (copy), l_sideMargin_0 (copy), l_FFlagSduiServerCompat_0 (ref), l_analyticsContext_0 (copy)
        if l_feedItems_0 == nil then
            return nil;
        else
            local v43 = {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v24.pageBottomPadding or 80 else 80)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v35)
                })
            };
            for v44, v45 in l_feedItems_0 do
                local v46 = l_findAnalyticsField_0("componentType", v45.analyticsData or v23) or l_SduiBuilder_0.getComponentType(v45, l_sduiContext_0);
                if not v46 then
                    l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                        componentType = "VerticalFeed", 
                        name = l_debugName_0, 
                        message = ("Nil componentType in VerticalFeed at feedItem index %*"):format(v44)
                    }, l_sduiContext_0.appPage);
                else
                    local v47 = {
                        feedItemPosition = v44, 
                        itemComponentType = v46, 
                        componentType = v46
                    };
                    local v48 = ("feedItem%*"):format(v44);
                    local v49 = l_getSduiComponentWrapper_0(v45);
                    local v50 = nil;
                    if l_FFlagSduiVerticalFeedLayoutOrder_0 then
                        v50 = if v45.props and v45.props.layoutOrder ~= nil then v45.props.layoutOrder else v44;
                    end;
                    v43[v48] = v2.createElement(v49, {
                        debugName = v48, 
                        componentConfig = v45, 
                        sduiContext = l_sduiContext_0, 
                        localAnalyticsData = v47, 
                        extraLocalProps = {
                            scrollViewPositionChangedSignal = v31.current, 
                            verticalScrollingFrameRef = v30, 
                            pageSideMargin = l_sideMargin_0, 
                            startRow = 1, 
                            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v50 else nil, 
                            layoutOrder = if l_FFlagSduiServerCompat_0 then v50 else nil
                        }, 
                        parentAnalyticsContext = if v45.__isClientBinding then nil else l_analyticsContext_0
                    });
                end;
            end;
            return v43;
        end;
    end, {
        l_feedItems_0, 
        l_debugName_0, 
        v30, 
        v31, 
        l_sduiContext_0, 
        l_sideMargin_0, 
        l_analyticsContext_0, 
        v35
    });
    if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v24.scrollingFrameRef ~= nil then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = v24.layoutOrder
        }, v51);
    else
        return v2.createElement("ScrollingFrame", {
            LayoutOrder = v24.layoutOrder, 
            ref = v30, 
            [v2.Change.CanvasPosition] = v32, 
            [v2.Change.CanvasSize] = v32, 
            BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v24.backgroundStyle then v24.backgroundStyle.Color3 else v29.Color.Surface.Surface_0.Color3, 
            BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v24.backgroundStyle then v24.backgroundStyle.Transparency else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            ScrollingEnabled = not v41, 
            ClipsDescendants = not l_FFlagSduiCoreBadgeDetailsSupport_0 and nil
        }, v51);
    end;
end);