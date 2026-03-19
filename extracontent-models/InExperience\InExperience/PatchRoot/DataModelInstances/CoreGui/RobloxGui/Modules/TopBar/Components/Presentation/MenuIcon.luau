local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableUnibarFtuxTooltips_0 = v6.FFlagEnableUnibarFtuxTooltips;
local l_FFlagEnableConsoleExpControls_0 = v6.FFlagEnableConsoleExpControls;
local l_FFlagReduceTopBarInsetsWhileHidden_0 = v6.FFlagReduceTopBarInsetsWhileHidden;
local l_FFlagShowUnibarOnVirtualCursor_0 = v6.FFlagShowUnibarOnVirtualCursor;
local l_FFlagAddUILessMode_0 = v6.FFlagAddUILessMode;
local l_FIntAddUILessModeVariant_0 = v6.FIntAddUILessModeVariant;
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v6.FFlagVirtualCursorTopbarAlwaysVisible;
local _ = require(l_CorePackages_0.Packages.Signals);
local v15 = require(l_CorePackages_0.Workspace.Packages.Display);
local v16 = require(l_CorePackages_0.Packages.Roact);
local v17 = require(l_CorePackages_0.Packages.React);
local v18 = require(l_CorePackages_0.Packages.RoactRodux);
local v19 = require(l_CorePackages_0.Packages.t);
local v20 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v20.App.ImageSet.Images;
local l_withTooltip_0 = v20.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v20.App.Dialog.Enum.TooltipOrientation;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v29 = if l_Enabled_0() and (l_FFlagEnableConsoleExpControls_0 or l_isInExperienceUIVREnabled_0) then require(l_Chrome_0.Service) else nil;
local v30 = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then require(l_Chrome_0.ChromeShared.Unibar.Constants) else nil;
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local v32 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v33 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local _ = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v35 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v36 = require(script.Parent.BadgeOver12);
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local v38 = require(l_CorePackages_0.Packages.Signals);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local l_createEffect_0 = v38.createEffect;
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_isSubjectToDesktopPolicies_0 = v6.isSubjectToDesktopPolicies;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v44 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v44.Flags.FFlagTopBarSignalizeKeepOutAreas;
local v46 = game:DefineFastFlag("EnableReferralRewardTooltip", false);
local l_FFlagTopBarSignalizeMenuOpen_0 = v44.Flags.FFlagTopBarSignalizeMenuOpen;
local v48 = require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Parent.Actions;
local v51 = require(l_Parent_0.Parent.Constants);
local v52 = require(l_Actions_0.SetGamepadMenuOpen);
local v53 = require(l_Actions_0.SetKeepOutArea);
local v54 = require(script.Parent.menuIconHoveredSignal);
local v55 = if not l_FFlagEnableConsoleExpControls_0 or l_Enabled_0() then require(script.Parent.Parent.GamepadConnector) else nil;
local v56 = nil;
if v32() then
    v56 = require(l_RobloxGui_0.Modules.InGameMenuInit);
end;
local v57 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
if l_isInExperienceUIVREnabled_0 then
    v59 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    v58 = v20.App.Dialog.TooltipCallout;
    local v65 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v63 = v65.UIManager;
    v60 = v65.Panel3DInSpatialUI;
    v61 = v65.Constants.PanelType;
    v62 = v65.Constants.SPATIAL_TOOLTIP_SPACING;
    v64 = function() --[[ Line: 90 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v59 (ref), v29 (copy), v63 (ref)
        if l_isInExperienceUIVREnabled_0 and v59() then
            local v66 = v29:showTopBar();
            local v67 = v63.getInstance():isBottomBarInteractionOnAnimationSupported();
            return not v66 and not v67;
        else
            return false;
        end;
    end;
end;
local v68 = require(script.Parent.IconButton);
local v69 = require(script.Parent.withReferralRewardTooltipInfo);
local v70 = v16.PureComponent:extend("MenuIcon");
local v71 = l_Enabled_0();
local v72 = v71 and 0.65 or 0.4;
local v73 = {
    Enum.KeyCode.Escape
};
v70.validateProps = v19.strictInterface({
    layoutOrder = v19.integer, 
    setGamepadMenuOpen = if v48 then nil else v19.callback, 
    iconScale = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v19.optional(v19.number), 
    onAreaChanged = v19.optional(v19.callback), 
    showBadgeOver12 = v19.optional(v19.boolean), 
    menuIconRef = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then v19.optional(v19.any) else nil, 
    unibarMenuRef = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then v19.optional(v19.any) else nil, 
    referralRewardTooltipText = v19.optional(v19.string)
});
v70.init = function(v74) --[[ Line: 127 ]] --[[ Name: init ]]
    -- upvalues: v71 (copy), v38 (copy), v15 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_SettingsShowSignal_0 (copy), l_Enabled_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v64 (ref), l_RobloxGui_0 (copy), l_FFlagAddUILessMode_0 (copy), v33 (copy), l_VRService_0 (copy), l_VRHub_0 (copy), l_GamepadService_0 (copy), v56 (ref), v32 (copy), v54 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v72 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), v30 (copy), v29 (copy), l_FocusUtils_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), v55 (copy), v16 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (copy), v51 (copy), l_FIntAddUILessModeVariant_0 (copy), l_Stores_0 (copy), l_createEffect_0 (copy)
    v74:setState({
        vrShowMenuIcon = false, 
        showTooltip = false, 
        isHovering = false, 
        clickLatched = not v71 and nil, 
        enableFlashingDot = false
    });
    v74.disposeUiScaleEffect = v38.createEffect(function(v75) --[[ Line: 135 ]]
        -- upvalues: v15 (ref), v74 (copy)
        local v76 = v15.GetDisplayStore(v75);
        v74:setState({
            UiScale = v76.getUIScale(v75)
        });
    end);
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        l_SettingsShowSignal_0:connect(function(v77) --[[ Line: 144 ]]
            -- upvalues: v74 (copy)
            v74:setState({
                tiltMenuOpen = v77
            });
        end);
    end;
    if not l_Enabled_0() then
        task.spawn(function() --[[ Line: 153 ]]
            -- upvalues: v74 (copy)
            v74:setState({
                enableFlashingDot = true
            });
        end);
    end;
    v74.menuIconActivated = function() --[[ Line: 160 ]]
        -- upvalues: v74 (copy), v71 (ref), l_isInExperienceUIVREnabled_0 (ref), v64 (ref), l_RobloxGui_0 (ref), l_FFlagAddUILessMode_0 (ref), v33 (ref), l_VRService_0 (ref), l_VRHub_0 (ref), l_GamepadService_0 (ref), v56 (ref), v32 (ref)
        v74:setState({
            showTooltip = false, 
            isHovering = if v71 then nil else false, 
            clickLatched = v71 and true or nil
        });
        if l_isInExperienceUIVREnabled_0 then
            if v64() then
                return;
            else
                local v78 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
                if l_FFlagAddUILessMode_0 then
                    v78:ToggleVisibility(nil, v33.AnalyticsMenuOpenTypes.TopbarButton);
                    return;
                else
                    v78:ToggleVisibility(v33.AnalyticsMenuOpenTypes.TopbarButton);
                    return;
                end;
            end;
        elseif l_VRService_0.VREnabled and (l_VRHub_0.ShowTopBar or l_GamepadService_0.GamepadCursorEnabled) then
            v56.openInGameMenu(v33.MainPagePageKey);
            return;
        elseif v32() then
            v56.openInGameMenu(v33.MainPagePageKey);
            return;
        else
            local v79 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            if l_FFlagAddUILessMode_0 then
                v79:ToggleVisibility(nil, v33.AnalyticsMenuOpenTypes.TopbarButton);
                return;
            else
                v79:ToggleVisibility(v33.AnalyticsMenuOpenTypes.TopbarButton);
                return;
            end;
        end;
    end;
    v74.fireMenuIconHoveredSignal = function(v80) --[[ Line: 195 ]]
        -- upvalues: v54 (ref)
        v54:fire(v80);
    end;
    v74.menuIconOnHover = function() --[[ Line: 198 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), v64 (ref), v71 (ref), v74 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v72 (ref), v32 (ref), l_isSubjectToDesktopPolicies_0 (ref), v56 (ref), v33 (ref)
        if l_isInExperienceUIVREnabled_0 and v64() then
            return;
        else
            if v71 then
                v74:setState({
                    isHovering = true
                });
                if l_FFlagEnableUnibarFtuxTooltips_0 then
                    v74.fireMenuIconHoveredSignal(true);
                end;
                delay(v72, function() --[[ Line: 210 ]]
                    -- upvalues: v74 (ref), l_isInExperienceUIVREnabled_0 (ref), v64 (ref)
                    if v74.state.isHovering and not v74.state.clickLatched then
                        if l_isInExperienceUIVREnabled_0 and v64() then
                            return;
                        else
                            v74:setState({
                                showTooltip = true
                            });
                        end;
                    end;
                end);
            elseif l_FFlagEnableUnibarFtuxTooltips_0 then
                v74.fireMenuIconHoveredSignal(false);
            end;
            if v32() then
                if not l_isSubjectToDesktopPolicies_0() then
                    return;
                else
                    v56.openInGameMenu(v33.InitalPageKey);
                    v56.setMenuIconTooltipOpen(false);
                end;
            end;
            return;
        end;
    end;
    v74.menuIconOnHoverEnd = function() --[[ Line: 236 ]]
        -- upvalues: v74 (copy), v71 (ref)
        v74:setState({
            showTooltip = false, 
            isHovering = false, 
            clickLatched = not v71 and nil
        });
    end;
    v74.showTopBarCallback = function() --[[ Line: 244 ]]
        -- upvalues: v74 (copy)
        if v74.state.vrShowMenuIcon ~= false then
            v74:setState({
                vrShowMenuIcon = false
            });
        end;
    end;
    if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
        v74.onMenuIconSelectionChanged = function(_, v82, _, v84) --[[ Line: 254 ]]
            -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), l_FFlagShowUnibarOnVirtualCursor_0 (ref), v30 (ref), v29 (ref), l_FocusUtils_0 (ref), l_GuiService_0 (ref), l_ContextActionService_0 (ref)
            if l_FFlagEnableConsoleExpControls_0 then
                if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    if (not l_FFlagShowUnibarOnVirtualCursor_0 or not l_GamepadService_0.GamepadCursorEnabled) and v84 and string.find(v84.Name, v30.ICON_NAME_PREFIX) then
                        v29:enableFocusNav();
                    end;
                    l_FocusUtils_0.MenuIconSelectedSignal:set(v82);
                    return;
                end;
            else
                local function v88(_, v86, _) --[[ Line: 265 ]] --[[ Name: unfocusTilt ]]
                    -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref)
                    if not l_FFlagEnableConsoleExpControls_0 and v86 == Enum.UserInputState.End or l_FFlagEnableConsoleExpControls_0 and v86 == Enum.UserInputState.Begin then
                        l_GuiService_0.SelectedCoreObject = nil;
                        return Enum.ContextActionResult.Sink;
                    else
                        return Enum.ContextActionResult.Pass;
                    end;
                end;
                if v82 then
                    l_ContextActionService_0:BindCoreAction("Unfocus_Tilt", v88, false, Enum.KeyCode.ButtonB);
                    return;
                else
                    l_ContextActionService_0:UnbindCoreAction("Unfocus_Tilt");
                    if (not l_FFlagShowUnibarOnVirtualCursor_0 or not l_GamepadService_0.GamepadCursorEnabled) and v84 and string.find(v84.Name, v30.ICON_NAME_PREFIX) then
                        v29:enableFocusNav();
                    end;
                    return;
                end;
            end;
        end;
    end;
    if (if l_FFlagEnableConsoleExpControls_0 then l_Enabled_0() and v55 else l_Enabled_0) and l_FFlagEnableConsoleExpControls_0 then
        local v89 = v55:getShowTopBar();
        local v90, v91 = v16.createBinding(v89:get());
        v74.showIcon = v90;
        v74.setShowIcon = v91;
        if l_FFlagReduceTopBarInsetsWhileHidden_0 then
            v74.priorAbsolutePosition = Vector2.zero;
            v74.priorAbsoluteSize = Vector2.zero;
        end;
        local l_v89_0 = v89 --[[ copy: 1 -> 4 ]];
        v89:connect(function() --[[ Line: 298 ]]
            -- upvalues: l_v89_0 (copy), v74 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v51 (ref)
            local v93 = l_v89_0:get();
            v74.setShowIcon(v93);
            if l_FFlagReduceTopBarInsetsWhileHidden_0 then
                if v93 then
                    v74.props.onAreaChanged(v51.MenuIconKeepOutAreaId, v74.priorAbsolutePosition, v74.priorAbsoluteSize);
                    return;
                else
                    v74.props.onAreaChanged(v51.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero);
                end;
            end;
        end);
    end;
    if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
        v29:onTriggerMenuIcon():connect(function() --[[ Line: 313 ]]
            -- upvalues: l_GuiService_0 (ref), v74 (copy), l_FocusUtils_0 (ref)
            l_GuiService_0.SelectedCoreObject = v74.props.menuIconRef:getValue();
            l_FocusUtils_0.MenuIconSelectedSignal:set(true);
        end);
    end;
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and l_Stores_0.GetUILessStore then
        v74.uiLessStore = l_Stores_0.GetUILessStore(false);
        if v74.uiLessStore.getUILessModeEnabled(false) then
            local v94, v95 = v16.createBinding(true);
            v74.showIcon = v94;
            v74.setShowIcon = v95;
            v74.priorAbsolutePosition = Vector2.zero;
            v74.priorAbsoluteSize = Vector2.zero;
            v74.disposeEffect = l_createEffect_0(function(v96) --[[ Line: 328 ]]
                -- upvalues: v74 (copy), v51 (ref)
                local v97 = v74.uiLessStore.getUIVisible(v96);
                v74.setShowIcon(v97);
                if v97 then
                    v74.props.onAreaChanged(v51.MenuIconKeepOutAreaId, v74.priorAbsolutePosition, v74.priorAbsoluteSize);
                    return;
                else
                    v74.props.onAreaChanged(v51.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero);
                    return;
                end;
            end);
        end;
    end;
end;
v70.renderWithTooltipCompat = function(v98, v99, v100, v101) --[[ Line: 342 ]] --[[ Name: renderWithTooltipCompat ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v59 (ref), v17 (copy), v60 (ref), v61 (ref), v58 (ref), l_TooltipOrientation_0 (copy), v62 (ref), l_withTooltip_0 (copy)
    if l_isInExperienceUIVREnabled_0 and v59() then
        return v17.createElement(v17.Fragment, nil, {
            VRSpatialTooltip = if v100.active and v98.state.triggerPointSize and v60 then v17.createElement(v60, {
                panelType = v61.ToolTipsContainer, 
                renderFunction = function(v102) --[[ Line: 360 ]] --[[ Name: renderFunction ]]
                    -- upvalues: v17 (ref), v58 (ref), v99 (copy), l_TooltipOrientation_0 (ref), v98 (copy), v62 (ref)
                    return v17.createElement(v58, {
                        textAlignment = Enum.TextXAlignment.Center, 
                        headerText = v99.headerText, 
                        orientation = l_TooltipOrientation_0.Top, 
                        distanceOffset = 0, 
                        triggerPointCenter = Vector2.new(v98.state.triggerPointPosition.X + v98.state.triggerPointSize.X / 2, v102.Y - v62), 
                        contentOffsetVector = Vector2.zero, 
                        triggerPointRadius = Vector2.zero
                    });
                end
            }) else nil, 
            MenuIconTriggerPoint = v101(function(v103) --[[ Line: 345 ]]
                -- upvalues: v98 (copy)
                v98:setState({
                    triggerPointSize = v103.AbsoluteSize, 
                    triggerPointPosition = v103.AbsolutePosition
                });
            end)
        });
    else
        return l_withTooltip_0(v99, v100, v101);
    end;
end;
v70.willUnmount = function(v104) --[[ Line: 384 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy)
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.uiLessStore.getUILessModeEnabled(false) and v104.disposeEffect then
        v104.disposeEffect();
    end;
    if l_FFlagTopBarSignalizeMenuOpen_0 and v104.tiltMenuDisposeEffect then
        v104.tiltMenuDisposeEffect();
    end;
    if v104.disposeUiScaleEffect then
        v104.disposeUiScaleEffect();
    end;
end;
v70.render = function(v105) --[[ Line: 401 ]] --[[ Name: render ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_VRService_0 (copy), v51 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_Enabled_0 (copy), v55 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), v16 (copy), v68 (copy), v57 (copy), l_Images_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v71 (copy), l_GamepadService_0 (copy), l_ExternalEventConnection_0 (copy), l_VRHub_0 (copy), v36 (copy), v35 (copy), v73 (copy), v46 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v29 (copy), v30 (copy)
    local v106 = nil;
    v106 = l_isInExperienceUIVREnabled_0 and true or not l_VRService_0.VREnabled or v105.state.vrShowMenuIcon;
    local v107 = v51.TopBarButtonHeight * v105.state.UiScale;
    local v108 = v51.TopBarButtonPadding * v105.state.UiScale;
    local v109 = v51.MENU_ICON_SIZE * v105.state.UiScale;
    local function v111(v110) --[[ Line: 413 ]]
        -- upvalues: l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v105 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_Enabled_0 (ref), v55 (ref), v51 (ref), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref)
        if v110 then
            if l_FFlagReduceTopBarInsetsWhileHidden_0 then
                v105.priorAbsolutePosition = v110.AbsolutePosition;
                v105.priorAbsoluteSize = v110.AbsoluteSize;
                if (not l_FFlagEnableConsoleExpControls_0 or l_Enabled_0()) and v55:getShowTopBar():get() then
                    v105.props.onAreaChanged(v51.MenuIconKeepOutAreaId, v110.AbsolutePosition, v110.AbsoluteSize);
                    return;
                end;
            elseif l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v105.uiLessStore.getUILessModeEnabled(false) then
                v105.priorAbsolutePosition = v110.AbsolutePosition;
                v105.priorAbsoluteSize = v110.AbsoluteSize;
                if v105.uiLessStore.getUIVisible(false) then
                    v105.props.onAreaChanged(v51.MenuIconKeepOutAreaId, v110.AbsolutePosition, v110.AbsoluteSize);
                    return;
                end;
            else
                v105.props.onAreaChanged(v51.MenuIconKeepOutAreaId, v110.AbsolutePosition, v110.AbsoluteSize);
            end;
        end;
    end;
    local v112 = v16.createElement(v68, {
        icon = if v57() then l_Images_0["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png", 
        iconSize = if l_FFlagTopBarSignalizeMenuOpen_0 then v109 * if v105.state.tiltMenuOpen then v51.MenuIconOpenScale else 1 else v109 * (v105.props.iconScale or 1), 
        useIconScaleAnimation = v57(), 
        onActivated = v105.menuIconActivated, 
        onHover = v105.menuIconOnHover, 
        onHoverEnd = if v71 then v105.menuIconOnHoverEnd else nil, 
        enableFlashingDot = v105.state.enableFlashingDot, 
        modal = l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 == 2 and v105.uiLessStore.getUILessModeEnabled(false) and true or nil
    });
    local v113 = l_GamepadService_0 and v16.createElement(l_ExternalEventConnection_0, {
        event = l_VRHub_0.ShowTopBarChanged.Event or l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
        callback = v105.showTopBarCallback
    });
    local v114 = if v105.props.showBadgeOver12 then v16.createElement(v36, {
        position = if l_Enabled_0() then UDim2.new(0, 1, 1, -(v108 + 1)) else UDim2.new(0, -4, 1, 4)
    }) else nil;
    if v71 then
        local v115 = "Roblox Menu";
        pcall(function() --[[ Line: 465 ]]
            -- upvalues: v115 (ref), v35 (ref)
            v115 = v35:FormatByKey("CoreScripts.TopBar.RobloxMenu");
        end);
        local v116 = {
            textAlignment = Enum.TextXAlignment.Center, 
            headerText = v115, 
            hotkeyCodes = v73
        };
        if v46 and v105.props.referralRewardTooltipText and v105.props.referralRewardTooltipText ~= "" then
            v116.headerText = v105.props.referralRewardTooltipText;
            v116.hotkeyCodes = {};
        end;
        local v117 = {
            active = v105.state.showTooltip, 
            guiTarget = l_CoreGui_0, 
            preferredOrientation = l_TooltipOrientation_0.Bottom, 
            DisplayOrder = 10
        };
        if v46 and v105.props.referralRewardTooltipText and v105.props.referralRewardTooltipText ~= "" then
            v117.active = true;
        end;
        return v105:renderWithTooltipCompat(v116, v117, function(v118) --[[ Line: 490 ]]
            -- upvalues: v111 (copy), l_Enabled_0 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v105 (copy), v29 (ref), v30 (ref), v16 (ref), v68 (ref), v57 (ref), l_Images_0 (ref), l_FFlagTopBarSignalizeMenuOpen_0 (ref), v109 (copy), v51 (ref), v71 (ref), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v106 (ref), v107 (copy), v114 (copy), v112 (copy), v113 (copy)
            local function v120(v119) --[[ Line: 491 ]]
                -- upvalues: v111 (ref), v118 (copy)
                v111(v119);
                v118(v119);
            end;
            local v121 = nil;
            if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 and v105.props.unibarMenuRef and v105.props.unibarMenuRef.current then
                local v122 = v29:menuList():get()[1];
                local v123 = if v122 then v30.ICON_NAME_PREFIX .. v122.id else nil;
                local v124 = if v105.props.unibarMenuRef.current and v123 then v105.props.unibarMenuRef.current:FindFirstChild(v123, true) else nil;
                v121 = v16.createElement(v68, {
                    icon = if v57() then l_Images_0["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png", 
                    iconSize = if l_FFlagTopBarSignalizeMenuOpen_0 then v109 * if v105.state.tiltMenuOpen then v51.MenuIconOpenScale else 1 else v109 * (v105.props.iconScale or 1), 
                    useIconScaleAnimation = v57(), 
                    onActivated = v105.menuIconActivated, 
                    onHover = v105.menuIconOnHover, 
                    onHoverEnd = if v71 then v105.menuIconOnHoverEnd else nil, 
                    enableFlashingDot = v105.state.enableFlashingDot, 
                    onSelectionChanged = v105.onMenuIconSelectionChanged, 
                    nextSelectionRightRef = v124, 
                    forwardRef = v105.props.menuIconRef
                });
            end;
            return v16.createElement("Frame", {
                Visible = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 or l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v105.uiLessStore.getUILessModeEnabled(false) then v105.showIcon:map(function(v125) --[[ Line: 522 ]]
                    -- upvalues: v106 (ref)
                    return v106 and v125;
                end) else v106, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v107, 1, 0), 
                LayoutOrder = v105.props.layoutOrder, 
                SelectionGroup = l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 and true or nil, 
                SelectionBehaviorLeft = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorUp = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorDown = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil, 
                [v16.Change.AbsoluteSize] = v120, 
                [v16.Change.AbsolutePosition] = v120
            }, {
                BadgeOver12 = v114, 
                Background = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 and v105.props.unibarMenuRef and v105.props.unibarMenuRef.current then nil else v112, 
                IconHitArea = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then v121 else nil, 
                ShowTopBarListener = v113
            });
        end);
    else
        return v16.createElement("Frame", {
            Visible = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 or l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v105.uiLessStore.getUILessModeEnabled(false) then v105.showIcon:map(function(v126) --[[ Line: 543 ]]
                -- upvalues: v106 (ref)
                return v106 and v126;
            end) else v106, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v107, 1, 0), 
            LayoutOrder = v105.props.layoutOrder, 
            [v16.Change.AbsoluteSize] = v111, 
            [v16.Change.AbsolutePosition] = v111
        }, {
            BadgeOver12 = v114, 
            Background = v112, 
            ShowTopBarListener = v113
        });
    end;
end;
local v132 = v18.UNSTABLE_connect2(nil, function(v127) --[[ Line: 559 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v48 (copy), v52 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v53 (copy)
    return {
        setGamepadMenuOpen = if v48 then nil else function(v128) --[[ Line: 563 ]]
            -- upvalues: v127 (copy), v52 (ref)
            return v127(v52(v128));
        end, 
        onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v129, v130, v131) --[[ Line: 568 ]]
            -- upvalues: v127 (copy), v53 (ref)
            return v127(v53(v129, v130, v131));
        end
    };
end)(v70);
if v46 then
    return v69(v132);
else
    return v132;
end;