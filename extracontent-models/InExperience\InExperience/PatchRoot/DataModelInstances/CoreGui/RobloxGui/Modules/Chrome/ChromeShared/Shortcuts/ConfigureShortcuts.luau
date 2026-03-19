local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChromeShared");
local v6 = require(l_script_FirstAncestor_1.Utility.FocusSelectExpChat);
local v7 = require(l_script_FirstAncestor_1.Service);
local l_GuiService_0 = game:GetService("GuiService");
local v9 = require(l_script_FirstAncestor_1.Unibar.Constants);
local v10 = require(l_script_FirstAncestor_0.Integrations.RespawnUtils);
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local v12 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v13.FFlagEnableConsoleExpControls;
local l_FFlagChromeShortcutAddRespawnLeaveToIEM_0 = v13.FFlagChromeShortcutAddRespawnLeaveToIEM;
local l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 = v13.FFlagChromeShortcutRemoveLeaveOnRespawnPage;
local l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 = v13.FFlagChromeShortcutRemoveRespawnOnLeavePage;
local l_FFlagConsoleChatUseChromeFocusUtils_0 = v13.FFlagConsoleChatUseChromeFocusUtils;
local l_FFlagChromeShortcutChatOpenKeyboard_0 = v13.FFlagChromeShortcutChatOpenKeyboard;
local l_FFlagAddSwitchTabHintsToIEM_0 = v13.FFlagAddSwitchTabHintsToIEM;
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v22 = require(l_Flags_0.FFlagRespawnChromeShortcutTelemetry);
local v23 = require(l_Flags_0.FFlagLeaveActionChromeShortcutTelemetry);
local v24 = require(l_Flags_0.FFlagLeaveChromeShortcutTelemetry);
local v25 = require(l_Flags_0.FFlagRespawnActionChromeShortcutTelemetry);
local v26 = require(l_script_FirstAncestor_1.Flags);
local l_FFlagRemoveLeaveShortcutFromLeaveConfirm_0 = v26.FFlagRemoveLeaveShortcutFromLeaveConfirm;
local l_FFlagRemoveRespawnShortcutFromRespawnConfirmation_0 = v26.FFlagRemoveRespawnShortcutFromRespawnConfirmation;
local v29 = if l_FFlagEnableConsoleExpControls_0 then require(l_RobloxGui_0.Modules.ChatSelector) else nil;
local v30 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local l_FFlagShowUnibarOnVirtualCursor_0 = v13.FFlagShowUnibarOnVirtualCursor;
local v38 = {
    keyCode = Enum.KeyCode.ButtonX, 
    activated = function() --[[ Line: 45 ]] --[[ Name: activated ]]
        -- upvalues: l_RobloxGui_0 (copy), v23 (copy), v30 (copy), v24 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v12 (copy), v22 (copy)
        local v32 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        local l_LeaveGamePage_0 = v32.Instance.LeaveGamePage;
        local function _() --[[ Line: 48 ]] --[[ Name: switchToLeavePage ]]
            -- upvalues: v32 (copy), l_LeaveGamePage_0 (copy)
            local v34 = {
                used_shortcut = true
            };
            v32.Instance:SwitchToPage(l_LeaveGamePage_0, true, nil, nil, nil, v34);
        end;
        if v32:GetVisibility() then
            if v32.Instance.Pages.CurrentPage == l_LeaveGamePage_0 then
                if v23 then
                    v30(true, {
                        telemetryFields = {
                            used_shortcut = true
                        }
                    });
                    return;
                else
                    v30(true);
                    return;
                end;
            elseif v24 then
                local v36 = {
                    used_shortcut = true
                };
                v32.Instance:SwitchToPage(l_LeaveGamePage_0, true, nil, nil, nil, v36);
                return;
            else
                v32:SwitchToPage(l_LeaveGamePage_0, true);
                return;
            end;
        else
            if l_FFlagConsoleChatUseChromeFocusUtils_0 and v12.getChatInputBarFocused(false) then
                v12.unfocusChatInputBar();
            end;
            if v22 then
                v32:SetVisibility(true);
                local v37 = {
                    used_shortcut = true
                };
                v32.Instance:SwitchToPage(l_LeaveGamePage_0, true, nil, nil, nil, v37);
                return;
            else
                v32:SetVisibility(true, false, l_LeaveGamePage_0);
                return;
            end;
        end;
    end
};
local v40 = {
    keyCode = Enum.KeyCode.ButtonY, 
    integration = "respawn", 
    activated = function() --[[ Line: 92 ]] --[[ Name: activated ]]
        -- upvalues: l_RobloxGui_0 (copy), v25 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v12 (copy), v22 (copy), v10 (copy), v7 (copy)
        local v39 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if v39:GetVisibility() and v39.Instance.Pages.CurrentPage == v39.Instance.ResetCharacterPage then
            if v25 then
                v39.Instance.ResetCharacterPage.ResetFunction({
                    resetTelemetryFields = {
                        used_shortcut = true
                    }
                });
                return;
            else
                v39.Instance.ResetCharacterPage.ResetFunction();
                return;
            end;
        else
            if l_FFlagConsoleChatUseChromeFocusUtils_0 and v12.getChatInputBarFocused(false) then
                v12.unfocusChatInputBar();
            end;
            if v22 then
                v10.respawnPage({
                    usedShortcut = true
                });
                return;
            else
                v7:activate("respawn");
                return;
            end;
        end;
    end
};
local function v45() --[[ Line: 124 ]] --[[ Name: activateBack ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), l_FocusUtils_0 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v7 (copy), l_RobloxGui_0 (copy), l_GuiService_0 (copy), v12 (copy)
    local v41 = l_FFlagEnableConsoleExpControls_0 and l_FocusUtils_0.MenuIconSelectedSignal:get();
    local v42 = not l_FFlagConsoleChatUseChromeFocusUtils_0 or v7:inFocusNav():get();
    local v43 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    if v43:GetVisibility() then
        v43.Instance:PopMenu(false, true);
        if not v43:GetVisibility() then
            v7:selectMenuIcon();
        end;
        return Enum.ContextActionResult.Sink;
    elseif v42 or v41 then
        local v44 = v7:currentSubMenu():get();
        if v44 then
            v7:toggleSubMenu(v44);
            v7:setSelected(v44);
        else
            v7:disableFocusNav();
            v7:setShortcutBar(nil);
            l_GuiService_0.SelectedCoreObject = nil;
            if l_FFlagEnableConsoleExpControls_0 then
                l_FocusUtils_0.MenuIconSelectedSignal:set(false);
            end;
        end;
        return Enum.ContextActionResult.Sink;
    elseif l_FFlagConsoleChatUseChromeFocusUtils_0 and v12.getChatInputBarFocused(false) then
        l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 149 ]]
            -- upvalues: v12 (ref)
            v12.unfocusChatInputBar();
        end, "chat");
        return Enum.ContextActionResult.Sink;
    else
        return;
    end;
end;
registerShortcuts = function() --[[ Line: 157 ]] --[[ Name: registerShortcuts ]]
    -- upvalues: v7 (copy), v38 (copy), v40 (copy), l_FFlagChromeShortcutAddRespawnLeaveToIEM_0 (copy), l_FFlagChromeShortcutChatOpenKeyboard_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v29 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v12 (copy), l_FocusUtils_0 (copy), l_GameSettings_0 (copy), v6 (copy), l_RobloxGui_0 (copy), v45 (copy), l_FFlagRemoveLeaveShortcutFromLeaveConfirm_0 (copy), l_FFlagRemoveRespawnShortcutFromRespawnConfirmation_0 (copy), l_GuiService_0 (copy), l_GamepadService_0 (copy)
    v7:registerShortcut({
        id = "leave", 
        label = "CoreScripts.TopBar.Leave", 
        keyCode = v38.keyCode, 
        integration = nil, 
        actionName = "UnibarGamepadLeaveGame", 
        activated = v38.activated
    });
    v7:registerShortcut({
        id = "respawn", 
        label = "CoreScripts.InGameMenu.QuickActions.Respawn", 
        keyCode = v40.keyCode, 
        integration = v40.integration, 
        actionName = "UnibarGamepadRespawn", 
        activated = v40.activated
    });
    if l_FFlagChromeShortcutAddRespawnLeaveToIEM_0 then
        v7:registerShortcut({
            id = "leave_in_experience_menu", 
            label = nil, 
            keyCode = v38.keyCode, 
            integration = nil, 
            actionName = "IEMGamepadLeaveGame", 
            activated = v38.activated
        });
        v7:registerShortcut({
            id = "respawn_in_experience_menu", 
            label = nil, 
            keyCode = v40.keyCode, 
            integration = v40.integration, 
            actionName = "IEMGamepadRespawn", 
            activated = v40.activated
        });
    end;
    v7:registerShortcut({
        id = "chat", 
        label = "CoreScripts.TopBar.Chat", 
        keyCode = if l_FFlagChromeShortcutChatOpenKeyboard_0 then Enum.KeyCode.ButtonL2 else Enum.KeyCode.ButtonR1, 
        integration = "chat", 
        actionName = "UnibarGamepadChat", 
        activated = l_FFlagEnableConsoleExpControls_0 and function() --[[ Line: 203 ]]
            -- upvalues: v29 (ref), l_FFlagChromeShortcutChatOpenKeyboard_0 (ref), l_FFlagConsoleChatUseChromeFocusUtils_0 (ref), v12 (ref), l_FocusUtils_0 (ref), l_GameSettings_0 (ref), v6 (ref)
            local l_v29_Visibility_0 = v29:GetVisibility();
            if l_FFlagChromeShortcutChatOpenKeyboard_0 then
                if l_FFlagConsoleChatUseChromeFocusUtils_0 and v12.getChatInputBarFocused(false) then
                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 210 ]]
                        -- upvalues: v12 (ref)
                        v12.unfocusChatInputBar();
                    end, "chat");
                    v29:SetVisible(false);
                    l_GameSettings_0.ChatVisible = false;
                    return;
                else
                    v29:SetVisible(true);
                    l_GameSettings_0.ChatVisible = true;
                    v29:FocusChatBar();
                    v6("chat");
                    return;
                end;
            else
                v29:SetVisible(not l_v29_Visibility_0);
                if not l_v29_Visibility_0 then
                    v6("chat");
                    return;
                else
                    if l_FFlagConsoleChatUseChromeFocusUtils_0 and v12.getChatInputBarFocused(false) then
                        l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 229 ]]
                            -- upvalues: v12 (ref)
                            v12.unfocusChatInputBar();
                        end, "chat");
                    end;
                    return;
                end;
            end;
        end or nil
    });
    v7:registerShortcut({
        id = "tiltMenu", 
        label = "CoreScripts.TopBar.Menu", 
        keyCode = Enum.KeyCode.ButtonR2, 
        integration = nil, 
        actionName = "UnibarGamepadMenu", 
        activated = function() --[[ Line: 245 ]] --[[ Name: activated ]]
            -- upvalues: l_RobloxGui_0 (ref), l_FFlagConsoleChatUseChromeFocusUtils_0 (ref), v12 (ref)
            local v47 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            if v47:GetVisibility() then
                v47:SetVisibility(false);
                return;
            else
                if l_FFlagConsoleChatUseChromeFocusUtils_0 and v12.getChatInputBarFocused(false) then
                    v12.unfocusChatInputBar();
                end;
                v47:SetVisibility(true);
                return;
            end;
        end
    });
    v7:registerShortcut({
        id = "back", 
        label = "CoreScripts.TopBar.Back", 
        keyCode = Enum.KeyCode.ButtonB, 
        displayPriority = l_FFlagEnableConsoleExpControls_0 and -10 or nil, 
        integration = nil, 
        actionName = "UnibarGamepadBack", 
        activated = v45
    });
    if l_FFlagRemoveLeaveShortcutFromLeaveConfirm_0 or l_FFlagRemoveRespawnShortcutFromRespawnConfirmation_0 then
        v7:registerShortcut({
            id = "back-invisible", 
            label = nil, 
            keyCode = Enum.KeyCode.ButtonB, 
            actionName = "UnibarGamepadBackInvisible", 
            activated = v45
        });
    end;
    v7:registerShortcut({
        id = "close", 
        label = nil, 
        keyCode = Enum.KeyCode.ButtonStart, 
        actionName = "UnibarGamepadClose", 
        activated = function() --[[ Line: 287 ]] --[[ Name: activated ]]
            -- upvalues: l_RobloxGui_0 (ref), v7 (ref), l_GuiService_0 (ref)
            require(l_RobloxGui_0.Modules.Settings.SettingsHub):SetVisibility(false);
            v7:disableFocusNav();
            v7:setShortcutBar(nil);
            l_GuiService_0.SelectedCoreObject = nil;
        end
    });
    v7:registerShortcut({
        id = "virtualCursor", 
        label = nil, 
        keyCode = Enum.KeyCode.ButtonSelect, 
        actionName = "VirtualCursorShortcut", 
        activated = function() --[[ Line: 303 ]] --[[ Name: activated ]]
            -- upvalues: v7 (ref), l_GuiService_0 (ref), l_GamepadService_0 (ref)
            v7:disableFocusNav();
            v7:setShortcutBar(nil);
            l_GuiService_0.SelectedCoreObject = nil;
            l_GamepadService_0.GamepadCursorEnabled = true;
        end
    });
    v7:registerShortcut({
        id = "tiltMenuPreviousTab", 
        label = "CoreScripts.InGameMenu.Controls.PreviousTab", 
        keyCode = Enum.KeyCode.ButtonL1, 
        integration = nil, 
        actionName = nil, 
        activated = nil
    });
    v7:registerShortcut({
        id = "tiltMenuNextTab", 
        label = "CoreScripts.InGameMenu.Controls.NextTab", 
        keyCode = Enum.KeyCode.ButtonR1, 
        integration = nil, 
        actionName = nil, 
        activated = nil
    });
end;
configureShortcutBars = function() --[[ Line: 333 ]] --[[ Name: configureShortcutBars ]]
    -- upvalues: v7 (copy), v9 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), l_FFlagAddSwitchTabHintsToIEM_0 (copy), l_FFlagChromeShortcutAddRespawnLeaveToIEM_0 (copy), l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 (copy), l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 (copy), l_FFlagRemoveLeaveShortcutFromLeaveConfirm_0 (copy), l_FFlagRemoveRespawnShortcutFromRespawnConfirmation_0 (copy)
    v7:configureShortcutBar(v9.UNIBAR_SHORTCUTBAR_ID, if l_FFlagShowUnibarOnVirtualCursor_0 then {
        "leave", 
        "respawn", 
        "chat", 
        "tiltMenu", 
        "back", 
        "virtualCursor"
    } else {
        "leave", 
        "respawn", 
        "chat", 
        "tiltMenu", 
        "back"
    });
    v7:configureShortcutBar(v9.TILTMENU_SHORTCUTBAR_ID, if l_FFlagAddSwitchTabHintsToIEM_0 then {
        "leave_in_experience_menu", 
        "respawn_in_experience_menu", 
        "back-invisible", 
        "close"
    } else if l_FFlagChromeShortcutAddRespawnLeaveToIEM_0 then {
        "leave_in_experience_menu", 
        "respawn_in_experience_menu", 
        "tiltMenuPreviousTab", 
        "tiltMenuNextTab", 
        "back", 
        "close"
    } else {
        "tiltMenuPreviousTab", 
        "tiltMenuNextTab", 
        "back", 
        "close"
    });
    if not l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 or not l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 then
        v7:configureShortcutBar(v9.TILTMENU_DIALOG_SHORTCUTBAR_ID, {
            "leave", 
            "respawn", 
            "back", 
            "close"
        });
    end;
    if l_FFlagRemoveLeaveShortcutFromLeaveConfirm_0 then
        v7:configureShortcutBar(v9.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, {
            "back-invisible", 
            "close"
        });
    elseif l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 then
        v7:configureShortcutBar(v9.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, {
            "leave", 
            "back", 
            "close"
        });
    end;
    if l_FFlagRemoveRespawnShortcutFromRespawnConfirmation_0 then
        v7:configureShortcutBar(v9.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, {
            "back-invisible", 
            "close"
        });
        return;
    else
        if l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 then
            v7:configureShortcutBar(v9.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, {
                "respawn", 
                "back", 
                "close"
            });
        end;
        return;
    end;
end;
return function() --[[ Line: 391 ]]
    registerShortcuts();
    configureShortcutBars();
end;