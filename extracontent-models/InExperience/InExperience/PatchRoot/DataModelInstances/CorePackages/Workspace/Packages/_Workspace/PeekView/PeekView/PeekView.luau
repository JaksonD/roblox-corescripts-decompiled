local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RunService_0 = game:GetService("RunService");
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.UIBlox);
local v10 = require(l_Parent_0.RoactGamepad);
local l_Focusable_0 = v10.Focusable;
local v12 = require(l_Parent_0.RoactRodux);
local v13 = require(script.Parent.PeekViewState);
local v14 = require(script.Parent.Scrim);
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local v18 = require(l_Parent_0.ArgCheck);
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local l_GamepadUtils_0 = require(l_Parent_0.InputUi).Gamepad.GamepadUtils;
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
local v22 = require(script.Parent.analytics.peekViewDismissedEvent);
local v23 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_switchAccountScrimError_0 = require(l_Parent_0.UiShellEvents).switchAccountScrimError;
local v25 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v25.FocusNavigableSurfaceWrapper;
local v27 = require(script.Parent.usePeekViewFocusNavigationBindings);
local l_GetFFlagEnablePeekViewStateOnMountParam_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePeekViewStateOnMountParam;
local l_GetFIntPeekViewTransitionDelayTiming_0 = require(l_Parent_0.SharedFlags).GetFIntPeekViewTransitionDelayTiming;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v31 = game:DefineFastFlag("EnableFastScrollingFixTest", false);
local l_FFlagEnablePeekViewFocusNav_0 = require(l_Parent_0.SharedFlags).FFlagEnablePeekViewFocusNav;
local l_GetFFlagPreventSuperBriefPeekViewClose_0 = require(l_Parent_0.SharedFlags).GetFFlagPreventSuperBriefPeekViewClose;
local v34 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigratePeekViewToFocusNavigation", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_Parent_0.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local l_FFlagAXFixManageOutfitPageFocusLostBehind_0 = require(l_Parent_0.SharedFlags).FFlagAXFixManageOutfitPageFocusLostBehind;
local v38 = Rect.new(9, 9, 9, 9);
local v39 = l_Images_0["icons/navigation/swipe"];
local v40 = 0.1 * l_GetFIntPeekViewTransitionDelayTiming_0();
local l_Hidden_0 = v13.Hidden;
local l_Closed_0 = v13.Closed;
local l_SuperBrief_0 = v13.SuperBrief;
local l_Brief_0 = v13.Brief;
local l_Full_0 = v13.Full;
local l_Extended_0 = v13.Extended;
local v47 = v8.PureComponent:extend("PeekView");
v47.defaultProps = {
    superBriefViewContentHeight = nil, 
    briefViewContentHeight = UDim.new(0.5, 0), 
    fullViewContentHeight = if not v34 then UDim.new(1, 0) else nil, 
    bottomDockedContainerHeight = 0, 
    bottomDockedContainerContent = nil, 
    elasticBehavior = Enum.ElasticBehavior.Always, 
    hidden = false, 
    showDraggerInClosedState = true, 
    showDropShadow = true, 
    stateOnMount = nil, 
    mountAsFullView = false, 
    mountAnimation = true, 
    canDragFullViewToBrief = false, 
    withNewThemeProvider = true, 
    viewStateChanged = nil, 
    briefToFullTransitionPercent = nil, 
    peekHeaderClose = true, 
    peekHeaderPositionYChange = nil, 
    isScrollingEnabled = true, 
    closeSignal = nil, 
    hideDraggerInSuperBrief = false, 
    minimizeToSuperBrief = false, 
    customBackground = nil, 
    shouldCaptureFocus = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
    hasSolidDragger = true
};
v47.init = function(v48) --[[ Line: 142 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Hidden_0 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy), v8 (copy), v9 (copy), l_Closed_0 (copy), l_SuperBrief_0 (copy), l_Brief_0 (copy), l_Full_0 (copy), v34 (copy), l_switchAccountScrimError_0 (copy), v23 (copy), v31 (copy), l_GetFFlagPreventSuperBriefPeekViewClose_0 (copy), v13 (copy), l_InputTypeConstants_0 (copy), v22 (copy), l_Extended_0 (copy), v18 (copy), l_RunService_0 (copy), v40 (copy), l_GuiService_0 (copy)
    v48.isMounted = false;
    v48.isTouched = false;
    v48.isInGoToState = false;
    v48.useReducedMotion = l_UserGameSettings_0.ReducedMotion;
    v48.viewType = l_Hidden_0;
    v48:setState({
        scrollableViewType = false, 
        absoluteWindowSizeX = 0, 
        absoluteWindowSizeY = 0, 
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType()), 
        canvasGroupTransparency = 0
    });
    v48.containerFrameRef = v8.createRef();
    v48.clipFrameRef = v8.createRef();
    v48.shadowRef = v8.createRef();
    v48.fillingAreaRef = v8.createRef();
    v48.swipeScrollingFrameRef = v8.createRef();
    v48.bottomContainerRef = v8.createRef();
    local v49, v50 = v8.createBinding(0);
    v48.transitionPercent = v49;
    v48.setTransitionPercent = v50;
    v48.onAbsoluteWindowSizeChanged = function(v51) --[[ Line: 168 ]]
        -- upvalues: v48 (copy)
        if v51.AbsoluteWindowSize.X ~= v48.state.absoluteWindowSizeX or v51.AbsoluteWindowSize.Y ~= v48.state.absoluteWindowSizeY then
            v48:setState({
                absoluteWindowSizeX = v51.AbsoluteWindowSize.X, 
                absoluteWindowSizeY = v51.AbsoluteWindowSize.Y
            });
        end;
    end;
    v48.withStyle = function(v52) --[[ Line: 180 ]]
        -- upvalues: v48 (copy), v9 (ref)
        if v48.props.withNewThemeProvider then
            return v9.Style.withStyle(v52);
        else
            return v52({
                Theme = {
                    BackgroundDefault = {
                        Color = Color3.fromRGB(35, 37, 39), 
                        Transparency = 0
                    }, 
                    UIEmphasis = {
                        Color = Color3.fromRGB(255, 255, 255), 
                        Transparency = 0.7
                    }, 
                    DropShadow = {
                        Color = Color3.fromRGB(0, 0, 0), 
                        Transparency = 0
                    }
                }, 
                Settings = {
                    ReducedMotion = false
                }
            });
        end;
    end;
    v48.inputBeganCallback = function(v53) --[[ Line: 206 ]]
        -- upvalues: v48 (copy)
        if not v48.isMounted then
            return;
        elseif v53.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v48.isTouched = true;
            return;
        end;
    end;
    v48.inputEndedCallback = function(v54) --[[ Line: 218 ]]
        -- upvalues: v48 (copy)
        if not v48.isMounted then
            return;
        elseif v54.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v48.isTouched = false;
            v48.checkGoTo();
            return;
        end;
    end;
    v48.getViewSize = function(v55) --[[ Line: 231 ]]
        -- upvalues: l_Hidden_0 (ref), l_Closed_0 (ref), l_SuperBrief_0 (ref), v48 (copy), l_Brief_0 (ref), l_Full_0 (ref)
        if v55 == l_Hidden_0 then
            return UDim.new(0, 0);
        elseif v55 == l_Closed_0 then
            return UDim.new(0, 0);
        elseif v55 == l_SuperBrief_0 then
            if v48.props.superBriefViewContentHeight then
                local l_superBriefViewContentHeight_0 = v48.props.superBriefViewContentHeight;
                return UDim.new(l_superBriefViewContentHeight_0.Scale, l_superBriefViewContentHeight_0.Offset + 25);
            else
                return UDim.new(0, 0);
            end;
        elseif v55 == l_Brief_0 then
            local l_briefViewContentHeight_0 = v48.props.briefViewContentHeight;
            return UDim.new(l_briefViewContentHeight_0.Scale, l_briefViewContentHeight_0.Offset + 25);
        elseif v55 == l_Full_0 then
            return v48.props.fullViewContentHeight;
        else
            return nil;
        end;
    end;
    v48.hasNilRefs = function() --[[ Line: 256 ]]
        -- upvalues: v34 (ref), v48 (copy)
        local v58 = if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current;
        local v59 = if v34 then v48.props.containerFrameRef.current else v48.containerFrameRef.current;
        local l_current_0 = v48.clipFrameRef.current;
        local l_current_1 = v48.shadowRef.current;
        local l_current_2 = v48.fillingAreaRef.current;
        return not (v58 and v59 and l_current_0 and l_current_1 and l_current_2);
    end;
    v48.reportRefStatus = function(v63, v64, v65, v66, v67, v68) --[[ Line: 270 ]]
        -- upvalues: l_switchAccountScrimError_0 (ref), v23 (ref)
        l_switchAccountScrimError_0(v23, "switchAccountScrimError", {
            callSite = v63, 
            swipeScrollingFrame = v64 and "true" or "nil", 
            containerFrame = v65 and "true" or "nil", 
            clipFrame = v66 and "true" or "nil", 
            shadow = v67 and "true" or "nil", 
            fillingArea = v68 and "true" or "nil"
        });
    end;
    v48.reconcileRbxInstances = function(v69) --[[ Line: 282 ]]
        -- upvalues: v34 (ref), v48 (copy)
        local v70 = if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current;
        local v71 = v70 and v70.CanvasPosition.Y or 0;
        local v72 = if v34 then v48.props.containerFrameRef.current else v48.containerFrameRef.current;
        local l_current_3 = v48.clipFrameRef.current;
        local l_current_4 = v48.shadowRef.current;
        local l_current_5 = v48.fillingAreaRef.current;
        if v48.hasNilRefs() then
            v48.reportRefStatus(v69, v70, v72, l_current_3, l_current_4, l_current_5);
            return;
        else
            local l_X_0 = v72.AbsoluteSize.X;
            local l_Y_0 = v72.AbsoluteSize.Y;
            l_current_3.Size = UDim2.new(0, l_X_0, 0, v71);
            l_current_4.Size = UDim2.new(0, l_X_0, 0, 36);
            l_current_3.Position = UDim2.new(0, 0, 1, -v71);
            l_current_4.Position = UDim2.new(0, 0, 1, -v71 - 30);
            v70.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            v70.Position = UDim2.new(0, 0, 0, -(l_Y_0 - v71));
            l_current_5.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            local l_current_6 = v48.bottomContainerRef.current;
            if l_current_6 then
                local l_bottomDockedContainerHeight_0 = v48.props.bottomDockedContainerHeight;
                if l_current_3.AbsoluteSize.Y > 25 + l_bottomDockedContainerHeight_0 then
                    l_current_6.Active = true;
                    l_current_6.Position = UDim2.new(0, 0, 1, -l_bottomDockedContainerHeight_0);
                else
                    l_current_6.Active = false;
                    l_current_6.Position = UDim2.new(0, 0, 1, -l_current_3.AbsoluteSize.Y + 25);
                end;
            end;
            v48.transitionCallbacks();
            if v48.props.peekHeaderPositionYChange then
                v48.props.peekHeaderPositionYChange(v71);
            end;
            return;
        end;
    end;
    v48.updateSwipeScrollingFrame = function() --[[ Line: 332 ]]
        -- upvalues: v48 (copy), v34 (ref)
        local v80 = v48.getViewSize(v48.viewType);
        local v81 = nil;
        v81 = if v34 then v48.props.containerFrameRef.current and v48.props.swipeScrollingFrameRef.current else v48.containerFrameRef.current and v48.swipeScrollingFrameRef.current;
        if v80 and v81 then
            local l_Y_1 = (if v34 then v48.props.containerFrameRef.current else v48.containerFrameRef.current).AbsoluteSize.Y;
            local v83 = if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current;
            local v84 = l_Y_1 * v80.Scale + v80.Offset;
            if v83.CanvasPosition.Y ~= v84 then
                v83.CanvasPosition = Vector2.new(0, v84);
                if v48.props.peekHeaderPositionYChange then
                    v48.props.peekHeaderPositionYChange(v84);
                end;
            end;
        end;
    end;
    v48.onContainerFrameAbsoluteSizeChanged = function() --[[ Line: 361 ]]
        -- upvalues: v48 (copy)
        if not v48.isMounted then
            return;
        else
            v48.reconcileRbxInstances("onContainerFrameAbsoluteSizeChanged");
            v48.updateSwipeScrollingFrame();
            return;
        end;
    end;
    v48.onSwipeScrollingFrameCanvasPositionChanged = function() --[[ Line: 370 ]]
        -- upvalues: v48 (copy), v34 (ref), v31 (ref), l_GetFFlagPreventSuperBriefPeekViewClose_0 (ref), v13 (ref), l_InputTypeConstants_0 (ref)
        if not v48.isMounted then
            return;
        else
            local v85 = if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current;
            local l_Y_2 = v85.CanvasPosition.Y;
            if l_Y_2 ~= math.floor(l_Y_2) then
                if not v31 then
                    if l_GetFFlagPreventSuperBriefPeekViewClose_0() then
                        local v87 = math.floor(l_Y_2 + 0.5);
                        if v48.viewType == v13.SuperBrief and v48.props.minimizeToSuperBrief then
                            local v88 = v48.getSuperBriefViewY();
                            if v88 ~= nil and v87 ~= nil and v87 < v88 then
                                v87 = v88;
                            end;
                        end;
                        v85.CanvasPosition = Vector2.new(0, v87);
                    else
                        v85.CanvasPosition = Vector2.new(0, (math.floor(l_Y_2 + 0.5)));
                    end;
                end;
                if v48.props.peekHeaderPositionYChange then
                    v48.props.peekHeaderPositionYChange(l_Y_2);
                end;
                if not v31 then
                    return;
                end;
            end;
            v48.reconcileRbxInstances("onSwipeScrollingFrameCanvasPositionChanged");
            if v48.state.lastInputGroup ~= l_InputTypeConstants_0.Gamepad then
                v48.checkGoTo();
            end;
            return;
        end;
    end;
    v48.getBriefViewY = function() --[[ Line: 419 ]]
        -- upvalues: v34 (ref), v48 (copy)
        local v89 = if v34 then v48.props.containerFrameRef.current.AbsoluteSize.Y else v48.containerFrameRef.current.AbsoluteSize.Y;
        local l_briefViewContentHeight_1 = v48.props.briefViewContentHeight;
        return v89 * l_briefViewContentHeight_1.Scale + l_briefViewContentHeight_1.Offset + 25;
    end;
    v48.getSuperBriefViewY = function() --[[ Line: 427 ]]
        -- upvalues: v34 (ref), v48 (copy)
        if v34 then
            if not v48.props.superBriefViewContentHeight or not v48.props.containerFrameRef:getValue() then
                return nil;
            end;
        elseif not v48.props.superBriefViewContentHeight or not v48.containerFrameRef:getValue() then
            return nil;
        end;
        local v91 = if v34 then v48.props.containerFrameRef:getValue().AbsoluteSize.Y else v48.containerFrameRef:getValue().AbsoluteSize.Y;
        local l_superBriefViewContentHeight_1 = v48.props.superBriefViewContentHeight;
        return v91 * l_superBriefViewContentHeight_1.Scale + l_superBriefViewContentHeight_1.Offset + 25;
    end;
    v48.getFullViewY = function() --[[ Line: 445 ]]
        -- upvalues: v48 (copy)
        return v48.containerFrameRef.current.AbsoluteSize.Y * v48.props.fullViewContentHeight.Scale + v48.props.fullViewContentHeight.Offset;
    end;
    v48.transitionCallbacks = function() --[[ Line: 450 ]]
        -- upvalues: v48 (copy), v34 (ref)
        local l_briefToFullTransitionPercent_0 = v48.props.briefToFullTransitionPercent;
        local l_Y_3 = (if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current).CanvasPosition.Y;
        local v95 = v48.getBriefViewY();
        local v96 = if v34 then v48.props.getFullViewY() else v48.getFullViewY();
        local v97 = v96 - v95;
        local v98 = 0;
        if v95 < l_Y_3 and l_Y_3 <= v96 then
            v98 = (l_Y_3 - v95) / v97;
        elseif v96 < l_Y_3 then
            v98 = 1;
        end;
        v48.setTransitionPercent(v98);
        if l_briefToFullTransitionPercent_0 then
            l_briefToFullTransitionPercent_0(v98);
        end;
    end;
    v48.checkGoTo = function() --[[ Line: 487 ]]
        -- upvalues: v48 (copy), v34 (ref), v13 (ref)
        if v48.isInGoToState then
            return;
        elseif v48.isTouched then
            return;
        else
            local v99 = if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current;
            if v99 and v48.state.absoluteWindowSizeX == 0 and v48.state.absoluteWindowSizeY == 0 then
                return;
            else
                local v100 = v48.getBriefViewY();
                local v101 = v48.getSuperBriefViewY();
                local v102 = if v34 then v48.props.getFullViewY() else v48.getFullViewY();
                if v102 < v100 then
                    return;
                elseif v101 and v100 < v101 then
                    return;
                elseif v99.AbsoluteWindowSize.Y + 25 + v48.props.bottomDockedContainerHeight > (v99.AbsoluteCanvasSize.Y or v99.CanvasSize.Y.Offset) then
                    return;
                else
                    local l_Y_4 = v99.ScrollVelocity.Y;
                    local v104 = l_Y_4 < 0;
                    local v105 = l_Y_4 > 0;
                    local l_Y_5 = v99.CanvasPosition.Y;
                    local v107 = false;
                    if v48.viewType == v13.Brief then
                        v107 = l_Y_5 == v100;
                    end;
                    local v108 = false;
                    if v48.viewType == v13.Full then
                        v108 = l_Y_5 == v102;
                    end;
                    if (v107 or v108) and l_Y_4 == 0 then
                        return;
                    elseif v102 < l_Y_5 then
                        v48:handleCurYAboveFullViewY(v104);
                        return;
                    elseif v100 < l_Y_5 and l_Y_5 <= v102 then
                        v48:handleCurYFromBriefToFull(l_Y_5, l_Y_4, v104, v105);
                        return;
                    else
                        if v101 then
                            if v101 < l_Y_5 and l_Y_5 <= v100 then
                                v48:handleCurYFromSuperBriefToBrief(l_Y_5, v101, l_Y_4, v104, v105);
                                return;
                            elseif l_Y_5 <= v101 then
                                v48:handleCurYFromClosedToSuperBrief(l_Y_5, v101, l_Y_4, v105, v104);
                                return;
                            end;
                        elseif l_Y_5 <= v100 then
                            v48:handleCurYFromClosedToBrief(l_Y_5, v105, v104);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    v48.onPeekHeaderActivated = function() --[[ Line: 574 ]]
        -- upvalues: v48 (copy), l_Closed_0 (ref), l_Brief_0 (ref), l_Full_0 (ref), l_SuperBrief_0 (ref), v22 (ref)
        if v48.viewType == l_Closed_0 then
            v48.goTo(l_Brief_0);
            return;
        elseif v48.viewType == l_Brief_0 then
            v48.goTo(l_Full_0);
            return;
        elseif v48.viewType == l_SuperBrief_0 then
            v48.goTo(l_Brief_0);
            return;
        else
            if v48.viewType == l_Full_0 then
                if v48.props.peekHeaderClose then
                    v48.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.handleTap
                    });
                    return;
                else
                    v48.goTo(l_Brief_0);
                end;
            end;
            return;
        end;
    end;
    v48.setViewType = function(v109, v110) --[[ Line: 592 ]]
        -- upvalues: v48 (copy), l_Extended_0 (ref), l_Full_0 (ref)
        if v48.goToAnimationConnection then
            v48.goToAnimationConnection:disconnect();
            v48.goToAnimationConnection = nil;
        end;
        v48.isInGoToState = false;
        v48.clipFrameRef.current.Active = false;
        local l_viewType_0 = v48.viewType;
        if l_viewType_0 ~= v109 then
            v48.viewType = v109;
            local v112 = true;
            if v48.viewType ~= l_Extended_0 then
                v112 = v48.viewType == l_Full_0;
            end;
            v48:setState({
                scrollableViewType = v112
            });
            local l_viewStateChanged_0 = v48.props.viewStateChanged;
            if l_viewStateChanged_0 then
                l_viewStateChanged_0(v109, l_viewType_0, v110 or {});
            end;
        end;
        v48.updateSwipeScrollingFrame();
    end;
    v48.goTo = function(v114, v115, v116, v117) --[[ Line: 620 ]]
        -- upvalues: v48 (copy), v18 (ref), v34 (ref), l_Full_0 (ref), l_Closed_0 (ref), l_RunService_0 (ref), l_Brief_0 (ref), v40 (ref)
        if v48.viewType == v114 then
            return;
        elseif v18.isEqual(v48.isInGoToState, false, "self.isInGoToState") then
            return;
        elseif v18.isEqual(v48.goToAnimationConnection, nil, "self.goToAnimationConnection") then
            return;
        else
            v48.isInGoToState = true;
            if v34 then
                v48.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
            else
                v48.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
            end;
            v48.clipFrameRef.current.Active = true;
            if v115 == false then
                v48.setViewType(v114, v117);
                if v114 == l_Full_0 then
                    v48:adjustScrollingFramePosition();
                    return;
                end;
            else
                local v118 = tick();
                if not v116 then
                    v48:setState({
                        canvasGroupTransparency = v114 == l_Closed_0 and 1 or 0
                    });
                    v48.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 655 ]]
                        -- upvalues: v48 (ref), v118 (copy), v114 (copy), l_Brief_0 (ref), v40 (ref), v34 (ref), v18 (ref), v117 (copy), l_Full_0 (ref)
                        if not v48.isMounted then
                            return;
                        else
                            local v119 = tick() - v118;
                            if v114 ~= l_Brief_0 or v40 <= v119 then
                                if v34 then
                                    v48.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                                else
                                    v48.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                                end;
                                local v120 = if v34 then v48.props.swipeScrollingFrameRef.current else v48.swipeScrollingFrameRef.current;
                                local v121 = if v34 then v48.props.containerFrameRef.current.AbsoluteSize.Y else v48.containerFrameRef.current.AbsoluteSize.Y;
                                local v122 = v18.isNotNil(v48.getViewSize(v114), "self.goTo.viewSize");
                                local v123 = v121 * v122.Scale + v122.Offset;
                                if v114 == l_Brief_0 then
                                    v119 = v119 - v40;
                                end;
                                if v119 >= 0.35 then
                                    v48.setViewType(v114, v117);
                                    if v114 == l_Full_0 then
                                        v48:adjustScrollingFramePosition();
                                    end;
                                    return;
                                else
                                    local l_Y_6 = v120.CanvasPosition.Y;
                                    local v125 = v123 - l_Y_6;
                                    v120.CanvasPosition = Vector2.new(0, l_Y_6 + v125 * math.sin(v119 * 2.468394227820552));
                                end;
                            end;
                            return;
                        end;
                    end);
                    return;
                else
                    if v114 ~= l_Closed_0 then
                        v48.setViewType(v114, v117);
                        if v114 == l_Full_0 then
                            v48:adjustScrollingFramePosition();
                        end;
                    end;
                    v48:setState({
                        canvasGroupTransparency = v114 == l_Closed_0 and 0 or 1
                    });
                    v48.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 708 ]]
                        -- upvalues: v48 (ref), v114 (copy), l_Full_0 (ref), v118 (copy), l_Closed_0 (ref), v117 (copy)
                        if not v48.isMounted then
                            return;
                        else
                            if v114 == l_Full_0 then
                                v48.updateSwipeScrollingFrame();
                            end;
                            local v126 = tick() - v118;
                            if v126 >= 0.35 then
                                v48:setState({
                                    canvasGroupTransparency = v114 == l_Closed_0 and 1 or 0
                                });
                                v48.setViewType(v114, v117);
                                if v114 == l_Full_0 then
                                    v48:adjustScrollingFramePosition();
                                end;
                                return;
                            else
                                v48:setState({
                                    canvasGroupTransparency = if v114 == l_Closed_0 then v126 / 0.35 else 1 - v126 / 0.35
                                });
                                return;
                            end;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end;
    v48.selectedCoreObjectConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function() --[[ Line: 742 ]]
        -- upvalues: v34 (ref), v48 (copy), l_InputTypeConstants_0 (ref)
        if v34 then
            if v48.props.swipeScrollingFrameRef.current and v48.state.lastInputGroup == l_InputTypeConstants_0.Gamepad then
                v48:adjustScrollingFramePosition();
                return;
            end;
        elseif v48.swipeScrollingFrameRef.current and v48.state.lastInputGroup == l_InputTypeConstants_0.Gamepad then
            v48:adjustScrollingFramePosition();
        end;
    end);
end;
v47.handleCurYAboveFullViewY = function(v127, v128) --[[ Line: 768 ]] --[[ Name: handleCurYAboveFullViewY ]]
    -- upvalues: l_Full_0 (copy), l_Extended_0 (copy)
    if v127.viewType ~= l_Full_0 and v127.viewType ~= l_Extended_0 then
        if v128 then
            v127.goTo(l_Full_0);
            return;
        else
            v127.setViewType(l_Extended_0);
            return;
        end;
    else
        if v127.viewType == l_Full_0 then
            v127.setViewType(l_Extended_0);
        end;
        return;
    end;
end;
v47.handleCurYFromBriefToFull = function(v129, v130, v131, v132, v133) --[[ Line: 780 ]] --[[ Name: handleCurYFromBriefToFull ]]
    -- upvalues: v34 (copy), l_Full_0 (copy), l_Brief_0 (copy), l_Closed_0 (copy), v22 (copy), l_Extended_0 (copy)
    local l_canDragFullViewToBrief_0 = v129.props.canDragFullViewToBrief;
    local l_minimizeToSuperBrief_0 = v129.props.minimizeToSuperBrief;
    local v136 = if v34 then v129.props.swipeScrollingFrameRef:getValue() else v129.swipeScrollingFrameRef:getValue();
    local v137 = v129.getBriefViewY();
    local v138 = (if v34 then v129.props.getFullViewY() else v129.getFullViewY()) - v137;
    if v129.viewType == l_Full_0 then
        if v136.AbsoluteCanvasSize.Y - v136.AbsoluteWindowSize.Y - 1 < v130 then
            return;
        elseif v133 or v130 < v137 + v138 * 0.8 then
            local v139 = v133 and v131 > 500;
            if l_canDragFullViewToBrief_0 and (not v139 or l_minimizeToSuperBrief_0) then
                v129.goTo(l_Brief_0);
                return;
            else
                v129.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return;
            end;
        end;
    elseif v129.viewType == l_Extended_0 then
        if not v133 or v130 < v137 + v138 * 0.8 or v131 > -1 then
            v129.goTo(l_Full_0);
            return;
        end;
    elseif v132 or v137 + v138 * 0.2 < v130 then
        v129.goTo(l_Full_0);
        return;
    else
        v129.goTo(l_Brief_0);
    end;
end;
v47.handleCurYFromSuperBriefToBrief = function(v140, v141, v142, v143, v144, v145) --[[ Line: 821 ]] --[[ Name: handleCurYFromSuperBriefToBrief ]]
    -- upvalues: v34 (copy), l_Full_0 (copy), l_SuperBrief_0 (copy), l_Closed_0 (copy), v22 (copy), l_Brief_0 (copy), l_Extended_0 (copy)
    local l_canDragFullViewToBrief_1 = v140.props.canDragFullViewToBrief;
    local l_minimizeToSuperBrief_1 = v140.props.minimizeToSuperBrief;
    local v148 = (if v34 then v140.props.getFullViewY() else v140.getFullViewY()) - v142;
    if v140.viewType == l_Full_0 then
        if v145 or v141 < v142 + v148 * 0.8 then
            local v149 = v145 and v143 > 500;
            if l_canDragFullViewToBrief_1 and (not v149 or l_minimizeToSuperBrief_1) then
                v140.goTo(l_SuperBrief_0);
                return;
            else
                v140.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return;
            end;
        else
            v140.goTo(l_Brief_0);
            return;
        end;
    else
        if v140.viewType == l_Extended_0 then
            if not v145 or v141 < v142 + v148 * 0.8 or v143 > -1 then
                v140.goTo(l_Brief_0);
                return;
            end;
        elseif v144 or v142 + v148 * 0.2 < v141 then
            v140.goTo(l_Brief_0);
            return;
        else
            local v150 = v145 and v143 > 500;
            if l_canDragFullViewToBrief_1 and (not v150 or l_minimizeToSuperBrief_1) then
                v140.goTo(l_SuperBrief_0);
                return;
            else
                v140.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
            end;
        end;
        return;
    end;
end;
v47.handleCurYFromClosedToSuperBrief = function(v151, v152, v153, v154, v155, v156) --[[ Line: 859 ]] --[[ Name: handleCurYFromClosedToSuperBrief ]]
    -- upvalues: l_SuperBrief_0 (copy), l_Closed_0 (copy), v22 (copy)
    local v157 = v153 - 0;
    local l_minimizeToSuperBrief_2 = v151.props.minimizeToSuperBrief;
    if v151.viewType == l_SuperBrief_0 then
        if (v155 or v152 < v157 * 0.8) and not l_minimizeToSuperBrief_2 then
            v151.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return;
        else
            v151.goTo(l_SuperBrief_0);
            return;
        end;
    elseif (not v155 or v154 <= 500) and (v156 or v157 * 0.8 < v152) or l_minimizeToSuperBrief_2 then
        v151.goTo(l_SuperBrief_0);
        return;
    else
        v151.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return;
    end;
end;
v47.handleCurYFromClosedToBrief = function(v159, v160, v161, v162) --[[ Line: 882 ]] --[[ Name: handleCurYFromClosedToBrief ]]
    -- upvalues: l_Brief_0 (copy), l_Closed_0 (copy), v22 (copy)
    local v163 = v159.getBriefViewY() - 0;
    if v159.viewType == l_Brief_0 then
        if v161 or v160 < 0 + v163 * 0.8 then
            v159.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return;
        else
            v159.goTo(l_Brief_0);
            return;
        end;
    elseif v162 or 0 + v163 * 0.2 < v160 then
        v159.goTo(l_Brief_0);
        return;
    else
        v159.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return;
    end;
end;
v47.adjustScrollingFramePosition = function(v164) --[[ Line: 905 ]] --[[ Name: adjustScrollingFramePosition ]]
    -- upvalues: l_GuiService_0 (copy), v34 (copy), l_Extended_0 (copy), l_Full_0 (copy), v18 (copy)
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if not l_SelectedCoreObject_0 or not v164.props.contentFrameRef or not l_SelectedCoreObject_0:IsDescendantOf(v164.props.contentFrameRef.current) then
        return;
    else
        local v166 = if v34 then v164.props.swipeScrollingFrameRef.current else v164.swipeScrollingFrameRef.current;
        if v164.viewType ~= l_Extended_0 and v164.viewType ~= l_Full_0 then
            local v167 = v18.isNotNil(v164.getViewSize(v164.viewType), "self.adjustScrollingFramePosition.viewSize");
            v166.CanvasPosition = Vector2.new(v166.CanvasPosition.X, v167.Offset);
            return;
        else
            local v168 = l_SelectedCoreObject_0.AbsolutePosition.Y - v164.props.topBarHeight;
            local l_Y_7 = l_SelectedCoreObject_0.AbsoluteSize.Y;
            local l_Y_8 = v166.AbsoluteWindowSize.Y;
            local v171 = l_Y_8 - (v168 + l_Y_7);
            local l_Y_9 = v166.CanvasPosition.Y;
            if v171 < v164.props.bottomDockedContainerHeight then
                l_Y_9 = l_Y_9 + v164.props.bottomDockedContainerHeight - v171;
            elseif v168 + l_Y_7 + (l_Y_9 - l_Y_8) < l_Y_8 - v164.props.bottomDockedContainerHeight then
                l_Y_9 = l_Y_8;
            end;
            l_Y_9 = math.max(0, (math.min(l_Y_9, (v166.AbsoluteCanvasSize.Y or v166.CanvasSize.Y.Offset) - v166.AbsoluteWindowSize.Y)));
            v166.CanvasPosition = Vector2.new(v166.CanvasPosition.X, l_Y_9);
            return;
        end;
    end;
end;
v47.handleThumbstickInput = function(v173, v174, v175) --[[ Line: 952 ]] --[[ Name: handleThumbstickInput ]]
    -- upvalues: l_GamepadUtils_0 (copy)
    local l_Position_0 = v174.Position;
    local v177 = v173.swipeScrollingFrameRef:getValue();
    if v173.containerFrameRef:getValue() and v177 then
        local v178 = v177.CanvasPosition.Y + v175 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
        if v173.getFullViewY() < v178 then
            v177.CanvasPosition = Vector2.new(0, v178);
        end;
    end;
end;
v47.renderWithStyle = function(v179, v180) --[[ Line: 965 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v8 (copy), v34 (copy), l_FFlagAXFixManageOutfitPageFocusLostBehind_0 (copy), l_SuperBrief_0 (copy), l_ImageSetLabel_0 (copy), v39 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_Focusable_0 (copy), v10 (copy), l_FFlagEnablePeekViewFocusNav_0 (copy), v38 (copy), l_Brief_0 (copy), l_Full_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v25 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v181 = v179.props[v8.Children];
    local l_bottomDockedContainerHeight_1 = v179.props.bottomDockedContainerHeight;
    local l_bottomDockedContainerContent_0 = v179.props.bottomDockedContainerContent;
    local v184 = v179.props.thumbstickScrollEnabled and v179.state.scrollableViewType;
    local l_Color_0 = v180.Theme.BackgroundContrast.Color;
    local function v191() --[[ Line: 974 ]] --[[ Name: getDraggerTransparency ]]
        -- upvalues: v34 (ref), v179 (copy), v180 (copy)
        local v186 = if v34 then v179.props.swipeScrollingFrameRef.current else v179.swipeScrollingFrameRef.current;
        if not v186 then
            return v180.Theme.UIEmphasis.Transparency;
        else
            local l_Y_10 = v186.CanvasPosition.Y;
            local v188 = v179.getBriefViewY();
            local v189 = if v34 then v179.props.getFullViewY() else v179.getFullViewY();
            local v190 = math.max(0, (math.min(1, (l_Y_10 - v188) / (v189 - v188))));
            return v180.Theme.UIEmphasis.Transparency + v190 * (1 - v180.Theme.UIEmphasis.Transparency);
        end;
    end;
    local v192 = v8.createElement("TextButton", {
        Text = "", 
        LayoutOrder = 3, 
        ZIndex = 3, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 25), 
        [v8.Event.Activated] = v179.onPeekHeaderActivated, 
        Selectable = not l_FFlagAXFixManageOutfitPageFocusLostBehind_0 and nil
    }, {
        Dragger = if v179.props.hideDraggerInSuperBrief and v179.props.peekViewState == l_SuperBrief_0 then nil else v8.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 36, 0, 36), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Image = v39, 
            ImageColor3 = v180.Theme.UIEmphasis.Color, 
            ImageTransparency = if not l_FFlagProfilePlatformNewProfileHeader_0 or v179.props.hasSolidDragger then v180.Theme.UIEmphasis.Transparency else v191(), 
            Active = false
        })
    });
    local l_createElement_0 = v8.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v197 = {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        [v8.Ref] = v179.clipFrameRef, 
        restorePreviousChildFocus = true, 
        inputBindings = if not v34 and v184 then {
            ScrollPeekView = v10.Input.onStep(Enum.KeyCode.Thumbstick2, function(v195, v196) --[[ Line: 1025 ]]
                -- upvalues: v179 (copy)
                v179:handleThumbstickInput(v195, v196);
            end)
        } else nil
    };
    local v198 = {};
    local l_createElement_1 = v8.createElement;
    local v200 = "ScrollingFrame";
    local v201 = {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Selectable = not l_FFlagEnablePeekViewFocusNav_0 and nil, 
        CanvasSize = UDim2.fromScale(1, 0), 
        Active = true, 
        BackgroundTransparency = 1, 
        ZIndex = 1, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0, 
        ClipsDescendants = false, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ElasticBehavior = v179.props.elasticBehavior, 
        ScrollingEnabled = v179.props.isScrollingEnabled, 
        [v8.Ref] = if v34 then v179.props.swipeScrollingFrameRef else v179.swipeScrollingFrameRef, 
        [v8.Change.CanvasPosition] = v179.onSwipeScrollingFrameCanvasPositionChanged, 
        [v8.Change.AbsoluteWindowSize] = v179.onAbsoluteWindowSizeChanged
    };
    local v202 = {
        UIListLayout = v8.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        FillingArea = v8.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Active = false, 
            [v8.Ref] = v179.fillingAreaRef
        }), 
        BackgroundFrame = v8.createElement("Frame", {
            LayoutOrder = 2, 
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Active = false
        }, {
            BackgroundImage = v8.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, 9999), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v38, 
                BackgroundColor3 = if v179.props.customBackground then v179.props.customBackground else l_Color_0, 
                Active = false
            })
        }), 
        PeekHeader = if not l_FFlagProfilePlatformNewProfileHeader_0 or v179.props.hasSolidDragger then v192 else nil, 
        ContentFrame = v8.createElement(l_Focusable_0.Frame, {
            LayoutOrder = 4, 
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v8.Ref] = v179.props.contentFrameRef, 
            restorePreviousChildFocus = true, 
            onFocusGained = function() --[[ Line: 1096 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v179 (copy), l_Brief_0 (ref), l_Full_0 (ref)
                if v179.viewType == l_Brief_0 and v179.props.peekViewState ~= l_Full_0 then
                    v179.goTo(l_Full_0);
                end;
            end
        }, if not l_FFlagProfilePlatformNewProfileHeader_0 or v179.props.hasSolidDragger then v181 else {
            PeekHeader = v192, 
            Content = v8.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, v181)
        })
    };
    local v203 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        v203 = v8.createElement("Frame", {
            LayoutOrder = 5, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            Active = false
        });
    end;
    v202.BottomContainerPlaceHolder = v203;
    v198.SwipeScrollingFrame = l_createElement_1(v200, v201, v202);
    l_createElement_1 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        l_createElement_1 = v8.createElement("Frame", {
            Active = true, 
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            BackgroundTransparency = 1, 
            [v8.Ref] = v179.bottomContainerRef
        }, l_bottomDockedContainerContent_0);
    end;
    v198.BottomContainer = l_createElement_1;
    l_createElement_0 = l_createElement_0(l_Frame_0, v197, v198);
    l_Frame_0 = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v179.props.shouldCaptureFocus then if l_FFlagEnablePeekViewFocusNav_0 then v8.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = v25.FocusNavigableSurfaceIdentifierEnum.PeekView, 
        isIsolated = true
    }, {
        ClipFrame = l_createElement_0
    }) else nil else nil;
    return v8.createFragment({
        DropShadowBackground = v8.createElement("Frame", {
            ZIndex = 0, 
            Visible = v179.props.showDropShadow, 
            [v8.Ref] = v179.shadowRef
        }, {
            UIGradient = v8.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v180.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v180.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.7)
                })
            })
        }), 
        ClipFrameContainer = l_Frame_0, 
        ClipFrame = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v179.props.shouldCaptureFocus then if l_FFlagEnablePeekViewFocusNav_0 then nil else l_createElement_0 else l_createElement_0, 
        InputBegan = v8.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = v179.inputBeganCallback
        }), 
        InputEnded = v8.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v179.inputEndedCallback
        })
    });
end;
v47.render = function(v204) --[[ Line: 1175 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v14 (copy), v34 (copy), l_Closed_0 (copy), v22 (copy)
    return v204.withStyle(function(v205) --[[ Line: 1176 ]]
        -- upvalues: v204 (copy), v8 (ref), v14 (ref), v34 (ref), l_Closed_0 (ref), v22 (ref)
        local v206 = if v204.useReducedMotion then v8.createElement("CanvasGroup", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            GroupTransparency = v204.state.canvasGroupTransparency
        }, {
            v204:renderWithStyle(v205)
        }) else v204:renderWithStyle(v205);
        if v204.props.hasScrim then
            return v8.createElement(v14, {
                [v8.Ref] = if v34 then v204.props.containerFrameRef else v204.containerFrameRef, 
                onActivated = function() --[[ Line: 1192 ]] --[[ Name: onActivated ]]
                    -- upvalues: v204 (ref), l_Closed_0 (ref), v22 (ref)
                    if v204.isInGoToState then
                        return;
                    else
                        v204.goTo(l_Closed_0, nil, nil, {
                            dismissMethod = v22.dismissMethodEnum.scrimTap
                        });
                        return;
                    end;
                end, 
                onSizeChanged = v204.onContainerFrameAbsoluteSizeChanged
            }, v206);
        else
            return v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                [v8.Ref] = if v34 then v204.props.containerFrameRef else v204.containerFrameRef, 
                [v8.Change.AbsoluteSize] = v204.onContainerFrameAbsoluteSizeChanged
            }, v206);
        end;
    end);
end;
v47.didMount = function(v207) --[[ Line: 1217 ]] --[[ Name: didMount ]]
    -- upvalues: l_Closed_0 (copy), l_GetFFlagEnablePeekViewStateOnMountParam_0 (copy), l_Full_0 (copy), l_Brief_0 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy)
    v207.isMounted = true;
    if v207.props.closeSignal then
        v207.closeSignalConnection = v207.props.closeSignal:connect(function() --[[ Line: 1221 ]]
            -- upvalues: v207 (copy), l_Closed_0 (ref)
            if not v207.isInGoToState then
                v207.goTo(l_Closed_0, true, v207.useReducedMotion);
            end;
        end);
    end;
    local l_hidden_0 = v207.props.hidden;
    local l_mountAsFullView_0 = v207.props.mountAsFullView;
    local l_mountAnimation_0 = v207.props.mountAnimation;
    local v211 = if l_GetFFlagEnablePeekViewStateOnMountParam_0() then v207.props.stateOnMount else nil;
    if not l_hidden_0 then
        if l_mountAsFullView_0 then
            v207.goTo(l_Full_0, l_mountAnimation_0, v207.useReducedMotion);
        elseif v211 ~= nil then
            v207.goTo(v211, l_mountAnimation_0, v207.useReducedMotion);
        else
            v207.goTo(l_Brief_0, l_mountAnimation_0, v207.useReducedMotion);
        end;
    end;
    v207:setState({
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType())
    });
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v212) --[[ Line: 1249 ]]
        -- upvalues: v207 (copy), l_getInputGroup_0 (ref)
        v207:setState({
            lastInputGroup = l_getInputGroup_0(v212)
        });
    end);
end;
v47.isAnimating = function(v213) --[[ Line: 1254 ]] --[[ Name: isAnimating ]]
    return v213.goToAnimationConnection ~= nil;
end;
v47.didUpdate = function(v214, v215, v216) --[[ Line: 1258 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Hidden_0 (copy), l_Brief_0 (copy), l_Extended_0 (copy)
    if v216.absoluteWindowSizeX ~= v214.state.absoluteWindowSizeX or v216.absoluteWindowSizeY ~= v214.state.absoluteWindowSizeY then
        v214.reconcileRbxInstances("didUpdate");
        if not v214:isAnimating() then
            v214.updateSwipeScrollingFrame();
        end;
    end;
    if v215.bottomDockedContainerHeight ~= v214.props.bottomDockedContainerHeight then
        v214.onContainerFrameAbsoluteSizeChanged();
    end;
    if v215.hidden == false and v214.props.hidden == true then
        v214.goTo(l_Hidden_0);
    elseif v215.hidden == true and v214.props.hidden == false then
        v214.goTo(l_Brief_0);
    end;
    local l_peekViewState_0 = v214.props.peekViewState;
    local l_isInGoToState_0 = v214.isInGoToState;
    if l_peekViewState_0 ~= v215.peekViewState and v214.viewType == v215.peekViewState and l_peekViewState_0 ~= l_Extended_0 and not l_isInGoToState_0 then
        v214.goTo(v214.props.peekViewState);
    end;
end;
v47.willUnmount = function(v219) --[[ Line: 1300 ]] --[[ Name: willUnmount ]]
    v219.isMounted = false;
    if v219.closeSignalConnection then
        v219.closeSignalConnection:disconnect();
        v219.closeSignalConnection = nil;
    end;
    if v219.goToAnimationConnection then
        v219.goToAnimationConnection:disconnect();
        v219.goToAnimationConnection = nil;
    end;
    if v219.selectedCoreObjectConnection then
        v219.selectedCoreObjectConnection:disconnect();
        v219.selectedCoreObjectConnection = nil;
    end;
end;
local function v222(v220, _) --[[ Line: 1319 ]] --[[ Name: mapStateToProps ]]
    return {
        topBarHeight = v220.TopBar and v220.TopBar.topBarHeight or 0
    };
end;
local function v234(v223) --[[ Line: 1325 ]] --[[ Name: PeekViewContainer ]]
    -- upvalues: v7 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_GamepadUtils_0 (copy), v27 (copy), v47 (ref), v6 (copy)
    local v224 = v7.useRef(nil);
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 and v223.scrollingFrameRef then
        v224 = v223.scrollingFrameRef;
    end;
    local v225 = v7.useRef(nil);
    local v226 = nil;
    v226 = if v223.fullViewContentHeight then v223.fullViewContentHeight else UDim.new(1, 0);
    local v227 = v7.useCallback(function() --[[ Line: 1341 ]]
        -- upvalues: v225 (copy), v226 (ref)
        return v225.current.AbsoluteSize.Y * v226.Scale + v226.Offset;
    end, {
        v226, 
        v225
    });
    local v233 = v7.useCallback(function(v228, v229) --[[ Line: 1346 ]]
        -- upvalues: v224 (ref), v225 (copy), l_GamepadUtils_0 (ref), v227 (copy)
        local l_Position_1 = v228.Position;
        local v231 = v224:getValue();
        if v225:getValue() and v231 then
            local v232 = v231.CanvasPosition.Y + v229 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_1).Y * 1000;
            if v227() < v232 then
                v231.CanvasPosition = Vector2.new(0, v232);
            end;
        end;
    end, {
        v227, 
        v224, 
        v225
    });
    v27(v233);
    return v7.createElement(v47, v6.Dictionary.join(v223, {
        swipeScrollingFrameRef = v224, 
        containerFrameRef = v225, 
        fullViewContentHeight = v226, 
        getFullViewY = v227
    }));
end;
v47 = v12.connect(v222, nil)(v47);
if v34 then
    return v234;
else
    return v47;
end;