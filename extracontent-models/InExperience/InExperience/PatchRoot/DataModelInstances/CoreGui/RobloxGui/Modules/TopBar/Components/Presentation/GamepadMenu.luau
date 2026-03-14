local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v14 = require(l_CorePackages_0.Packages.Signals);
local v15 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_withStyle_0 = v11.Core.Style.withStyle;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local v19 = require(script.MenuHeader);
local v20 = require(script.ChatIcon);
local v21 = require(script.MenuCell);
local v22 = require(script.QuickMenuControllerBar);
local v23 = require(script.MenuNavigationToggleDialog);
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules;
local l_TopBar_0 = l_Modules_0.TopBar;
local v26 = require(l_Modules_0.TenFootInterface);
local v27 = require(l_Modules_0.BackpackScript);
local v28 = require(l_Modules_0.EmotesMenu.EmotesMenuMaster);
local v29 = require(l_Modules_0.ChatSelector);
local v30 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v31 = require(l_Modules_0.PlayerList.PlayerListManager);
local v32 = require(l_Modules_0.isNewInGameMenuEnabled);
local v33 = require(l_Modules_0.InGameMenuConstants);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
local l_Telemetry_0 = require(l_TopBar_0:WaitForChild("Telemetry"));
local l_LogGamepadOpenExperienceControlsMenu_0 = l_Telemetry_0.LogGamepadOpenExperienceControlsMenu;
local l_default_0 = l_Telemetry_0.GamepadMenuTelemetry.default;
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v41 = require(l_Actions_0.SetGamepadMenuOpen);
local v42 = require(script.EnumGamepadMenuOptions);
local v43 = l_Images_0["icons/logo/block"];
local v44 = l_Images_0["icons/menu/AR"];
local v45 = l_Images_0["icons/actions/respawn"];
local v46 = l_Images_0["icons/navigation/close"];
local v47 = l_Images_0["component_assets/circle_17"];
local v48 = Rect.new(8, 8, 9, 9);
local v49 = v7.PureComponent:extend("GamepadMenu");
local v50 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAddMenuNavigationToggleDialog_0 = v50.FFlagAddMenuNavigationToggleDialog;
local l_FFlagEnableConsoleExpControls_0 = v50.FFlagEnableConsoleExpControls;
local l_FFlagExperienceMenuGamepadExposureEnabled_0 = v50.FFlagExperienceMenuGamepadExposureEnabled;
local v54 = require(l_Modules_0.Flags.FFlagMountCoreGuiBackpack);
local l_FFlagPlayerListUseFocusNavHook_0 = v30.Flags.FFlagPlayerListUseFocusNavHook;
local l_getFFlagExpChatAlwaysRunTCS_0 = v50.getFFlagExpChatAlwaysRunTCS;
local v57 = nil;
local v58 = nil;
local v59 = nil;
task.spawn(function() --[[ Line: 109 ]]
    -- upvalues: v57 (ref), l_CoreGui_0 (copy), v58 (ref), v59 (ref)
    v57 = l_CoreGui_0:WaitForChild("ToastNotification", 3);
    v58 = if v57 ~= nil then v57:WaitForChild("ToastNotificationWrapper", 3) else nil;
    v59 = if v58 ~= nil then v58:FindFirstChild("Toast", true) else nil;
end);
v49.validateProps = v10.strictInterface({
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v10.Vector2, 
    chatVersion = v10.optional(v10.EnumItem), 
    chatEnabled = v10.boolean, 
    leaderboardEnabled = v10.boolean, 
    emotesEnabled = v10.boolean, 
    backpackEnabled = if v54 then nil else v10.boolean, 
    respawnEnabled = v10.boolean, 
    leaderboardOpen = v10.boolean, 
    backpackOpen = v10.boolean, 
    emotesOpen = v10.boolean, 
    menuOpen = v10.boolean, 
    topBarEnabled = if v54 then v10.boolean else nil, 
    setGamepadMenuOpen = v10.callback, 
    isGamepadMenuOpen = v10.boolean
});
v49.init = function(v60) --[[ Line: 137 ]] --[[ Name: init ]]
    -- upvalues: v54 (copy), l_StarterGui_0 (copy), l_FFlagExperienceMenuGamepadExposureEnabled_0 (copy), l_default_0 (copy), v42 (copy), v29 (copy), v59 (ref), l_FFlagPlayerListUseFocusNavHook_0 (copy), v31 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy), v49 (copy), l_GuiService_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v15 (copy), v14 (copy)
    if v54 then
        v60:setState({
            selectedIndex = 1, 
            menuActions = {}, 
            mountBackpack = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
        });
        l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v61, v62) --[[ Line: 145 ]]
            -- upvalues: v60 (copy)
            if v61 == Enum.CoreGuiType.Backpack or v61 == Enum.CoreGuiType.All then
                v60:setState({
                    mountBackpack = v62
                });
            end;
        end);
    else
        v60:setState({
            selectedIndex = 1, 
            menuActions = {}
        });
    end;
    if l_FFlagExperienceMenuGamepadExposureEnabled_0 then
        v60.loggedExperienceMenuGamepadExposure = false;
    end;
    v60.boundMenuOpenActions = false;
    v60.lastMenuButtonPress = 0;
    v60.toggleChatVisibilityAction = function(_, v64, _) --[[ Line: 167 ]]
        -- upvalues: v60 (copy), l_default_0 (ref), v42 (ref), v29 (ref)
        if v64 == Enum.UserInputState.Begin then
            v60.toggleChatVisible();
            l_default_0.onOptionSelected({
                menuOptionName = v42.Chat, 
                usedShortcut = true, 
                isToggleOpen = v29:GetVisibility()
            });
        end;
    end;
    v60.toggleMenuVisibleAction = function(_, v67, _) --[[ Line: 178 ]]
        -- upvalues: v60 (copy), v59 (ref), l_FFlagPlayerListUseFocusNavHook_0 (ref), v31 (ref), l_LogGamepadOpenExperienceControlsMenu_0 (ref)
        if v60.props.menuOpen then
            return Enum.ContextActionResult.Pass;
        else
            local v69 = false;
            if v59 ~= nil then
                v69 = v59.Visible;
            end;
            if v67 == Enum.UserInputState.Begin then
                v60.lastMenuButtonPress = tick();
                return Enum.ContextActionResult.Pass;
            elseif v67 == Enum.UserInputState.End and (not v69 or tick() - v60.lastMenuButtonPress < 1) then
                local v70 = not v60.props.isGamepadMenuOpen;
                if l_FFlagPlayerListUseFocusNavHook_0 and v70 and v31:GetIsModal() and v31:GetVisibility() then
                    v31:SetVisibility(false);
                end;
                v60.props.setGamepadMenuOpen(v70);
                l_LogGamepadOpenExperienceControlsMenu_0(v70);
                v60:logExperienceMenuGamepadExposure();
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end;
    end;
    v60.closeMenuAction = function(_, v72, _) --[[ Line: 209 ]]
        -- upvalues: v60 (copy)
        if v72 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v60.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v60.leaveGameMenuAction = function(_, v75, _) --[[ Line: 219 ]]
        -- upvalues: v49 (ref), v60 (copy), l_default_0 (ref), v42 (ref)
        if v75 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v49.leaveGame();
            v60.props.setGamepadMenuOpen(false);
            l_default_0.onOptionSelected({
                menuOptionName = v42.Leave, 
                usedShortcut = true, 
                isToggleOpen = true
            });
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v60.respawnMenuAction = function(_, v78, _) --[[ Line: 236 ]]
        -- upvalues: v49 (ref), v60 (copy), l_default_0 (ref), v42 (ref)
        if v78 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v49.respawnCharacter();
            v60.props.setGamepadMenuOpen(false);
            l_default_0.onOptionSelected({
                menuOptionName = v42.Respawn, 
                usedShortcut = true, 
                isToggleOpen = true
            });
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v60.lastThumbStickMove = 0;
    v60.moveSelectionAction = function(_, v81, v82) --[[ Line: 255 ]]
        -- upvalues: v60 (copy)
        if v81 == Enum.UserInputState.Begin then
            if v82.KeyCode == Enum.KeyCode.DPadUp then
                if v60.state.selectedIndex > 1 then
                    v60:setState({
                        selectedIndex = v60.state.selectedIndex - 1
                    });
                end;
                return Enum.ContextActionResult.Sink;
            elseif v82.KeyCode == Enum.KeyCode.DPadDown then
                if v60.state.selectedIndex < #v60.state.menuActions then
                    v60:setState({
                        selectedIndex = v60.state.selectedIndex + 1
                    });
                end;
                return Enum.ContextActionResult.Sink;
            end;
        elseif v82.KeyCode == Enum.KeyCode.Thumbstick1 then
            if tick() - v60.lastThumbStickMove < 0.15 then
                return Enum.ContextActionResult.Pass;
            elseif v82.Position.Y > 0.8 then
                if v60.state.selectedIndex > 1 then
                    v60:setState({
                        selectedIndex = v60.state.selectedIndex - 1
                    });
                    v60.lastThumbStickMove = tick();
                end;
                return Enum.ContextActionResult.Pass;
            elseif v82.Position.Y < -0.8 then
                if v60.state.selectedIndex < #v60.state.menuActions then
                    v60:setState({
                        selectedIndex = v60.state.selectedIndex + 1
                    });
                    v60.lastThumbStickMove = tick();
                end;
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end;
    v60.goToTopAction = function(_, v84, _) --[[ Line: 297 ]]
        -- upvalues: v60 (copy)
        if v84 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v60:setState({
                selectedIndex = 1
            });
            return;
        end;
    end;
    v60.goToBottomAction = function(_, v87, _) --[[ Line: 307 ]]
        -- upvalues: v60 (copy)
        if v87 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v60:setState({
                selectedIndex = #v60.state.menuActions
            });
            return;
        end;
    end;
    v60.activateSelectionAction = function(_, v90, _) --[[ Line: 317 ]]
        -- upvalues: v60 (copy), l_GuiService_0 (ref), v42 (ref), v31 (ref), l_default_0 (ref)
        if v90 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            local v92 = v60.state.menuActions[v60.state.selectedIndex];
            v60.props.setGamepadMenuOpen(false);
            l_GuiService_0:SetMenuIsOpen(false, "GamepadMenu");
            v92.onActivated();
            local function _(v93) --[[ Line: 331 ]] --[[ Name: isMenuOptionToggleOpenOnSelect ]]
                -- upvalues: v42 (ref), v31 (ref)
                if v93 == v42.Leaderboard then
                    return v31:GetSetVisible();
                else
                    return true;
                end;
            end;
            l_default_0.onOptionSelected({
                menuOptionName = v92.name, 
                usedShortcut = false, 
                isToggleOpen = v92.name ~= v42.Leaderboard or v31:GetSetVisible()
            });
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v60.overlayDismiss = function() --[[ Line: 348 ]]
        -- upvalues: v60 (copy)
        v60.props.setGamepadMenuOpen(false);
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v15.GetDisplayStore(false).getViewportSize;
        v60.disposeScreenSize = v14.createEffect(function(v96) --[[ Line: 355 ]]
            -- upvalues: v60 (copy), l_getViewportSize_0 (copy)
            v60:setState({
                screenSize = l_getViewportSize_0(v96)
            });
        end);
    end;
end;
v49.openRootMenu = function() --[[ Line: 363 ]] --[[ Name: openRootMenu ]]
    -- upvalues: v32 (copy), l_Modules_0 (copy), v33 (copy)
    if v32() then
        require(l_Modules_0.InGameMenuInit).openInGameMenu(v33.MainPagePageKey);
        return;
    else
        require(l_Modules_0.Settings.SettingsHub):SetVisibility(true, nil, nil, true, v33.AnalyticsMenuOpenTypes.PlayersTriggered);
        return;
    end;
end;
v49.openUnibarMenu = function() --[[ Line: 374 ]] --[[ Name: openUnibarMenu ]]
    -- upvalues: l_Modules_0 (copy)
    require(l_Modules_0.Chrome.Service):enableFocusNav();
end;
v49.closeUnibarMenu = function() --[[ Line: 379 ]] --[[ Name: closeUnibarMenu ]]
    -- upvalues: l_Modules_0 (copy)
    require(l_Modules_0.Chrome.Service):disableFocusNav();
end;
v49.toggleChatVisible = function() --[[ Line: 384 ]] --[[ Name: toggleChatVisible ]]
    -- upvalues: v29 (copy), l_GameSettings_0 (copy)
    v29:ToggleVisibility();
    l_GameSettings_0.ChatVisible = v29:GetVisibility();
end;
v49.focusChatBar = function() --[[ Line: 389 ]] --[[ Name: focusChatBar ]]
    -- upvalues: v29 (copy), l_GameSettings_0 (copy)
    v29:SetVisible(true);
    l_GameSettings_0.ChatVisible = true;
    v29:FocusChatBar();
end;
v49.toggleLeaderboard = function() --[[ Line: 395 ]] --[[ Name: toggleLeaderboard ]]
    -- upvalues: v32 (copy), l_Modules_0 (copy), v31 (copy)
    if v32() then
        require(l_Modules_0.InGameMenuInit).openPlayersPage();
        return;
    else
        v31:SetVisibility(not v31:GetSetVisible());
        return;
    end;
end;
v49.toggleEmotesMenu = function() --[[ Line: 405 ]] --[[ Name: toggleEmotesMenu ]]
    -- upvalues: v28 (copy)
    if v28:isOpen() then
        v28:close();
        return;
    else
        v28:open();
        return;
    end;
end;
v49.toggleBackpack = function() --[[ Line: 413 ]] --[[ Name: toggleBackpack ]]
    -- upvalues: v27 (copy)
    v27:OpenClose();
end;
v49.leaveGame = function() --[[ Line: 417 ]] --[[ Name: leaveGame ]]
    -- upvalues: v32 (copy), l_Modules_0 (copy), v33 (copy)
    if v32() then
        require(l_Modules_0.InGameMenuInit).openGameLeavePage();
        return;
    else
        local v97 = require(l_Modules_0.Settings.SettingsHub);
        v97:SetVisibility(true, false, v97.Instance.LeaveGamePage, true, v33.AnalyticsMenuOpenTypes.GamepadLeaveGame);
        return;
    end;
end;
v49.respawnCharacter = function() --[[ Line: 434 ]] --[[ Name: respawnCharacter ]]
    -- upvalues: v32 (copy), l_Modules_0 (copy), v33 (copy)
    if v32() then
        require(l_Modules_0.InGameMenuInit).openCharacterResetPage();
        return;
    else
        local v98 = require(l_Modules_0.Settings.SettingsHub);
        v98:SetVisibility(true, false, v98.Instance.ResetCharacterPage, true, v33.AnalyticsMenuOpenTypes.GamepadResetCharacter);
        return;
    end;
end;
v49.shouldShowChatMenuOption = function(v99, v100) --[[ Line: 450 ]] --[[ Name: shouldShowChatMenuOption ]]
    -- upvalues: v26 (copy), l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy)
    if not v26:IsEnabled() then
        return v100;
    else
        v99 = v99 or l_TextChatService_0.ChatVersion;
        if l_getFFlagExpChatAlwaysRunTCS_0() then
            return v100;
        else
            return v100 and v99 == Enum.ChatVersion.TextChatService;
        end;
    end;
end;
v49.getMenuActionsFromProps = function(v101, v102) --[[ Line: 468 ]] --[[ Name: getMenuActionsFromProps ]]
    -- upvalues: v42 (copy), v43 (copy), v49 (copy), v20 (copy), l_Enabled_0 (copy), v44 (copy), v26 (copy), v54 (copy), v45 (copy), v46 (copy)
    local v103 = {};
    table.insert(v103, {
        name = v42.Menu, 
        icon = v43, 
        iconComponent = nil, 
        localizationKey = "CoreScripts.TopBar.Menu", 
        onActivated = v49.openRootMenu
    });
    if v49.shouldShowChatMenuOption(v101.chatVersion, v101.chatEnabled) then
        table.insert(v103, {
            name = v42.Chat, 
            icon = nil, 
            iconComponent = v20, 
            localizationKey = "CoreScripts.TopBar.Chat", 
            onActivated = v49.focusChatBar
        });
    end;
    if l_Enabled_0() then
        table.insert(v103, {
            name = v42.Unibar, 
            icon = v44, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Title.ExperienceControls", 
            onActivated = v49.openUnibarMenu
        });
    end;
    if v101.leaderboardEnabled or v26:IsEnabled() then
        local v104 = nil;
        v104 = v101.leaderboardOpen and "rbxasset://textures/ui/TopBar/leaderboardOn.png" or "rbxasset://textures/ui/TopBar/leaderboardOff.png";
        table.insert(v103, {
            name = v42.Leaderboard, 
            icon = v104, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Leaderboard", 
            onActivated = v49.toggleLeaderboard
        });
    end;
    if v101.emotesEnabled then
        local v105 = nil;
        v105 = v101.emotesOpen and "rbxasset://textures/ui/TopBar/emotesOn.png" or "rbxasset://textures/ui/TopBar/emotesOff.png";
        table.insert(v103, {
            name = v42.Emotes, 
            icon = v105, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Emotes", 
            onActivated = v49.toggleEmotesMenu
        });
    end;
    local _ = nil;
    if if v54 then v101.topBarEnabled and v102.mountBackpack else v101.backpackEnabled then
        local v107 = nil;
        v107 = v101.backpackOpen and "rbxasset://textures/ui/TopBar/inventoryOn.png" or "rbxasset://textures/ui/TopBar/inventoryOff.png";
        table.insert(v103, {
            name = v42.Inventory, 
            icon = v107, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Inventory", 
            onActivated = v49.toggleBackpack
        });
    end;
    if v101.respawnEnabled then
        table.insert(v103, {
            name = v42.Respawn, 
            icon = v45, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Respawn", 
            onActivated = v49.respawnCharacter
        });
    end;
    table.insert(v103, {
        name = v42.Leave, 
        icon = v46, 
        iconComponent = nil, 
        localizationKey = "CoreScripts.TopBar.Leave", 
        onActivated = v49.leaveGame
    });
    return v103;
end;
v49.getDerivedStateFromProps = function(v108, v109) --[[ Line: 580 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v54 (copy), v49 (copy), v9 (copy)
    local v110 = nil;
    v110 = if v54 then v49.getMenuActionsFromProps(v108, v109) else v49.getMenuActionsFromProps(v108);
    local v111 = v109.selectedIndex or 1;
    if #v110 < v111 then
        v111 = #v110;
    end;
    return v9.Dictionary.join(v109, {
        selectedIndex = v111, 
        menuActions = v110
    });
end;
v49.render = function(v112) --[[ Line: 599 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), v19 (copy), v21 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v22 (copy), l_ImageSetLabel_0 (copy), v47 (copy), v48 (copy), l_Enabled_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagAddMenuNavigationToggleDialog_0 (copy), v23 (copy)
    return l_withStyle_0(function(v113) --[[ Line: 600 ]]
        -- upvalues: v7 (ref), v19 (ref), v112 (copy), v21 (ref), l_FFlagTopBarSignalizeScreenSize_0 (ref), v22 (ref), l_ImageSetLabel_0 (ref), v47 (ref), v48 (ref), l_Enabled_0 (ref), l_FFlagEnableConsoleExpControls_0 (ref), l_FFlagAddMenuNavigationToggleDialog_0 (ref), v23 (ref)
        local l_Theme_0 = v113.Theme;
        local v115 = {
            Layout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MenuHeader = v7.createElement(v19, {
                layoutOrder = 1, 
                height = 120
            })
        };
        for v116, v117 in ipairs(v112.state.menuActions) do
            v115[v117.name] = v7.createElement(v21, {
                layoutOrder = v116 + 1, 
                icon = v117.icon, 
                iconComponent = v117.iconComponent, 
                localizationKey = v117.localizationKey, 
                height = 56, 
                hasDivider = v116 ~= #v112.state.menuActions, 
                isSelected = v116 == v112.state.selectedIndex
            });
        end;
        local v118 = #v112.state.menuActions * 56 + 120;
        local v119 = 1;
        local v120 = if l_FFlagTopBarSignalizeScreenSize_0 then v112.state.screenSize else v112.props.screenSize;
        if v120.Y * 0.75 < v118 then
            v119 = v120.Y * 0.75 / v118;
        end;
        if v120.X * 0.75 < 336 then
            local v121 = v120.X * 0.75 / 336;
            if v121 < v119 then
                v119 = v121;
            end;
        end;
        if v119 < 1 then
            v115.UIScale = v7.createElement("UIScale", {
                Scale = v119
            });
        end;
        local l_isGamepadMenuOpen_0 = v112.props.isGamepadMenuOpen;
        local v123 = nil;
        if l_isGamepadMenuOpen_0 then
            v123 = v7.createElement(v22, {
                chatMenuEnabled = v112.shouldShowChatMenuOption(v112.props.chatVersion, v112.props.chatEnabled)
            });
        end;
        local v124 = {
            Menu = v7.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v47, 
                SliceCenter = v48, 
                ScaleType = Enum.ScaleType.Slice, 
                ImageTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
                ImageColor3 = l_Theme_0.BackgroundUIContrast.Color, 
                Size = UDim2.fromOffset(336, v118), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, v115), 
            ControllerBar = v123, 
            MenuNavigationToggleDialog = if not (not not l_Enabled_0() or l_FFlagEnableConsoleExpControls_0) and l_FFlagAddMenuNavigationToggleDialog_0 then v7.createElement(v23, {
                Position = UDim2.fromScale(0.5, 0.1)
            }) else nil
        };
        return v7.createElement("TextButton", {
            Visible = l_isGamepadMenuOpen_0, 
            Text = "", 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            ZIndex = 10, 
            [v7.Event.Activated] = v112.overlayDismiss
        }, v124);
    end);
end;
v49.didMount = function(v125) --[[ Line: 697 ]] --[[ Name: didMount ]]
    -- upvalues: l_VRService_0 (copy), l_ContextActionService_0 (copy)
    if not l_VRService_0.VREnabled then
        l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleGamepadMenu", v125.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart);
    end;
end;
v49.bindMenuOpenActions = function(v126) --[[ Line: 708 ]] --[[ Name: bindMenuOpenActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v126.boundMenuOpenActions = true;
    l_ContextActionService_0:BindCoreAction("TopBarGamepadFreezeController", function() --[[ Line: 713 ]]

    end, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadCloseMenu", v126.closeMenuAction, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadLeaveGame", v126.leaveGameMenuAction, false, Enum.KeyCode.ButtonX);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadRespawnAction", v126.respawnMenuAction, false, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadActivateSelection", v126.activateSelectionAction, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelection", v126.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelectionTop", v126.goToTopAction, false, Enum.KeyCode.ButtonL2);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelectionBottom", v126.goToBottomAction, false, Enum.KeyCode.ButtonR2);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleChatVisibility", v126.toggleChatVisibilityAction, false, Enum.KeyCode.ButtonR1);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleGamepadMenu", v126.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart);
end;
v49.unbindMenuOpenActions = function(v127) --[[ Line: 753 ]] --[[ Name: unbindMenuOpenActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v127.boundMenuOpenActions = false;
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadFreezeController");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadCloseMenu");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadActivateSelection");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadLeaveGame");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadRespawnAction");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelection");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelectionTop");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelectionBottom");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadToggleChatVisibility");
end;
v49.unbindAllActions = function(v128) --[[ Line: 767 ]] --[[ Name: unbindAllActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v128.boundMenuOpenActions then
        v128:unbindMenuOpenActions();
    end;
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadToggleGamepadMenu");
end;
v49.didUpdate = function(v129, v130, _) --[[ Line: 775 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy), l_Enabled_0 (copy), v49 (copy)
    local v132 = nil;
    local v133 = nil;
    v132 = v130.isGamepadMenuOpen ~= v129.props.isGamepadMenuOpen;
    v133 = v129.props.isGamepadMenuOpen;
    if v132 then
        if v133 then
            v129:bindMenuOpenActions();
            if v129.state.selectedIndex ~= 1 then
                v129:setState({
                    selectedIndex = 1
                });
            end;
            v129.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
            l_GuiService_0.SelectedCoreObject = nil;
            v129.savedSelectedObject = l_GuiService_0.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0:SetMenuIsOpen(true, "GamepadMenu");
            if l_Enabled_0() then
                v49.closeUnibarMenu();
                return;
            end;
        else
            v129:unbindMenuOpenActions();
            l_GuiService_0:SetMenuIsOpen(false, "GamepadMenu");
        end;
    end;
end;
v49.willUnmount = function(v134) --[[ Line: 808 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    v134:unbindAllActions();
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v134.disposeScreenSize();
    end;
end;
v49.logExperienceMenuGamepadExposure = function(v135) --[[ Line: 816 ]] --[[ Name: logExperienceMenuGamepadExposure ]]
    -- upvalues: l_FFlagExperienceMenuGamepadExposureEnabled_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy)
    if l_FFlagExperienceMenuGamepadExposureEnabled_0 and not v135.loggedExperienceMenuGamepadExposure then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ExperienceMenuGamepadExposureLayer);
        v135.loggedExperienceMenuGamepadExposure = true;
    end;
end;
return v8.UNSTABLE_connect2(function(v136) --[[ Line: 823 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), l_VRService_0 (copy), v54 (copy)
    local l_topbarEnabled_0 = v136.displayOptions.topbarEnabled;
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v136.displayOptions.screenSize, 
        chatEnabled = v136.coreGuiEnabled[Enum.CoreGuiType.Chat] and l_topbarEnabled_0 and not l_VRService_0.VREnabled, 
        leaderboardEnabled = v136.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and l_topbarEnabled_0, 
        emotesEnabled = v136.moreMenu.emotesEnabled and v136.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu] and l_topbarEnabled_0, 
        backpackEnabled = if v54 then nil else v136.coreGuiEnabled[Enum.CoreGuiType.Backpack] and l_topbarEnabled_0, 
        respawnEnabled = v136.respawn.enabled, 
        topBarEnabled = if v54 then l_topbarEnabled_0 else nil, 
        leaderboardOpen = v136.moreMenu.leaderboardOpen, 
        backpackOpen = v136.moreMenu.backpackOpen, 
        emotesOpen = v136.moreMenu.emotesOpen, 
        menuOpen = v136.displayOptions.menuOpen, 
        isGamepadMenuOpen = v136.displayOptions.isGamepadMenuOpen
    };
end, function(v138) --[[ Line: 849 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v41 (copy)
    return {
        setGamepadMenuOpen = function(v139) --[[ Line: 851 ]] --[[ Name: setGamepadMenuOpen ]]
            -- upvalues: v138 (copy), v41 (ref)
            return v138(v41(v139));
        end
    };
end)(v49);