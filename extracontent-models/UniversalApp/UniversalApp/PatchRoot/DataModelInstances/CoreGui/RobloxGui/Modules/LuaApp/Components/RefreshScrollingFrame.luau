local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_TweenService_0 = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local v9 = require(l_Modules_0.Common.Roact);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v14 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v15 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v16 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local v17 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v20 = require(l_Modules_0.LuaApp.FitChildren);
local v21 = require(l_Modules_0.LuaApp.RoactMotion);
local v22 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v23 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v24 = game:DefineFastFlag("SetRSFNotSelectable", false);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local v26 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v26.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v26.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 = v26.FFlagLuaAppSduiSeeAllLayoutParamsFix;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = v26.FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagLuaAppCompositionSupport_0 = v26.FFlagLuaAppCompositionSupport;
local v32 = require(l_CorePackages_0.Packages.Cryo);
local v33 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v33.Style.withStyle;
local l_getIconSize_0 = v33.App.ImageSet.getIconSize;
local l_Images_0 = v33.App.ImageSet.Images;
local l_ImageSetLabel_0 = v33.Core.ImageSet.ImageSetLabel;
local v38 = l_getIconSize_0(v33.App.ImageSet.Enum.IconSize.Medium);
local function v49(v39) --[[ Line: 95 ]] --[[ Name: Spinner ]]
    -- upvalues: v9 (copy), l_ImageSetLabel_0 (copy), v38 (copy), l_Images_0 (copy)
    local l_activated_0 = v39.activated;
    local l_offset_0 = v39.offset;
    local l_Position_0 = v39.Position;
    local l_timer_0 = v39.timer;
    local l_tween_0 = v39.tween;
    local v45 = 0;
    local v46 = 1;
    local v47 = 0;
    if l_offset_0 > 0 then
        return;
    else
        if l_activated_0 then
            v45 = l_timer_0 * 540;
            l_offset_0 = 0;
        elseif l_tween_0 then
            l_offset_0 = 0;
            v47 = 2 * l_timer_0;
        elseif l_offset_0 > -52 then
            l_offset_0 = -l_offset_0;
            v45 = 9.6 * l_offset_0 - 240;
            v47 = 1 - 0.04 * l_offset_0;
        else
            v46 = 1;
            l_offset_0 = 52;
        end;
        local l_ImageColor3_0 = v39.ImageColor3;
        return v9.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v38 * v46, 0, v38 * v46), 
            Position = l_Position_0 + UDim2.new(0.5, 0, 0, l_offset_0 - v38 / 2), 
            ImageTransparency = v47, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = l_ImageColor3_0, 
            BackgroundTransparency = 1, 
            Rotation = v45, 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
local v50 = v9.Component:extend("RefreshScrollingFrame");
v50.defaultProps = {
    preloadDistance = 2000, 
    createEndOfScrollElement = false, 
    Selectable = not v24 and nil, 
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
v50.startTweenBack = function(v51) --[[ Line: 158 ]] --[[ Name: startTweenBack ]]
    v51:setState({
        activated = false, 
        tween = true, 
        timer = 0, 
        offset = 0
    });
end;
v50.startSpin = function(v52) --[[ Line: 168 ]] --[[ Name: startSpin ]]
    v52:setState({
        activated = true, 
        tween = false, 
        timer = 0
    });
end;
v50.startTween = function(v53) --[[ Line: 177 ]] --[[ Name: startTween ]]
    v53:setState({
        activated = true, 
        tween = true, 
        timer = 0
    });
end;
v50.didMount = function(v54) --[[ Line: 186 ]] --[[ Name: didMount ]]
    v54._isMounted = true;
    v54.updateIsScrollable();
end;
v50.willUnmount = function(v55) --[[ Line: 192 ]] --[[ Name: willUnmount ]]
    v55._isMounted = false;
    if v55.luaAppReloadPageEventConnection ~= nil then
        v55.luaAppReloadPageEventConnection:disconnect();
        v55.luaAppReloadPageEventConnection = nil;
    end;
end;
v50.init = function(v56) --[[ Line: 201 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v9 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_TweenService_0 (copy), l_GuiService_0 (copy), l_UserGameSettings_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v16 (copy), l_HttpService_0 (copy), v22 (copy)
    v56._inputCount = 0;
    v56._isMounted = false;
    v56._isUserInteracting = false;
    v56._isRefreshing = false;
    v56._lastReloadEventTime = tick();
    v56.state = {
        activated = false, 
        tween = false, 
        timer = 0, 
        offset = 0, 
        isScrollable = false
    };
    v56.fitFieldCanvasSize = {
        CanvasSize = v20.FitAxis.Height
    };
    local l_forwardRef_0 = v56.props.forwardRef;
    if type(l_forwardRef_0) == "table" then
        v56.scrollingFrameRef = l_forwardRef_0;
    else
        v56.scrollingFrameRef = v9.createRef();
    end;
    v56.setScrollingFrameRef = function(v58) --[[ Line: 239 ]]
        -- upvalues: v56 (copy), l_forwardRef_0 (copy)
        v56.scrollingFrameRef.current = v58;
        if type(l_forwardRef_0) == "function" then
            l_forwardRef_0(v58);
        end;
    end;
    v56.contentFrameRef = v9.createRef();
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        v56.setContentFrameRef = function(v59) --[[ Line: 248 ]]
            -- upvalues: v56 (copy)
            v56.contentFrameRef.current = v59;
            if v56.props.contentFrameRefCallback then
                v56.props.contentFrameRefCallback(v59);
            end;
        end;
    end;
    v56.scrollBackWithFocus = function(v60) --[[ Line: 256 ]]
        -- upvalues: l_TweenService_0 (ref), l_GuiService_0 (ref)
        local v61 = TweenInfo.new(0.3);
        local v62 = l_TweenService_0:Create(v60, v61, {
            CanvasPosition = Vector2.new(0, 0)
        });
        v62:Play();
        v62.Completed:Connect(function() --[[ Line: 260 ]]
            -- upvalues: l_GuiService_0 (ref), v60 (copy)
            l_GuiService_0:Select(v60);
        end);
    end;
    v56.scrollBack = function() --[[ Line: 265 ]]
        -- upvalues: v56 (copy), l_UserGameSettings_0 (ref)
        if v56.scrollingFrameRef.current then
            if l_UserGameSettings_0.ReducedMotion then
                v56.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
                return;
            elseif v56.props.isInputDirectional then
                v56.scrollBackWithFocus(v56.scrollingFrameRef.current);
                return;
            else
                v56.scrollingFrameRef.current:ScrollToTop();
            end;
        end;
    end;
    v56.dispatchRefresh = function() --[[ Line: 277 ]]
        -- upvalues: v56 (copy)
        local l_refresh_0 = v56.props.refresh;
        if v56._isMounted and v56.scrollingFrameRef.current then
            local l_Y_0 = v56.scrollingFrameRef.current.CanvasPosition.Y;
            if l_refresh_0 and not v56._isRefreshing then
                v56._isRefreshing = true;
                if l_Y_0 < -52 then
                    v56:startSpin();
                else
                    v56:startTween();
                end;
                l_refresh_0():andThen(function() --[[ Line: 294 ]]
                    -- upvalues: v56 (ref)
                    v56._isRefreshing = false;
                    if v56._isMounted then
                        v56:startTweenBack();
                    end;
                end, function() --[[ Line: 299 ]]
                    -- upvalues: v56 (ref)
                    v56._isRefreshing = false;
                    if v56._isMounted then
                        v56:startTweenBack();
                    end;
                end);
            end;
        end;
    end;
    v56.onCanvasPositionChanged = function(v65) --[[ Line: 309 ]]
        -- upvalues: v56 (copy), l_FFlagAppIaScrollAway_0 (ref), v16 (ref)
        local l_refresh_1 = v56.props.refresh;
        local l_onCanvasPositionChangedCallback_0 = v56.props.onCanvasPositionChangedCallback;
        local l_Y_1 = v65.CanvasPosition.Y;
        if l_refresh_1 and l_Y_1 < 52 then
            v56:setState({
                offset = l_Y_1
            });
        end;
        if l_FFlagAppIaScrollAway_0 and v16.getScrollAwayEnabled() and l_Y_1 <= 0 then
            v16.VisibilityControl.show();
        end;
        if l_onCanvasPositionChangedCallback_0 then
            l_onCanvasPositionChangedCallback_0(v65);
        end;
    end;
    v56.renderSteppedCallback = function(v69) --[[ Line: 335 ]]
        -- upvalues: v56 (copy)
        if v56.state.activated or v56.state.tween then
            local v70 = {
                timer = v56.state.timer + v69
            };
            if v56.state.tween and v56.state.timer > 0.5 then
                v70.tween = false;
            end;
            v56:setState(v70);
        end;
    end;
    v56.inputBeganCallback = function(v71) --[[ Line: 347 ]]
        -- upvalues: v56 (copy)
        if v71.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v56._isUserInteracting = true;
            v56._inputCount = v56._inputCount + 1;
            return;
        end;
    end;
    v56.inputEndedCallback = function(v72) --[[ Line: 357 ]]
        -- upvalues: v56 (copy)
        if v72.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            if v56._inputCount > 0 then
                v56._inputCount = v56._inputCount - 1;
            end;
            if v56._inputCount > 0 then
                return;
            else
                v56._isUserInteracting = false;
                if v56.state.offset < -52 and not v56.state.activated then
                    v56.dispatchRefresh();
                end;
                return;
            end;
        end;
    end;
    v56.statusBarTapCallback = function() --[[ Line: 379 ]]
        -- upvalues: v56 (copy)
        v56.scrollBack();
    end;
    v56.onReloadPage = function() --[[ Line: 383 ]]
        -- upvalues: v56 (copy)
        if v56._isMounted and v56.scrollingFrameRef.current then
            local l_Y_2 = v56.scrollingFrameRef.current.CanvasPosition.Y;
            local v74 = tick();
            if l_Y_2 ~= 0 then
                v56.scrollBack();
                if v74 - v56._lastReloadEventTime < 0.5 then
                    v56.dispatchRefresh();
                end;
            else
                v56.dispatchRefresh();
            end;
            v56._lastReloadEventTime = v74;
        end;
    end;
    v56.onNavigationEventReceived = function(v75) --[[ Line: 403 ]]
        -- upvalues: v56 (copy), l_HttpService_0 (ref)
        local l_parentAppPage_0 = v56.props.parentAppPage;
        local l_currentRoute_0 = v56.props.currentRoute;
        if v75.namespace == "Navigations" and v75.detailType == "Reload" and l_HttpService_0:JSONDecode(v75.detail).appName == l_parentAppPage_0 and #l_currentRoute_0 == 1 then
            v56.onReloadPage();
        end;
    end;
    v56.luaAppReloadPageEventConnection = v22.ReloadPage:connect(function(v78) --[[ Line: 416 ]]
        -- upvalues: v56 (copy)
        local l_parentAppPage_1 = v56.props.parentAppPage;
        local l_currentRoute_1 = v56.props.currentRoute;
        if v78 == l_parentAppPage_1 and #l_currentRoute_1 == 1 then
            v56.onReloadPage();
        end;
    end);
    v56.updateIsScrollable = function() --[[ Line: 425 ]]
        -- upvalues: v56 (copy)
        if v56.scrollingFrameRef.current and v56.contentFrameRef and v56.contentFrameRef.current then
            local l_Y_3 = v56.scrollingFrameRef.current.AbsoluteSize.Y;
            local l_Y_4 = v56.contentFrameRef.current.AbsoluteSize.Y;
            local v83 = l_Y_3 < l_Y_4;
            if l_Y_3 >= 0 and l_Y_4 >= 0 and v83 ~= v56.state.isScrollable then
                v56:setState({
                    isScrollable = v83
                });
            end;
        end;
    end;
    v56.onCanvasSizeChanged = function(v84) --[[ Line: 443 ]]
        -- upvalues: v56 (copy)
        if v56.props.onCanvasSizeChangedCallback ~= nil then
            v56.props.onCanvasSizeChangedCallback(v84);
        end;
    end;
end;
v50.render = function(v85) --[[ Line: 450 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v9 (copy), v21 (copy), v49 (copy), v20 (copy), v24 (copy), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v10 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v23 (copy), v14 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_withStyle_0 (copy)
    local v86 = nil;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        v86 = v85.props.Position or UDim2.new(0, 0, 0, 0);
        if v85.props.shouldExtendIntoSafeArea.left then
            v86 = v86 + UDim2.fromOffset(-v85.props.deviceSafePadding.left, 0);
        end;
        if v85.props.shouldExtendIntoSafeArea.top then
            v86 = v86 + UDim2.fromOffset(0, -v85.props.deviceSafePadding.top);
        end;
    end;
    local l_Size_0 = v85.props.Size;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        if v85.props.shouldExtendIntoSafeArea.left then
            l_Size_0 = l_Size_0 + UDim2.new(0, v85.props.deviceSafePadding.left, 0, 0);
        end;
        if v85.props.shouldExtendIntoSafeArea.top then
            l_Size_0 = l_Size_0 + UDim2.new(0, 0, 0, v85.props.deviceSafePadding.top);
        end;
        if v85.props.shouldExtendIntoSafeArea.right then
            l_Size_0 = l_Size_0 + UDim2.new(0, v85.props.deviceSafePadding.right, 0, 0);
        end;
        if v85.props.shouldExtendIntoSafeArea.bottom then
            l_Size_0 = l_Size_0 + UDim2.new(0, 0, 0, v85.props.deviceSafePadding.bottom);
        end;
    end;
    local l_BackgroundColor3_0 = v85.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v85.props.BackgroundTransparency;
    local l_ScrollBarImageColor3_0 = v85.props.ScrollBarImageColor3;
    local v91 = v85.props.ScrollBarThickness or 0;
    local v92 = v85.props.ScrollBarImageTransparency or 0;
    local v93 = if l_FFlagAppIaScrollAway_0 then v85.props.canvasTopPadding else nil;
    local v94 = if l_FFlagLuaAppLayoutParamsInContext_0 then v85.props.canvasSidePadding else nil;
    local v95 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v86.Y.Offset else v85.props.Position.Y.Offset;
    local l_NotificationService_0 = v85.props.NotificationService;
    local l_createFooter_0 = v85.props.createFooter;
    local l_useAutomaticSizeContentFrame_0 = v85.props.useAutomaticSizeContentFrame;
    local l_activated_1 = v85.state.activated;
    local l_tween_1 = v85.state.tween;
    local l_offset_1 = v85.state.offset;
    local v102 = v85.state.isScrollable and v85.props.createEndOfScrollElement;
    local v103 = l_activated_1 or l_tween_1 or v85._isUserInteracting;
    if l_activated_1 then
        if l_offset_1 > 0 and l_offset_1 < 52 then
            v95 = v95 - l_offset_1 + 52;
        elseif l_offset_1 <= 0 then
            v95 = v95 + 52;
        end;
    end;
    local function v110(v104, v105, v106, v107) --[[ Line: 505 ]] --[[ Name: renderRSF ]]
        -- upvalues: v9 (ref), v85 (copy), v21 (ref), v95 (ref), l_FFlagAppIaScrollAway_0 (ref), v93 (copy), v103 (copy), v49 (ref), v20 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v86 (ref), l_Size_0 (ref), v91 (copy), v92 (copy), v24 (ref), l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v94 (copy), v102 (copy), l_useAutomaticSizeContentFrame_0 (copy), v10 (ref), l_FFlagLuaAppCompositionSupport_0 (ref), l_createFooter_0 (copy), v23 (ref), v14 (ref), l_RunService_0 (ref), l_UserInputService_0 (ref), l_NotificationService_0 (copy)
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v104, 
            BackgroundTransparency = v105, 
            [v9.Change.AbsoluteSize] = v85.props.onAbsoluteSizeChangedCallback
        }, {
            layout = v9.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            spinnerFrame = v9.createElement(v21.SimpleMotion, {
                style = {
                    sizeY = v21.spring(v95, 150, 18, 2)
                }, 
                render = function(v108) --[[ Line: 522 ]] --[[ Name: render ]]
                    -- upvalues: v85 (ref), v95 (ref), l_FFlagAppIaScrollAway_0 (ref), v93 (ref), v9 (ref), v103 (ref), v49 (ref), v106 (copy)
                    local v109 = v85.state.tween and v108.sizeY or v95;
                    if l_FFlagAppIaScrollAway_0 and v93 > 0 then
                        v109 = v109 + v93;
                    end;
                    return v9.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v108.sizeY), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        spinner = v103 and v49({
                            Position = UDim2.new(0, 0, 0, v109), 
                            ImageColor3 = v106, 
                            offset = v85.state.offset, 
                            activated = v85.state.activated, 
                            timer = v85.state.timer, 
                            tween = v85.state.tween
                        })
                    });
                end
            }), 
            scrollingFrame = v9.createElement(v20.FitScrollingFrame, {
                Position = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v86 else nil, 
                Size = l_Size_0, 
                CanvasPosition = v85.props.canvasPosition, 
                ScrollBarThickness = v91, 
                ScrollBarImageColor3 = v107, 
                ScrollBarImageTransparency = v92, 
                Selectable = if v24 then v85.props.Selectable else nil, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                ScrollingEnabled = v85.props.ScrollingEnabled, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                fitFields = v85.fitFieldCanvasSize, 
                AutomaticCanvasSize = if l_FFlagLuaAppSduiSeeAllLayoutParamsFix_0 then v85.props.AutomaticCanvasSize else nil, 
                [v9.Ref] = v85.setScrollingFrameRef, 
                [v9.Change.CanvasPosition] = v85.onCanvasPositionChanged, 
                [v9.Change.CanvasSize] = v85.onCanvasSizeChanged, 
                [v9.Change.AbsoluteWindowSize] = v85.props.onAbsoluteWindowSizeChangedCallback, 
                [v9.Event.SelectionChanged] = v85.props.onSelectionChanged
            }, {
                Layout = v9.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    [v9.Change.AbsoluteContentSize] = if l_FFlagSearchOmniAutocompletePage_0 then v85.props.onAbsoluteContentSizeChanged else nil
                }), 
                UIPadding = if not ((not l_FFlagAppIaScrollAway_0 or v93 <= 0) and (not l_FFlagLuaAppLayoutParamsInContext_0 or v94 <= 0)) or l_FFlagExtendScrollingFramesBySafeInsets_0 then v9.createElement("UIPadding", {
                    PaddingTop = if not not l_FFlagAppIaScrollAway_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v93 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v85.props.shouldExtendIntoSafeArea.top and v85.props.deviceSafePadding.top or 0)) else nil, 
                    PaddingLeft = if not not l_FFlagLuaAppLayoutParamsInContext_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v94 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v85.props.shouldExtendIntoSafeArea.left and v85.props.deviceSafePadding.left or 0)) else nil, 
                    PaddingRight = if not not l_FFlagLuaAppLayoutParamsInContext_0 or l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim.new(0, v94 + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v85.props.shouldExtendIntoSafeArea.right and v85.props.deviceSafePadding.right or 0)) else nil, 
                    PaddingBottom = if not l_FFlagExtendScrollingFramesBySafeInsets_0 or v102 then nil else UDim.new(0, v85.props.shouldExtendIntoSafeArea.bottom and v85.props.deviceSafePadding.bottom or 0)
                }) else nil, 
                Content = v9.createElement(l_useAutomaticSizeContentFrame_0 and "Frame" or v20.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    [v10.Tag] = if l_FFlagLuaAppCompositionSupport_0 then v85.props.contentTag else nil, 
                    Size = if l_useAutomaticSizeContentFrame_0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                    fitFields = if l_useAutomaticSizeContentFrame_0 then nil else {
                        Size = v20.FitAxis.Height
                    }, 
                    AutomaticSize = if l_useAutomaticSizeContentFrame_0 then Enum.AutomaticSize.Y else nil, 
                    [v9.Ref] = v85.setContentFrameRef, 
                    [v9.Change.AbsoluteSize] = function() --[[ Line: 638 ]]
                        -- upvalues: v85 (ref)
                        spawn(v85.updateIsScrollable);
                    end
                }, v85.props[v9.Children]), 
                Footer = l_createFooter_0 and v9.createElement(v20.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    fitFields = {
                        Size = v20.FitAxis.Height
                    }, 
                    LayoutOrder = 2
                }, {
                    FooterContent = l_createFooter_0()
                }), 
                EndOfScroll = v102 and v9.createElement(v23, {
                    bottomPadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v85.props.bottomPadding + (v85.props.shouldExtendIntoSafeArea.bottom and v85.props.deviceSafePadding.bottom or 0) else v85.props.bottomPadding, 
                    backToTopCallback = v85.scrollBack, 
                    LayoutOrder = 3
                })
            }), 
            renderStepped = v9.createElement(v14, {
                event = l_RunService_0.renderStepped, 
                callback = v85.renderSteppedCallback
            }), 
            inputBegan = v9.createElement(v14, {
                event = l_UserInputService_0.InputBegan, 
                callback = v85.inputBeganCallback
            }), 
            inputEnded = v9.createElement(v14, {
                event = l_UserInputService_0.InputEnded, 
                callback = v85.inputEndedCallback
            }), 
            statusBarTapped = not _G.__TESTEZ_RUNNING_TEST__ and v9.createElement(v14, {
                event = l_UserInputService_0.StatusBarTapped, 
                callback = v85.statusBarTapCallback
            }), 
            bottomBarButtonPressed = v9.createElement(v14, {
                event = l_NotificationService_0.RobloxEventReceived, 
                callback = v85.onNavigationEventReceived
            })
        });
    end;
    return l_withStyle_0(function(v111) --[[ Line: 686 ]]
        -- upvalues: v110 (copy), l_BackgroundColor3_0 (copy), l_BackgroundTransparency_0 (copy), l_ScrollBarImageColor3_0 (copy)
        return v110(l_BackgroundColor3_0 or v111.Theme.BackgroundDefault.Color, l_BackgroundTransparency_0 or v111.Theme.BackgroundDefault.Transparency, v111.Theme.IconEmphasis.Color, l_ScrollBarImageColor3_0 or v111.Theme.UIEmphasis.Color);
    end);
end;
v50 = v11.connect(function(v112, _) --[[ Line: 696 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v112) else v112.Navigation.history[#v112.Navigation.history]
    };
end)(v50);
v50 = l_RoactServices_0.connect({
    NotificationService = l_AppNotificationService_0
})(v50);
return v9.forwardRef(function(v114, v115) --[[ Line: 708 ]]
    -- upvalues: v15 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v17 (copy), v9 (copy), v50 (ref), v32 (copy)
    local v116 = v15.useLastInput() == v15.Input.Directional;
    local v117 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v17.GetDisplayStore().getDeviceSafePadding) else nil;
    return v9.createElement(v50, v32.Dictionary.join(v114, {
        forwardRef = v115, 
        isInputDirectional = v116, 
        deviceSafePadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v117 else nil
    }));
end);