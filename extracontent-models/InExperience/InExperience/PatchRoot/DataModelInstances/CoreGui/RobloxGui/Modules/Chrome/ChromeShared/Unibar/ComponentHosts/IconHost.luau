local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v5.FFlagEnableConsoleExpControls;
local v7 = require(script.Parent.Parent.Parent.Parent.Flags);
local l_FFlagUnibarMenuOpenHamburger_0 = v7.FFlagUnibarMenuOpenHamburger;
local l_FFlagUnibarMenuOpenSubmenu_0 = v7.FFlagUnibarMenuOpenSubmenu;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_useCursor_0 = v12.Hooks.useCursor;
local l_Flags_0 = v12.Utility.Flags;
local l_StatusIndicator_0 = v12.StatusIndicator;
local l_StatusIndicatorVariant_0 = v12.Enums.StatusIndicatorVariant;
local l_Interactable_0 = v11.Core.Control.Interactable;
local l_ControlState_0 = v11.Core.Control.Enum.ControlState;
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_withTooltip_0 = v11.App.Dialog.TooltipV2.withTooltip;
local v21 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v22 = require(l_script_FirstAncestor_0.Service);
local v23 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local v25 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v26 = require(l_script_FirstAncestor_0.Hooks.useNotificationCount);
local v27 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v28 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValueBinding);
local v29 = require(l_script_FirstAncestor_0.Hooks.useTimeHysteresis);
local l_useTokens_0 = v12.Hooks.useTokens;
local v31 = require(l_script_FirstAncestor_0.Utility.shouldRejectMultiTouch);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
if l_isInExperienceUIVREnabled_0 then
    v33 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    local v42 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v34 = v42.Panel3DInSpatialUI;
    v35 = v42.Constants.PanelType;
    v36 = v11.App.Dialog.Enum.TooltipOrientation;
    v37 = v11.App.Dialog.TooltipCallout;
    v38 = v42.Constants.SPATIAL_TOOLTIP_SPACING;
    v39 = v42.UIManager;
    v40 = require(l_script_FirstAncestor_0.Service.ChromeUtils).MappedSignal;
    local v43 = v39.getInstance():getBottomBarVisibility();
    if v43 and v33() then
        local l_v43_0 = v43 --[[ copy: 45 -> 48 ]];
        v41 = v40.new(v43, function() --[[ Line: 71 ]]
            -- upvalues: l_v43_0 (copy)
            return l_v43_0:get();
        end);
    end;
end;
local v45 = if l_FFlagEnableConsoleExpControls_0 then require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Components.MenuIconContext) else nil;
local l_GetFFlagSimpleChatUnreadMessageCount_0 = v5.GetFFlagSimpleChatUnreadMessageCount;
local v47 = game:DefineFastFlag("UseBindingForUnreadChat", false);
local v48 = {};
areTooltipsDisplaying = function() --[[ Line: 94 ]] --[[ Name: areTooltipsDisplaying ]]
    -- upvalues: v48 (copy)
    local v49 = tick();
    for _, v51 in v48 do
        if v51.displaying or v49 - v51.time < 0.15 then
            return true;
        end;
    end;
    return false;
end;
logTooltipState = function(v52, v53) --[[ Line: 106 ]] --[[ Name: logTooltipState ]]
    -- upvalues: v48 (copy)
    if not v48[v52] or v48[v52].displaying ~= v53 then
        v48[v52] = {
            displaying = v53, 
            time = tick()
        };
    end;
end;
NotificationBadge = function(v54) --[[ Line: 125 ]] --[[ Name: NotificationBadge ]]
    -- upvalues: v47 (copy), v4 (copy), v26 (copy), v27 (copy), v22 (copy), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), l_useTokens_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v12 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy)
    if not v54.integration then
        return nil;
    else
        local v55 = nil;
        local v56 = nil;
        local v57 = nil;
        local v58 = nil;
        local v59 = nil;
        local v60 = false;
        if v47 then
            local v61 = v54.integration.integration and v54.integration.integration.notification or nil;
            local v62, v63 = v4.useBinding(v61 and v61:get().value or 0);
            v55 = v62;
            v56 = v63;
            v62, v63 = v4.useState(false);
            v58 = v62;
            v59 = v63;
            local l_v61_0 = v61 --[[ copy: 7 -> 13 ]];
            v4.useEffect(function() --[[ Line: 139 ]]
                -- upvalues: l_v61_0 (copy), v59 (ref), v56 (ref)
                if not l_v61_0 then
                    return;
                else
                    local v66 = l_v61_0:connect(function() --[[ Line: 144 ]]
                        -- upvalues: l_v61_0 (ref), v59 (ref), v56 (ref)
                        local v65 = l_v61_0:get().value or 0;
                        v59(v65 > 0);
                        v56(v65);
                    end);
                    return function() --[[ Line: 149 ]]
                        -- upvalues: v66 (copy)
                        v66:disconnect();
                    end;
                end;
            end, {
                v54.integration.integration.id
            });
        else
            v57 = v26(v54.integration.integration);
            if v27(v22:currentSubMenu(), function(v67) --[[ Line: 157 ]]
                -- upvalues: v54 (copy)
                return v67 == v54.integration.id;
            end) then
                v57 = 0;
            end;
            if v54.integration and v54.integration.integration then
                v60 = v54.integration.integration.hideNotificationCountWhileOpen or false;
            end;
        end;
        local v68 = nil;
        if l_GetFFlagSimpleChatUnreadMessageCount_0() and v54.disableBadgeNumber then
            v68 = l_useTokens_0();
        end;
        local v69 = nil;
        local v70 = nil;
        local v71 = nil;
        local v72 = nil;
        if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
            v69 = l_UnibarStyle_0.use();
            v70 = v69.ICON_SIZE;
            v71 = v69.ICON_BADGE_OFFSET_X;
            v72 = v69.ICON_BADGE_OFFSET_Y;
        else
            v70 = v21.ICON_SIZE;
            v71 = v21.ICON_BADGE_OFFSET_X;
            v72 = v21.ICON_BADGE_OFFSET_Y;
        end;
        local v73 = if v47 then v58 else v57 > 0;
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = if l_GetFFlagSimpleChatUnreadMessageCount_0() and v54.disableBadgeNumber then UDim2.new(0, v70, 0, v70) else UDim2.fromScale(1, 1), 
            Visible = not v54.toggleTransition or v54.toggleTransition:map(function(v74) --[[ Line: 196 ]]
                -- upvalues: v60 (ref)
                if v60 then
                    return v74 < 0.5;
                else
                    return true;
                end;
            end) or true, 
            ZIndex = 2
        }, {
            Badge = if v73 then if l_GetFFlagSimpleChatUnreadMessageCount_0() and v54.disableBadgeNumber then v4.createElement(v12.View, {
                Position = UDim2.new(1, 0, 0.2, 0), 
                backgroundStyle = {
                    Color3 = v68.Color.System.Contrast.Color3, 
                    Transparency = 0
                }, 
                stroke = {
                    Color = v68.Color.Surface.Surface_0.Color3, 
                    Transparency = 0, 
                    Thickness = v68.Stroke.Thicker
                }, 
                tag = "anchor-top-right radius-circle size-200 stroke-thicker", 
                ZIndex = 2
            }) else v4.createElement(l_StatusIndicator_0, {
                value = if v47 then v55:map(function(v75) --[[ Line: 225 ]]
                    return (math.min(v75, 99));
                end) else math.min(v57, 99), 
                variant = if l_Flags_0.FoundationStatusIndicatorVariantExperiment then l_StatusIndicatorVariant_0.Contrast_Experiment else l_StatusIndicatorVariant_0.Emphasis, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, v71, 0, v72)
            }) else nil
        });
    end;
end;
NotificationIndicator = function(v76) --[[ Line: 244 ]] --[[ Name: NotificationIndicator ]]
    -- upvalues: v25 (copy), v22 (copy), v4 (copy)
    local v77 = v25(v22:notificationIndicator());
    v76.setIconVisible(not v77 or false);
    return (v4.createElement("Frame", {
        Name = "NotificationIndicatorFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        IntegrationIcon = v77 and v77.component(v76) or nil, 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    }));
end;
HighlightCircle = function(v78) --[[ Line: 263 ]] --[[ Name: HighlightCircle ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v4 (copy)
    local _ = nil;
    local v80 = nil;
    v80 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_HIGHLIGHT_SIZE else v21.ICON_HIGHLIGHT_SIZE;
    return v4.createElement("Frame", {
        Name = v78.name or "Highlighter", 
        Size = v80, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = v78.color.Color, 
        BackgroundTransparency = v78.color.Transparency, 
        BorderSizePixel = 0, 
        Visible = v78.visible
    }, {
        corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
TooltipButton = function(v81) --[[ Line: 293 ]] --[[ Name: TooltipButton ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v4 (copy), v29 (copy), l_isInExperienceUIVREnabled_0 (copy), v33 (ref), v25 (copy), v22 (copy), v41 (ref), l_ControlState_0 (copy), v23 (copy), l_UserInputService_0 (copy), v31 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v45 (copy), l_Interactable_0 (copy), l_FFlagUnibarMenuOpenHamburger_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), l_useCursor_0 (copy), v12 (copy), v34 (ref), v35 (ref), v38 (ref), v37 (ref), v36 (ref), l_withTooltip_0 (copy), l_CoreGui_0 (copy)
    local _ = nil;
    local v83 = nil;
    v83 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_HIGHLIGHT_SIZE else v21.ICON_HIGHLIGHT_SIZE;
    local v84 = v4.useRef(nil);
    local l_secondaryAction_0 = v81.integration.integration.secondaryAction;
    local v86 = v81.integration.integration.draggable or false;
    local v87 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 309 ]]
        -- upvalues: v87 (copy)
        return function() --[[ Line: 310 ]]
            -- upvalues: v87 (ref)
            if v87.current then
                v87.current:Disconnect();
                v87.current = nil;
            end;
        end;
    end, {});
    local v88 = nil;
    local v89 = nil;
    if l_secondaryAction_0 then
        local v90, v91 = v29(0.05, 0.15, 0.35);
        v88 = v90;
        v89 = v91;
    else
        local v92, v93 = v29(0.6, 0.65, 0.7);
        v88 = v92;
        v89 = v93;
    end;
    local v94, v95 = v29(0, 0, 0.65);
    local v96, v97 = v4.useState(false);
    local v98, v99 = v29(0, 1);
    local v100 = if l_isInExperienceUIVREnabled_0 then v33() else nil;
    local v101 = if l_isInExperienceUIVREnabled_0 then v25(v22:getTopBarVisibiity()) else nil;
    local v102 = if l_isInExperienceUIVREnabled_0 and v41 then v25(v41) else nil;
    local v103 = false;
    if l_isInExperienceUIVREnabled_0 and v100 and not v101 and not v102 then
        v103 = true;
        v86 = v86 and not v103;
    end;
    local v108 = v4.useCallback(function(v104, v105) --[[ Line: 348 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), v103 (ref), l_ControlState_0 (ref), v22 (ref), v81 (copy), v89 (ref), v94 (copy), v99 (copy)
        if l_isInExperienceUIVREnabled_0 and v103 then
            return;
        else
            if v105 == l_ControlState_0.Selected and (v104 == l_ControlState_0.Default or v104 == l_ControlState_0.Hover) then
                v22:setSelected(v81.integration.id);
            elseif v105 == l_ControlState_0.Selected and v104 == l_ControlState_0.Default then
                v22:setSelected(v81.integration.id);
            end;
            local v106 = v105 ~= l_ControlState_0.Default;
            v81.setHovered(v106);
            local v107 = v105 == l_ControlState_0.Hover;
            v89(v107, v107 and v94 or areTooltipsDisplaying());
            if v107 then
                v22:onIntegrationHovered():fire(v81.integration.id);
            end;
            if not v106 then
                v99(false);
            end;
            return;
        end;
    end, if l_isInExperienceUIVREnabled_0 then {
        v81.setHovered, 
        v89, 
        v99, 
        v94, 
        v100, 
        v103
    } else {
        v81.setHovered, 
        v89, 
        v99, 
        v94
    });
    local v115 = v4.useCallback(function(_, v110) --[[ Line: 384 ]]
        -- upvalues: v86 (ref), v99 (copy), v23 (ref), v81 (copy), v87 (copy), l_UserInputService_0 (ref), v31 (ref), v22 (ref), v21 (ref)
        if not v86 then
            return;
        else
            if v110.UserInputType == Enum.UserInputType.MouseButton1 or v110.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v110.Position;
                v99(true, true);
                v23.default:onIconTouchBegan(v81.integration.id);
                if not v87.current then
                    v87.current = l_UserInputService_0.InputChanged:Connect(function(v112, _) --[[ Line: 397 ]]
                        -- upvalues: v31 (ref), v110 (copy), v22 (ref), v81 (ref), v87 (ref), l_Position_0 (copy), v21 (ref), v23 (ref)
                        if v31(v110, v112) then
                            return;
                        elseif v22:isWindowOpen(v81.integration.id) or not v87.current then
                            return;
                        else
                            local l_Position_1 = v112.Position;
                            if math.abs((l_Position_0 - l_Position_1).Magnitude) > v21.DRAG_MAGNITUDE_THRESHOLD then
                                v23.default:onIconDrag(v81.integration.id);
                                v22:storeChromeInteracted();
                                v22:toggleWindow(v81.integration.id);
                                v22:gesture(v81.integration.id, v87, v110);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end, {
        v86
    });
    local v118 = v4.useCallback(function(_, v117) --[[ Line: 423 ]]
        -- upvalues: v86 (ref), v99 (copy), v87 (copy), v22 (ref), v81 (copy)
        if not v86 then
            return;
        else
            if v117.UserInputType == Enum.UserInputType.MouseButton1 or v117.UserInputType == Enum.UserInputType.Touch then
                v99(false);
                if v87.current then
                    v87.current:Disconnect();
                    v87.current = nil;
                    v22:gesture(v81.integration.id, nil);
                end;
            end;
            return;
        end;
    end, {
        v86
    });
    local v119 = (not not v88 or v94 or v96) and not v98;
    if l_isInExperienceUIVREnabled_0 and v119 and v103 then
        v119 = false;
    end;
    logTooltipState(v81.integration.id, v119);
    local v120 = if l_FFlagEnableConsoleExpControls_0 then v4.useContext(v45) else nil;
    local v125 = v4.useCallback(function(v121) --[[ Line: 451 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v22 (ref), v4 (ref), l_Interactable_0 (ref), v21 (ref), v81 (copy), v83 (ref), v108 (copy), v84 (copy), l_FFlagUnibarMenuOpenHamburger_0 (ref), l_FFlagUnibarMenuOpenSubmenu_0 (ref), l_useCursor_0 (ref), v12 (ref), v119 (ref), l_secondaryAction_0 (copy), v120 (copy), v115 (copy), v118 (copy), l_isInExperienceUIVREnabled_0 (ref), v100 (copy), v103 (ref), v99 (copy), v87 (copy)
        local v122 = nil;
        if l_FFlagEnableConsoleExpControls_0 then
            v122 = v22:menuList():get()[1].id;
        end;
        return v4.createElement(l_Interactable_0, {
            Name = (if l_FFlagEnableConsoleExpControls_0 then v21.ICON_NAME_PREFIX else "IconHitArea_") .. v81.integration.id, 
            Size = v83, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            onStateChanged = v108, 
            ref = v84, 
            SelectionOrder = if not not l_FFlagUnibarMenuOpenHamburger_0 or l_FFlagUnibarMenuOpenSubmenu_0 then v81.integration.order else 100 - v81.integration.order, 
            Position = v81.isCurrentlyOpenSubMenu:map(function(v123) --[[ Line: 469 ]]
                -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref)
                return UDim2.new(0.5, 0, 0.5, not l_FFlagEnableConsoleExpControls_0 and v123 and 1 or 0);
            end), 
            SelectionImageObject = l_useCursor_0(v12.Enums.CursorType.SkinToneCircle), 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = v81.isCurrentlyOpenSubMenu:map(function(v124) --[[ Line: 475 ]]
                -- upvalues: v119 (ref), l_secondaryAction_0 (ref)
                if v119 and l_secondaryAction_0 or v124 then
                    return Enum.SelectionBehavior.Escape;
                else
                    return Enum.SelectionBehavior.Stop;
                end;
            end), 
            NextSelectionLeft = if l_FFlagEnableConsoleExpControls_0 and v81.integration.id == v122 then v120.menuIconRef else nil, 
            [v4.Change.AbsolutePosition] = v121, 
            [v4.Change.AbsoluteSize] = v121, 
            [v4.Event.InputBegan] = v115, 
            [v4.Event.InputEnded] = v118, 
            [v4.Event.Activated] = function() --[[ Line: 489 ]]
                -- upvalues: l_isInExperienceUIVREnabled_0 (ref), v100 (ref), v103 (ref), v22 (ref), v99 (ref), v81 (ref), v87 (ref)
                if l_isInExperienceUIVREnabled_0 and v100 then
                    if v103 then
                        return;
                    else
                        v22:onTriggerVRToggleButton():fire(true);
                    end;
                end;
                v99(true, true);
                v81.integration.activated();
                if v87.current then
                    v87.current:Disconnect();
                    v87.current = nil;
                    v22:gesture(v81.integration.id, nil);
                end;
            end
        }, {
            corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        });
    end, {
        v108, 
        v89, 
        v99, 
        v115, 
        v118, 
        v81.isCurrentlyOpenSubMenu, 
        v119, 
        l_secondaryAction_0, 
        if l_isInExperienceUIVREnabled_0 then v103 else nil, 
        if l_FFlagEnableConsoleExpControls_0 then v120.menuIconRef else nil
    });
    local v126 = v4.useRef(nil);
    local v132 = v4.useCallback(function(v127) --[[ Line: 526 ]]
        -- upvalues: v126 (copy), v95 (copy)
        local v128 = nil;
        local v129 = nil;
        local v130 = nil;
        local function v131() --[[ Line: 533 ]]
            -- upvalues: v128 (ref), v129 (ref), v130 (ref)
            if v128 then
                v128:disconnect();
                v128 = nil;
            end;
            if v129 then
                v129:disconnect();
                v129 = nil;
            end;
            if v130 then
                v130:disconnect();
                v130 = nil;
            end;
        end;
        if v127 ~= v126.current then
            pcall(v131);
            if v127 then
                v128 = v127.MouseEnter:Connect(function() --[[ Line: 551 ]]
                    -- upvalues: v95 (ref)
                    v95(true, true);
                end);
                v129 = v127.MouseLeave:Connect(function() --[[ Line: 554 ]]
                    -- upvalues: v95 (ref)
                    v95(false);
                end);
                v130 = v127.Destroying:Connect(function() --[[ Line: 557 ]]
                    -- upvalues: v95 (ref)
                    v95(false);
                end);
            end;
            v126.current = v127;
        end;
    end, {
        v95
    });
    local v135 = if l_secondaryAction_0 then {
        text = l_secondaryAction_0.label, 
        onStateChanged = function(_, v134) --[[ Line: 568 ]] --[[ Name: onStateChanged ]]
            -- upvalues: l_ControlState_0 (ref), v97 (copy)
            if v134 == l_ControlState_0.Selected then
                v97(true);
                return;
            else
                v97(false);
                return;
            end;
        end, 
        onActivated = function() --[[ Line: 575 ]] --[[ Name: onActivated ]]
            -- upvalues: l_secondaryAction_0 (copy), v81 (copy)
            l_secondaryAction_0.activated(v81.integration);
        end, 
        NextSelectionUp = v84, 
        NextSelectionLeft = v84, 
        NextSelectionRight = v84, 
        NextSelectionDown = v84
    } else nil;
    if l_isInExperienceUIVREnabled_0 and v100 then
        local v136, v137 = v4.useBinding(Vector2.zero);
        local v138, v139 = v4.useBinding(Vector2.zero);
        local v141 = v4.useCallback(function(v140) --[[ Line: 589 ]]
            -- upvalues: v137 (copy), v139 (copy)
            v137(v140.AbsolutePosition);
            v139(v140.AbsoluteSize);
        end, {
            v137, 
            v139
        });
        return v4.createElement(v4.Fragment, nil, {
            VRSpatialTooltip = if v119 and v34 then v4.createElement(v34, {
                panelType = v35.ToolTipsContainer, 
                renderFunction = function(v142) --[[ Line: 601 ]] --[[ Name: renderFunction ]]
                    -- upvalues: v136 (copy), v138 (copy), v38 (ref), v4 (ref), v37 (ref), v81 (copy), v36 (ref), v135 (copy), l_secondaryAction_0 (copy), v132 (copy)
                    local v143 = Vector2.new(v136:getValue().X + v138:getValue().X / 2, v142.Y - v38);
                    return v4.createElement(v37, {
                        textAlignment = Enum.TextXAlignment.Center, 
                        headerText = v81.integration.integration.label, 
                        orientation = v36.Top, 
                        distanceOffset = 0, 
                        triggerPointCenter = v143, 
                        contentOffsetVector = Vector2.zero, 
                        triggerPointRadius = Vector2.zero, 
                        buttonProps = v135, 
                        ref = if l_secondaryAction_0 then v132 else nil
                    });
                end
            }) else nil; 
            v125(v141)
        });
    else
        return l_withTooltip_0({
            headerText = v81.integration.integration.label, 
            hotkeyCodes = v81.integration.integration.hotkeyCodes, 
            textAlignment = Enum.TextXAlignment.Left, 
            buttonProps = v135, 
            ref = if l_secondaryAction_0 then v132 else nil
        }, {
            active = v119, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 10
        }, v125);
    end;
end;
IconHost = function(v144) --[[ Line: 640 ]] --[[ Name: IconHost ]]
    -- upvalues: v4 (copy), l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v28 (copy), v22 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    if not v144.integration or not v144.integration.component then
        warn("IconHost has no component to render");
    end;
    local v145, v146 = v4.useBinding(false);
    local v147, v148 = v4.useBinding(true);
    local v149 = l_useStyle_0();
    local _ = nil;
    local l_BackgroundOnHover_0 = v149.Theme.BackgroundOnHover;
    local v152 = nil;
    v152 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_CELL_WIDTH else v21.ICON_CELL_WIDTH;
    local v154 = v28(v22:currentSubMenu(), function(v153) --[[ Line: 663 ]]
        -- upvalues: v144 (copy)
        return v153 == v144.integration.id;
    end);
    return v4.createElement("Frame", {
        Size = UDim2.new(0, v152, 0, v152), 
        LayoutOrder = v144.integration.order, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v144.position, 
        Visible = v144.visible, 
        ZIndex = if l_FFlagEnableConsoleExpControls_0 then nil else v144.integration.order
    }, {
        v4.createElement("Frame", {
            Name = "IntegrationIconFrame", 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Visible = v147
        }, {
            IntegrationIcon = v144.integration and v144.integration.component and v144.integration.component(v144) or nil, 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        }), 
        if v144.integration.integration.flashNotificationSource then v4.createElement(NotificationIndicator, {
            integration = v144.integration, 
            setIconVisible = v148
        }) else nil, 
        v4.createElement(HighlightCircle, {
            name = "SelectedHighlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v154
        }), 
        v4.createElement(HighlightCircle, {
            name = "Highlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v145
        }), 
        v4.createElement(NotificationBadge, v144), 
        if v144.disableButtonBehaviors then nil else v4.createElement(TooltipButton, {
            integration = v144.integration, 
            setHovered = v146, 
            isCurrentlyOpenSubMenu = v154
        })
    });
end;
return IconHost;