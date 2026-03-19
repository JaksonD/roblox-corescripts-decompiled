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
local l_FFlagEnableUnibarFtuxTooltips_0 = v20.FFlagEnableUnibarFtuxTooltips;
local l_FFlagShowUnibarOnVirtualCursor_0 = v20.FFlagShowUnibarOnVirtualCursor;
local l_View_0 = v15.View;
local l_Icon_0 = v15.Icon;
local l_ControlState_0 = v15.Enums.ControlState;
local l_useTokens_0 = v15.Hooks.useTokens;
local l_useCursor_0 = v15.Hooks.useCursor;
local v31 = require(l_Parent_0.Components.Presentation.menuIconHoveredSignal);
local v32 = require(l_Parent_0.Components.Presentation.BadgeOver12);
local l_withTooltip_0 = v22.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v22.App.Dialog.Enum.TooltipOrientation;
local l_TooltipCallout_0 = v22.App.Dialog.TooltipCallout;
local v36 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
local l_UIManager_0 = v36.UIManager;
local l_Panel3DInSpatialUI_0 = v36.Panel3DInSpatialUI;
local l_PanelType_0 = v36.Constants.PanelType;
local l_SPATIAL_TOOLTIP_SPACING_0 = v36.Constants.SPATIAL_TOOLTIP_SPACING;
local function _() --[[ Line: 55 ]]
    -- upvalues: l_isSpatial_0 (copy), v9 (copy), l_UIManager_0 (copy)
    if l_isSpatial_0() then
        local v41 = v9:showTopBar();
        local v42 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
        return not v41 and not v42;
    else
        return false;
    end;
end;
local v44 = {
    Enum.KeyCode.Escape
};
return function(v45) --[[ Line: 83 ]] --[[ Name: MenuIcon ]]
    -- upvalues: l_useTokens_0 (copy), v21 (copy), v14 (copy), v10 (copy), v17 (copy), v16 (copy), l_GuiService_0 (copy), v9 (copy), v12 (copy), l_useCursor_0 (copy), v15 (copy), v44 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v18 (copy), l_SettingsShowSignal_0 (copy), l_FocusUtils_0 (copy), l_ControlState_0 (copy), l_isSpatial_0 (copy), l_UIManager_0 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v31 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), l_GamepadService_0 (copy), l_Parent_1 (copy), v11 (copy), l_TooltipCallout_0 (copy), l_SPATIAL_TOOLTIP_SPACING_0 (copy), l_Panel3DInSpatialUI_0 (copy), l_PanelType_0 (copy), l_withTooltip_0 (copy), l_View_0 (copy), v32 (copy), l_Icon_0 (copy)
    local v46 = l_useTokens_0();
    local v48 = v21.useSignalState(function(v47) --[[ Line: 86 ]]
        -- upvalues: v14 (ref)
        return v14.GetDisplayStore(v47).getUIScale(v47);
    end);
    local _ = v10.TopBarButtonHeight * v48;
    local v50 = v10.TopBarButtonPadding * v48;
    local v51 = v10.MENU_ICON_SIZE * v48;
    local v52 = v17.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v16 (ref), v51 (copy), v10 (ref)
        return {
            menuOpen = v16.createState({
                size = v51 * v10.MenuIconOpenScale
            }), 
            menuClosed = v16.createState({
                size = v51
            })
        };
    end, {
        v48
    });
    local v53, v54 = v16.useMotion(v52.menuClosed);
    local v55, v56 = v17.useBinding(l_GuiService_0.PreferredTransparency);
    local v57 = v17.useRef(false);
    local v58 = v17.useRef(false);
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    if v45.unibarMenuRef and v45.unibarMenuRef.current then
        v59 = v9:menuList():get()[1];
        v60 = if v59 then v12.ICON_NAME_PREFIX .. v59.id else nil;
        v61 = if v45.unibarMenuRef.current and v60 then v45.unibarMenuRef.current:FindFirstChild(v60, true) else nil;
    end;
    local v62, v63 = v17.useState(false);
    local v64, v65 = v17.useState(Vector2.zero);
    local v66, v67 = v17.useState(Vector2.zero);
    local v68 = l_useCursor_0(v15.Enums.CursorType.SkinToneCircle);
    local v69 = v17.useRef("Roblox Menu");
    local v70 = {
        textAlignment = Enum.TextXAlignment.Center, 
        headerText = v69.current, 
        hotkeyCodes = v44
    };
    local v71 = {
        active = v62, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        DisplayOrder = 10
    };
    v17.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v69 (copy), v18 (ref), l_GuiService_0 (ref), v56 (copy), l_SettingsShowSignal_0 (ref), v54 (copy), v52 (copy), v45 (copy), v9 (ref), l_FocusUtils_0 (ref)
        pcall(function() --[[ Line: 143 ]]
            -- upvalues: v69 (ref), v18 (ref)
            v69.current = v18:FormatByKey("CoreScripts.TopBar.RobloxMenu");
        end);
        local v72 = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 147 ]]
            -- upvalues: v56 (ref), l_GuiService_0 (ref)
            v56(l_GuiService_0.PreferredTransparency);
        end);
        local v74 = l_SettingsShowSignal_0:connect(function(v73) --[[ Line: 150 ]]
            -- upvalues: v54 (ref), v52 (ref)
            v54(if v73 then v52.menuOpen else v52.menuClosed);
        end);
        local v75 = nil;
        if v45.menuIconRef then
            v75 = v9:onTriggerMenuIcon():connect(function() --[[ Line: 156 ]]
                -- upvalues: l_GuiService_0 (ref), v45 (ref), l_FocusUtils_0 (ref)
                l_GuiService_0.SelectedCoreObject = v45.menuIconRef.current;
                l_FocusUtils_0.MenuIconSelectedSignal:set(true);
            end);
        end;
        return function() --[[ Line: 162 ]]
            -- upvalues: v72 (copy), v74 (copy), v75 (ref)
            v72:Disconnect();
            v74:Disconnect();
            if v75 then
                v75:disconnect();
            end;
        end;
    end, {});
    local v76 = v17.useRef(l_ControlState_0.Default);
    local v84 = v17.useCallback(function(v77) --[[ Line: 172 ]]
        -- upvalues: l_ControlState_0 (ref), l_isSpatial_0 (ref), v9 (ref), l_UIManager_0 (ref), v58 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v31 (ref), v57 (copy), v63 (copy), l_FocusUtils_0 (ref), v76 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (ref), l_GamepadService_0 (ref), l_GuiService_0 (ref), v12 (ref)
        if v77 == l_ControlState_0.Hover then
            local v78;
            if l_isSpatial_0() then
                local v79 = v9:showTopBar();
                local v80 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
                v78 = not v79 and not v80;
            else
                v78 = false;
            end;
            if v78 then
                return;
            else
                v58.current = true;
                if l_FFlagEnableUnibarFtuxTooltips_0 then
                    v31:fire(true);
                end;
                task.delay(0.65, function() --[[ Line: 183 ]]
                    -- upvalues: v58 (ref), v57 (ref), l_isSpatial_0 (ref), v9 (ref), l_UIManager_0 (ref), v63 (ref)
                    if v58.current and not v57.current then
                        local v81;
                        if l_isSpatial_0() then
                            local v82 = v9:showTopBar();
                            local v83 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
                            v81 = not v82 and not v83;
                        else
                            v81 = false;
                        end;
                        if v81 then
                            return;
                        else
                            v63(true);
                        end;
                    end;
                end);
            end;
        elseif v77 == l_ControlState_0.Selected then
            l_FocusUtils_0.MenuIconSelectedSignal:set(true);
        elseif v77 == l_ControlState_0.Default then
            if v76.current == l_ControlState_0.Hover then
                v63(false);
                v58.current = false;
                v57.current = false;
            elseif v76.current == l_ControlState_0.Selected then
                if (not l_FFlagShowUnibarOnVirtualCursor_0 or not l_GamepadService_0.GamepadCursorEnabled) and l_GuiService_0.SelectedCoreObject and string.find(l_GuiService_0.SelectedCoreObject.Name, v12.ICON_NAME_PREFIX) then
                    v9:enableFocusNav();
                end;
                l_FocusUtils_0.MenuIconSelectedSignal:set(false);
            end;
        end;
        v76.current = v77;
    end, {});
    local v88 = v17.useCallback(function() --[[ Line: 209 ]]
        -- upvalues: v63 (copy), v57 (copy), l_isSpatial_0 (ref), v9 (ref), l_UIManager_0 (ref), l_Parent_1 (ref), v11 (ref)
        v63(false);
        v57.current = true;
        local v85;
        if l_isSpatial_0() then
            local v86 = v9:showTopBar();
            local v87 = l_UIManager_0.getInstance():isBottomBarInteractionOnAnimationSupported();
            v85 = not v86 and not v87;
        else
            v85 = false;
        end;
        if v85 then
            return;
        else
            require(l_Parent_1.Settings.SettingsHub):ToggleVisibility(v11.AnalyticsMenuOpenTypes.TopbarButton);
            return;
        end;
    end, {});
    return (function(v89, v90, v91) --[[ Line: 220 ]] --[[ Name: renderWithTooltipCompat ]]
        -- upvalues: l_isSpatial_0 (ref), v65 (copy), v67 (copy), v17 (ref), l_TooltipCallout_0 (ref), l_TooltipOrientation_0 (ref), v66 (copy), v64 (copy), l_SPATIAL_TOOLTIP_SPACING_0 (ref), l_Panel3DInSpatialUI_0 (ref), l_PanelType_0 (ref), l_withTooltip_0 (ref)
        if l_isSpatial_0() then
            local function v93(v92) --[[ Line: 223 ]]
                -- upvalues: v65 (ref), v67 (ref)
                v65(v92.AbsoluteSize);
                v67(v92.AbsolutePosition);
            end;
            local v95 = v17.useCallback(function(v94) --[[ Line: 227 ]]
                -- upvalues: v17 (ref), l_TooltipCallout_0 (ref), v89 (copy), l_TooltipOrientation_0 (ref), v66 (ref), v64 (ref), l_SPATIAL_TOOLTIP_SPACING_0 (ref)
                return v17.createElement(l_TooltipCallout_0, {
                    textAlignment = Enum.TextXAlignment.Center, 
                    headerText = v89.headerText, 
                    orientation = l_TooltipOrientation_0.Top, 
                    distanceOffset = 0, 
                    triggerPointCenter = Vector2.new(v66.X + v64.X / 2, v94.Y - l_SPATIAL_TOOLTIP_SPACING_0), 
                    contentOffsetVector = Vector2.zero, 
                    triggerPointRadius = Vector2.zero
                });
            end, {
                v89, 
                v66, 
                v64
            });
            return v17.createElement(v17.Fragment, nil, {
                VRSpatialTooltip = if v90.active and v64 and l_Panel3DInSpatialUI_0 then v17.createElement(l_Panel3DInSpatialUI_0, {
                    panelType = l_PanelType_0.ToolTipsContainer, 
                    renderFunction = v95
                }) else nil, 
                MenuIconTriggerPoint = v91(v93)
            });
        else
            return l_withTooltip_0(v89, v90, v91);
        end;
    end)(v70, v71, (v17.useCallback(function(v96) --[[ Line: 261 ]]
        -- upvalues: v17 (ref), l_View_0 (ref), v55 (copy), v46 (copy), v61 (ref), v68 (copy), v45 (copy), v88 (copy), v84 (copy), v32 (ref), v50 (copy), l_Icon_0 (ref), v15 (ref), v53 (copy)
        return v17.createElement(l_View_0, {
            tag = "radius-circle aspect-1-1", 
            backgroundStyle = v55:map(function(v97) --[[ Line: 264 ]]
                -- upvalues: v46 (ref)
                local l_OverMedia_0_0 = v46.Color.OverMedia.OverMedia_0;
                l_OverMedia_0_0.Transparency = l_OverMedia_0_0.Transparency * v97;
                return l_OverMedia_0_0;
            end), 
            Size = UDim2.fromScale(1, 1), 
            NextSelectionRight = v61, 
            selection = {
                Selectable = true, 
                SelectionImageObject = v68
            }, 
            selectionGroup = {
                SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorDown = Enum.SelectionBehavior.Stop
            }, 
            ref = v45.menuIconRef, 
            onAbsoluteSizeChanged = v96, 
            onAbsolutePositionChanged = v96, 
            onActivated = v88, 
            onStateChanged = v84
        }, {
            BadgeOver12 = if v45.showBadgeOver12 then v17.createElement(v32, {
                position = UDim2.new(0, 1, 1, -(v50 + 1))
            }) else nil, 
            Icon = v17.createElement(l_Icon_0, {
                name = v15.Enums.IconName.Tilt, 
                size = v53.size, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            })
        });
    end, {
        v55, 
        v61, 
        v68, 
        v88, 
        v84, 
        v45.showBadgeOver12
    })));
end;