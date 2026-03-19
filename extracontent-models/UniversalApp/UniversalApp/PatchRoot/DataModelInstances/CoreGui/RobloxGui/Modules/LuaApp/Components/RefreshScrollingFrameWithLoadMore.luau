local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.Common.Signal);
local v5 = require(l_Modules_0.LuaApp.Enum.ScrollMovementDirection);
local v6 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v7 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrame);
local v8 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v8.Button;
local l_View_0 = v8.View;
local l_InputSize_0 = v8.Enums.InputSize;
local v12 = v3.PureComponent:extend("RefreshScrollingFrameWithLoadMore");
v12.defaultProps = {
    preloadDistance = 2000
};
v12.init = function(v13) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), l_View_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), v6 (copy)
    v13._isMounted = false;
    if type(v13.props.forwardRef) == "table" then
        v13.scrollingFrameRef = v13.props.forwardRef;
    else
        v13.scrollingFrameRef = v3.createRef();
    end;
    v13.setScrollingFrameRef = function(v14) --[[ Line: 40 ]]
        -- upvalues: v13 (copy)
        v13.scrollingFrameRef.current = v14;
        if v13.props.forwardRef and type(v13.props.forwardRef) == "function" then
            v13.props.forwardRef(v14);
        end;
    end;
    v13.scrollToTopSignal = v4.new();
    v13.scrollToTop = function() --[[ Line: 49 ]]
        -- upvalues: v13 (copy)
        v13.scrollToTopSignal:fire();
    end;
    v13.state = {
        isLoadingMore = false, 
        isScrollable = false
    };
    v13.lastLoadMoreThreshold = 0;
    v13.lastCanvasHeight = 0;
    v13.loadMore = function() --[[ Line: 61 ]]
        -- upvalues: v13 (copy)
        local l_onLoadMore_0 = v13.props.onLoadMore;
        v13:setState({
            isLoadingMore = true
        });
        l_onLoadMore_0():andThen(function() --[[ Line: 68 ]]
            -- upvalues: v13 (ref)
            if v13._isMounted then
                v13:setState({
                    isLoadingMore = false
                });
            end;
        end, function() --[[ Line: 74 ]]
            -- upvalues: v13 (ref)
            if v13._isMounted then
                v13:setState({
                    isLoadingMore = false
                });
            end;
            v13.lastLoadMoreThreshold = 0;
        end);
    end;
    v13.lastScrollPosition = 0;
    v13.scrollMovementDirection = v5.Backward;
    v13.checkScrollDirectionChanged = function(v16) --[[ Line: 89 ]]
        -- upvalues: v13 (copy), v5 (ref)
        local l_Y_0 = v16.CanvasPosition.Y;
        if l_Y_0 < 0 or l_Y_0 == v13.lastScrollPosition then
            return;
        else
            local v18 = nil;
            v18 = if v13.lastScrollPosition < l_Y_0 then v5.Forward else v5.Backward;
            if v18 ~= v13.scrollMovementDirection then
                if v13.props.onScrollDirectionChanged ~= nil then
                    v13.props.onScrollDirectionChanged(v18);
                end;
                v13.scrollMovementDirection = v18;
            end;
            v13.lastScrollPosition = l_Y_0;
            return;
        end;
    end;
    v13.onCanvasPositionChanged = function(v19) --[[ Line: 110 ]]
        -- upvalues: v13 (copy)
        local l_preloadDistance_0 = v13.props.preloadDistance;
        local l_onLoadMore_1 = v13.props.onLoadMore;
        local l_isLoadingMore_0 = v13.state.isLoadingMore;
        local l_Y_1 = v19.CanvasPosition.Y;
        if l_onLoadMore_1 and not l_isLoadingMore_0 and l_Y_1 > 0 and not v13.props.loadMoreButtonText then
            if v19.CanvasSize.Y.Scale ~= 0 then
                warn("RefreshScrollingFrame: Scrollingframe.CanvasSize.Y.Scale is not 0!\n\t\t\t\tContent loading would not work properly.");
                return;
            else
                local v24 = v13._absoluteWindowSize or v19.AbsoluteWindowSize;
                local v25 = v19.CanvasSize.Y.Offset - v24.Y - l_preloadDistance_0;
                local v26 = false;
                if v25 < l_Y_1 then
                    v26 = false;
                    if v25 ~= v13.lastLoadMoreThreshold then
                        v26 = v25 ~= v13.lastLoadMoreThreshold + 56;
                    end;
                end;
                if v26 then
                    v13.lastLoadMoreThreshold = v25;
                    v13.loadMore();
                end;
            end;
        end;
        if v13.props.onCanvasPositionChangedCallback then
            v13.props.onCanvasPositionChangedCallback(l_Y_1);
        end;
        if v13.props.onScrollDirectionChanged ~= nil then
            v13.checkScrollDirectionChanged(v19);
        end;
    end;
    v13.onAbsoluteWindowSizeChanged = function(v27) --[[ Line: 154 ]]
        -- upvalues: v13 (copy)
        v13._absoluteWindowSize = v27.AbsoluteWindowSize;
        v13.onCanvasSizeChanged(v27);
    end;
    v13.onCanvasSizeChanged = function(v28) --[[ Line: 159 ]]
        -- upvalues: v13 (copy)
        local l_Offset_0 = v28.CanvasSize.Y.Offset;
        local l_Y_2 = (v13._absoluteWindowSize or v28.AbsoluteWindowSize).Y;
        if l_Offset_0 < v13.lastCanvasHeight and l_Offset_0 ~= v13.lastCanvasHeight - 56 then
            v13.lastLoadMoreThreshold = 0;
        end;
        v13.lastCanvasHeight = l_Offset_0;
        if l_Y_2 == 0 then
            return;
        elseif not v13._isMounted then
            return;
        else
            local v31 = l_Y_2 < l_Offset_0;
            if v31 ~= v13.state.isScrollable then
                v13:setState({
                    isScrollable = v31
                });
            end;
            if v13.props.onLoadMore and not v13.state.isLoadingMore and not v31 and v28.CanvasPosition.Y > 0 and not v13.props.loadMoreButtonText and not v13.props.initializing then
                v13.loadMore();
            end;
            return;
        end;
    end;
    v13.createFooter = function() --[[ Line: 204 ]]
        -- upvalues: v13 (copy), v3 (ref), l_View_0 (ref), l_Button_0 (ref), l_InputSize_0 (ref), v6 (ref)
        local l_isLoadingMore_1 = v13.state.isLoadingMore;
        if not l_isLoadingMore_1 and v13.props.onLoadMore and v13.props.loadMoreButtonText then
            return v3.createElement(l_View_0, {
                tag = "size-full-1200 row align-x-center align-y-center padding-x-xlarge padding-bottom-xxlarge"
            }, {
                v3.createElement(l_Button_0, {
                    size = l_InputSize_0.Large, 
                    fillBehavior = "Fill", 
                    onActivated = v13.loadMore, 
                    text = v13.props.loadMoreButtonText
                })
            });
        else
            return l_isLoadingMore_1 and v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 56)
            }, {
                LoadingBar = v3.createElement(v6)
            });
        end;
    end;
end;
v12.didMount = function(v33) --[[ Line: 229 ]] --[[ Name: didMount ]]
    v33._isMounted = true;
    local l_current_0 = v33.scrollingFrameRef.current;
    if l_current_0 then
        v33.onCanvasSizeChanged(l_current_0);
        v33._absoluteWindowSize = l_current_0.AbsoluteWindowSize;
    end;
end;
v12.willUnmount = function(v35) --[[ Line: 241 ]] --[[ Name: willUnmount ]]
    v35._isMounted = false;
end;
v12.render = function(v36) --[[ Line: 245 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy)
    local v37 = v2.Dictionary.join(v36.props, {
        onCanvasPositionChangedCallback = v36.onCanvasPositionChanged, 
        onCanvasSizeChangedCallback = v36.onCanvasSizeChanged, 
        onAbsoluteWindowSizeChangedCallback = v36.onAbsoluteWindowSizeChanged, 
        createFooter = v36.createFooter, 
        onLoadMore = v2.None, 
        bottomPadding = v36.props.bottomPadding, 
        [v3.Children] = v2.None, 
        [v3.Ref] = v36.setScrollingFrameRef
    });
    return v3.createElement(v7, v37, v36.props[v3.Children]);
end;
return v3.forwardRef(function(v38, v39) --[[ Line: 260 ]]
    -- upvalues: v3 (copy), v12 (copy), v2 (copy)
    return v3.createElement(v12, v2.Dictionary.join(v38, {
        forwardRef = v39
    }));
end);