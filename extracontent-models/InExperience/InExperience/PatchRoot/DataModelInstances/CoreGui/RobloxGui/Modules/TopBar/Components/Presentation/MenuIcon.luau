local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v6.FFlagEnableConsoleExpControls;
local l_FFlagReduceTopBarInsetsWhileHidden_0 = v6.FFlagReduceTopBarInsetsWhileHidden;
local l_FFlagShowUnibarOnVirtualCursor_0 = v6.FFlagShowUnibarOnVirtualCursor;
local l_FFlagAddUILessMode_0 = v6.FFlagAddUILessMode;
local l_FIntAddUILessModeVariant_0 = v6.FIntAddUILessModeVariant;
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v6.FFlagVirtualCursorTopbarAlwaysVisible;
local _ = require(l_CorePackages_0.Packages.Signals);
local v14 = require(l_CorePackages_0.Workspace.Packages.Display);
local v15 = require(l_CorePackages_0.Packages.Roact);
local v16 = require(l_CorePackages_0.Packages.React);
local v17 = require(l_CorePackages_0.Packages.RoactRodux);
local v18 = require(l_CorePackages_0.Packages.t);
local v19 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v19.App.ImageSet.Images;
local l_withTooltip_0 = v19.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v19.App.Dialog.Enum.TooltipOrientation;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v28 = if l_Enabled_0() and (l_FFlagEnableConsoleExpControls_0 or l_isInExperienceUIVREnabled_0) then require(l_Chrome_0.Service) else nil;
local v29 = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then require(l_Chrome_0.ChromeShared.Unibar.Constants) else nil;
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local v31 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v32 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local _ = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v34 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v35 = require(script.Parent.BadgeOver12);
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local v37 = require(l_CorePackages_0.Packages.Signals);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local l_createEffect_0 = v37.createEffect;
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_isSubjectToDesktopPolicies_0 = v6.isSubjectToDesktopPolicies;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v43 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v43.Flags.FFlagTopBarSignalizeKeepOutAreas;
local v45 = game:DefineFastFlag("EnableReferralRewardTooltip", false);
local l_FFlagTopBarSignalizeMenuOpen_0 = v43.Flags.FFlagTopBarSignalizeMenuOpen;
local v47 = require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Parent.Actions;
local v50 = require(l_Parent_0.Parent.Constants);
local v51 = require(l_Actions_0.SetGamepadMenuOpen);
local v52 = require(l_Actions_0.SetKeepOutArea);
local v53 = require(script.Parent.menuIconHoveredSignal);
local v54 = if not l_FFlagEnableConsoleExpControls_0 or l_Enabled_0() then require(script.Parent.Parent.GamepadConnector) else nil;
local v55 = nil;
if v31() then
    v55 = require(l_RobloxGui_0.Modules.InGameMenuInit);
end;
local v56 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
if l_isInExperienceUIVREnabled_0 then
    v58 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    v57 = v19.App.Dialog.TooltipCallout;
    local v64 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v62 = v64.UIManager;
    v59 = v64.Panel3DInSpatialUI;
    v60 = v64.Constants.PanelType;
    v61 = v64.Constants.SPATIAL_TOOLTIP_SPACING;
    v63 = function() --[[ Line: 89 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v58 (ref), v28 (copy), v62 (ref)
        if l_isInExperienceUIVREnabled_0 and v58() then
            local v65 = v28:showTopBar();
            local v66 = v62.getInstance():isBottomBarInteractionOnAnimationSupported();
            return not v65 and not v66;
        else
            return false;
        end;
    end;
end;
local v67 = require(script.Parent.IconButton);
local v68 = require(script.Parent.withReferralRewardTooltipInfo);
local v69 = v15.PureComponent:extend("MenuIcon");
local v70 = l_Enabled_0();
local v71 = v70 and 0.65 or 0.4;
local v72 = {
    Enum.KeyCode.Escape
};
v69.validateProps = v18.strictInterface({
    layoutOrder = v18.integer, 
    setGamepadMenuOpen = if v47 then nil else v18.callback, 
    iconScale = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v18.optional(v18.number), 
    onAreaChanged = v18.optional(v18.callback), 
    showBadgeOver12 = v18.optional(v18.boolean), 
    menuIconRef = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then v18.optional(v18.any) else nil, 
    unibarMenuRef = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then v18.optional(v18.any) else nil, 
    referralRewardTooltipText = v18.optional(v18.string)
});
v69.init = function(v73) --[[ Line: 126 ]] --[[ Name: init ]]
    -- upvalues: v70 (copy), v37 (copy), v14 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_SettingsShowSignal_0 (copy), l_Enabled_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v63 (ref), l_RobloxGui_0 (copy), l_FFlagAddUILessMode_0 (copy), v32 (copy), l_VRService_0 (copy), l_VRHub_0 (copy), l_GamepadService_0 (copy), v55 (ref), v31 (copy), v53 (copy), v71 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), v29 (copy), v28 (copy), l_FocusUtils_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), v54 (copy), v15 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (copy), v50 (copy), l_FIntAddUILessModeVariant_0 (copy), l_Stores_0 (copy), l_createEffect_0 (copy)
    v73:setState({
        vrShowMenuIcon = false, 
        showTooltip = false, 
        isHovering = false, 
        clickLatched = not v70 and nil, 
        enableFlashingDot = false
    });
    v73.disposeUiScaleEffect = v37.createEffect(function(v74) --[[ Line: 134 ]]
        -- upvalues: v14 (ref), v73 (copy)
        local v75 = v14.GetDisplayStore(v74);
        v73:setState({
            UiScale = v75.getUIScale(v74)
        });
    end);
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        l_SettingsShowSignal_0:connect(function(v76) --[[ Line: 143 ]]
            -- upvalues: v73 (copy)
            v73:setState({
                tiltMenuOpen = v76
            });
        end);
    end;
    if not l_Enabled_0() then
        task.spawn(function() --[[ Line: 152 ]]
            -- upvalues: v73 (copy)
            v73:setState({
                enableFlashingDot = true
            });
        end);
    end;
    v73.menuIconActivated = function() --[[ Line: 159 ]]
        -- upvalues: v73 (copy), v70 (ref), l_isInExperienceUIVREnabled_0 (ref), v63 (ref), l_RobloxGui_0 (ref), l_FFlagAddUILessMode_0 (ref), v32 (ref), l_VRService_0 (ref), l_VRHub_0 (ref), l_GamepadService_0 (ref), v55 (ref), v31 (ref)
        v73:setState({
            showTooltip = false, 
            isHovering = if v70 then nil else false, 
            clickLatched = v70 and true or nil
        });
        if l_isInExperienceUIVREnabled_0 then
            if v63() then
                return;
            else
                local v77 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
                if l_FFlagAddUILessMode_0 then
                    v77:ToggleVisibility(nil, v32.AnalyticsMenuOpenTypes.TopbarButton);
                    return;
                else
                    v77:ToggleVisibility(v32.AnalyticsMenuOpenTypes.TopbarButton);
                    return;
                end;
            end;
        elseif l_VRService_0.VREnabled and (l_VRHub_0.ShowTopBar or l_GamepadService_0.GamepadCursorEnabled) then
            v55.openInGameMenu(v32.MainPagePageKey);
            return;
        elseif v31() then
            v55.openInGameMenu(v32.MainPagePageKey);
            return;
        else
            local v78 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            if l_FFlagAddUILessMode_0 then
                v78:ToggleVisibility(nil, v32.AnalyticsMenuOpenTypes.TopbarButton);
                return;
            else
                v78:ToggleVisibility(v32.AnalyticsMenuOpenTypes.TopbarButton);
                return;
            end;
        end;
    end;
    v73.fireMenuIconHoveredSignal = function(v79) --[[ Line: 194 ]]
        -- upvalues: v53 (ref)
        v53:fire(v79);
    end;
    v73.menuIconOnHover = function() --[[ Line: 197 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), v63 (ref), v70 (ref), v73 (copy), v71 (ref), v31 (ref), l_isSubjectToDesktopPolicies_0 (ref), v55 (ref), v32 (ref)
        if l_isInExperienceUIVREnabled_0 and v63() then
            return;
        else
            if v70 then
                v73:setState({
                    isHovering = true
                });
                v73.fireMenuIconHoveredSignal(true);
                delay(v71, function() --[[ Line: 207 ]]
                    -- upvalues: v73 (ref), l_isInExperienceUIVREnabled_0 (ref), v63 (ref)
                    if v73.state.isHovering and not v73.state.clickLatched then
                        if l_isInExperienceUIVREnabled_0 and v63() then
                            return;
                        else
                            v73:setState({
                                showTooltip = true
                            });
                        end;
                    end;
                end);
            else
                v73.fireMenuIconHoveredSignal(false);
            end;
            if v31() then
                if not l_isSubjectToDesktopPolicies_0() then
                    return;
                else
                    v55.openInGameMenu(v32.InitalPageKey);
                    v55.setMenuIconTooltipOpen(false);
                end;
            end;
            return;
        end;
    end;
    v73.menuIconOnHoverEnd = function() --[[ Line: 231 ]]
        -- upvalues: v73 (copy), v70 (ref)
        v73:setState({
            showTooltip = false, 
            isHovering = false, 
            clickLatched = not v70 and nil
        });
    end;
    v73.showTopBarCallback = function() --[[ Line: 239 ]]
        -- upvalues: v73 (copy)
        if v73.state.vrShowMenuIcon ~= false then
            v73:setState({
                vrShowMenuIcon = false
            });
        end;
    end;
    if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
        v73.onMenuIconSelectionChanged = function(_, v81, _, v83) --[[ Line: 249 ]]
            -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), l_FFlagShowUnibarOnVirtualCursor_0 (ref), v29 (ref), v28 (ref), l_FocusUtils_0 (ref), l_GuiService_0 (ref), l_ContextActionService_0 (ref)
            if l_FFlagEnableConsoleExpControls_0 then
                if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    if (not l_FFlagShowUnibarOnVirtualCursor_0 or not l_GamepadService_0.GamepadCursorEnabled) and v83 and string.find(v83.Name, v29.ICON_NAME_PREFIX) then
                        v28:enableFocusNav();
                    end;
                    l_FocusUtils_0.MenuIconSelectedSignal:set(v81);
                    return;
                end;
            else
                local function v87(_, v85, _) --[[ Line: 260 ]] --[[ Name: unfocusTilt ]]
                    -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref)
                    if not l_FFlagEnableConsoleExpControls_0 and v85 == Enum.UserInputState.End or l_FFlagEnableConsoleExpControls_0 and v85 == Enum.UserInputState.Begin then
                        l_GuiService_0.SelectedCoreObject = nil;
                        return Enum.ContextActionResult.Sink;
                    else
                        return Enum.ContextActionResult.Pass;
                    end;
                end;
                if v81 then
                    l_ContextActionService_0:BindCoreAction("Unfocus_Tilt", v87, false, Enum.KeyCode.ButtonB);
                    return;
                else
                    l_ContextActionService_0:UnbindCoreAction("Unfocus_Tilt");
                    if (not l_FFlagShowUnibarOnVirtualCursor_0 or not l_GamepadService_0.GamepadCursorEnabled) and v83 and string.find(v83.Name, v29.ICON_NAME_PREFIX) then
                        v28:enableFocusNav();
                    end;
                    return;
                end;
            end;
        end;
    end;
    if (if l_FFlagEnableConsoleExpControls_0 then l_Enabled_0() and v54 else l_Enabled_0) and l_FFlagEnableConsoleExpControls_0 then
        local v88 = v54:getShowTopBar();
        local v89, v90 = v15.createBinding(v88:get());
        v73.showIcon = v89;
        v73.setShowIcon = v90;
        if l_FFlagReduceTopBarInsetsWhileHidden_0 then
            v73.priorAbsolutePosition = Vector2.zero;
            v73.priorAbsoluteSize = Vector2.zero;
        end;
        local l_v88_0 = v88 --[[ copy: 1 -> 4 ]];
        v88:connect(function() --[[ Line: 293 ]]
            -- upvalues: l_v88_0 (copy), v73 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v50 (ref)
            local v92 = l_v88_0:get();
            v73.setShowIcon(v92);
            if l_FFlagReduceTopBarInsetsWhileHidden_0 then
                if v92 then
                    v73.props.onAreaChanged(v50.MenuIconKeepOutAreaId, v73.priorAbsolutePosition, v73.priorAbsoluteSize);
                    return;
                else
                    v73.props.onAreaChanged(v50.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero);
                end;
            end;
        end);
    end;
    if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
        v28:onTriggerMenuIcon():connect(function() --[[ Line: 308 ]]
            -- upvalues: l_GuiService_0 (ref), v73 (copy), l_FocusUtils_0 (ref)
            l_GuiService_0.SelectedCoreObject = v73.props.menuIconRef:getValue();
            l_FocusUtils_0.MenuIconSelectedSignal:set(true);
        end);
    end;
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and l_Stores_0.GetUILessStore then
        v73.uiLessStore = l_Stores_0.GetUILessStore(false);
        if v73.uiLessStore.getUILessModeEnabled(false) then
            local v93, v94 = v15.createBinding(true);
            v73.showIcon = v93;
            v73.setShowIcon = v94;
            v73.priorAbsolutePosition = Vector2.zero;
            v73.priorAbsoluteSize = Vector2.zero;
            v73.disposeEffect = l_createEffect_0(function(v95) --[[ Line: 323 ]]
                -- upvalues: v73 (copy), v50 (ref)
                local v96 = v73.uiLessStore.getUIVisible(v95);
                v73.setShowIcon(v96);
                if v96 then
                    v73.props.onAreaChanged(v50.MenuIconKeepOutAreaId, v73.priorAbsolutePosition, v73.priorAbsoluteSize);
                    return;
                else
                    v73.props.onAreaChanged(v50.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero);
                    return;
                end;
            end);
        end;
    end;
end;
v69.renderWithTooltipCompat = function(v97, v98, v99, v100) --[[ Line: 337 ]] --[[ Name: renderWithTooltipCompat ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v58 (ref), v16 (copy), v59 (ref), v60 (ref), v57 (ref), l_TooltipOrientation_0 (copy), v61 (ref), l_withTooltip_0 (copy)
    if l_isInExperienceUIVREnabled_0 and v58() then
        return v16.createElement(v16.Fragment, nil, {
            VRSpatialTooltip = if v99.active and v97.state.triggerPointSize and v59 then v16.createElement(v59, {
                panelType = v60.ToolTipsContainer, 
                renderFunction = function(v101) --[[ Line: 355 ]] --[[ Name: renderFunction ]]
                    -- upvalues: v16 (ref), v57 (ref), v98 (copy), l_TooltipOrientation_0 (ref), v97 (copy), v61 (ref)
                    return v16.createElement(v57, {
                        textAlignment = Enum.TextXAlignment.Center, 
                        headerText = v98.headerText, 
                        orientation = l_TooltipOrientation_0.Top, 
                        distanceOffset = 0, 
                        triggerPointCenter = Vector2.new(v97.state.triggerPointPosition.X + v97.state.triggerPointSize.X / 2, v101.Y - v61), 
                        contentOffsetVector = Vector2.zero, 
                        triggerPointRadius = Vector2.zero
                    });
                end
            }) else nil, 
            MenuIconTriggerPoint = v100(function(v102) --[[ Line: 340 ]]
                -- upvalues: v97 (copy)
                v97:setState({
                    triggerPointSize = v102.AbsoluteSize, 
                    triggerPointPosition = v102.AbsolutePosition
                });
            end)
        });
    else
        return l_withTooltip_0(v98, v99, v100);
    end;
end;
v69.willUnmount = function(v103) --[[ Line: 379 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy)
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v103.uiLessStore.getUILessModeEnabled(false) and v103.disposeEffect then
        v103.disposeEffect();
    end;
    if l_FFlagTopBarSignalizeMenuOpen_0 and v103.tiltMenuDisposeEffect then
        v103.tiltMenuDisposeEffect();
    end;
    if v103.disposeUiScaleEffect then
        v103.disposeUiScaleEffect();
    end;
end;
v69.render = function(v104) --[[ Line: 396 ]] --[[ Name: render ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_VRService_0 (copy), v50 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_Enabled_0 (copy), v54 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), v15 (copy), v67 (copy), v56 (copy), l_Images_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v70 (copy), l_GamepadService_0 (copy), l_ExternalEventConnection_0 (copy), l_VRHub_0 (copy), v35 (copy), v34 (copy), v72 (copy), v45 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v28 (copy), v29 (copy)
    local v105 = nil;
    v105 = l_isInExperienceUIVREnabled_0 and true or not l_VRService_0.VREnabled or v104.state.vrShowMenuIcon;
    local v106 = v50.TopBarButtonHeight * v104.state.UiScale;
    local v107 = v50.TopBarButtonPadding * v104.state.UiScale;
    local v108 = v50.MENU_ICON_SIZE * v104.state.UiScale;
    local function v110(v109) --[[ Line: 408 ]]
        -- upvalues: l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v104 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_Enabled_0 (ref), v54 (ref), v50 (ref), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref)
        if v109 then
            if l_FFlagReduceTopBarInsetsWhileHidden_0 then
                v104.priorAbsolutePosition = v109.AbsolutePosition;
                v104.priorAbsoluteSize = v109.AbsoluteSize;
                if (not l_FFlagEnableConsoleExpControls_0 or l_Enabled_0()) and v54:getShowTopBar():get() then
                    v104.props.onAreaChanged(v50.MenuIconKeepOutAreaId, v109.AbsolutePosition, v109.AbsoluteSize);
                    return;
                end;
            elseif l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.uiLessStore.getUILessModeEnabled(false) then
                v104.priorAbsolutePosition = v109.AbsolutePosition;
                v104.priorAbsoluteSize = v109.AbsoluteSize;
                if v104.uiLessStore.getUIVisible(false) then
                    v104.props.onAreaChanged(v50.MenuIconKeepOutAreaId, v109.AbsolutePosition, v109.AbsoluteSize);
                    return;
                end;
            else
                v104.props.onAreaChanged(v50.MenuIconKeepOutAreaId, v109.AbsolutePosition, v109.AbsoluteSize);
            end;
        end;
    end;
    local v111 = v15.createElement(v67, {
        icon = if v56() then l_Images_0["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png", 
        iconSize = if l_FFlagTopBarSignalizeMenuOpen_0 then v108 * if v104.state.tiltMenuOpen then v50.MenuIconOpenScale else 1 else v108 * (v104.props.iconScale or 1), 
        useIconScaleAnimation = v56(), 
        onActivated = v104.menuIconActivated, 
        onHover = v104.menuIconOnHover, 
        onHoverEnd = if v70 then v104.menuIconOnHoverEnd else nil, 
        enableFlashingDot = v104.state.enableFlashingDot, 
        modal = l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 == 2 and v104.uiLessStore.getUILessModeEnabled(false) and true or nil
    });
    local v112 = l_GamepadService_0 and v15.createElement(l_ExternalEventConnection_0, {
        event = l_VRHub_0.ShowTopBarChanged.Event or l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
        callback = v104.showTopBarCallback
    });
    local v113 = if v104.props.showBadgeOver12 then v15.createElement(v35, {
        position = if l_Enabled_0() then UDim2.new(0, 1, 1, -(v107 + 1)) else UDim2.new(0, -4, 1, 4)
    }) else nil;
    if v70 then
        local v114 = "Roblox Menu";
        pcall(function() --[[ Line: 460 ]]
            -- upvalues: v114 (ref), v34 (ref)
            v114 = v34:FormatByKey("CoreScripts.TopBar.RobloxMenu");
        end);
        local v115 = {
            textAlignment = Enum.TextXAlignment.Center, 
            headerText = v114, 
            hotkeyCodes = v72
        };
        if v45 and v104.props.referralRewardTooltipText and v104.props.referralRewardTooltipText ~= "" then
            v115.headerText = v104.props.referralRewardTooltipText;
            v115.hotkeyCodes = {};
        end;
        local v116 = {
            active = v104.state.showTooltip, 
            guiTarget = l_CoreGui_0, 
            preferredOrientation = l_TooltipOrientation_0.Bottom, 
            DisplayOrder = 10
        };
        if v45 and v104.props.referralRewardTooltipText and v104.props.referralRewardTooltipText ~= "" then
            v116.active = true;
        end;
        return v104:renderWithTooltipCompat(v115, v116, function(v117) --[[ Line: 485 ]]
            -- upvalues: v110 (copy), l_Enabled_0 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v104 (copy), v28 (ref), v29 (ref), v15 (ref), v67 (ref), v56 (ref), l_Images_0 (ref), l_FFlagTopBarSignalizeMenuOpen_0 (ref), v108 (copy), v50 (ref), v70 (ref), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v105 (ref), v106 (copy), v113 (copy), v111 (copy), v112 (copy)
            local function v119(v118) --[[ Line: 486 ]]
                -- upvalues: v110 (ref), v117 (copy)
                v110(v118);
                v117(v118);
            end;
            local v120 = nil;
            if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 and v104.props.unibarMenuRef and v104.props.unibarMenuRef.current then
                local v121 = v28:menuList():get()[1];
                local v122 = if v121 then v29.ICON_NAME_PREFIX .. v121.id else nil;
                local v123 = if v104.props.unibarMenuRef.current and v122 then v104.props.unibarMenuRef.current:FindFirstChild(v122, true) else nil;
                v120 = v15.createElement(v67, {
                    icon = if v56() then l_Images_0["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png", 
                    iconSize = if l_FFlagTopBarSignalizeMenuOpen_0 then v108 * if v104.state.tiltMenuOpen then v50.MenuIconOpenScale else 1 else v108 * (v104.props.iconScale or 1), 
                    useIconScaleAnimation = v56(), 
                    onActivated = v104.menuIconActivated, 
                    onHover = v104.menuIconOnHover, 
                    onHoverEnd = if v70 then v104.menuIconOnHoverEnd else nil, 
                    enableFlashingDot = v104.state.enableFlashingDot, 
                    onSelectionChanged = v104.onMenuIconSelectionChanged, 
                    nextSelectionRightRef = v123, 
                    forwardRef = v104.props.menuIconRef
                });
            end;
            return v15.createElement("Frame", {
                Visible = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 or l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.uiLessStore.getUILessModeEnabled(false) then v104.showIcon:map(function(v124) --[[ Line: 517 ]]
                    -- upvalues: v105 (ref)
                    return v105 and v124;
                end) else v105, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v106, 1, 0), 
                LayoutOrder = v104.props.layoutOrder, 
                SelectionGroup = l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 and true or nil, 
                SelectionBehaviorLeft = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorUp = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorDown = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then Enum.SelectionBehavior.Stop else nil, 
                [v15.Change.AbsoluteSize] = v119, 
                [v15.Change.AbsolutePosition] = v119
            }, {
                BadgeOver12 = v113, 
                Background = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 and v104.props.unibarMenuRef and v104.props.unibarMenuRef.current then nil else v111, 
                IconHitArea = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then v120 else nil, 
                ShowTopBarListener = v112
            });
        end);
    else
        return v15.createElement("Frame", {
            Visible = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 or l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.uiLessStore.getUILessModeEnabled(false) then v104.showIcon:map(function(v125) --[[ Line: 538 ]]
                -- upvalues: v105 (ref)
                return v105 and v125;
            end) else v105, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v106, 1, 0), 
            LayoutOrder = v104.props.layoutOrder, 
            [v15.Change.AbsoluteSize] = v110, 
            [v15.Change.AbsolutePosition] = v110
        }, {
            BadgeOver12 = v113, 
            Background = v111, 
            ShowTopBarListener = v112
        });
    end;
end;
local v131 = v17.UNSTABLE_connect2(nil, function(v126) --[[ Line: 554 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v47 (copy), v51 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v52 (copy)
    return {
        setGamepadMenuOpen = if v47 then nil else function(v127) --[[ Line: 558 ]]
            -- upvalues: v126 (copy), v51 (ref)
            return v126(v51(v127));
        end, 
        onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v128, v129, v130) --[[ Line: 563 ]]
            -- upvalues: v126 (copy), v52 (ref)
            return v126(v52(v128, v129, v130));
        end
    };
end)(v69);
if v45 then
    return v68(v131);
else
    return v131;
end;