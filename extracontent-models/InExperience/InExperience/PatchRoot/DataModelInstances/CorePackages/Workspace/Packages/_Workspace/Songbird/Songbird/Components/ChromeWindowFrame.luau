local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v5 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local v7 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v8 = require(l_script_FirstAncestor_0.Parent.Responsive);
local v9 = require(l_script_FirstAncestor_0.Components.CollapsibleFrame);
local v10 = require(l_script_FirstAncestor_0.constants);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdPopoverSubmenu);
local l_GetFFlagChromeMusicWindowTopbarReappearsOnGamepad_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagChromeMusicWindowTopbarReappearsOnGamepad;
local l_createNextOrder_0 = v7.createNextOrder;
local l_usePrevious_0 = v7.usePrevious;
local l_useCallback_0 = v6.useCallback;
local l_useEffect_0 = v6.useEffect;
local l_useRef_0 = v6.useRef;
local l_useState_0 = v6.useState;
local _ = function(v19) --[[ Line: 28 ]] --[[ Name: useUnfocusKeybind ]]
    -- upvalues: l_useEffect_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy)
    l_useEffect_0(function() --[[ Line: 29 ]]
        -- upvalues: v19 (copy), l_GuiService_0 (ref), l_ContextActionService_0 (ref)
        if v19 then
            l_ContextActionService_0:BindCoreAction("UnfocusMusicWindow", function(_, v21) --[[ Line: 31 ]] --[[ Name: unfocus ]]
                -- upvalues: l_GuiService_0 (ref)
                if v21 == Enum.UserInputState.End then
                    l_GuiService_0.SelectedCoreObject = nil;
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
            return function() --[[ Line: 42 ]]
                -- upvalues: l_ContextActionService_0 (ref)
                l_ContextActionService_0:UnbindCoreAction("UnfocusMusicWindow");
            end;
        else
            return nil;
        end;
    end, {
        v19
    });
end;
local v23 = {
    autoCollapseSeconds = 3, 
    isSubMenuOpen = false, 
    isFocused = false, 
    onToggleSubMenu = function() --[[ Line: 70 ]] --[[ Name: onToggleSubMenu ]]

    end
};
return function(v24) --[[ Line: 75 ]] --[[ Name: ChromeWindowFrame ]]
    -- upvalues: v4 (copy), v23 (copy), v5 (copy), l_useRef_0 (copy), v8 (copy), l_GetFFlagChromeMusicWindowTopbarReappearsOnGamepad_0 (copy), l_usePrevious_0 (copy), v11 (copy), v10 (copy), l_createNextOrder_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), l_RunService_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), v6 (copy), v9 (copy)
    local v25 = v4.Dictionary.join(v23, v24);
    local v26 = v5.Hooks.useTokens();
    local v27 = l_useRef_0(nil);
    local v28 = l_useRef_0(nil);
    local v29 = v8.useLastInput();
    local v30 = if l_GetFFlagChromeMusicWindowTopbarReappearsOnGamepad_0() then l_usePrevious_0(v29) else nil;
    local v31 = true;
    if not v11() and typeof(v25.overflowButtonRef) == "table" and v25.overflowButtonRef.current then
        local v32 = v25.overflowButtonRef.current.AbsolutePosition + Vector2.new(v26.Gap.Small + v10.SUBMENU_WIDTH, 0);
        local l_FirstAncestorOfClass_0 = v25.overflowButtonRef.current:FindFirstAncestorOfClass("ScreenGui");
        v31 = v32.X < l_FirstAncestorOfClass_0.AbsoluteSize.X;
    end;
    local v34 = l_createNextOrder_0();
    local v35 = l_useRef_0(nil);
    local v36, v37 = l_useState_0(true);
    local v38 = l_useCallback_0(function() --[[ Line: 101 ]]
        -- upvalues: v25 (copy)
        if v25.onClose then
            v25.onClose();
        end;
    end, {
        v25.onClose
    });
    local v40 = l_useCallback_0(function(v39) --[[ Line: 108 ]]
        -- upvalues: v35 (copy), v37 (copy), v5 (ref)
        v35.current = nil;
        v37(true);
        if v39 == v5.Enums.ControlState.Default then
            v35.current = os.time();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 124 ]]
        -- upvalues: v29 (copy), v8 (ref), v25 (copy), l_RunService_0 (ref), v35 (copy), v37 (copy)
        if v29 ~= v8.Input.Pointer then
            return;
        elseif v25.autoCollapseSeconds and v25.autoCollapseSeconds > 0 then
            local v41 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 132 ]]
                -- upvalues: v35 (ref), v25 (ref), v37 (ref)
                if v35.current and os.time() - v35.current >= v25.autoCollapseSeconds then
                    v37(false);
                end;
            end);
            return function() --[[ Line: 140 ]]
                -- upvalues: v41 (copy)
                v41:Disconnect();
            end;
        else
            return nil;
        end;
    end, {
        v25.autoCollapseSeconds, 
        v29
    });
    local v42, v43 = l_useState_0(Vector2.new(1e999, 1e999));
    local v45 = l_useCallback_0(function(v44) --[[ Line: 148 ]]
        -- upvalues: v43 (copy)
        v43(v44.AbsoluteSize);
    end, {});
    l_useEffect_0(function() --[[ Line: 152 ]]
        -- upvalues: v28 (copy), v25 (copy)
        local l_current_0 = v28.current;
        if l_current_0 then
            local function v50(_, _, v49) --[[ Line: 156 ]] --[[ Name: onSelectionChanged ]]
                -- upvalues: l_current_0 (copy), v25 (ref)
                if not l_current_0:IsAncestorOf(v49) and v25.onUnfocus then
                    v25.onUnfocus();
                end;
            end;
            local v51 = l_current_0.SelectionChanged:Connect(v50);
            return function() --[[ Line: 166 ]]
                -- upvalues: v51 (copy)
                v51:Disconnect();
            end;
        else
            return nil;
        end;
    end, {
        v25.onUnfocus
    });
    l_useEffect_0(function() --[[ Line: 173 ]]
        -- upvalues: v25 (copy), l_GuiService_0 (ref), v27 (copy)
        if v25.isFocused then
            l_GuiService_0.SelectedCoreObject = v27.current;
        end;
    end, {
        v25.isFocused
    });
    local l_isFocused_0 = v25.isFocused;
    l_useEffect_0(function() --[[ Line: 29 ]]
        -- upvalues: l_isFocused_0 (copy), l_GuiService_0 (ref), l_ContextActionService_0 (ref)
        if l_isFocused_0 then
            l_ContextActionService_0:BindCoreAction("UnfocusMusicWindow", function(_, v54) --[[ Line: 31 ]] --[[ Name: unfocus ]]
                -- upvalues: l_GuiService_0 (ref)
                if v54 == Enum.UserInputState.End then
                    l_GuiService_0.SelectedCoreObject = nil;
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
            return function() --[[ Line: 42 ]]
                -- upvalues: l_ContextActionService_0 (ref)
                l_ContextActionService_0:UnbindCoreAction("UnfocusMusicWindow");
            end;
        else
            return nil;
        end;
    end, {
        l_isFocused_0
    });
    if l_GetFFlagChromeMusicWindowTopbarReappearsOnGamepad_0() then
        l_useEffect_0(function() --[[ Line: 185 ]]
            -- upvalues: v30 (copy), v29 (copy), v8 (ref), v37 (copy)
            if v30 and v29 ~= v30 and v29 ~= v8.Input.Pointer then
                v37(true);
            end;
        end, {
            v29, 
            v30
        });
    end;
    return v6.createElement(v5.View, {
        tag = "auto-xy", 
        sizeConstraint = {
            MaxSize = if v25.maxSize then v25.maxSize else nil
        }, 
        stateLayer = {
            affordance = v5.Enums.StateLayerAffordance.None
        }, 
        selectionGroup = {
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, 
        onStateChanged = v40, 
        ref = if v11() then v28 else nil
    }, {
        WindowFrame = v6.createElement(v5.View, {
            tag = "size-full-0 auto-y bg-over-media-100 radius-medium col gap-xxsmall stroke-emphasis"
        }, {
            CollapsibleTitleBar = v6.createElement(v9, {
                isCollapsed = not v36, 
                LayoutOrder = v34()
            }, {
                TitleBar = v6.createElement(v5.View, {
                    tag = "size-full-0 auto-y row flex-between items-center"
                }, {
                    Actions = v6.createElement(v5.View, {
                        tag = "auto-xy row", 
                        LayoutOrder = v34(), 
                        onAbsoluteSizeChanged = v45
                    }, {
                        CloseButton = v6.createElement(v5.IconButton, {
                            icon = v5.Enums.IconName.X, 
                            layoutOrder = v34(), 
                            size = v5.Enums.IconSize.Medium, 
                            onActivated = v38, 
                            ref = v27
                        })
                    }), 
                    CenterAlignedTitle = v6.createElement(v5.View, {
                        tag = "size-full-0 shrink auto-y", 
                        LayoutOrder = v34()
                    }, {
                        Title = v6.createElement(v5.Text, {
                            tag = "size-full-0 text-title-medium content-emphasis", 
                            Text = v25.title, 
                            fontStyle = v26.Typography.TitleMedium, 
                            Position = UDim2.new(0, -v42.X / 2, 0, 0)
                        })
                    })
                })
            }), 
            Divider = if v36 then v6.createElement(v5.View, {
                backgroundStyle = v26.Color.Stroke.Emphasis, 
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = v34()
            }) else nil, 
            Content = v6.createElement(v5.View, {
                tag = "size-full-0 auto-y row flex-between items-center padding-left-small padding-y-small", 
                LayoutOrder = v34()
            }, {
                Body = v6.createElement(v5.View, {
                    tag = "size-full-0 auto-y shrink clip", 
                    LayoutOrder = v34()
                }, v25.children), 
                Actions = v6.createElement(v5.View, {
                    tag = "auto-xy row flex-between items-center", 
                    LayoutOrder = v34()
                }, {
                    CustomActions = if v25.actions then v6.createElement(v5.View, {
                        tag = "row auto-xy", 
                        LayoutOrder = v34()
                    }, v25.actions) else nil, 
                    OverflowButton = if v11() then if v25.menuItems and v29 ~= v8.Input.Directional then v6.createElement(v5.IconButton, {
                        icon = "icons/common/overflow", 
                        size = v5.Enums.IconSize.Medium, 
                        onActivated = v25.onToggleSubMenu, 
                        LayoutOrder = v34()
                    }) else nil else if v25.submenu and v29 ~= v8.Input.Directional then v6.createElement(v5.IconButton, {
                        icon = "icons/common/overflow", 
                        size = v5.Enums.IconSize.Medium, 
                        onActivated = v25.onToggleSubMenu, 
                        LayoutOrder = v34(), 
                        ref = v25.overflowButtonRef
                    }) else nil
                })
            })
        }), 
        SubMenu = if v11() then nil else if v25.submenu and v25.isSubMenuOpen then v6.createElement(v5.View, {
            tag = "auto-xy bg-over-media-200 radius-medium padding-small", 
            Position = if v31 then UDim2.fromScale(1, 0) + UDim2.fromOffset(v26.Gap.Small, 0) else UDim2.new(1, -v10.SUBMENU_WIDTH - v10.ICON_BUTTON_WIDTH / 2, 1, 0) + UDim2.fromOffset(v26.Gap.Small / 2, v26.Gap.Small)
        }, v25.submenu) else nil, 
        OverflowMenu = if v11() and v25.menuItems then v6.createElement(v5.Menu, {
            isOpen = v25.isSubMenuOpen, 
            items = v25.menuItems, 
            side = v5.Enums.PopoverSide.Right, 
            align = v5.Enums.PopoverAlign.Center, 
            anchorRef = v28, 
            onPressedOutside = v25.onToggleSubMenu
        }) else nil
    });
end;