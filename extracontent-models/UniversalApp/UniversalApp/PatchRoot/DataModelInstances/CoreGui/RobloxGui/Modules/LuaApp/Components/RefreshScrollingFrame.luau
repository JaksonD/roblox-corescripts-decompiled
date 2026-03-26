local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local v8 = require(l_Modules_0.Common.Roact);
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v13 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v14 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v15 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local v16 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v18 = require(l_Modules_0.LuaApp.FitChildren);
local v19 = require(l_Modules_0.LuaApp.RoactMotion);
local v20 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v21 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v22 = game:DefineFastFlag("SetRSFNotSelectable", false);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local v24 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v24.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v24.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 = v24.FFlagLuaAppSduiSeeAllLayoutParamsFix;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v24.FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagLuaAppCompositionSupport_0 = v24.FFlagLuaAppCompositionSupport;
local v30 = require(l_CorePackages_0.Packages.Cryo);
local v31 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v31.Style.withStyle;
local l_getIconSize_0 = v31.App.ImageSet.getIconSize;
local l_Images_0 = v31.App.ImageSet.Images;
local l_ImageSetLabel_0 = v31.Core.ImageSet.ImageSetLabel;
local v36 = l_getIconSize_0(v31.App.ImageSet.Enum.IconSize.Medium);
local function v47(v37) --[[ Line: 93 ]] --[[ Name: Spinner ]]
    -- upvalues: v8 (copy), l_ImageSetLabel_0 (copy), v36 (copy), l_Images_0 (copy)
    local l_activated_0 = v37.activated;
    local l_offset_0 = v37.offset;
    local l_Position_0 = v37.Position;
    local l_timer_0 = v37.timer;
    local l_tween_0 = v37.tween;
    local v43 = 0;
    local v44 = 1;
    local v45 = 0;
    if l_offset_0 > 0 then
        return;
    else
        if l_activated_0 then
            v43 = l_timer_0 * 540;
            l_offset_0 = 0;
        elseif l_tween_0 then
            l_offset_0 = 0;
            v45 = 2 * l_timer_0;
        elseif l_offset_0 > -52 then
            l_offset_0 = -l_offset_0;
            v43 = 9.6 * l_offset_0 - 240;
            v45 = 1 - 0.04 * l_offset_0;
        else
            v44 = 1;
            l_offset_0 = 52;
        end;
        local l_ImageColor3_0 = v37.ImageColor3;
        return v8.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v36 * v44, 0, v36 * v44), 
            Position = l_Position_0 + UDim2.new(0.5, 0, 0, l_offset_0 - v36 / 2), 
            ImageTransparency = v45, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = l_ImageColor3_0, 
            BackgroundTransparency = 1, 
            Rotation = v43, 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
local v48 = v8.Component:extend("RefreshScrollingFrame");
v48.defaultProps = {
    preloadDistance = 2000, 
    createEndOfScrollElement = false, 
    Selectable = not v22 and nil, 
    canvasTopPadding = l_FFlagAppIaScrollAway_0 and 0 or nil, 
    canvasSidePadding = l_FFlagLuaAppLayoutParamsInContext_0 and 0 or nil, 
    bottomPadding = l_FFlagExtendScrollingFramesBySafeInsets_0 and 0 or nil, 
    shouldExtendIntoSafeArea = if l_FFlagExtendScrollingFramesBySafeInsets_0 then {
        left = false, 
        top = false, 
        right = false, 
        bottom = false
    } else nil
};
v48.startTweenBack = function(v49) --[[ Line: 156 ]] --[[ Name: startTweenBack ]]
    v49:setState({
        activated = false, 
        tween = true, 
        timer = 0, 
        offset = 0
    });
end;
v48.startSpin = function(v50) --[[ Line: 166 ]] --[[ Name: startSpin ]]
    v50:setState({
        activated = true, 
        tween = false, 
        timer = 0
    });
end;
v48.startTween = function(v51) --[[ Line: 175 ]] --[[ Name: startTween ]]
    v51:setState({
        activated = true, 
        tween = true, 
        timer = 0
    });
end;
v48.didMount = function(v52) --[[ Line: 184 ]] --[[ Name: didMount ]]
    v52._isMounted = true;
    v52.updateIsScrollable();
end;
v48.willUnmount = function(v53) --[[ Line: 190 ]] --[[ Name: willUnmount ]]
    v53._isMounted = false;
    if v53.luaAppReloadPageEventConnection ~= nil then
        v53.luaAppReloadPageEventConnection:disconnect();
        v53.luaAppReloadPageEventConnection = nil;
    end;
end;
v48.init = function(v54) --[[ Line: 199 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v8 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_TweenService_0 (copy), l_GuiService_0 (copy), l_UserGameSettings_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v15 (copy), l_HttpService_0 (copy), v20 (copy)
    v54._inputCount = 0;
    v54._isMounted = false;
    v54._isUserInteracting = false;
    v54._isRefreshing = false;
    v54._lastReloadEventTime = tick();
    v54.state = {
        activated = false, 
        tween = false, 
        timer = 0, 
        offset = 0, 
        isScrollable = false
    };
    v54.fitFieldCanvasSize = {
        CanvasSize = v18.FitAxis.Height
    };
    local l_forwardRef_0 = v54.props.forwardRef;
    if type(l_forwardRef_0) == "table" then
        v54.scrollingFrameRef = l_forwardRef_0;
    else
        v54.scrollingFrameRef = v8.createRef();
    end;
    v54.setScrollingFrameRef = function(v56) --[[ Line: 237 ]]
        -- upvalues: v54 (copy), l_forwardRef_0 (copy)
        v54.scrollingFrameRef.current = v56;
        if type(l_forwardRef_0) == "function" then
            l_forwardRef_0(v56);
        end;
    end;
    v54.contentFrameRef = v8.createRef();
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        v54.setContentFrameRef = function(v57) --[[ Line: 246 ]]
            -- upvalues: v54 (copy)
            v54.contentFrameRef.current = v57;
            if v54.props.contentFrameRefCallback then
                v54.props.contentFrameRefCallback(v57);
            end;
        end;
    end;
    v54.scrollBackWithFocus = function(v58) --[[ Line: 254 ]]
        -- upvalues: l_TweenService_0 (ref), l_GuiService_0 (ref)
        local v59 = TweenInfo.new(0.3);
        local v60 = l_TweenService_0:Create(v58, v59, {
            CanvasPosition = Vector2.new(0, 0)
        });
        v60:Play();
        v60.Completed:Connect(function() --[[ Line: 258 ]]
            -- upvalues: l_GuiService_0 (ref), v58 (copy)
            l_GuiService_0:Select(v58);
        end);
    end;
    v54.scrollBack = function() --[[ Line: 263 ]]
        -- upvalues: v54 (copy), l_UserGameSettings_0 (ref)
        if v54.scrollingFrameRef.current then
            if l_UserGameSettings_0.ReducedMotion then
                v54.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
                return;
            elseif v54.props.isInputDirectional then
                v54.scrollBackWithFocus(v54.scrollingFrameRef.current);
                return;
            else
                v54.scrollingFrameRef.current:ScrollToTop();
            end;
        end;
    end;
    v54.dispatchRefresh = function() --[[ Line: 275 ]]
        -- upvalues: v54 (copy)
        local l_refresh_0 = v54.props.refresh;
        if v54._isMounted and v54.scrollingFrameRef.current then
            local l_Y_0 = v54.scrollingFrameRef.current.CanvasPosition.Y;
            if l_refresh_0 and not v54._isRefreshing then
                v54._isRefreshing = true;
                if l_Y_0 < -52 then
                    v54:startSpin();
                else
                    v54:startTween();
                end;
                l_refresh_0():andThen(function() --[[ Line: 292 ]]
                    -- upvalues: v54 (ref)
                    v54._isRefreshing = false;
                    if v54._isMounted then
                        v54:startTweenBack();
                    end;
                end, function() --[[ Line: 297 ]]
                    -- upvalues: v54 (ref)
                    v54._isRefreshing = false;
                    if v54._isMounted then
                        v54:startTweenBack();
                    end;
                end);
            end;
        end;
    end;
    v54.onCanvasPositionChanged = function(v63) --[[ Line: 307 ]]
        -- upvalues: v54 (copy), l_FFlagAppIaScrollAway_0 (ref), v15 (ref)
        local l_refresh_1 = v54.props.refresh;
        local l_onCanvasPositionChangedCallback_0 = v54.props.onCanvasPositionChangedCallback;
        local l_Y_1 = v63.CanvasPosition.Y;
        if l_refresh_1 and l_Y_1 < 52 then
            v54:setState({
                offset = l_Y_1
            });
        end;
        if l_FFlagAppIaScrollAway_0 and v15.getScrollAwayEnabled() and l_Y_1 <= 0 then
            v15.VisibilityControl.show();
        end;
        if l_onCanvasPositionChangedCallback_0 then
            l_onCanvasPositionChangedCallback_0(v63);
        end;
    end;
    v54.renderSteppedCallback = function(v67) --[[ Line: 333 ]]
        -- upvalues: v54 (copy)
        if v54.state.activated or v54.state.tween then
            local v68 = {
                timer = v54.state.timer + v67
            };
            if v54.state.tween and v54.state.timer > 0.5 then
                v68.tween = false;
            end;
            v54:setState(v68);
        end;
    end;
    v54.inputBeganCallback = function(v69) --[[ Line: 345 ]]
        -- upvalues: v54 (copy)
        if v69.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v54._isUserInteracting = true;
            v54._inputCount = v54._inputCount + 1;
            return;
        end;
    end;
    v54.inputEndedCallback = function(v70) --[[ Line: 355 ]]
        -- upvalues: v54 (copy)
        if v70.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            if v54._inputCount > 0 then
                v54._inputCount = v54._inputCount - 1;
            end;
            if v54._inputCount > 0 then
                return;
            else
                v54._isUserInteracting = false;
                if v54.state.offset < -52 and not v54.state.activated then
                    v54.dispatchRefresh();
                end;
                return;
            end;
        end;
    end;
    v54.statusBarTapCallback = function() --[[ Line: 377 ]]
        -- upvalues: v54 (copy)
        v54.scrollBack();
    end;
    v54.onReloadPage = function() --[[ Line: 381 ]]
        -- upvalues: v54 (copy)
        if v54._isMounted and v54.scrollingFrameRef.current then
            local l_Y_2 = v54.scrollingFrameRef.current.CanvasPosition.Y;
            local v72 = tick();
            if l_Y_2 ~= 0 then
                v54.scrollBack();
                if v72 - v54._lastReloadEventTime < 0.5 then
                    v54.dispatchRefresh();
                end;
            else
                v54.dispatchRefresh();
            end;
            v54._lastReloadEventTime = v72;
        end;
    end;
    v54.onNavigationEventReceived = function(v73) --[[ Line: 401 ]]
        -- upvalues: v54 (copy), l_HttpService_0 (ref)
        local l_parentAppPage_0 = v54.props.parentAppPage;
        local l_currentRoute_0 = v54.props.currentRoute;
        if v73.namespace == "Navigations" and v73.detailType == "Reload" and l_HttpService_0:JSONDecode(v73.detail).appName == l_parentAppPage_0 and #l_currentRoute_0 == 1 then
            v54.onReloadPage();
        end;
    end;
    v54.luaAppReloadPageEventConnection = v20.ReloadPage:connect(function(v76) --[[ Line: 414 ]]
        -- upvalues: v54 (copy)
        local l_parentAppPage_1 = v54.props.parentAppPage;
        local l_currentRoute_1 = v54.props.currentRoute;
        if v76 == l_parentAppPage_1 and #l_currentRoute_1 == 1 then
            v54.onReloadPage();
        end;
    end);
    v54.updateIsScrollable = function() --[[ Line: 423 ]]
        -- upvalues: v54 (copy)
        if v54.scrollingFrameRef.current and v54.contentFrameRef and v54.contentFrameRef.current then
            local l_Y_3 = v54.scrollingFrameRef.current.AbsoluteSize.Y;
            local l_Y_4 = v54.contentFrameRef.current.AbsoluteSize.Y;
            local v81 = l_Y_3 < l_Y_4;
            if l_Y_3 >= 0 and l_Y_4 >= 0 and v81 ~= v54.state.isScrollable then
                v54:setState({
                    isScrollable = v81
                });
            end;
        end;
    end;
    v54.onCanvasSizeChanged = function(v82) --[[ Line: 441 ]]
        -- upvalues: v54 (copy)
        if v54.props.onCanvasSizeChangedCallback ~= nil then
            v54.props.onCanvasSizeChangedCallback(v82);
        end;
    end;
end;
v48.render = function(v83) --[[ Line: 448 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v8 (copy), v19 (copy), v47 (copy), v18 (copy), v22 (copy), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v9 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v21 (copy), v13 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_withStyle_0 (copy)
    local v84 = nil;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        v84 = v83.props.Position or UDim2.new(0, 0, 0, 0);
        if v83.props.shouldExtendIntoSafeArea.left then
            v84 = v84 + UDim2.fromOffset(-v83.props.deviceSafePadding.left, 0);
        end;
        if v83.props.shouldExtendIntoSafeArea.top then
            v84 = v84 + UDim2.fromOffset(0, -v83.props.deviceSafePadding.top);
        end;
    end;
    local l_Size_0 = v83.props.Size;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        if v83.props.shouldExtendIntoSafeArea.left then
            l_Size_0 = l_Size_0 + UDim2.new(0, v83.props.deviceSafePadding.left, 0, 0);
        end;
        if v83.props.shouldExtendIntoSafeArea.top then
            l_Size_0 = l_Size_0 + UDim2.new(0, 0, 0, v83.props.deviceSafePadding.top);
        end;
        if v83.props.shouldExtendIntoSafeArea.right then
            l_Size_0 = l_Size_0 + UDim2.new(0, v83.props.deviceSafePadding.right, 0, 0);
        end;
        if v83.props.shouldExtendIntoSafeArea.bottom then
            l_Size_0 = l_Size_0 + UDim2.new(0, 0, 0, v83.props.deviceSafePadding.bottom);
        end;
    end;
    local l_BackgroundColor3_0 = v83.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v83.props.BackgroundTransparency;
    local l_ScrollBarImageColor3_0 = v83.props.ScrollBarImageColor3;
    local v89 = v83.props.ScrollBarThickness or 0;
    local v90 = v83.props.ScrollBarImageTransparency or 0;
    local v91 = if l_FFlagAppIaScrollAway_0 then v83.props.canvasTopPadding else nil;
    local v92 = if l_FFlagLuaAppLayoutParamsInContext_0 then v83.props.canvasSidePadding else nil;
    local v93 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v84.Y.Offset else v83.props.Position.Y.Offset;
    local l_NotificationService_0 = v83.props.NotificationService;
    local l_createFooter_0 = v83.props.createFooter;
    local l_useAutomaticSizeContentFrame_0 = v83.props.useAutomaticSizeContentFrame;
    local l_activated_1 = v83.state.activated;
    local l_tween_1 = v83.state.tween;
    local l_offset_1 = v83.state.offset;
    local v100 = v83.state.isScrollable and v83.props.createEndOfScrollElement;
    local v101 = l_activated_1 or l_tween_1 or v83._isUserInteracting;
    if l_activated_1 then
        if l_offset_1 > 0 and l_offset_1 < 52 then
            v93 = v93 - l_offset_1 + 52;
        elseif l_offset_1 <= 0 then
            v93 = v93 + 52;
        end;
    end;
    local function v108(v102, v103, v104, v105) --[[ Line: 503 ]] --[[ Name: renderRSF ]]
        -- upvalues: v8 (ref), v83 (copy), v19 (ref), v93 (ref), l_FFlagAppIaScrollAway_0 (ref), v91 (copy), v101 (copy), v47 (ref), v18 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v84 (ref), l_Size_0 (ref), v89 (copy), v90 (copy), v22 (ref), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v92 (copy), v100 (copy), l_useAutomaticSizeContentFrame_0 (copy), v9 (ref), l_FFlagLuaAppCompositionSupport_0 (ref), l_createFooter_0 (copy), v21 (ref), v13 (ref), l_RunService_0 (ref), l_UserInputService_0 (ref), l_NotificationService_0 (copy)
        return v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v102, 
            BackgroundTransparency = v103, 
            [v8.Change.AbsoluteSize] = v83.props.onAbsoluteSizeChangedCallback
        }, {
            layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            spinnerFrame = v8.createElement(v19.SimpleMotion, {
                style = {
                    sizeY = v19.spring(v93, 150, 18, 2)
                }, 
                render = function(v106) --[[ Line: 520 ]] --[[ Name: render ]]
                    -- upvalues: v83 (ref), v93 (ref), l_FFlagAppIaScrollAway_0 (ref), v91 (ref), v8 (ref), v101 (ref), v47 (ref), v104 (copy)
                    local v107 = v83.state.tween and v106.sizeY or v93;
                    if l_FFlagAppIaScrollAway_0 and v91 > 0 then
                        v107 = v107 + v91;
                    end;
                    return v8.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v106.sizeY), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        spinner = v101 and v47({
                            Position = UDim2.new(0, 0, 0, v107), 
                            ImageColor3 = v104, 
                            offset = v83.state.offset, 
                            activated = v83.state.activated, 
                            timer = v83.state.timer, 
                            tween = v83.state.tween
                        })
                    });
                end
            }), 
            scrollingFrame = v8.createElement(v18.FitScrollingFrame, {
                Position = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v84 else nil, 
                Size = l_Size_0, 
                CanvasPosition = v83.props.canvasPosition, 
                ScrollBarThickness = v89, 
                ScrollBarImageColor3 = v105, 
                ScrollBarImageTransparency = v90, 
                Selectable = if v22 then v83.props.Selectable else nil, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                ScrollingEnabled = v83.props.ScrollingEnabled, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                fitFields = v83.fitFieldCanvasSize, 
                AutomaticCanvasSize = if l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 then v83.props.AutomaticCanvasSize else nil, 
                [v8.Ref] = v83.setScrollingFrameRef, 
                [v8.Change.CanvasPosition] = v83.onCanvasPositionChanged, 
                [v8.Change.CanvasSize] = v83.onCanvasSizeChanged, 
                [v8.Change.AbsoluteWindowSize] = v83.props.onAbsoluteWindowSizeChangedCallback, 
                [v8.Event.SelectionChanged] = v83.props.onSelectionChanged
            }, {
                Layout = v8.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    [v8.Change.AbsoluteContentSize] = if l_FFlagSearchOmniAutocompletePage_0 then v83.props.onAbsoluteContentSizeChanged else nil
                }), 
                UIPadding = if not ((not l_FFlagAppIaScrollAway_0 or v91 <= 0) and (not l_FFlagLuaAppLayoutParamsInContext_0 or v92 <= 0)) or l_FFlagExtendScrollingFramesBySafeInsets_0 then v8.createElement("UIPadding", {
                    PaddingTop = if not not l_FFlagAppIaScrollAway_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v91 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v83.props.shouldExtendIntoSafeArea.top and v83.props.deviceSafePadding.top or 0)) else nil, 
                    PaddingLeft = if not not l_FFlagLuaAppLayoutParamsInContext_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v92 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v83.props.shouldExtendIntoSafeArea.left and v83.props.deviceSafePadding.left or 0)) else nil, 
                    PaddingRight = if not not l_FFlagLuaAppLayoutParamsInContext_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v92 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v83.props.shouldExtendIntoSafeArea.right and v83.props.deviceSafePadding.right or 0)) else nil, 
                    PaddingBottom = if not l_FFlagExtendScrollingFramesBySafeInsets_0 or v100 then nil else UDim.new(0, v83.props.shouldExtendIntoSafeArea.bottom and v83.props.deviceSafePadding.bottom or 0)
                }) else nil, 
                Content = v8.createElement(l_useAutomaticSizeContentFrame_0 and "Frame" or v18.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    [v9.Tag] = if l_FFlagLuaAppCompositionSupport_0 then v83.props.contentTag else nil, 
                    Size = if l_useAutomaticSizeContentFrame_0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                    fitFields = if l_useAutomaticSizeContentFrame_0 then nil else {
                        Size = v18.FitAxis.Height
                    }, 
                    AutomaticSize = if l_useAutomaticSizeContentFrame_0 then Enum.AutomaticSize.Y else nil, 
                    [v8.Ref] = v83.setContentFrameRef, 
                    [v8.Change.AbsoluteSize] = function() --[[ Line: 636 ]]
                        -- upvalues: v83 (ref)
                        spawn(v83.updateIsScrollable);
                    end
                }, v83.props[v8.Children]), 
                Footer = l_createFooter_0 and v8.createElement(v18.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    fitFields = {
                        Size = v18.FitAxis.Height
                    }, 
                    LayoutOrder = 2
                }, {
                    FooterContent = l_createFooter_0()
                }), 
                EndOfScroll = v100 and v8.createElement(v21, {
                    bottomPadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v83.props.bottomPadding + (v83.props.shouldExtendIntoSafeArea.bottom and v83.props.deviceSafePadding.bottom or 0) else v83.props.bottomPadding, 
                    backToTopCallback = v83.scrollBack, 
                    LayoutOrder = 3
                })
            }), 
            renderStepped = v8.createElement(v13, {
                event = l_RunService_0.renderStepped, 
                callback = v83.renderSteppedCallback
            }), 
            inputBegan = v8.createElement(v13, {
                event = l_UserInputService_0.InputBegan, 
                callback = v83.inputBeganCallback
            }), 
            inputEnded = v8.createElement(v13, {
                event = l_UserInputService_0.InputEnded, 
                callback = v83.inputEndedCallback
            }), 
            statusBarTapped = not _G.__TESTEZ_RUNNING_TEST__ and v8.createElement(v13, {
                event = l_UserInputService_0.StatusBarTapped, 
                callback = v83.statusBarTapCallback
            }), 
            bottomBarButtonPressed = v8.createElement(v13, {
                event = l_NotificationService_0.RobloxEventReceived, 
                callback = v83.onNavigationEventReceived
            })
        });
    end;
    return l_withStyle_0(function(v109) --[[ Line: 684 ]]
        -- upvalues: v108 (copy), l_BackgroundColor3_0 (copy), l_BackgroundTransparency_0 (copy), l_ScrollBarImageColor3_0 (copy)
        return v108(l_BackgroundColor3_0 or v109.Theme.BackgroundDefault.Color, l_BackgroundTransparency_0 or v109.Theme.BackgroundDefault.Transparency, v109.Theme.IconEmphasis.Color, l_ScrollBarImageColor3_0 or v109.Theme.UIEmphasis.Color);
    end);
end;
v48 = v10.connect(function(v110, _) --[[ Line: 694 ]]
    return {
        currentRoute = v110.Navigation.history[#v110.Navigation.history]
    };
end)(v48);
v48 = l_RoactServices_0.connect({
    NotificationService = l_AppNotificationService_0
})(v48);
return v8.forwardRef(function(v112, v113) --[[ Line: 704 ]]
    -- upvalues: v14 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v16 (copy), v8 (copy), v48 (ref), v30 (copy)
    local v114 = v14.useLastInput() == v14.Input.Directional;
    local v115 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v16.GetDisplayStore().getDeviceSafePadding) else nil;
    return v8.createElement(v48, v30.Dictionary.join(v112, {
        forwardRef = v113, 
        isInputDirectional = v114, 
        deviceSafePadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v115 else nil
    }));
end);