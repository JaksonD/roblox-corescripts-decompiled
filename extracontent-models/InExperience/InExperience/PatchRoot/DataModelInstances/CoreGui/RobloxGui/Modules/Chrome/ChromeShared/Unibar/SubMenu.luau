local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v4.FFlagEnableConsoleExpControls;
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v4.FFlagVirtualCursorTopbarAlwaysVisible;
local v7 = game:DefineFastFlag("AvatarSwitcherHamburgerExposure", false);
local v8 = game:DefineFastString("AvatarSwitcherIXPLayer", "UIEcosystem.User.Migration");
local l_FFlagUnibarMenuOpenSubmenu_0 = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v11 = require(l_CorePackages_0.Packages.React);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local v13 = if l_FFlagEnableConsoleExpControls_0 then require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils else nil;
local l_StyledTextLabel_0 = v12.App.Text.StyledTextLabel;
local l_useStyle_0 = v12.Core.Style.useStyle;
local l_Interactable_0 = v12.Core.Control.Interactable;
local l_ControlState_0 = v12.Core.Control.Enum.ControlState;
local l_VerticalScrollView_0 = v12.App.Container.VerticalScrollView;
local l_ScrollBarType_0 = v12.App.Container.Enum.ScrollBarType;
local v20 = require(l_CorePackages_0.Packages.ReactOtter);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v22 = require(l_CorePackages_0.Packages.Foundation);
local l_useCursor_0 = v22.Hooks.useCursor;
local v24 = require(l_script_FirstAncestor_0.Service);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v26 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v27 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v28 = if l_FFlagEnableConsoleExpControls_0 then require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Components.MenuIconContext) else nil;
local v29 = require(l_script_FirstAncestor_0.Unibar.SubMenuContext);
local v30 = require(script.Parent.UnibarStyle);
local l_UserInputService_0 = game:GetService("UserInputService");
local v32 = require(l_script_FirstAncestor_0.Hooks.useChromeMenuItems);
local v33 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v34 = require(l_script_FirstAncestor_0.Hooks.useTopbarInsetHeight);
local v35 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v36 = game:DefineFastFlag("FixChromeIntegrationLayoutBug", false);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local v40 = nil;
if l_isInExperienceUIVREnabled_0 then
    v40 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi).UIManager;
end;
local v41 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.IconHost);
local l_RoundedSlot_0 = v22.Enums.CursorType.RoundedSlot;
local v43 = Vector2.new(0, 0);
local v44 = {
    Closed = 0, 
    Open = 1
};
local v45 = {};
local v46 = nil;
MenuRow = function(v47) --[[ Line: 82 ]] --[[ Name: MenuRow ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v30 (copy), v27 (copy), v11 (copy), v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v28 (copy), l_ControlState_0 (copy), v24 (copy), l_GuiService_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), v41 (copy), l_StyledTextLabel_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_InExperienceUIVRIXP_0 (copy), v40 (ref), l_Interactable_0 (copy), l_useCursor_0 (copy), l_RoundedSlot_0 (copy), v36 (copy)
    local v48 = l_useStyle_0();
    local v49 = nil;
    local l_Theme_0 = v48.Theme;
    local v51 = {
        Color = Color3.new(0, 0, 0), 
        Transparency = 1
    };
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v49 = v30.use();
        v52 = v49.ICON_SIZE;
        v53 = v49.SUB_MENU_ROW_HEIGHT;
        v54 = v49.SUBMENU_PADDING_LEFT;
        v55 = v49.SUBMENU_PADDING_RIGHT;
        v56 = v49.SUBMENU_ROW_LABEL_FONT;
        v57 = v49.SUBMENU_ROW_PADDING;
        v58 = v49.SUBMENU_ROW_CORNER_RADIUS;
    else
        v52 = v27.ICON_SIZE;
        v53 = v27.SUB_MENU_ROW_HEIGHT;
        v54 = v27.SUBMENU_PADDING_LEFT;
        v55 = v27.SUBMENU_PADDING_RIGHT;
        v56 = v27.SUBMENU_ROW_LABEL_FONT;
        v57 = v27.SUBMENU_ROW_PADDING;
        v58 = v27.SUBMENU_ROW_CORNER_RADIUS;
    end;
    local v59 = v11.useContext(v29);
    local v60 = if l_FFlagEnableConsoleExpControls_0 then v11.useContext(v28) else nil;
    local v61, v62 = v11.useBinding(v51);
    local v65 = v11.useCallback(function(_, v64) --[[ Line: 121 ]]
        -- upvalues: l_ControlState_0 (ref), v62 (copy), l_Theme_0 (copy), v51 (copy)
        if v64 == l_ControlState_0.Pressed then
            v62(l_Theme_0.BackgroundOnPress);
            return;
        elseif v64 == l_ControlState_0.Hover then
            v62(l_Theme_0.BackgroundOnHover);
            return;
        else
            v62(v51);
            return;
        end;
    end);
    local v66 = v11.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v24 (ref), l_GuiService_0 (ref), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), v47 (copy)
        if l_FFlagEnableConsoleExpControls_0 then
            v24:disableFocusNav();
            l_GuiService_0.SelectedCoreObject = nil;
            v24:setShortcutBar(nil);
            if l_FFlagVirtualCursorTopbarAlwaysVisible_0 then
                v24:selectedItem():set(nil);
            end;
            v47.activated();
            return;
        else
            v47.activated();
            return;
        end;
    end, {
        v47.id
    });
    local v68 = v11.createElement(v11.Fragment, nil, {
        UIPadding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v54), 
            PaddingRight = UDim.new(0, v55)
        }), 
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v57)
        }), 
        IconHost = v11.createElement(v41, {
            integration = v47, 
            disableButtonBehaviors = true
        }), 
        StyledTextLabel = v11.createElement(l_StyledTextLabel_0, {
            size = UDim2.new(1, -v52 - v54 - v55, 1, 0), 
            lineHeight = 1, 
            fontStyle = v56, 
            colorStyle = if v59 then {
                Color = l_Theme_0.TextEmphasis.Color, 
                Transparency = v59:map(function(v67) --[[ Line: 173 ]]
                    return 1 - v67;
                end)
            } else l_Theme_0.TextEmphasis, 
            text = v47.integration.label, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            fluidSizing = true, 
            richText = true
        })
    });
    local v69 = (not l_isInExperienceUIVREnabled_0 or l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled()) and 1 or v40.getInstance():getAdditionalCameraScaleIfNeeded();
    return v11.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 0, v53 * v69), 
        BorderSizePixel = 0, 
        BackgroundTransparency = v61:map(function(v70) --[[ Line: 191 ]]
            return v70.Transparency;
        end), 
        BackgroundColor3 = v61:map(function(v71) --[[ Line: 194 ]]
            return v71.Color;
        end), 
        SelectionImageObject = l_useCursor_0(l_RoundedSlot_0), 
        [v11.Event.Activated] = v66, 
        LayoutOrder = v47.order, 
        onStateChanged = v65, 
        NextSelectionLeft = if l_FFlagEnableConsoleExpControls_0 then v60.menuIconRef else nil
    }, {
        UICorner = v11.createElement("UICorner", {
            CornerRadius = UDim.new(0, v58)
        }), 
        RowLabel = if v36 then v11.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v47.order
        }, {
            v68
        }) else v68
    });
end;
isLeft = function(v72) --[[ Line: 219 ]] --[[ Name: isLeft ]]
    return v72 == Enum.HorizontalAlignment.Left;
end;
SubMenu = function(v73) --[[ Line: 223 ]] --[[ Name: SubMenu ]]
    -- upvalues: l_useStyle_0 (copy), v11 (copy), v33 (copy), v26 (copy), v34 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v30 (copy), v27 (copy), l_GuiService_0 (copy), v24 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_UserInputService_0 (copy), v13 (copy), v7 (copy), l_IXPServiceWrapper_0 (copy), v8 (copy), l_UserGameSettings_0 (copy), v35 (copy), l_isInExperienceUIVREnabled_0 (copy), l_InExperienceUIVRIXP_0 (copy), v40 (ref), l_isSpatial_0 (copy), l_VerticalScrollView_0 (copy), l_ScrollBarType_0 (copy)
    local v74 = l_useStyle_0();
    local v75 = nil;
    local l_Theme_1 = v74.Theme;
    local v77 = v11.useRef(nil);
    local v78 = v33(v26.screenSize);
    local v79 = v34();
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v75 = v30.use();
        v80 = v75.UNIBAR_LEFT_MARGIN;
        v81 = v75.ICON_CELL_WIDTH;
        v82 = v75.UNIBAR_END_PADDING;
        v83 = v75.SUB_MENU_ROW_HEIGHT;
        v84 = v75.SUBMENU_CORNER_RADIUS;
        v85 = v75.SUBMENU_BOTTOM_PADDING;
    else
        v80 = v27.UNIBAR_LEFT_MARGIN;
        v81 = v27.ICON_CELL_WIDTH;
        v82 = v27.UNIBAR_END_PADDING;
        v83 = v27.SUB_MENU_ROW_HEIGHT;
        v84 = v27.SUBMENU_CORNER_RADIUS;
        v85 = v27.SUBMENU_BOTTOM_PADDING;
    end;
    local v86 = v83 * 0.5;
    v11.useEffect(function() --[[ Line: 253 ]]
        -- upvalues: v77 (copy), l_GuiService_0 (ref), v24 (ref), l_FFlagEnableConsoleExpControls_0 (ref), l_UserInputService_0 (ref), v13 (ref)
        local function _() --[[ Line: 254 ]] --[[ Name: moveLeft ]]
            -- upvalues: v77 (ref), l_GuiService_0 (ref), v24 (ref)
            if v77.current and v77.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                v24:setSelectedByOffset(-1);
            end;
        end;
        local function _() --[[ Line: 261 ]] --[[ Name: moveRight ]]
            -- upvalues: v77 (ref), l_GuiService_0 (ref), v24 (ref)
            if v77.current and v77.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                v24:setSelectedByOffset(1);
            end;
        end;
        local v89 = nil;
        if l_FFlagEnableConsoleExpControls_0 then
            v89 = l_UserInputService_0.InputChanged:Connect(function(_) --[[ Line: 272 ]]
                -- upvalues: l_UserInputService_0 (ref), v13 (ref), v77 (ref), l_GuiService_0 (ref), v24 (ref)
                for _, v92 in (l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1)) do
                    if v92.KeyCode == Enum.KeyCode.Thumbstick1 then
                        local l_X_0 = v13.normalizeStickByDeadzone(Vector2.new(v92.Position.X, v92.Position.Y)).X;
                        if l_X_0 < -0.5 then
                            if v77.current and v77.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                                v24:setSelectedByOffset(-1);
                            end;
                        elseif l_X_0 > 0.5 and v77.current and v77.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                            v24:setSelectedByOffset(1);
                        end;
                    end;
                end;
            end);
        end;
        local v96 = l_UserInputService_0.InputBegan:Connect(function(v94) --[[ Line: 294 ]]
            -- upvalues: v77 (ref), l_GuiService_0 (ref), v24 (ref)
            local l_KeyCode_0 = v94.KeyCode;
            if l_KeyCode_0 == Enum.KeyCode.Left or l_KeyCode_0 == Enum.KeyCode.DPadLeft then
                if v77.current and v77.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                    v24:setSelectedByOffset(-1);
                    return;
                end;
            elseif (l_KeyCode_0 == Enum.KeyCode.Right or l_KeyCode_0 == Enum.KeyCode.DPadRight) and v77.current and v77.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                v24:setSelectedByOffset(1);
            end;
        end);
        return function() --[[ Line: 303 ]]
            -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v89 (ref), v96 (copy)
            if l_FFlagEnableConsoleExpControls_0 then
                v89:Disconnect();
            end;
            v96:Disconnect();
        end;
    end, {});
    if v7 then
        v11.useEffect(function() --[[ Line: 313 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v8 (ref)
            l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v8);
        end, {});
    end;
    local v97 = v79 + v81;
    local v98 = if v73 and v73.items then v83 * #v73.items else 0;
    local v99 = math.min(v78.Y - v97, v98);
    if v78.Y - v97 < v98 then
        local v100 = math.floor((v78.Y - v97) / v83);
        v99 = if v83 * v100 + v86 <= v78.Y - v97 then v83 * v100 + v86 else v83 * v100 - v86;
    end;
    local v102 = {
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UISizeConstraint = v11.createElement("UISizeConstraint", {
            MinSize = if not l_UserGameSettings_0.ReducedMotion and v73.menuTransition then v73.menuTransition:map(function(v101) --[[ Line: 341 ]]
                -- upvalues: v99 (ref)
                return Vector2.new(0, v99 * v101);
            end) else Vector2.new(0, v99)
        }), 
        BottomPadding = v11.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, v85), 
            BackgroundTransparency = 1, 
            LayoutOrder = 10000
        })
    };
    for _, v104 in v73.items do
        v102[v104.id] = v11.createElement(MenuRow, v104);
    end;
    local v105 = v35(v24:orderAlignment(), isLeft);
    local v106 = v74.Theme.BackgroundUIContrast.Transparency * v74.Settings.PreferredTransparency;
    local v107 = (not l_isInExperienceUIVREnabled_0 or l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled()) and 1 or v40.getInstance():getAdditionalCameraScaleIfNeeded();
    local v108 = nil;
    v108 = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then Vector2.new(0, 1) else if v105 then Vector2.zero else Vector2.new(1, 0);
    return v11.createElement("Frame", {
        Size = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then UDim2.new(1, 0, 0, v98 * v107) else UDim2.new(0, v81 * 4 + v80 + v82 * 2, 0, 0), 
        AnchorPoint = v108, 
        Position = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then UDim2.new(0, 0, 1, 0) else UDim2.new(0, -v79 - 2 + v80, 0, 0), 
        BackgroundColor3 = l_Theme_1.BackgroundUIContrast.Color, 
        BackgroundTransparency = if v73.menuTransition then v73.menuTransition:map(function(v109) --[[ Line: 379 ]]
            -- upvalues: v106 (copy)
            return v106 + (1 - v106) * (1 - v109);
        end) else v106, 
        AutomaticSize = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then nil else Enum.AutomaticSize.Y, 
        ref = v77, 
        SelectionGroup = l_FFlagEnableConsoleExpControls_0 and true or nil, 
        SelectionBehaviorDown = if l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil
    }, {
        UICorner = v11.createElement("UICorner", {
            CornerRadius = UDim.new(0, v84)
        }), 
        ScrollingFrame = v11.createElement(l_VerticalScrollView_0, {
            size = UDim2.new(1, 0, 1, 0), 
            canvasSizeY = UDim.new(0, v98), 
            selectable = false, 
            scrollBarType = l_ScrollBarType_0.Compact
        }, v102)
    });
end;
return function(v110) --[[ Line: 404 ]]
    -- upvalues: v11 (copy), v33 (copy), v24 (copy), v44 (copy), v32 (copy), v20 (copy), v45 (ref), v46 (ref), v27 (copy), l_UserInputService_0 (copy), v43 (ref), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), v29 (copy)
    local v111 = {};
    local v112 = v11.useRef(nil);
    local v113 = v11.useRef(nil);
    local v114 = v11.useRef(nil);
    local v115 = v33(v24:currentSubMenu());
    local _, v117 = v11.useState(v44.Closed);
    local v118 = v32();
    local v119 = {};
    local v121, v122 = v20.useAnimatedBinding(v44.Closed, function(v120) --[[ Line: 417 ]]
        -- upvalues: v117 (copy)
        v117(v120);
    end);
    v11.useEffect(function() --[[ Line: 422 ]]
        -- upvalues: v45 (ref), v119 (ref), v46 (ref), v115 (copy), v117 (copy), v44 (ref), v122 (copy), v20 (ref), v27 (ref), v114 (copy), l_UserInputService_0 (ref), v43 (ref), v113 (copy), v24 (ref), v112 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_InExperienceUIVRIXP_0 (ref)
        v45 = v119;
        v46 = v115;
        if v115 then
            v117(v44.Closed);
            v122(v20.spring(v44.Open, v27.MENU_ANIMATION_SPRING));
            v114.current = l_UserInputService_0.TouchStarted:Connect(function(v123) --[[ Line: 430 ]]
                -- upvalues: v43 (ref)
                v43 = Vector2.new(v123.Position.X, v123.Position.Y);
            end);
            v113.current = l_UserInputService_0.TouchTap:Connect(function(v124) --[[ Line: 434 ]]
                -- upvalues: v43 (ref), v24 (ref)
                if v124[1] - v43 ~= Vector2.zero then
                    return;
                else
                    local v125 = v24:currentSubMenu():get();
                    if v125 then
                        v24:toggleSubMenu(v125);
                    end;
                    return;
                end;
            end);
            v112.current = l_UserInputService_0.InputEnded:Connect(function(v126, _) --[[ Line: 445 ]]
                -- upvalues: l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_InExperienceUIVRIXP_0 (ref), v24 (ref)
                if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
                    return;
                else
                    local v128 = v126.UserInputType == Enum.UserInputType.MouseButton1;
                    local v129 = v24:currentSubMenu():get();
                    if v129 and v128 then
                        v24:toggleSubMenu(v129);
                    end;
                    return;
                end;
            end);
        else
            v117(v44.Open);
            v122(v20.spring(v44.Closed, v27.MENU_ANIMATION_SPRING));
        end;
        return function() --[[ Line: 466 ]]
            -- upvalues: v112 (ref), v113 (ref), v114 (ref)
            if v112.current then
                v112.current:Disconnect();
                v112.current = nil;
            end;
            if v113.current then
                v113.current:Disconnect();
                v113.current = nil;
            end;
            if v114.current then
                v114.current:Disconnect();
                v114.current = nil;
            end;
        end;
    end, {
        v115
    });
    if v115 and v118 then
        for _, v131 in v118 do
            if v115 == v131.id then
                v119 = v131.children;
                break;
            end;
        end;
    end;
    if #v119 > 0 then
        v111[v115] = v11.createElement(SubMenu, {
            items = v119, 
            menuTransition = v121
        });
    elseif #v45 > 0 then
        v111[v46] = v11.createElement(SubMenu, {
            items = v45, 
            menuTransition = v121
        });
    end;
    return v11.createElement("Frame", {
        Name = "SubMenuHost", 
        Size = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then UDim2.new(1, 0, 1, 0) else UDim2.new(0, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ref = if l_FFlagUnibarMenuOpenSubmenu_0 then v110.subMenuHostRef else nil
    }, v11.createElement(v29.Provider, {
        value = v121
    }, v111));
end;