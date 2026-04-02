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
local _ = require(l_script_FirstAncestor_0.Service.Types);
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local v26 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v27 = require(l_script_FirstAncestor_0.Hooks.useNotificationCount);
local v28 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v29 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValueBinding);
local v30 = require(l_script_FirstAncestor_0.Hooks.useTimeHysteresis);
local l_useTokens_0 = v12.Hooks.useTokens;
local v32 = require(l_script_FirstAncestor_0.Utility.shouldRejectMultiTouch);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
if l_isInExperienceUIVREnabled_0 then
    v34 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    local v43 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v35 = v43.Panel3DInSpatialUI;
    v36 = v43.Constants.PanelType;
    v37 = v11.App.Dialog.Enum.TooltipOrientation;
    v38 = v11.App.Dialog.TooltipCallout;
    v39 = v43.Constants.SPATIAL_TOOLTIP_SPACING;
    v40 = v43.UIManager;
    v41 = require(l_script_FirstAncestor_0.Service.ChromeUtils).MappedSignal;
    local v44 = v40.getInstance():getBottomBarVisibility();
    if v44 and v34() then
        local l_v44_0 = v44 --[[ copy: 45 -> 49 ]];
        v42 = v41.new(v44, function() --[[ Line: 71 ]]
            -- upvalues: l_v44_0 (copy)
            return l_v44_0:get();
        end);
    end;
end;
local v46 = if l_FFlagEnableConsoleExpControls_0 then require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Components.MenuIconContext) else nil;
local l_FFlagEnableUnibarFtuxTooltips_0 = v5.FFlagEnableUnibarFtuxTooltips;
local l_GetFFlagSimpleChatUnreadMessageCount_0 = v5.GetFFlagSimpleChatUnreadMessageCount;
local v49 = game:DefineFastFlag("UseBindingForUnreadChat", false);
local v50 = {};
areTooltipsDisplaying = function() --[[ Line: 93 ]] --[[ Name: areTooltipsDisplaying ]]
    -- upvalues: v50 (copy)
    local v51 = tick();
    for _, v53 in v50 do
        if v53.displaying or v51 - v53.time < 0.15 then
            return true;
        end;
    end;
    return false;
end;
logTooltipState = function(v54, v55) --[[ Line: 105 ]] --[[ Name: logTooltipState ]]
    -- upvalues: v50 (copy)
    if not v50[v54] or v50[v54].displaying ~= v55 then
        v50[v54] = {
            displaying = v55, 
            time = tick()
        };
    end;
end;
NotificationBadge = function(v56) --[[ Line: 124 ]] --[[ Name: NotificationBadge ]]
    -- upvalues: v49 (copy), v4 (copy), v27 (copy), v28 (copy), v22 (copy), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), l_useTokens_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v12 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy)
    if not v56.integration then
        return nil;
    else
        local v57 = nil;
        local v58 = nil;
        local v59 = nil;
        local v60 = nil;
        local v61 = nil;
        local v62 = false;
        if v49 then
            local v63 = v56.integration.integration and v56.integration.integration.notification or nil;
            local v64, v65 = v4.useBinding(v63 and v63:get().value or 0);
            v57 = v64;
            v58 = v65;
            v64, v65 = v4.useState(false);
            v60 = v64;
            v61 = v65;
            local l_v63_0 = v63 --[[ copy: 7 -> 13 ]];
            v4.useEffect(function() --[[ Line: 138 ]]
                -- upvalues: l_v63_0 (copy), v61 (ref), v58 (ref)
                if not l_v63_0 then
                    return;
                else
                    local v68 = l_v63_0:connect(function() --[[ Line: 143 ]]
                        -- upvalues: l_v63_0 (ref), v61 (ref), v58 (ref)
                        local v67 = l_v63_0:get().value or 0;
                        v61(v67 > 0);
                        v58(v67);
                    end);
                    return function() --[[ Line: 148 ]]
                        -- upvalues: v68 (copy)
                        v68:disconnect();
                    end;
                end;
            end, {
                v56.integration.integration.id
            });
        else
            v59 = v27(v56.integration.integration);
            if v28(v22:currentSubMenu(), function(v69) --[[ Line: 156 ]]
                -- upvalues: v56 (copy)
                return v69 == v56.integration.id;
            end) then
                v59 = 0;
            end;
            if v56.integration and v56.integration.integration then
                v62 = v56.integration.integration.hideNotificationCountWhileOpen or false;
            end;
        end;
        local v70 = nil;
        if l_GetFFlagSimpleChatUnreadMessageCount_0() and v56.disableBadgeNumber then
            v70 = l_useTokens_0();
        end;
        local v71 = nil;
        local v72 = nil;
        local v73 = nil;
        local v74 = nil;
        if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
            v71 = l_UnibarStyle_0.use();
            v72 = v71.ICON_SIZE;
            v73 = v71.ICON_BADGE_OFFSET_X;
            v74 = v71.ICON_BADGE_OFFSET_Y;
        else
            v72 = v21.ICON_SIZE;
            v73 = v21.ICON_BADGE_OFFSET_X;
            v74 = v21.ICON_BADGE_OFFSET_Y;
        end;
        local v75 = if v49 then v60 else v59 > 0;
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = if l_GetFFlagSimpleChatUnreadMessageCount_0() and v56.disableBadgeNumber then UDim2.new(0, v72, 0, v72) else UDim2.fromScale(1, 1), 
            Visible = not v56.toggleTransition or v56.toggleTransition:map(function(v76) --[[ Line: 195 ]]
                -- upvalues: v62 (ref)
                if v62 then
                    return v76 < 0.5;
                else
                    return true;
                end;
            end) or true, 
            ZIndex = 2
        }, {
            Badge = if v75 then if l_GetFFlagSimpleChatUnreadMessageCount_0() and v56.disableBadgeNumber then v4.createElement(v12.View, {
                Position = UDim2.new(1, 0, 0.2, 0), 
                backgroundStyle = {
                    Color3 = v70.Color.System.Contrast.Color3, 
                    Transparency = 0
                }, 
                stroke = {
                    Color = v70.Color.Surface.Surface_0.Color3, 
                    Transparency = 0, 
                    Thickness = v70.Stroke.Thicker
                }, 
                tag = "anchor-top-right radius-circle size-200 stroke-thicker", 
                ZIndex = 2
            }) else v4.createElement(l_StatusIndicator_0, {
                value = if v49 then v57:map(function(v77) --[[ Line: 224 ]]
                    return (math.min(v77, 99));
                end) else math.min(v59, 99), 
                variant = if l_Flags_0.FoundationStatusIndicatorVariantExperiment then l_StatusIndicatorVariant_0.Contrast_Experiment else l_StatusIndicatorVariant_0.Emphasis, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, v73, 0, v74)
            }) else nil
        });
    end;
end;
NotificationIndicator = function(v78) --[[ Line: 243 ]] --[[ Name: NotificationIndicator ]]
    -- upvalues: v26 (copy), v22 (copy), v4 (copy)
    local v79 = v26(v22:notificationIndicator());
    v78.setIconVisible(not v79 or false);
    return (v4.createElement("Frame", {
        Name = "NotificationIndicatorFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        IntegrationIcon = v79 and v79.component(v78) or nil, 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    }));
end;
HighlightCircle = function(v80) --[[ Line: 262 ]] --[[ Name: HighlightCircle ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v4 (copy)
    local _ = nil;
    local v82 = nil;
    v82 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_HIGHLIGHT_SIZE else v21.ICON_HIGHLIGHT_SIZE;
    return v4.createElement("Frame", {
        Name = v80.name or "Highlighter", 
        Size = v82, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = v80.color.Color, 
        BackgroundTransparency = v80.color.Transparency, 
        BorderSizePixel = 0, 
        Visible = v80.visible
    }, {
        corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
TooltipButton = function(v83) --[[ Line: 292 ]] --[[ Name: TooltipButton ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v4 (copy), v30 (copy), l_isInExperienceUIVREnabled_0 (copy), v34 (ref), v26 (copy), v22 (copy), v42 (ref), l_ControlState_0 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v23 (copy), l_UserInputService_0 (copy), v32 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v46 (copy), l_Interactable_0 (copy), l_FFlagUnibarMenuOpenHamburger_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), l_useCursor_0 (copy), v12 (copy), v35 (ref), v36 (ref), v39 (ref), v38 (ref), v37 (ref), l_withTooltip_0 (copy), l_CoreGui_0 (copy)
    local _ = nil;
    local v85 = nil;
    v85 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_HIGHLIGHT_SIZE else v21.ICON_HIGHLIGHT_SIZE;
    local v86 = v4.useRef(nil);
    local l_secondaryAction_0 = v83.integration.integration.secondaryAction;
    local v88 = v83.integration.integration.draggable or false;
    local v89 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 308 ]]
        -- upvalues: v89 (copy)
        return function() --[[ Line: 309 ]]
            -- upvalues: v89 (ref)
            if v89.current then
                v89.current:Disconnect();
                v89.current = nil;
            end;
        end;
    end, {});
    local v90 = nil;
    local v91 = nil;
    if l_secondaryAction_0 then
        local v92, v93 = v30(0.05, 0.15, 0.35);
        v90 = v92;
        v91 = v93;
    else
        local v94, v95 = v30(0.6, 0.65, 0.7);
        v90 = v94;
        v91 = v95;
    end;
    local v96, v97 = v30(0, 0, 0.65);
    local v98, v99 = v4.useState(false);
    local v100, v101 = v30(0, 1);
    local v102 = if l_isInExperienceUIVREnabled_0 then v34() else nil;
    local v103 = if l_isInExperienceUIVREnabled_0 then v26(v22:getTopBarVisibiity()) else nil;
    local v104 = if l_isInExperienceUIVREnabled_0 and v42 then v26(v42) else nil;
    local v105 = false;
    if l_isInExperienceUIVREnabled_0 and v102 and not v103 and not v104 then
        v105 = true;
        v88 = v88 and not v105;
    end;
    local v110 = v4.useCallback(function(v106, v107) --[[ Line: 347 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), v105 (ref), l_ControlState_0 (ref), v22 (ref), v83 (copy), v91 (ref), v96 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v101 (copy)
        if l_isInExperienceUIVREnabled_0 and v105 then
            return;
        else
            if v107 == l_ControlState_0.Selected and (v106 == l_ControlState_0.Default or v106 == l_ControlState_0.Hover) then
                v22:setSelected(v83.integration.id);
            elseif v107 == l_ControlState_0.Selected and v106 == l_ControlState_0.Default then
                v22:setSelected(v83.integration.id);
            end;
            local v108 = v107 ~= l_ControlState_0.Default;
            v83.setHovered(v108);
            local v109 = v107 == l_ControlState_0.Hover;
            v91(v109, v109 and v96 or areTooltipsDisplaying());
            if l_FFlagEnableUnibarFtuxTooltips_0 and v109 then
                v22:onIntegrationHovered():fire(v83.integration.id);
            end;
            if not v108 then
                v101(false);
            end;
            return;
        end;
    end, if l_isInExperienceUIVREnabled_0 then {
        v83.setHovered, 
        v91, 
        v101, 
        v96, 
        v102, 
        v105
    } else {
        v83.setHovered, 
        v91, 
        v101, 
        v96
    });
    local v117 = v4.useCallback(function(_, v112) --[[ Line: 383 ]]
        -- upvalues: v88 (ref), v101 (copy), v23 (ref), v83 (copy), v89 (copy), l_UserInputService_0 (ref), v32 (ref), v22 (ref), v21 (ref)
        if not v88 then
            return;
        else
            if v112.UserInputType == Enum.UserInputType.MouseButton1 or v112.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v112.Position;
                v101(true, true);
                v23.default:onIconTouchBegan(v83.integration.id);
                if not v89.current then
                    v89.current = l_UserInputService_0.InputChanged:Connect(function(v114, _) --[[ Line: 396 ]]
                        -- upvalues: v32 (ref), v112 (copy), v22 (ref), v83 (ref), v89 (ref), l_Position_0 (copy), v21 (ref), v23 (ref)
                        if v32(v112, v114) then
                            return;
                        elseif v22:isWindowOpen(v83.integration.id) or not v89.current then
                            return;
                        else
                            local l_Position_1 = v114.Position;
                            if math.abs((l_Position_0 - l_Position_1).Magnitude) > v21.DRAG_MAGNITUDE_THRESHOLD then
                                v23.default:onIconDrag(v83.integration.id);
                                v22:storeChromeInteracted();
                                v22:toggleWindow(v83.integration.id);
                                v22:gesture(v83.integration.id, v89, v112);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end, {
        v88
    });
    local v120 = v4.useCallback(function(_, v119) --[[ Line: 422 ]]
        -- upvalues: v88 (ref), v101 (copy), v89 (copy), v22 (ref), v83 (copy)
        if not v88 then
            return;
        else
            if v119.UserInputType == Enum.UserInputType.MouseButton1 or v119.UserInputType == Enum.UserInputType.Touch then
                v101(false);
                if v89.current then
                    v89.current:Disconnect();
                    v89.current = nil;
                    v22:gesture(v83.integration.id, nil);
                end;
            end;
            return;
        end;
    end, {
        v88
    });
    local v121 = (not not v90 or v96 or v98) and not v100;
    if l_isInExperienceUIVREnabled_0 and v121 and v105 then
        v121 = false;
    end;
    logTooltipState(v83.integration.id, v121);
    local v122 = if l_FFlagEnableConsoleExpControls_0 then v4.useContext(v46) else nil;
    local v127 = v4.useCallback(function(v123) --[[ Line: 450 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v22 (ref), v4 (ref), l_Interactable_0 (ref), v21 (ref), v83 (copy), v85 (ref), v110 (copy), v86 (copy), l_FFlagUnibarMenuOpenHamburger_0 (ref), l_FFlagUnibarMenuOpenSubmenu_0 (ref), l_useCursor_0 (ref), v12 (ref), v121 (ref), l_secondaryAction_0 (copy), v122 (copy), v117 (copy), v120 (copy), l_isInExperienceUIVREnabled_0 (ref), v102 (copy), v105 (ref), v101 (copy), v89 (copy)
        local v124 = nil;
        if l_FFlagEnableConsoleExpControls_0 then
            v124 = v22:menuList():get()[1].id;
        end;
        return v4.createElement(l_Interactable_0, {
            Name = (if l_FFlagEnableConsoleExpControls_0 then v21.ICON_NAME_PREFIX else "IconHitArea_") .. v83.integration.id, 
            Size = v85, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            onStateChanged = v110, 
            ref = v86, 
            SelectionOrder = if not not l_FFlagUnibarMenuOpenHamburger_0 or l_FFlagUnibarMenuOpenSubmenu_0 then v83.integration.order else 100 - v83.integration.order, 
            Position = v83.isCurrentlyOpenSubMenu:map(function(v125) --[[ Line: 468 ]]
                -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref)
                return UDim2.new(0.5, 0, 0.5, not l_FFlagEnableConsoleExpControls_0 and v125 and 1 or 0);
            end), 
            SelectionImageObject = l_useCursor_0(v12.Enums.CursorType.SkinToneCircle), 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = v83.isCurrentlyOpenSubMenu:map(function(v126) --[[ Line: 474 ]]
                -- upvalues: v121 (ref), l_secondaryAction_0 (ref)
                if v121 and l_secondaryAction_0 or v126 then
                    return Enum.SelectionBehavior.Escape;
                else
                    return Enum.SelectionBehavior.Stop;
                end;
            end), 
            NextSelectionLeft = if l_FFlagEnableConsoleExpControls_0 and v83.integration.id == v124 then v122.menuIconRef else nil, 
            [v4.Change.AbsolutePosition] = v123, 
            [v4.Change.AbsoluteSize] = v123, 
            [v4.Event.InputBegan] = v117, 
            [v4.Event.InputEnded] = v120, 
            [v4.Event.Activated] = function() --[[ Line: 488 ]]
                -- upvalues: l_isInExperienceUIVREnabled_0 (ref), v102 (ref), v105 (ref), v22 (ref), v101 (ref), v83 (ref), v89 (ref)
                if l_isInExperienceUIVREnabled_0 and v102 then
                    if v105 then
                        return;
                    else
                        v22:onTriggerVRToggleButton():fire(true);
                    end;
                end;
                v101(true, true);
                v83.integration.activated();
                if v89.current then
                    v89.current:Disconnect();
                    v89.current = nil;
                    v22:gesture(v83.integration.id, nil);
                end;
            end
        }, {
            corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        });
    end, {
        v110, 
        v91, 
        v101, 
        v117, 
        v120, 
        v83.isCurrentlyOpenSubMenu, 
        v121, 
        l_secondaryAction_0, 
        if l_isInExperienceUIVREnabled_0 then v105 else nil, 
        if l_FFlagEnableConsoleExpControls_0 then v122.menuIconRef else nil
    });
    local v128 = v4.useRef(nil);
    local v134 = v4.useCallback(function(v129) --[[ Line: 525 ]]
        -- upvalues: v128 (copy), v97 (copy)
        local v130 = nil;
        local v131 = nil;
        local v132 = nil;
        local function v133() --[[ Line: 532 ]]
            -- upvalues: v130 (ref), v131 (ref), v132 (ref)
            if v130 then
                v130:disconnect();
                v130 = nil;
            end;
            if v131 then
                v131:disconnect();
                v131 = nil;
            end;
            if v132 then
                v132:disconnect();
                v132 = nil;
            end;
        end;
        if v129 ~= v128.current then
            pcall(v133);
            if v129 then
                v130 = v129.MouseEnter:Connect(function() --[[ Line: 550 ]]
                    -- upvalues: v97 (ref)
                    v97(true, true);
                end);
                v131 = v129.MouseLeave:Connect(function() --[[ Line: 553 ]]
                    -- upvalues: v97 (ref)
                    v97(false);
                end);
                v132 = v129.Destroying:Connect(function() --[[ Line: 556 ]]
                    -- upvalues: v97 (ref)
                    v97(false);
                end);
            end;
            v128.current = v129;
        end;
    end, {
        v97
    });
    local v137 = if l_secondaryAction_0 then {
        text = l_secondaryAction_0.label, 
        onStateChanged = function(_, v136) --[[ Line: 567 ]] --[[ Name: onStateChanged ]]
            -- upvalues: l_ControlState_0 (ref), v99 (copy)
            if v136 == l_ControlState_0.Selected then
                v99(true);
                return;
            else
                v99(false);
                return;
            end;
        end, 
        onActivated = function() --[[ Line: 574 ]] --[[ Name: onActivated ]]
            -- upvalues: l_secondaryAction_0 (copy), v83 (copy)
            l_secondaryAction_0.activated(v83.integration);
        end, 
        NextSelectionUp = v86, 
        NextSelectionLeft = v86, 
        NextSelectionRight = v86, 
        NextSelectionDown = v86
    } else nil;
    if l_isInExperienceUIVREnabled_0 and v102 then
        local v138, v139 = v4.useBinding(Vector2.zero);
        local v140, v141 = v4.useBinding(Vector2.zero);
        local v143 = v4.useCallback(function(v142) --[[ Line: 588 ]]
            -- upvalues: v139 (copy), v141 (copy)
            v139(v142.AbsolutePosition);
            v141(v142.AbsoluteSize);
        end, {
            v139, 
            v141
        });
        return v4.createElement(v4.Fragment, nil, {
            VRSpatialTooltip = if v121 and v35 then v4.createElement(v35, {
                panelType = v36.ToolTipsContainer, 
                renderFunction = function(v144) --[[ Line: 600 ]] --[[ Name: renderFunction ]]
                    -- upvalues: v138 (copy), v140 (copy), v39 (ref), v4 (ref), v38 (ref), v83 (copy), v37 (ref), v137 (copy), l_secondaryAction_0 (copy), v134 (copy)
                    local v145 = Vector2.new(v138:getValue().X + v140:getValue().X / 2, v144.Y - v39);
                    return v4.createElement(v38, {
                        textAlignment = Enum.TextXAlignment.Center, 
                        headerText = v83.integration.integration.label, 
                        orientation = v37.Top, 
                        distanceOffset = 0, 
                        triggerPointCenter = v145, 
                        contentOffsetVector = Vector2.zero, 
                        triggerPointRadius = Vector2.zero, 
                        buttonProps = v137, 
                        ref = if l_secondaryAction_0 then v134 else nil
                    });
                end
            }) else nil; 
            v127(v143)
        });
    else
        return l_withTooltip_0({
            headerText = v83.integration.integration.label, 
            hotkeyCodes = v83.integration.integration.hotkeyCodes, 
            textAlignment = Enum.TextXAlignment.Left, 
            buttonProps = v137, 
            ref = if l_secondaryAction_0 then v134 else nil
        }, {
            active = v121, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 10
        }, v127);
    end;
end;
IconHost = function(v146) --[[ Line: 639 ]] --[[ Name: IconHost ]]
    -- upvalues: v4 (copy), l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v21 (copy), v29 (copy), v22 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    if not v146.integration or not v146.integration.component then
        warn("IconHost has no component to render");
    end;
    local v147, v148 = v4.useBinding(false);
    local v149, v150 = v4.useBinding(true);
    local v151 = l_useStyle_0();
    local _ = nil;
    local l_BackgroundOnHover_0 = v151.Theme.BackgroundOnHover;
    local v154 = nil;
    v154 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_CELL_WIDTH else v21.ICON_CELL_WIDTH;
    local v156 = v29(v22:currentSubMenu(), function(v155) --[[ Line: 662 ]]
        -- upvalues: v146 (copy)
        return v155 == v146.integration.id;
    end);
    return v4.createElement("Frame", {
        Size = UDim2.new(0, v154, 0, v154), 
        LayoutOrder = v146.integration.order, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v146.position, 
        Visible = v146.visible, 
        ZIndex = if l_FFlagEnableConsoleExpControls_0 then nil else v146.integration.order
    }, {
        v4.createElement("Frame", {
            Name = "IntegrationIconFrame", 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Visible = v149
        }, {
            IntegrationIcon = v146.integration and v146.integration.component and v146.integration.component(v146) or nil, 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        }), 
        if v146.integration.integration.flashNotificationSource then v4.createElement(NotificationIndicator, {
            integration = v146.integration, 
            setIconVisible = v150
        }) else nil, 
        v4.createElement(HighlightCircle, {
            name = "SelectedHighlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v156
        }), 
        v4.createElement(HighlightCircle, {
            name = "Highlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v147
        }), 
        v4.createElement(NotificationBadge, v146), 
        if v146.disableButtonBehaviors then nil else v4.createElement(TooltipButton, {
            integration = v146.integration, 
            setHovered = v148, 
            isCurrentlyOpenSubMenu = v156
        })
    });
end;
return IconHost;