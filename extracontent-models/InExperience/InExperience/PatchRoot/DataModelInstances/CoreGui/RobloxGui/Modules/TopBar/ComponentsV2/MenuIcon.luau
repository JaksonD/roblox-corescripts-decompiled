local _ = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Chrome_0 = l_Parent_1.Chrome;
local v9 = require(l_Chrome_0.Service);
local v10 = require(l_Parent_0.Constants);
local v11 = require(l_Parent_1.InGameMenuConstants);
local v12 = require(l_Chrome_0.ChromeShared.Unibar.Constants);
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local v14 = require(l_CorePackages_0.Workspace.Packages.Display);
local v15 = require(l_CorePackages_0.Packages.Foundation);
local v16 = require(l_CorePackages_0.Packages.Motion);
local v17 = require(l_CorePackages_0.Packages.React);
local v18 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v21 = require(l_CorePackages_0.Packages.SignalsReact);
local v22 = require(l_CorePackages_0.Packages.UIBlox);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_FFlagShowUnibarOnVirtualCursor_0 = v20.FFlagShowUnibarOnVirtualCursor;
local l_View_0 = v15.View;
local l_Icon_0 = v15.Icon;
local l_ControlState_0 = v15.Enums.ControlState;
local l_useTokens_0 = v15.Hooks.useTokens;
local l_useCursor_0 = v15.Hooks.useCursor;
local v30 = require(l_Parent_0.Components.Presentation.menuIconHoveredSignal);
local v31 = require(l_Parent_0.Components.Presentation.BadgeOver12);
local l_withTooltip_0 = v22.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v22.App.Dialog.Enum.TooltipOrientation;
local l_TooltipCallout_0 = v22.App.Dialog.TooltipCallout;
local v35 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
local l_UIManager_0 = v35.UIManager;
local l_Panel3DInSpatialUI_0 = v35.Panel3DInSpatialUI;
local l_PanelType_0 = v35.Constants.PanelType;
local l_SPATIAL_TOOLTIP_SPACING_0 = v35.Constants.SPATIAL_TOOLTIP_SPACING;
local function _() --[[ Line: 53 ]]
    -- upvalues: l_isSpatial_0 (copy), v9 (copy), l_UIManager_0 (copy)
    if l_isSpatial_0() then
        local v40 = v9:showTopBar();
        local v41 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
        return not v40 and not v41;
    else
        return false;
    end;
end;
local v43 = {
    Enum.KeyCode.Escape
};
return function(v44) --[[ Line: 81 ]] --[[ Name: MenuIcon ]]
    -- upvalues: l_useTokens_0 (copy), v21 (copy), v14 (copy), v10 (copy), v17 (copy), v16 (copy), l_GuiService_0 (copy), v9 (copy), v12 (copy), l_useCursor_0 (copy), v15 (copy), v43 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v18 (copy), l_SettingsShowSignal_0 (copy), l_FocusUtils_0 (copy), l_ControlState_0 (copy), l_isSpatial_0 (copy), l_UIManager_0 (copy), v30 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), l_GamepadService_0 (copy), l_Parent_1 (copy), v11 (copy), l_TooltipCallout_0 (copy), l_SPATIAL_TOOLTIP_SPACING_0 (copy), l_Panel3DInSpatialUI_0 (copy), l_PanelType_0 (copy), l_withTooltip_0 (copy), l_View_0 (copy), v31 (copy), l_Icon_0 (copy)
    local v45 = l_useTokens_0();
    local v47 = v21.useSignalState(function(v46) --[[ Line: 84 ]]
        -- upvalues: v14 (ref)
        return v14.GetDisplayStore(v46).getUIScale(v46);
    end);
    local _ = v10.TopBarButtonHeight * v47;
    local v49 = v10.TopBarButtonPadding * v47;
    local v50 = v10.MENU_ICON_SIZE * v47;
    local v51 = v17.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: v16 (ref), v50 (copy), v10 (ref)
        return {
            menuOpen = v16.createState({
                size = v50 * v10.MenuIconOpenScale
            }), 
            menuClosed = v16.createState({
                size = v50
            })
        };
    end, {
        v47
    });
    local v52, v53 = v16.useMotion(v51.menuClosed);
    local v54, v55 = v17.useBinding(l_GuiService_0.PreferredTransparency);
    local v56 = v17.useRef(false);
    local v57 = v17.useRef(false);
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if v44.unibarMenuRef and v44.unibarMenuRef.current then
        v58 = v9:menuList():get()[1];
        v59 = if v58 then v12.ICON_NAME_PREFIX .. v58.id else nil;
        v60 = if v44.unibarMenuRef.current and v59 then v44.unibarMenuRef.current:FindFirstChild(v59, true) else nil;
    end;
    local v61, v62 = v17.useState(false);
    local v63, v64 = v17.useState(Vector2.zero);
    local v65, v66 = v17.useState(Vector2.zero);
    local v67 = l_useCursor_0(v15.Enums.CursorType.SkinToneCircle);
    local v68 = v17.useRef("Roblox Menu");
    local v69 = {
        textAlignment = Enum.TextXAlignment.Center, 
        headerText = v68.current, 
        hotkeyCodes = v43
    };
    local v70 = {
        active = v61, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        DisplayOrder = 10
    };
    v17.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v68 (copy), v18 (ref), l_GuiService_0 (ref), v55 (copy), l_SettingsShowSignal_0 (ref), v53 (copy), v51 (copy), v44 (copy), v9 (ref), l_FocusUtils_0 (ref)
        pcall(function() --[[ Line: 141 ]]
            -- upvalues: v68 (ref), v18 (ref)
            v68.current = v18:FormatByKey("CoreScripts.TopBar.RobloxMenu");
        end);
        local v71 = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 145 ]]
            -- upvalues: v55 (ref), l_GuiService_0 (ref)
            v55(l_GuiService_0.PreferredTransparency);
        end);
        local v73 = l_SettingsShowSignal_0:connect(function(v72) --[[ Line: 148 ]]
            -- upvalues: v53 (ref), v51 (ref)
            v53(if v72 then v51.menuOpen else v51.menuClosed);
        end);
        local v74 = nil;
        if v44.menuIconRef then
            v74 = v9:onTriggerMenuIcon():connect(function() --[[ Line: 154 ]]
                -- upvalues: l_GuiService_0 (ref), v44 (ref), l_FocusUtils_0 (ref)
                l_GuiService_0.SelectedCoreObject = v44.menuIconRef.current;
                l_FocusUtils_0.MenuIconSelectedSignal:set(true);
            end);
        end;
        return function() --[[ Line: 160 ]]
            -- upvalues: v71 (copy), v73 (copy), v74 (ref)
            v71:Disconnect();
            v73:Disconnect();
            if v74 then
                v74:disconnect();
            end;
        end;
    end, {});
    local v75 = v17.useRef(l_ControlState_0.Default);
    local v83 = v17.useCallback(function(v76) --[[ Line: 170 ]]
        -- upvalues: l_ControlState_0 (ref), l_isSpatial_0 (ref), v9 (ref), l_UIManager_0 (ref), v57 (copy), v30 (ref), v56 (copy), v62 (copy), l_FocusUtils_0 (ref), v75 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (ref), l_GamepadService_0 (ref), l_GuiService_0 (ref), v12 (ref)
        if v76 == l_ControlState_0.Hover then
            local v77;
            if l_isSpatial_0() then
                local v78 = v9:showTopBar();
                local v79 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
                v77 = not v78 and not v79;
            else
                v77 = false;
            end;
            if v77 then
                return;
            else
                v57.current = true;
                v30:fire(true);
                task.delay(0.65, function() --[[ Line: 178 ]]
                    -- upvalues: v57 (ref), v56 (ref), l_isSpatial_0 (ref), v9 (ref), l_UIManager_0 (ref), v62 (ref)
                    if v57.current and not v56.current then
                        local v80;
                        if l_isSpatial_0() then
                            local v81 = v9:showTopBar();
                            local v82 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
                            v80 = not v81 and not v82;
                        else
                            v80 = false;
                        end;
                        if v80 then
                            return;
                        else
                            v62(true);
                        end;
                    end;
                end);
            end;
        elseif v76 == l_ControlState_0.Selected then
            l_FocusUtils_0.MenuIconSelectedSignal:set(true);
        elseif v76 == l_ControlState_0.Default then
            if v75.current == l_ControlState_0.Hover then
                v62(false);
                v57.current = false;
                v56.current = false;
            elseif v75.current == l_ControlState_0.Selected then
                if (not l_FFlagShowUnibarOnVirtualCursor_0 or not l_GamepadService_0.GamepadCursorEnabled) and l_GuiService_0.SelectedCoreObject and string.find(l_GuiService_0.SelectedCoreObject.Name, v12.ICON_NAME_PREFIX) then
                    v9:enableFocusNav();
                end;
                l_FocusUtils_0.MenuIconSelectedSignal:set(false);
            end;
        end;
        v75.current = v76;
    end, {});
    local v87 = v17.useCallback(function() --[[ Line: 204 ]]
        -- upvalues: v62 (copy), v56 (copy), l_isSpatial_0 (ref), v9 (ref), l_UIManager_0 (ref), l_Parent_1 (ref), v11 (ref)
        v62(false);
        v56.current = true;
        local v84;
        if l_isSpatial_0() then
            local v85 = v9:showTopBar();
            local v86 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
            v84 = not v85 and not v86;
        else
            v84 = false;
        end;
        if v84 then
            return;
        else
            require(l_Parent_1.Settings.SettingsHub):ToggleVisibility(v11.AnalyticsMenuOpenTypes.TopbarButton);
            return;
        end;
    end, {});
    return (function(v88, v89, v90) --[[ Line: 215 ]] --[[ Name: renderWithTooltipCompat ]]
        -- upvalues: l_isSpatial_0 (ref), v64 (copy), v66 (copy), v17 (ref), l_TooltipCallout_0 (ref), l_TooltipOrientation_0 (ref), v65 (copy), v63 (copy), l_SPATIAL_TOOLTIP_SPACING_0 (ref), l_Panel3DInSpatialUI_0 (ref), l_PanelType_0 (ref), l_withTooltip_0 (ref)
        if l_isSpatial_0() then
            local function v92(v91) --[[ Line: 218 ]]
                -- upvalues: v64 (ref), v66 (ref)
                v64(v91.AbsoluteSize);
                v66(v91.AbsolutePosition);
            end;
            local v94 = v17.useCallback(function(v93) --[[ Line: 222 ]]
                -- upvalues: v17 (ref), l_TooltipCallout_0 (ref), v88 (copy), l_TooltipOrientation_0 (ref), v65 (ref), v63 (ref), l_SPATIAL_TOOLTIP_SPACING_0 (ref)
                return v17.createElement(l_TooltipCallout_0, {
                    textAlignment = Enum.TextXAlignment.Center, 
                    headerText = v88.headerText, 
                    orientation = l_TooltipOrientation_0.Top, 
                    distanceOffset = 0, 
                    triggerPointCenter = Vector2.new(v65.X + v63.X / 2, v93.Y - l_SPATIAL_TOOLTIP_SPACING_0), 
                    contentOffsetVector = Vector2.zero, 
                    triggerPointRadius = Vector2.zero
                });
            end, {
                v88, 
                v65, 
                v63
            });
            return v17.createElement(v17.Fragment, nil, {
                VRSpatialTooltip = if v89.active and v63 and l_Panel3DInSpatialUI_0 then v17.createElement(l_Panel3DInSpatialUI_0, {
                    panelType = l_PanelType_0.ToolTipsContainer, 
                    renderFunction = v94
                }) else nil, 
                MenuIconTriggerPoint = v90(v92)
            });
        else
            return l_withTooltip_0(v88, v89, v90);
        end;
    end)(v69, v70, (v17.useCallback(function(v95) --[[ Line: 256 ]]
        -- upvalues: v17 (ref), l_View_0 (ref), v54 (copy), v45 (copy), v60 (ref), v67 (copy), v44 (copy), v87 (copy), v83 (copy), v31 (ref), v49 (copy), l_Icon_0 (ref), v15 (ref), v52 (copy)
        return v17.createElement(l_View_0, {
            tag = "radius-circle aspect-1-1", 
            backgroundStyle = v54:map(function(v96) --[[ Line: 259 ]]
                -- upvalues: v45 (ref)
                local l_OverMedia_0_0 = v45.Color.OverMedia.OverMedia_0;
                l_OverMedia_0_0.Transparency = l_OverMedia_0_0.Transparency * v96;
                return l_OverMedia_0_0;
            end), 
            Size = UDim2.fromScale(1, 1), 
            NextSelectionRight = v60, 
            selection = {
                Selectable = true, 
                SelectionImageObject = v67
            }, 
            selectionGroup = {
                SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorDown = Enum.SelectionBehavior.Stop
            }, 
            ref = v44.menuIconRef, 
            onAbsoluteSizeChanged = v95, 
            onAbsolutePositionChanged = v95, 
            onActivated = v87, 
            onStateChanged = v83
        }, {
            BadgeOver12 = if v44.showBadgeOver12 then v17.createElement(v31, {
                position = UDim2.new(0, 1, 1, -(v49 + 1))
            }) else nil, 
            Icon = v17.createElement(l_Icon_0, {
                name = v15.Enums.IconName.Tilt, 
                size = v52.size, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            })
        });
    end, {
        v54, 
        v60, 
        v67, 
        v87, 
        v83, 
        v44.showBadgeOver12
    })));
end;