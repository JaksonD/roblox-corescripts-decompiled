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
local v38 = game:DefineFastFlag("PeekViewUpdateOnBriefViewHeightChange", false);
local v39 = Rect.new(9, 9, 9, 9);
local v40 = l_Images_0["icons/navigation/swipe"];
local v41 = 0.1 * l_GetFIntPeekViewTransitionDelayTiming_0();
local l_Hidden_0 = v13.Hidden;
local l_Closed_0 = v13.Closed;
local l_SuperBrief_0 = v13.SuperBrief;
local l_Brief_0 = v13.Brief;
local l_Full_0 = v13.Full;
local l_Extended_0 = v13.Extended;
local v48 = v8.PureComponent:extend("PeekView");
v48.defaultProps = {
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
v48.init = function(v49) --[[ Line: 143 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Hidden_0 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy), v8 (copy), v9 (copy), l_Closed_0 (copy), l_SuperBrief_0 (copy), l_Brief_0 (copy), l_Full_0 (copy), v34 (copy), l_switchAccountScrimError_0 (copy), v23 (copy), v31 (copy), l_GetFFlagPreventSuperBriefPeekViewClose_0 (copy), v13 (copy), l_InputTypeConstants_0 (copy), v22 (copy), l_Extended_0 (copy), v18 (copy), l_RunService_0 (copy), v41 (copy), l_GuiService_0 (copy)
    v49.isMounted = false;
    v49.isTouched = false;
    v49.isInGoToState = false;
    v49.useReducedMotion = l_UserGameSettings_0.ReducedMotion;
    v49.viewType = l_Hidden_0;
    v49:setState({
        scrollableViewType = false, 
        absoluteWindowSizeX = 0, 
        absoluteWindowSizeY = 0, 
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType()), 
        canvasGroupTransparency = 0
    });
    v49.containerFrameRef = v8.createRef();
    v49.clipFrameRef = v8.createRef();
    v49.shadowRef = v8.createRef();
    v49.fillingAreaRef = v8.createRef();
    v49.swipeScrollingFrameRef = v8.createRef();
    v49.bottomContainerRef = v8.createRef();
    local v50, v51 = v8.createBinding(0);
    v49.transitionPercent = v50;
    v49.setTransitionPercent = v51;
    v49.onAbsoluteWindowSizeChanged = function(v52) --[[ Line: 169 ]]
        -- upvalues: v49 (copy)
        if v52.AbsoluteWindowSize.X ~= v49.state.absoluteWindowSizeX or v52.AbsoluteWindowSize.Y ~= v49.state.absoluteWindowSizeY then
            v49:setState({
                absoluteWindowSizeX = v52.AbsoluteWindowSize.X, 
                absoluteWindowSizeY = v52.AbsoluteWindowSize.Y
            });
        end;
    end;
    v49.withStyle = function(v53) --[[ Line: 181 ]]
        -- upvalues: v49 (copy), v9 (ref)
        if v49.props.withNewThemeProvider then
            return v9.Style.withStyle(v53);
        else
            return v53({
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
    v49.inputBeganCallback = function(v54) --[[ Line: 207 ]]
        -- upvalues: v49 (copy)
        if not v49.isMounted then
            return;
        elseif v54.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v49.isTouched = true;
            return;
        end;
    end;
    v49.inputEndedCallback = function(v55) --[[ Line: 219 ]]
        -- upvalues: v49 (copy)
        if not v49.isMounted then
            return;
        elseif v55.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v49.isTouched = false;
            v49.checkGoTo();
            return;
        end;
    end;
    v49.getViewSize = function(v56) --[[ Line: 232 ]]
        -- upvalues: l_Hidden_0 (ref), l_Closed_0 (ref), l_SuperBrief_0 (ref), v49 (copy), l_Brief_0 (ref), l_Full_0 (ref)
        if v56 == l_Hidden_0 then
            return UDim.new(0, 0);
        elseif v56 == l_Closed_0 then
            return UDim.new(0, 0);
        elseif v56 == l_SuperBrief_0 then
            if v49.props.superBriefViewContentHeight then
                local l_superBriefViewContentHeight_0 = v49.props.superBriefViewContentHeight;
                return UDim.new(l_superBriefViewContentHeight_0.Scale, l_superBriefViewContentHeight_0.Offset + 25);
            else
                return UDim.new(0, 0);
            end;
        elseif v56 == l_Brief_0 then
            local l_briefViewContentHeight_0 = v49.props.briefViewContentHeight;
            return UDim.new(l_briefViewContentHeight_0.Scale, l_briefViewContentHeight_0.Offset + 25);
        elseif v56 == l_Full_0 then
            return v49.props.fullViewContentHeight;
        else
            return nil;
        end;
    end;
    v49.hasNilRefs = function() --[[ Line: 257 ]]
        -- upvalues: v34 (ref), v49 (copy)
        local v59 = if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current;
        local v60 = if v34 then v49.props.containerFrameRef.current else v49.containerFrameRef.current;
        local l_current_0 = v49.clipFrameRef.current;
        local l_current_1 = v49.shadowRef.current;
        local l_current_2 = v49.fillingAreaRef.current;
        return not (v59 and v60 and l_current_0 and l_current_1 and l_current_2);
    end;
    v49.reportRefStatus = function(v64, v65, v66, v67, v68, v69) --[[ Line: 271 ]]
        -- upvalues: l_switchAccountScrimError_0 (ref), v23 (ref)
        l_switchAccountScrimError_0(v23, "switchAccountScrimError", {
            callSite = v64, 
            swipeScrollingFrame = v65 and "true" or "nil", 
            containerFrame = v66 and "true" or "nil", 
            clipFrame = v67 and "true" or "nil", 
            shadow = v68 and "true" or "nil", 
            fillingArea = v69 and "true" or "nil"
        });
    end;
    v49.reconcileRbxInstances = function(v70) --[[ Line: 283 ]]
        -- upvalues: v34 (ref), v49 (copy)
        local v71 = if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current;
        local v72 = v71 and v71.CanvasPosition.Y or 0;
        local v73 = if v34 then v49.props.containerFrameRef.current else v49.containerFrameRef.current;
        local l_current_3 = v49.clipFrameRef.current;
        local l_current_4 = v49.shadowRef.current;
        local l_current_5 = v49.fillingAreaRef.current;
        if v49.hasNilRefs() then
            v49.reportRefStatus(v70, v71, v73, l_current_3, l_current_4, l_current_5);
            return;
        else
            local l_X_0 = v73.AbsoluteSize.X;
            local l_Y_0 = v73.AbsoluteSize.Y;
            l_current_3.Size = UDim2.new(0, l_X_0, 0, v72);
            l_current_4.Size = UDim2.new(0, l_X_0, 0, 36);
            l_current_3.Position = UDim2.new(0, 0, 1, -v72);
            l_current_4.Position = UDim2.new(0, 0, 1, -v72 - 30);
            v71.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            v71.Position = UDim2.new(0, 0, 0, -(l_Y_0 - v72));
            l_current_5.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            local l_current_6 = v49.bottomContainerRef.current;
            if l_current_6 then
                local l_bottomDockedContainerHeight_0 = v49.props.bottomDockedContainerHeight;
                if l_current_3.AbsoluteSize.Y > 25 + l_bottomDockedContainerHeight_0 then
                    l_current_6.Active = true;
                    l_current_6.Position = UDim2.new(0, 0, 1, -l_bottomDockedContainerHeight_0);
                else
                    l_current_6.Active = false;
                    l_current_6.Position = UDim2.new(0, 0, 1, -l_current_3.AbsoluteSize.Y + 25);
                end;
            end;
            v49.transitionCallbacks();
            if v49.props.peekHeaderPositionYChange then
                v49.props.peekHeaderPositionYChange(v72);
            end;
            return;
        end;
    end;
    v49.updateSwipeScrollingFrame = function() --[[ Line: 333 ]]
        -- upvalues: v49 (copy), v34 (ref)
        local v81 = v49.getViewSize(v49.viewType);
        local v82 = nil;
        v82 = if v34 then v49.props.containerFrameRef.current and v49.props.swipeScrollingFrameRef.current else v49.containerFrameRef.current and v49.swipeScrollingFrameRef.current;
        if v81 and v82 then
            local l_Y_1 = (if v34 then v49.props.containerFrameRef.current else v49.containerFrameRef.current).AbsoluteSize.Y;
            local v84 = if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current;
            local v85 = l_Y_1 * v81.Scale + v81.Offset;
            if v84.CanvasPosition.Y ~= v85 then
                v84.CanvasPosition = Vector2.new(0, v85);
                if v49.props.peekHeaderPositionYChange then
                    v49.props.peekHeaderPositionYChange(v85);
                end;
            end;
        end;
    end;
    v49.onContainerFrameAbsoluteSizeChanged = function() --[[ Line: 362 ]]
        -- upvalues: v49 (copy)
        if not v49.isMounted then
            return;
        else
            v49.reconcileRbxInstances("onContainerFrameAbsoluteSizeChanged");
            v49.updateSwipeScrollingFrame();
            return;
        end;
    end;
    v49.onSwipeScrollingFrameCanvasPositionChanged = function() --[[ Line: 371 ]]
        -- upvalues: v49 (copy), v34 (ref), v31 (ref), l_GetFFlagPreventSuperBriefPeekViewClose_0 (ref), v13 (ref), l_InputTypeConstants_0 (ref)
        if not v49.isMounted then
            return;
        else
            local v86 = if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current;
            local l_Y_2 = v86.CanvasPosition.Y;
            if l_Y_2 ~= math.floor(l_Y_2) then
                if not v31 then
                    if l_GetFFlagPreventSuperBriefPeekViewClose_0() then
                        local v88 = math.floor(l_Y_2 + 0.5);
                        if v49.viewType == v13.SuperBrief and v49.props.minimizeToSuperBrief then
                            local v89 = v49.getSuperBriefViewY();
                            if v89 ~= nil and v88 ~= nil and v88 < v89 then
                                v88 = v89;
                            end;
                        end;
                        v86.CanvasPosition = Vector2.new(0, v88);
                    else
                        v86.CanvasPosition = Vector2.new(0, (math.floor(l_Y_2 + 0.5)));
                    end;
                end;
                if v49.props.peekHeaderPositionYChange then
                    v49.props.peekHeaderPositionYChange(l_Y_2);
                end;
                if not v31 then
                    return;
                end;
            end;
            v49.reconcileRbxInstances("onSwipeScrollingFrameCanvasPositionChanged");
            if v49.state.lastInputGroup ~= l_InputTypeConstants_0.Gamepad then
                v49.checkGoTo();
            end;
            return;
        end;
    end;
    v49.getBriefViewY = function() --[[ Line: 420 ]]
        -- upvalues: v34 (ref), v49 (copy)
        local v90 = if v34 then v49.props.containerFrameRef.current.AbsoluteSize.Y else v49.containerFrameRef.current.AbsoluteSize.Y;
        local l_briefViewContentHeight_1 = v49.props.briefViewContentHeight;
        return v90 * l_briefViewContentHeight_1.Scale + l_briefViewContentHeight_1.Offset + 25;
    end;
    v49.getSuperBriefViewY = function() --[[ Line: 428 ]]
        -- upvalues: v34 (ref), v49 (copy)
        if v34 then
            if not v49.props.superBriefViewContentHeight or not v49.props.containerFrameRef:getValue() then
                return nil;
            end;
        elseif not v49.props.superBriefViewContentHeight or not v49.containerFrameRef:getValue() then
            return nil;
        end;
        local v92 = if v34 then v49.props.containerFrameRef:getValue().AbsoluteSize.Y else v49.containerFrameRef:getValue().AbsoluteSize.Y;
        local l_superBriefViewContentHeight_1 = v49.props.superBriefViewContentHeight;
        return v92 * l_superBriefViewContentHeight_1.Scale + l_superBriefViewContentHeight_1.Offset + 25;
    end;
    v49.getFullViewY = function() --[[ Line: 446 ]]
        -- upvalues: v49 (copy)
        return v49.containerFrameRef.current.AbsoluteSize.Y * v49.props.fullViewContentHeight.Scale + v49.props.fullViewContentHeight.Offset;
    end;
    v49.transitionCallbacks = function() --[[ Line: 451 ]]
        -- upvalues: v49 (copy), v34 (ref)
        local l_briefToFullTransitionPercent_0 = v49.props.briefToFullTransitionPercent;
        local l_Y_3 = (if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current).CanvasPosition.Y;
        local v96 = v49.getBriefViewY();
        local v97 = if v34 then v49.props.getFullViewY() else v49.getFullViewY();
        local v98 = v97 - v96;
        local v99 = 0;
        if v96 < l_Y_3 and l_Y_3 <= v97 then
            v99 = (l_Y_3 - v96) / v98;
        elseif v97 < l_Y_3 then
            v99 = 1;
        end;
        v49.setTransitionPercent(v99);
        if l_briefToFullTransitionPercent_0 then
            l_briefToFullTransitionPercent_0(v99);
        end;
    end;
    v49.checkGoTo = function() --[[ Line: 488 ]]
        -- upvalues: v49 (copy), v34 (ref), v13 (ref)
        if v49.isInGoToState then
            return;
        elseif v49.isTouched then
            return;
        else
            local v100 = if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current;
            if v100 and v49.state.absoluteWindowSizeX == 0 and v49.state.absoluteWindowSizeY == 0 then
                return;
            else
                local v101 = v49.getBriefViewY();
                local v102 = v49.getSuperBriefViewY();
                local v103 = if v34 then v49.props.getFullViewY() else v49.getFullViewY();
                if v103 < v101 then
                    return;
                elseif v102 and v101 < v102 then
                    return;
                elseif v100.AbsoluteWindowSize.Y + 25 + v49.props.bottomDockedContainerHeight > (v100.AbsoluteCanvasSize.Y or v100.CanvasSize.Y.Offset) then
                    return;
                else
                    local l_Y_4 = v100.ScrollVelocity.Y;
                    local v105 = l_Y_4 < 0;
                    local v106 = l_Y_4 > 0;
                    local l_Y_5 = v100.CanvasPosition.Y;
                    local v108 = false;
                    if v49.viewType == v13.Brief then
                        v108 = l_Y_5 == v101;
                    end;
                    local v109 = false;
                    if v49.viewType == v13.Full then
                        v109 = l_Y_5 == v103;
                    end;
                    if (v108 or v109) and l_Y_4 == 0 then
                        return;
                    elseif v103 < l_Y_5 then
                        v49:handleCurYAboveFullViewY(v105);
                        return;
                    elseif v101 < l_Y_5 and l_Y_5 <= v103 then
                        v49:handleCurYFromBriefToFull(l_Y_5, l_Y_4, v105, v106);
                        return;
                    else
                        if v102 then
                            if v102 < l_Y_5 and l_Y_5 <= v101 then
                                v49:handleCurYFromSuperBriefToBrief(l_Y_5, v102, l_Y_4, v105, v106);
                                return;
                            elseif l_Y_5 <= v102 then
                                v49:handleCurYFromClosedToSuperBrief(l_Y_5, v102, l_Y_4, v106, v105);
                                return;
                            end;
                        elseif l_Y_5 <= v101 then
                            v49:handleCurYFromClosedToBrief(l_Y_5, v106, v105);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    v49.onPeekHeaderActivated = function() --[[ Line: 575 ]]
        -- upvalues: v49 (copy), l_Closed_0 (ref), l_Brief_0 (ref), l_Full_0 (ref), l_SuperBrief_0 (ref), v22 (ref)
        if v49.viewType == l_Closed_0 then
            v49.goTo(l_Brief_0);
            return;
        elseif v49.viewType == l_Brief_0 then
            v49.goTo(l_Full_0);
            return;
        elseif v49.viewType == l_SuperBrief_0 then
            v49.goTo(l_Brief_0);
            return;
        else
            if v49.viewType == l_Full_0 then
                if v49.props.peekHeaderClose then
                    v49.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.handleTap
                    });
                    return;
                else
                    v49.goTo(l_Brief_0);
                end;
            end;
            return;
        end;
    end;
    v49.setViewType = function(v110, v111) --[[ Line: 593 ]]
        -- upvalues: v49 (copy), l_Extended_0 (ref), l_Full_0 (ref)
        if v49.goToAnimationConnection then
            v49.goToAnimationConnection:disconnect();
            v49.goToAnimationConnection = nil;
        end;
        v49.isInGoToState = false;
        v49.clipFrameRef.current.Active = false;
        local l_viewType_0 = v49.viewType;
        if l_viewType_0 ~= v110 then
            v49.viewType = v110;
            local v113 = true;
            if v49.viewType ~= l_Extended_0 then
                v113 = v49.viewType == l_Full_0;
            end;
            v49:setState({
                scrollableViewType = v113
            });
            local l_viewStateChanged_0 = v49.props.viewStateChanged;
            if l_viewStateChanged_0 then
                l_viewStateChanged_0(v110, l_viewType_0, v111 or {});
            end;
        end;
        v49.updateSwipeScrollingFrame();
    end;
    v49.goTo = function(v115, v116, v117, v118) --[[ Line: 621 ]]
        -- upvalues: v49 (copy), v18 (ref), v34 (ref), l_Full_0 (ref), l_Closed_0 (ref), l_RunService_0 (ref), l_Brief_0 (ref), v41 (ref)
        if v49.viewType == v115 then
            return;
        elseif v18.isEqual(v49.isInGoToState, false, "self.isInGoToState") then
            return;
        elseif v18.isEqual(v49.goToAnimationConnection, nil, "self.goToAnimationConnection") then
            return;
        else
            v49.isInGoToState = true;
            if v34 then
                v49.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
            else
                v49.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
            end;
            v49.clipFrameRef.current.Active = true;
            if v116 == false then
                v49.setViewType(v115, v118);
                if v115 == l_Full_0 then
                    v49:adjustScrollingFramePosition();
                    return;
                end;
            else
                local v119 = tick();
                if not v117 then
                    v49:setState({
                        canvasGroupTransparency = v115 == l_Closed_0 and 1 or 0
                    });
                    v49.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 656 ]]
                        -- upvalues: v49 (ref), v119 (copy), v115 (copy), l_Brief_0 (ref), v41 (ref), v34 (ref), v18 (ref), v118 (copy), l_Full_0 (ref)
                        if not v49.isMounted then
                            return;
                        else
                            local v120 = tick() - v119;
                            if v115 ~= l_Brief_0 or v41 <= v120 then
                                if v34 then
                                    v49.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                                else
                                    v49.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                                end;
                                local v121 = if v34 then v49.props.swipeScrollingFrameRef.current else v49.swipeScrollingFrameRef.current;
                                local v122 = if v34 then v49.props.containerFrameRef.current.AbsoluteSize.Y else v49.containerFrameRef.current.AbsoluteSize.Y;
                                local v123 = v18.isNotNil(v49.getViewSize(v115), "self.goTo.viewSize");
                                local v124 = v122 * v123.Scale + v123.Offset;
                                if v115 == l_Brief_0 then
                                    v120 = v120 - v41;
                                end;
                                if v120 >= 0.35 then
                                    v49.setViewType(v115, v118);
                                    if v115 == l_Full_0 then
                                        v49:adjustScrollingFramePosition();
                                    end;
                                    return;
                                else
                                    local l_Y_6 = v121.CanvasPosition.Y;
                                    local v126 = v124 - l_Y_6;
                                    v121.CanvasPosition = Vector2.new(0, l_Y_6 + v126 * math.sin(v120 * 2.468394227820552));
                                end;
                            end;
                            return;
                        end;
                    end);
                    return;
                else
                    if v115 ~= l_Closed_0 then
                        v49.setViewType(v115, v118);
                        if v115 == l_Full_0 then
                            v49:adjustScrollingFramePosition();
                        end;
                    end;
                    v49:setState({
                        canvasGroupTransparency = v115 == l_Closed_0 and 0 or 1
                    });
                    v49.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 709 ]]
                        -- upvalues: v49 (ref), v115 (copy), l_Full_0 (ref), v119 (copy), l_Closed_0 (ref), v118 (copy)
                        if not v49.isMounted then
                            return;
                        else
                            if v115 == l_Full_0 then
                                v49.updateSwipeScrollingFrame();
                            end;
                            local v127 = tick() - v119;
                            if v127 >= 0.35 then
                                v49:setState({
                                    canvasGroupTransparency = v115 == l_Closed_0 and 1 or 0
                                });
                                v49.setViewType(v115, v118);
                                if v115 == l_Full_0 then
                                    v49:adjustScrollingFramePosition();
                                end;
                                return;
                            else
                                v49:setState({
                                    canvasGroupTransparency = if v115 == l_Closed_0 then v127 / 0.35 else 1 - v127 / 0.35
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
    v49.selectedCoreObjectConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function() --[[ Line: 743 ]]
        -- upvalues: v34 (ref), v49 (copy), l_InputTypeConstants_0 (ref)
        if v34 then
            if v49.props.swipeScrollingFrameRef.current and v49.state.lastInputGroup == l_InputTypeConstants_0.Gamepad then
                v49:adjustScrollingFramePosition();
                return;
            end;
        elseif v49.swipeScrollingFrameRef.current and v49.state.lastInputGroup == l_InputTypeConstants_0.Gamepad then
            v49:adjustScrollingFramePosition();
        end;
    end);
end;
v48.handleCurYAboveFullViewY = function(v128, v129) --[[ Line: 769 ]] --[[ Name: handleCurYAboveFullViewY ]]
    -- upvalues: l_Full_0 (copy), l_Extended_0 (copy)
    if v128.viewType ~= l_Full_0 and v128.viewType ~= l_Extended_0 then
        if v129 then
            v128.goTo(l_Full_0);
            return;
        else
            v128.setViewType(l_Extended_0);
            return;
        end;
    else
        if v128.viewType == l_Full_0 then
            v128.setViewType(l_Extended_0);
        end;
        return;
    end;
end;
v48.handleCurYFromBriefToFull = function(v130, v131, v132, v133, v134) --[[ Line: 781 ]] --[[ Name: handleCurYFromBriefToFull ]]
    -- upvalues: v34 (copy), l_Full_0 (copy), l_Brief_0 (copy), l_Closed_0 (copy), v22 (copy), l_Extended_0 (copy)
    local l_canDragFullViewToBrief_0 = v130.props.canDragFullViewToBrief;
    local l_minimizeToSuperBrief_0 = v130.props.minimizeToSuperBrief;
    local v137 = if v34 then v130.props.swipeScrollingFrameRef:getValue() else v130.swipeScrollingFrameRef:getValue();
    local v138 = v130.getBriefViewY();
    local v139 = (if v34 then v130.props.getFullViewY() else v130.getFullViewY()) - v138;
    if v130.viewType == l_Full_0 then
        if v137.AbsoluteCanvasSize.Y - v137.AbsoluteWindowSize.Y - 1 < v131 then
            return;
        elseif v134 or v131 < v138 + v139 * 0.8 then
            local v140 = v134 and v132 > 500;
            if l_canDragFullViewToBrief_0 and (not v140 or l_minimizeToSuperBrief_0) then
                v130.goTo(l_Brief_0);
                return;
            else
                v130.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return;
            end;
        end;
    elseif v130.viewType == l_Extended_0 then
        if not v134 or v131 < v138 + v139 * 0.8 or v132 > -1 then
            v130.goTo(l_Full_0);
            return;
        end;
    elseif v133 or v138 + v139 * 0.2 < v131 then
        v130.goTo(l_Full_0);
        return;
    else
        v130.goTo(l_Brief_0);
    end;
end;
v48.handleCurYFromSuperBriefToBrief = function(v141, v142, v143, v144, v145, v146) --[[ Line: 822 ]] --[[ Name: handleCurYFromSuperBriefToBrief ]]
    -- upvalues: v34 (copy), l_Full_0 (copy), l_SuperBrief_0 (copy), l_Closed_0 (copy), v22 (copy), l_Brief_0 (copy), l_Extended_0 (copy)
    local l_canDragFullViewToBrief_1 = v141.props.canDragFullViewToBrief;
    local l_minimizeToSuperBrief_1 = v141.props.minimizeToSuperBrief;
    local v149 = (if v34 then v141.props.getFullViewY() else v141.getFullViewY()) - v143;
    if v141.viewType == l_Full_0 then
        if v146 or v142 < v143 + v149 * 0.8 then
            local v150 = v146 and v144 > 500;
            if l_canDragFullViewToBrief_1 and (not v150 or l_minimizeToSuperBrief_1) then
                v141.goTo(l_SuperBrief_0);
                return;
            else
                v141.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return;
            end;
        else
            v141.goTo(l_Brief_0);
            return;
        end;
    else
        if v141.viewType == l_Extended_0 then
            if not v146 or v142 < v143 + v149 * 0.8 or v144 > -1 then
                v141.goTo(l_Brief_0);
                return;
            end;
        elseif v145 or v143 + v149 * 0.2 < v142 then
            v141.goTo(l_Brief_0);
            return;
        else
            local v151 = v146 and v144 > 500;
            if l_canDragFullViewToBrief_1 and (not v151 or l_minimizeToSuperBrief_1) then
                v141.goTo(l_SuperBrief_0);
                return;
            else
                v141.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
            end;
        end;
        return;
    end;
end;
v48.handleCurYFromClosedToSuperBrief = function(v152, v153, v154, v155, v156, v157) --[[ Line: 860 ]] --[[ Name: handleCurYFromClosedToSuperBrief ]]
    -- upvalues: l_SuperBrief_0 (copy), l_Closed_0 (copy), v22 (copy)
    local v158 = v154 - 0;
    local l_minimizeToSuperBrief_2 = v152.props.minimizeToSuperBrief;
    if v152.viewType == l_SuperBrief_0 then
        if (v156 or v153 < v158 * 0.8) and not l_minimizeToSuperBrief_2 then
            v152.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return;
        else
            v152.goTo(l_SuperBrief_0);
            return;
        end;
    elseif (not v156 or v155 <= 500) and (v157 or v158 * 0.8 < v153) or l_minimizeToSuperBrief_2 then
        v152.goTo(l_SuperBrief_0);
        return;
    else
        v152.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return;
    end;
end;
v48.handleCurYFromClosedToBrief = function(v160, v161, v162, v163) --[[ Line: 883 ]] --[[ Name: handleCurYFromClosedToBrief ]]
    -- upvalues: l_Brief_0 (copy), l_Closed_0 (copy), v22 (copy)
    local v164 = v160.getBriefViewY() - 0;
    if v160.viewType == l_Brief_0 then
        if v162 or v161 < 0 + v164 * 0.8 then
            v160.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return;
        else
            v160.goTo(l_Brief_0);
            return;
        end;
    elseif v163 or 0 + v164 * 0.2 < v161 then
        v160.goTo(l_Brief_0);
        return;
    else
        v160.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return;
    end;
end;
v48.adjustScrollingFramePosition = function(v165) --[[ Line: 906 ]] --[[ Name: adjustScrollingFramePosition ]]
    -- upvalues: l_GuiService_0 (copy), v34 (copy), l_Extended_0 (copy), l_Full_0 (copy), v18 (copy)
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if not l_SelectedCoreObject_0 or not v165.props.contentFrameRef or not l_SelectedCoreObject_0:IsDescendantOf(v165.props.contentFrameRef.current) then
        return;
    else
        local v167 = if v34 then v165.props.swipeScrollingFrameRef.current else v165.swipeScrollingFrameRef.current;
        if v165.viewType ~= l_Extended_0 and v165.viewType ~= l_Full_0 then
            local v168 = v18.isNotNil(v165.getViewSize(v165.viewType), "self.adjustScrollingFramePosition.viewSize");
            v167.CanvasPosition = Vector2.new(v167.CanvasPosition.X, v168.Offset);
            return;
        else
            local v169 = l_SelectedCoreObject_0.AbsolutePosition.Y - v165.props.topBarHeight;
            local l_Y_7 = l_SelectedCoreObject_0.AbsoluteSize.Y;
            local l_Y_8 = v167.AbsoluteWindowSize.Y;
            local v172 = l_Y_8 - (v169 + l_Y_7);
            local l_Y_9 = v167.CanvasPosition.Y;
            if v172 < v165.props.bottomDockedContainerHeight then
                l_Y_9 = l_Y_9 + v165.props.bottomDockedContainerHeight - v172;
            elseif v169 + l_Y_7 + (l_Y_9 - l_Y_8) < l_Y_8 - v165.props.bottomDockedContainerHeight then
                l_Y_9 = l_Y_8;
            end;
            l_Y_9 = math.max(0, (math.min(l_Y_9, (v167.AbsoluteCanvasSize.Y or v167.CanvasSize.Y.Offset) - v167.AbsoluteWindowSize.Y)));
            v167.CanvasPosition = Vector2.new(v167.CanvasPosition.X, l_Y_9);
            return;
        end;
    end;
end;
v48.handleThumbstickInput = function(v174, v175, v176) --[[ Line: 953 ]] --[[ Name: handleThumbstickInput ]]
    -- upvalues: l_GamepadUtils_0 (copy)
    local l_Position_0 = v175.Position;
    local v178 = v174.swipeScrollingFrameRef:getValue();
    if v174.containerFrameRef:getValue() and v178 then
        local v179 = v178.CanvasPosition.Y + v176 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
        if v174.getFullViewY() < v179 then
            v178.CanvasPosition = Vector2.new(0, v179);
        end;
    end;
end;
v48.renderWithStyle = function(v180, v181) --[[ Line: 966 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v8 (copy), v34 (copy), l_FFlagAXFixManageOutfitPageFocusLostBehind_0 (copy), l_SuperBrief_0 (copy), l_ImageSetLabel_0 (copy), v40 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_Focusable_0 (copy), v10 (copy), l_FFlagEnablePeekViewFocusNav_0 (copy), v39 (copy), l_Brief_0 (copy), l_Full_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v25 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v182 = v180.props[v8.Children];
    local l_bottomDockedContainerHeight_1 = v180.props.bottomDockedContainerHeight;
    local l_bottomDockedContainerContent_0 = v180.props.bottomDockedContainerContent;
    local v185 = v180.props.thumbstickScrollEnabled and v180.state.scrollableViewType;
    local l_Color_0 = v181.Theme.BackgroundContrast.Color;
    local function v192() --[[ Line: 975 ]] --[[ Name: getDraggerTransparency ]]
        -- upvalues: v34 (ref), v180 (copy), v181 (copy)
        local v187 = if v34 then v180.props.swipeScrollingFrameRef.current else v180.swipeScrollingFrameRef.current;
        if not v187 then
            return v181.Theme.UIEmphasis.Transparency;
        else
            local l_Y_10 = v187.CanvasPosition.Y;
            local v189 = v180.getBriefViewY();
            local v190 = if v34 then v180.props.getFullViewY() else v180.getFullViewY();
            local v191 = math.max(0, (math.min(1, (l_Y_10 - v189) / (v190 - v189))));
            return v181.Theme.UIEmphasis.Transparency + v191 * (1 - v181.Theme.UIEmphasis.Transparency);
        end;
    end;
    local v193 = v8.createElement("TextButton", {
        Text = "", 
        LayoutOrder = 3, 
        ZIndex = 3, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 25), 
        [v8.Event.Activated] = v180.onPeekHeaderActivated, 
        Selectable = not l_FFlagAXFixManageOutfitPageFocusLostBehind_0 and nil
    }, {
        Dragger = if v180.props.hideDraggerInSuperBrief and v180.props.peekViewState == l_SuperBrief_0 then nil else v8.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 36, 0, 36), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Image = v40, 
            ImageColor3 = v181.Theme.UIEmphasis.Color, 
            ImageTransparency = if not l_FFlagProfilePlatformNewProfileHeader_0 or v180.props.hasSolidDragger then v181.Theme.UIEmphasis.Transparency else v192(), 
            Active = false
        })
    });
    local l_createElement_0 = v8.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v198 = {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        [v8.Ref] = v180.clipFrameRef, 
        restorePreviousChildFocus = true, 
        inputBindings = if not v34 and v185 then {
            ScrollPeekView = v10.Input.onStep(Enum.KeyCode.Thumbstick2, function(v196, v197) --[[ Line: 1026 ]]
                -- upvalues: v180 (copy)
                v180:handleThumbstickInput(v196, v197);
            end)
        } else nil
    };
    local v199 = {};
    local l_createElement_1 = v8.createElement;
    local v201 = "ScrollingFrame";
    local v202 = {
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
        ElasticBehavior = v180.props.elasticBehavior, 
        ScrollingEnabled = v180.props.isScrollingEnabled, 
        [v8.Ref] = if v34 then v180.props.swipeScrollingFrameRef else v180.swipeScrollingFrameRef, 
        [v8.Change.CanvasPosition] = v180.onSwipeScrollingFrameCanvasPositionChanged, 
        [v8.Change.AbsoluteWindowSize] = v180.onAbsoluteWindowSizeChanged
    };
    local v203 = {
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
            [v8.Ref] = v180.fillingAreaRef
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
                SliceCenter = v39, 
                BackgroundColor3 = if v180.props.customBackground then v180.props.customBackground else l_Color_0, 
                Active = false
            })
        }), 
        PeekHeader = if not l_FFlagProfilePlatformNewProfileHeader_0 or v180.props.hasSolidDragger then v193 else nil, 
        ContentFrame = v8.createElement(l_Focusable_0.Frame, {
            LayoutOrder = 4, 
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v8.Ref] = v180.props.contentFrameRef, 
            restorePreviousChildFocus = true, 
            onFocusGained = function() --[[ Line: 1097 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v180 (copy), l_Brief_0 (ref), l_Full_0 (ref)
                if v180.viewType == l_Brief_0 and v180.props.peekViewState ~= l_Full_0 then
                    v180.goTo(l_Full_0);
                end;
            end
        }, if not l_FFlagProfilePlatformNewProfileHeader_0 or v180.props.hasSolidDragger then v182 else {
            PeekHeader = v193, 
            Content = v8.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, v182)
        })
    };
    local v204 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        v204 = v8.createElement("Frame", {
            LayoutOrder = 5, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            Active = false
        });
    end;
    v203.BottomContainerPlaceHolder = v204;
    v199.SwipeScrollingFrame = l_createElement_1(v201, v202, v203);
    l_createElement_1 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        l_createElement_1 = v8.createElement("Frame", {
            Active = true, 
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            BackgroundTransparency = 1, 
            [v8.Ref] = v180.bottomContainerRef
        }, l_bottomDockedContainerContent_0);
    end;
    v199.BottomContainer = l_createElement_1;
    l_createElement_0 = l_createElement_0(l_Frame_0, v198, v199);
    l_Frame_0 = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v180.props.shouldCaptureFocus then if l_FFlagEnablePeekViewFocusNav_0 then v8.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = v25.FocusNavigableSurfaceIdentifierEnum.PeekView, 
        isIsolated = true
    }, {
        ClipFrame = l_createElement_0
    }) else nil else nil;
    return v8.createFragment({
        DropShadowBackground = v8.createElement("Frame", {
            ZIndex = 0, 
            Visible = v180.props.showDropShadow, 
            [v8.Ref] = v180.shadowRef
        }, {
            UIGradient = v8.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v181.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v181.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.7)
                })
            })
        }), 
        ClipFrameContainer = l_Frame_0, 
        ClipFrame = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v180.props.shouldCaptureFocus then if l_FFlagEnablePeekViewFocusNav_0 then nil else l_createElement_0 else l_createElement_0, 
        InputBegan = v8.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = v180.inputBeganCallback
        }), 
        InputEnded = v8.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v180.inputEndedCallback
        })
    });
end;
v48.render = function(v205) --[[ Line: 1176 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v14 (copy), v34 (copy), l_Closed_0 (copy), v22 (copy)
    return v205.withStyle(function(v206) --[[ Line: 1177 ]]
        -- upvalues: v205 (copy), v8 (ref), v14 (ref), v34 (ref), l_Closed_0 (ref), v22 (ref)
        local v207 = if v205.useReducedMotion then v8.createElement("CanvasGroup", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            GroupTransparency = v205.state.canvasGroupTransparency
        }, {
            v205:renderWithStyle(v206)
        }) else v205:renderWithStyle(v206);
        if v205.props.hasScrim then
            return v8.createElement(v14, {
                [v8.Ref] = if v34 then v205.props.containerFrameRef else v205.containerFrameRef, 
                onActivated = function() --[[ Line: 1193 ]] --[[ Name: onActivated ]]
                    -- upvalues: v205 (ref), l_Closed_0 (ref), v22 (ref)
                    if v205.isInGoToState then
                        return;
                    else
                        v205.goTo(l_Closed_0, nil, nil, {
                            dismissMethod = v22.dismissMethodEnum.scrimTap
                        });
                        return;
                    end;
                end, 
                onSizeChanged = v205.onContainerFrameAbsoluteSizeChanged
            }, v207);
        else
            return v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                [v8.Ref] = if v34 then v205.props.containerFrameRef else v205.containerFrameRef, 
                [v8.Change.AbsoluteSize] = v205.onContainerFrameAbsoluteSizeChanged
            }, v207);
        end;
    end);
end;
v48.didMount = function(v208) --[[ Line: 1218 ]] --[[ Name: didMount ]]
    -- upvalues: l_Closed_0 (copy), l_GetFFlagEnablePeekViewStateOnMountParam_0 (copy), l_Full_0 (copy), l_Brief_0 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy)
    v208.isMounted = true;
    if v208.props.closeSignal then
        v208.closeSignalConnection = v208.props.closeSignal:connect(function() --[[ Line: 1222 ]]
            -- upvalues: v208 (copy), l_Closed_0 (ref)
            if not v208.isInGoToState then
                v208.goTo(l_Closed_0, true, v208.useReducedMotion);
            end;
        end);
    end;
    local l_hidden_0 = v208.props.hidden;
    local l_mountAsFullView_0 = v208.props.mountAsFullView;
    local l_mountAnimation_0 = v208.props.mountAnimation;
    local v212 = if l_GetFFlagEnablePeekViewStateOnMountParam_0() then v208.props.stateOnMount else nil;
    if not l_hidden_0 then
        if l_mountAsFullView_0 then
            v208.goTo(l_Full_0, l_mountAnimation_0, v208.useReducedMotion);
        elseif v212 ~= nil then
            v208.goTo(v212, l_mountAnimation_0, v208.useReducedMotion);
        else
            v208.goTo(l_Brief_0, l_mountAnimation_0, v208.useReducedMotion);
        end;
    end;
    v208:setState({
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType())
    });
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v213) --[[ Line: 1250 ]]
        -- upvalues: v208 (copy), l_getInputGroup_0 (ref)
        v208:setState({
            lastInputGroup = l_getInputGroup_0(v213)
        });
    end);
end;
v48.isAnimating = function(v214) --[[ Line: 1255 ]] --[[ Name: isAnimating ]]
    return v214.goToAnimationConnection ~= nil;
end;
v48.didUpdate = function(v215, v216, v217) --[[ Line: 1259 ]] --[[ Name: didUpdate ]]
    -- upvalues: v38 (copy), l_Hidden_0 (copy), l_Brief_0 (copy), l_Extended_0 (copy)
    if v217.absoluteWindowSizeX ~= v215.state.absoluteWindowSizeX or v217.absoluteWindowSizeY ~= v215.state.absoluteWindowSizeY then
        v215.reconcileRbxInstances("didUpdate");
        if not v215:isAnimating() then
            v215.updateSwipeScrollingFrame();
        end;
    end;
    if v216.bottomDockedContainerHeight ~= v215.props.bottomDockedContainerHeight then
        v215.onContainerFrameAbsoluteSizeChanged();
    end;
    if v38 and v216.briefViewContentHeight ~= v215.props.briefViewContentHeight and not v215:isAnimating() then
        v215.updateSwipeScrollingFrame();
    end;
    if v216.hidden == false and v215.props.hidden == true then
        v215.goTo(l_Hidden_0);
    elseif v216.hidden == true and v215.props.hidden == false then
        v215.goTo(l_Brief_0);
    end;
    local l_peekViewState_0 = v215.props.peekViewState;
    local l_isInGoToState_0 = v215.isInGoToState;
    if l_peekViewState_0 ~= v216.peekViewState and v215.viewType == v216.peekViewState and l_peekViewState_0 ~= l_Extended_0 and not l_isInGoToState_0 then
        v215.goTo(v215.props.peekViewState);
    end;
end;
v48.willUnmount = function(v220) --[[ Line: 1309 ]] --[[ Name: willUnmount ]]
    v220.isMounted = false;
    if v220.closeSignalConnection then
        v220.closeSignalConnection:disconnect();
        v220.closeSignalConnection = nil;
    end;
    if v220.goToAnimationConnection then
        v220.goToAnimationConnection:disconnect();
        v220.goToAnimationConnection = nil;
    end;
    if v220.selectedCoreObjectConnection then
        v220.selectedCoreObjectConnection:disconnect();
        v220.selectedCoreObjectConnection = nil;
    end;
end;
local function v223(v221, _) --[[ Line: 1328 ]] --[[ Name: mapStateToProps ]]
    return {
        topBarHeight = v221.TopBar and v221.TopBar.topBarHeight or 0
    };
end;
local function v235(v224) --[[ Line: 1334 ]] --[[ Name: PeekViewContainer ]]
    -- upvalues: v7 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_GamepadUtils_0 (copy), v27 (copy), v48 (ref), v6 (copy)
    local v225 = v7.useRef(nil);
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 and v224.scrollingFrameRef then
        v225 = v224.scrollingFrameRef;
    end;
    local v226 = v7.useRef(nil);
    local v227 = nil;
    v227 = if v224.fullViewContentHeight then v224.fullViewContentHeight else UDim.new(1, 0);
    local v228 = v7.useCallback(function() --[[ Line: 1350 ]]
        -- upvalues: v226 (copy), v227 (ref)
        return v226.current.AbsoluteSize.Y * v227.Scale + v227.Offset;
    end, {
        v227, 
        v226
    });
    local v234 = v7.useCallback(function(v229, v230) --[[ Line: 1355 ]]
        -- upvalues: v225 (ref), v226 (copy), l_GamepadUtils_0 (ref), v228 (copy)
        local l_Position_1 = v229.Position;
        local v232 = v225:getValue();
        if v226:getValue() and v232 then
            local v233 = v232.CanvasPosition.Y + v230 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_1).Y * 1000;
            if v228() < v233 then
                v232.CanvasPosition = Vector2.new(0, v233);
            end;
        end;
    end, {
        v228, 
        v225, 
        v226
    });
    v27(v234);
    return v7.createElement(v48, v6.Dictionary.join(v224, {
        swipeScrollingFrameRef = v225, 
        containerFrameRef = v226, 
        fullViewContentHeight = v227, 
        getFullViewY = v228
    }));
end;
v48 = v12.connect(v223, nil)(v48);
if v34 then
    return v235;
else
    return v48;
end;