local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local v8 = require(l_Modules_0.Common.Roact);
local v9 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v12 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v13 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v14 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local v15 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v17 = require(l_Modules_0.LuaApp.FitChildren);
local v18 = require(l_Modules_0.LuaApp.RoactMotion);
local v19 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v20 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v21 = game:DefineFastFlag("SetRSFNotSelectable", false);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local v23 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v23.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v23.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 = v23.FFlagLuaAppSduiSeeAllLayoutParamsFix;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v23.FFlagExtendScrollingFramesBySafeInsets;
local v28 = require(l_CorePackages_0.Packages.Cryo);
local v29 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v29.Style.withStyle;
local l_getIconSize_0 = v29.App.ImageSet.getIconSize;
local l_Images_0 = v29.App.ImageSet.Images;
local l_ImageSetLabel_0 = v29.Core.ImageSet.ImageSetLabel;
local v34 = l_getIconSize_0(v29.App.ImageSet.Enum.IconSize.Medium);
local function v45(v35) --[[ Line: 91 ]] --[[ Name: Spinner ]]
    -- upvalues: v8 (copy), l_ImageSetLabel_0 (copy), v34 (copy), l_Images_0 (copy)
    local l_activated_0 = v35.activated;
    local l_offset_0 = v35.offset;
    local l_Position_0 = v35.Position;
    local l_timer_0 = v35.timer;
    local l_tween_0 = v35.tween;
    local v41 = 0;
    local v42 = 1;
    local v43 = 0;
    if l_offset_0 > 0 then
        return;
    else
        if l_activated_0 then
            v41 = l_timer_0 * 540;
            l_offset_0 = 0;
        elseif l_tween_0 then
            l_offset_0 = 0;
            v43 = 2 * l_timer_0;
        elseif l_offset_0 > -52 then
            l_offset_0 = -l_offset_0;
            v41 = 9.6 * l_offset_0 - 240;
            v43 = 1 - 0.04 * l_offset_0;
        else
            v42 = 1;
            l_offset_0 = 52;
        end;
        local l_ImageColor3_0 = v35.ImageColor3;
        return v8.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v34 * v42, 0, v34 * v42), 
            Position = l_Position_0 + UDim2.new(0.5, 0, 0, l_offset_0 - v34 / 2), 
            ImageTransparency = v43, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = l_ImageColor3_0, 
            BackgroundTransparency = 1, 
            Rotation = v41, 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
local v46 = v8.Component:extend("RefreshScrollingFrame");
v46.defaultProps = {
    preloadDistance = 2000, 
    createEndOfScrollElement = false, 
    Selectable = not v21 and nil, 
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
v46.startTweenBack = function(v47) --[[ Line: 154 ]] --[[ Name: startTweenBack ]]
    v47:setState({
        activated = false, 
        tween = true, 
        timer = 0, 
        offset = 0
    });
end;
v46.startSpin = function(v48) --[[ Line: 164 ]] --[[ Name: startSpin ]]
    v48:setState({
        activated = true, 
        tween = false, 
        timer = 0
    });
end;
v46.startTween = function(v49) --[[ Line: 173 ]] --[[ Name: startTween ]]
    v49:setState({
        activated = true, 
        tween = true, 
        timer = 0
    });
end;
v46.didMount = function(v50) --[[ Line: 182 ]] --[[ Name: didMount ]]
    v50._isMounted = true;
    v50.updateIsScrollable();
end;
v46.willUnmount = function(v51) --[[ Line: 188 ]] --[[ Name: willUnmount ]]
    v51._isMounted = false;
    if v51.luaAppReloadPageEventConnection ~= nil then
        v51.luaAppReloadPageEventConnection:disconnect();
        v51.luaAppReloadPageEventConnection = nil;
    end;
end;
v46.init = function(v52) --[[ Line: 197 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v8 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_TweenService_0 (copy), l_GuiService_0 (copy), l_UserGameSettings_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v14 (copy), l_HttpService_0 (copy), v19 (copy)
    v52._inputCount = 0;
    v52._isMounted = false;
    v52._isUserInteracting = false;
    v52._isRefreshing = false;
    v52._lastReloadEventTime = tick();
    v52.state = {
        activated = false, 
        tween = false, 
        timer = 0, 
        offset = 0, 
        isScrollable = false
    };
    v52.fitFieldCanvasSize = {
        CanvasSize = v17.FitAxis.Height
    };
    local l_forwardRef_0 = v52.props.forwardRef;
    if type(l_forwardRef_0) == "table" then
        v52.scrollingFrameRef = l_forwardRef_0;
    else
        v52.scrollingFrameRef = v8.createRef();
    end;
    v52.setScrollingFrameRef = function(v54) --[[ Line: 235 ]]
        -- upvalues: v52 (copy), l_forwardRef_0 (copy)
        v52.scrollingFrameRef.current = v54;
        if type(l_forwardRef_0) == "function" then
            l_forwardRef_0(v54);
        end;
    end;
    v52.contentFrameRef = v8.createRef();
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        v52.setContentFrameRef = function(v55) --[[ Line: 244 ]]
            -- upvalues: v52 (copy)
            v52.contentFrameRef.current = v55;
            if v52.props.contentFrameRefCallback then
                v52.props.contentFrameRefCallback(v55);
            end;
        end;
    end;
    v52.scrollBackWithFocus = function(v56) --[[ Line: 252 ]]
        -- upvalues: l_TweenService_0 (ref), l_GuiService_0 (ref)
        local v57 = TweenInfo.new(0.3);
        local v58 = l_TweenService_0:Create(v56, v57, {
            CanvasPosition = Vector2.new(0, 0)
        });
        v58:Play();
        v58.Completed:Connect(function() --[[ Line: 256 ]]
            -- upvalues: l_GuiService_0 (ref), v56 (copy)
            l_GuiService_0:Select(v56);
        end);
    end;
    v52.scrollBack = function() --[[ Line: 261 ]]
        -- upvalues: v52 (copy), l_UserGameSettings_0 (ref)
        if v52.scrollingFrameRef.current then
            if l_UserGameSettings_0.ReducedMotion then
                v52.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
                return;
            elseif v52.props.isInputDirectional then
                v52.scrollBackWithFocus(v52.scrollingFrameRef.current);
                return;
            else
                v52.scrollingFrameRef.current:ScrollToTop();
            end;
        end;
    end;
    v52.dispatchRefresh = function() --[[ Line: 273 ]]
        -- upvalues: v52 (copy)
        local l_refresh_0 = v52.props.refresh;
        if v52._isMounted and v52.scrollingFrameRef.current then
            local l_Y_0 = v52.scrollingFrameRef.current.CanvasPosition.Y;
            if l_refresh_0 and not v52._isRefreshing then
                v52._isRefreshing = true;
                if l_Y_0 < -52 then
                    v52:startSpin();
                else
                    v52:startTween();
                end;
                l_refresh_0():andThen(function() --[[ Line: 290 ]]
                    -- upvalues: v52 (ref)
                    v52._isRefreshing = false;
                    if v52._isMounted then
                        v52:startTweenBack();
                    end;
                end, function() --[[ Line: 295 ]]
                    -- upvalues: v52 (ref)
                    v52._isRefreshing = false;
                    if v52._isMounted then
                        v52:startTweenBack();
                    end;
                end);
            end;
        end;
    end;
    v52.onCanvasPositionChanged = function(v61) --[[ Line: 305 ]]
        -- upvalues: v52 (copy), l_FFlagAppIaScrollAway_0 (ref), v14 (ref)
        local l_refresh_1 = v52.props.refresh;
        local l_onCanvasPositionChangedCallback_0 = v52.props.onCanvasPositionChangedCallback;
        local l_Y_1 = v61.CanvasPosition.Y;
        if l_refresh_1 and l_Y_1 < 52 then
            v52:setState({
                offset = l_Y_1
            });
        end;
        if l_FFlagAppIaScrollAway_0 and v14.getScrollAwayEnabled() and l_Y_1 <= 0 then
            v14.VisibilityControl.show();
        end;
        if l_onCanvasPositionChangedCallback_0 then
            l_onCanvasPositionChangedCallback_0(v61);
        end;
    end;
    v52.renderSteppedCallback = function(v65) --[[ Line: 331 ]]
        -- upvalues: v52 (copy)
        if v52.state.activated or v52.state.tween then
            local v66 = {
                timer = v52.state.timer + v65
            };
            if v52.state.tween and v52.state.timer > 0.5 then
                v66.tween = false;
            end;
            v52:setState(v66);
        end;
    end;
    v52.inputBeganCallback = function(v67) --[[ Line: 343 ]]
        -- upvalues: v52 (copy)
        if v67.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v52._isUserInteracting = true;
            v52._inputCount = v52._inputCount + 1;
            return;
        end;
    end;
    v52.inputEndedCallback = function(v68) --[[ Line: 353 ]]
        -- upvalues: v52 (copy)
        if v68.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            if v52._inputCount > 0 then
                v52._inputCount = v52._inputCount - 1;
            end;
            if v52._inputCount > 0 then
                return;
            else
                v52._isUserInteracting = false;
                if v52.state.offset < -52 and not v52.state.activated then
                    v52.dispatchRefresh();
                end;
                return;
            end;
        end;
    end;
    v52.statusBarTapCallback = function() --[[ Line: 375 ]]
        -- upvalues: v52 (copy)
        v52.scrollBack();
    end;
    v52.onReloadPage = function() --[[ Line: 379 ]]
        -- upvalues: v52 (copy)
        if v52._isMounted and v52.scrollingFrameRef.current then
            local l_Y_2 = v52.scrollingFrameRef.current.CanvasPosition.Y;
            local v70 = tick();
            if l_Y_2 ~= 0 then
                v52.scrollBack();
                if v70 - v52._lastReloadEventTime < 0.5 then
                    v52.dispatchRefresh();
                end;
            else
                v52.dispatchRefresh();
            end;
            v52._lastReloadEventTime = v70;
        end;
    end;
    v52.onNavigationEventReceived = function(v71) --[[ Line: 399 ]]
        -- upvalues: v52 (copy), l_HttpService_0 (ref)
        local l_parentAppPage_0 = v52.props.parentAppPage;
        local l_currentRoute_0 = v52.props.currentRoute;
        if v71.namespace == "Navigations" and v71.detailType == "Reload" and l_HttpService_0:JSONDecode(v71.detail).appName == l_parentAppPage_0 and #l_currentRoute_0 == 1 then
            v52.onReloadPage();
        end;
    end;
    v52.luaAppReloadPageEventConnection = v19.ReloadPage:connect(function(v74) --[[ Line: 412 ]]
        -- upvalues: v52 (copy)
        local l_parentAppPage_1 = v52.props.parentAppPage;
        local l_currentRoute_1 = v52.props.currentRoute;
        if v74 == l_parentAppPage_1 and #l_currentRoute_1 == 1 then
            v52.onReloadPage();
        end;
    end);
    v52.updateIsScrollable = function() --[[ Line: 421 ]]
        -- upvalues: v52 (copy)
        if v52.scrollingFrameRef.current and v52.contentFrameRef and v52.contentFrameRef.current then
            local l_Y_3 = v52.scrollingFrameRef.current.AbsoluteSize.Y;
            local l_Y_4 = v52.contentFrameRef.current.AbsoluteSize.Y;
            local v79 = l_Y_3 < l_Y_4;
            if l_Y_3 >= 0 and l_Y_4 >= 0 and v79 ~= v52.state.isScrollable then
                v52:setState({
                    isScrollable = v79
                });
            end;
        end;
    end;
    v52.onCanvasSizeChanged = function(v80) --[[ Line: 439 ]]
        -- upvalues: v52 (copy)
        if v52.props.onCanvasSizeChangedCallback ~= nil then
            v52.props.onCanvasSizeChangedCallback(v80);
        end;
    end;
end;
v46.render = function(v81) --[[ Line: 446 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v8 (copy), v18 (copy), v45 (copy), v17 (copy), v21 (copy), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v20 (copy), v12 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_withStyle_0 (copy)
    local v82 = nil;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        v82 = v81.props.Position or UDim2.new(0, 0, 0, 0);
        if v81.props.shouldExtendIntoSafeArea.left then
            v82 = v82 + UDim2.fromOffset(-v81.props.deviceSafePadding.left, 0);
        end;
        if v81.props.shouldExtendIntoSafeArea.top then
            v82 = v82 + UDim2.fromOffset(0, -v81.props.deviceSafePadding.top);
        end;
    end;
    local l_Size_0 = v81.props.Size;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        if v81.props.shouldExtendIntoSafeArea.left then
            l_Size_0 = l_Size_0 + UDim2.new(0, v81.props.deviceSafePadding.left, 0, 0);
        end;
        if v81.props.shouldExtendIntoSafeArea.top then
            l_Size_0 = l_Size_0 + UDim2.new(0, 0, 0, v81.props.deviceSafePadding.top);
        end;
        if v81.props.shouldExtendIntoSafeArea.right then
            l_Size_0 = l_Size_0 + UDim2.new(0, v81.props.deviceSafePadding.right, 0, 0);
        end;
        if v81.props.shouldExtendIntoSafeArea.bottom then
            l_Size_0 = l_Size_0 + UDim2.new(0, 0, 0, v81.props.deviceSafePadding.bottom);
        end;
    end;
    local l_BackgroundColor3_0 = v81.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v81.props.BackgroundTransparency;
    local l_ScrollBarImageColor3_0 = v81.props.ScrollBarImageColor3;
    local v87 = v81.props.ScrollBarThickness or 0;
    local v88 = v81.props.ScrollBarImageTransparency or 0;
    local v89 = if l_FFlagAppIaScrollAway_0 then v81.props.canvasTopPadding else nil;
    local v90 = if l_FFlagLuaAppLayoutParamsInContext_0 then v81.props.canvasSidePadding else nil;
    local v91 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v82.Y.Offset else v81.props.Position.Y.Offset;
    local l_NotificationService_0 = v81.props.NotificationService;
    local l_createFooter_0 = v81.props.createFooter;
    local l_useAutomaticSizeContentFrame_0 = v81.props.useAutomaticSizeContentFrame;
    local l_activated_1 = v81.state.activated;
    local l_tween_1 = v81.state.tween;
    local l_offset_1 = v81.state.offset;
    local v98 = v81.state.isScrollable and v81.props.createEndOfScrollElement;
    local v99 = l_activated_1 or l_tween_1 or v81._isUserInteracting;
    if l_activated_1 then
        if l_offset_1 > 0 and l_offset_1 < 52 then
            v91 = v91 - l_offset_1 + 52;
        elseif l_offset_1 <= 0 then
            v91 = v91 + 52;
        end;
    end;
    local function v106(v100, v101, v102, v103) --[[ Line: 501 ]] --[[ Name: renderRSF ]]
        -- upvalues: v8 (ref), v81 (copy), v18 (ref), v91 (ref), l_FFlagAppIaScrollAway_0 (ref), v89 (copy), v99 (copy), v45 (ref), v17 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v82 (ref), l_Size_0 (ref), v87 (copy), v88 (copy), v21 (ref), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v90 (copy), v98 (copy), l_useAutomaticSizeContentFrame_0 (copy), l_createFooter_0 (copy), v20 (ref), v12 (ref), l_RunService_0 (ref), l_UserInputService_0 (ref), l_NotificationService_0 (copy)
        return v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v100, 
            BackgroundTransparency = v101, 
            [v8.Change.AbsoluteSize] = v81.props.onAbsoluteSizeChangedCallback
        }, {
            layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            spinnerFrame = v8.createElement(v18.SimpleMotion, {
                style = {
                    sizeY = v18.spring(v91, 150, 18, 2)
                }, 
                render = function(v104) --[[ Line: 518 ]] --[[ Name: render ]]
                    -- upvalues: v81 (ref), v91 (ref), l_FFlagAppIaScrollAway_0 (ref), v89 (ref), v8 (ref), v99 (ref), v45 (ref), v102 (copy)
                    local v105 = v81.state.tween and v104.sizeY or v91;
                    if l_FFlagAppIaScrollAway_0 and v89 > 0 then
                        v105 = v105 + v89;
                    end;
                    return v8.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v104.sizeY), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        spinner = v99 and v45({
                            Position = UDim2.new(0, 0, 0, v105), 
                            ImageColor3 = v102, 
                            offset = v81.state.offset, 
                            activated = v81.state.activated, 
                            timer = v81.state.timer, 
                            tween = v81.state.tween
                        })
                    });
                end
            }), 
            scrollingFrame = v8.createElement(v17.FitScrollingFrame, {
                Position = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v82 else nil, 
                Size = l_Size_0, 
                CanvasPosition = v81.props.canvasPosition, 
                ScrollBarThickness = v87, 
                ScrollBarImageColor3 = v103, 
                ScrollBarImageTransparency = v88, 
                Selectable = if v21 then v81.props.Selectable else nil, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                ScrollingEnabled = v81.props.ScrollingEnabled, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                fitFields = v81.fitFieldCanvasSize, 
                AutomaticCanvasSize = if l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 then v81.props.AutomaticCanvasSize else nil, 
                [v8.Ref] = v81.setScrollingFrameRef, 
                [v8.Change.CanvasPosition] = v81.onCanvasPositionChanged, 
                [v8.Change.CanvasSize] = v81.onCanvasSizeChanged, 
                [v8.Change.AbsoluteWindowSize] = v81.props.onAbsoluteWindowSizeChangedCallback, 
                [v8.Event.SelectionChanged] = v81.props.onSelectionChanged
            }, {
                Layout = v8.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    [v8.Change.AbsoluteContentSize] = if l_FFlagSearchOmniAutocompletePage_0 then v81.props.onAbsoluteContentSizeChanged else nil
                }), 
                UIPadding = if not ((not l_FFlagAppIaScrollAway_0 or v89 <= 0) and (not l_FFlagLuaAppLayoutParamsInContext_0 or v90 <= 0)) or l_FFlagExtendScrollingFramesBySafeInsets_0 then v8.createElement("UIPadding", {
                    PaddingTop = if not not l_FFlagAppIaScrollAway_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v89 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v81.props.shouldExtendIntoSafeArea.top and v81.props.deviceSafePadding.top or 0)) else nil, 
                    PaddingLeft = if not not l_FFlagLuaAppLayoutParamsInContext_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v90 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v81.props.shouldExtendIntoSafeArea.left and v81.props.deviceSafePadding.left or 0)) else nil, 
                    PaddingRight = if not not l_FFlagLuaAppLayoutParamsInContext_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v90 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v81.props.shouldExtendIntoSafeArea.right and v81.props.deviceSafePadding.right or 0)) else nil, 
                    PaddingBottom = if not l_FFlagExtendScrollingFramesBySafeInsets_0 or v98 then nil else UDim.new(0, v81.props.shouldExtendIntoSafeArea.bottom and v81.props.deviceSafePadding.bottom or 0)
                }) else nil, 
                Content = v8.createElement(l_useAutomaticSizeContentFrame_0 and "Frame" or v17.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Size = if l_useAutomaticSizeContentFrame_0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                    fitFields = if l_useAutomaticSizeContentFrame_0 then nil else {
                        Size = v17.FitAxis.Height
                    }, 
                    AutomaticSize = if l_useAutomaticSizeContentFrame_0 then Enum.AutomaticSize.Y else nil, 
                    [v8.Ref] = v81.setContentFrameRef, 
                    [v8.Change.AbsoluteSize] = function() --[[ Line: 633 ]]
                        -- upvalues: v81 (ref)
                        spawn(v81.updateIsScrollable);
                    end
                }, v81.props[v8.Children]), 
                Footer = l_createFooter_0 and v8.createElement(v17.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    fitFields = {
                        Size = v17.FitAxis.Height
                    }, 
                    LayoutOrder = 2
                }, {
                    FooterContent = l_createFooter_0()
                }), 
                EndOfScroll = v98 and v8.createElement(v20, {
                    bottomPadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v81.props.bottomPadding + (v81.props.shouldExtendIntoSafeArea.bottom and v81.props.deviceSafePadding.bottom or 0) else v81.props.bottomPadding, 
                    backToTopCallback = v81.scrollBack, 
                    LayoutOrder = 3
                })
            }), 
            renderStepped = v8.createElement(v12, {
                event = l_RunService_0.renderStepped, 
                callback = v81.renderSteppedCallback
            }), 
            inputBegan = v8.createElement(v12, {
                event = l_UserInputService_0.InputBegan, 
                callback = v81.inputBeganCallback
            }), 
            inputEnded = v8.createElement(v12, {
                event = l_UserInputService_0.InputEnded, 
                callback = v81.inputEndedCallback
            }), 
            statusBarTapped = not _G.__TESTEZ_RUNNING_TEST__ and v8.createElement(v12, {
                event = l_UserInputService_0.StatusBarTapped, 
                callback = v81.statusBarTapCallback
            }), 
            bottomBarButtonPressed = v8.createElement(v12, {
                event = l_NotificationService_0.RobloxEventReceived, 
                callback = v81.onNavigationEventReceived
            })
        });
    end;
    return l_withStyle_0(function(v107) --[[ Line: 681 ]]
        -- upvalues: v106 (copy), l_BackgroundColor3_0 (copy), l_BackgroundTransparency_0 (copy), l_ScrollBarImageColor3_0 (copy)
        return v106(l_BackgroundColor3_0 or v107.Theme.BackgroundDefault.Color, l_BackgroundTransparency_0 or v107.Theme.BackgroundDefault.Transparency, v107.Theme.IconEmphasis.Color, l_ScrollBarImageColor3_0 or v107.Theme.UIEmphasis.Color);
    end);
end;
v46 = v9.connect(function(v108, _) --[[ Line: 691 ]]
    return {
        currentRoute = v108.Navigation.history[#v108.Navigation.history]
    };
end)(v46);
v46 = l_RoactServices_0.connect({
    NotificationService = l_AppNotificationService_0
})(v46);
return v8.forwardRef(function(v110, v111) --[[ Line: 701 ]]
    -- upvalues: v13 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v15 (copy), v8 (copy), v46 (ref), v28 (copy)
    local v112 = v13.useLastInput() == v13.Input.Directional;
    local v113 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v15.GetDisplayStore().getDeviceSafePadding) else nil;
    return v8.createElement(v46, v28.Dictionary.join(v110, {
        forwardRef = v111, 
        isInputDirectional = v112, 
        deviceSafePadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v113 else nil
    }));
end);