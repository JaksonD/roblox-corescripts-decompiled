local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v7 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v8 = v7.GetInputModeStore(false);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v11 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v12 = require(l_CorePackages_0.Packages.Signals);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v13.FFlagEnableConsoleExpControls;
local l_FFlagShowUnibarOnVirtualCursor_0 = v13.FFlagShowUnibarOnVirtualCursor;
local l_FFlagConsoleChatUseChromeFocusUtils_0 = v13.FFlagConsoleChatUseChromeFocusUtils;
local l_FFlagExperienceMenuGamepadExposureEnabled_0 = v13.FFlagExperienceMenuGamepadExposureEnabled;
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v13.FFlagVirtualCursorTopbarAlwaysVisible;
local l_FFlagAddNewPlayerListFocusNav_0 = v11.Flags.FFlagAddNewPlayerListFocusNav;
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v11.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_TopBar_0 = l_Parent_0.TopBar;
local v23 = require(l_TopBar_0.Flags.FFlagAddTopBarScrim);
local l_LogGamepadOpenExperienceControlsMenu_0 = require(l_TopBar_0:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu;
local l_Chrome_0 = l_Parent_0.Chrome;
local v26 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v27 = if v26 then require(l_Chrome_0.Service) else nil;
local v28 = require(l_Chrome_0.ChromeShared.Service.ChromeUtils);
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local v30 = if v26 and l_FFlagEnableConsoleExpControls_0 then v28.ObservableValue else nil;
local l_ToastNotificationConstants_0 = require(l_CorePackages_0.Workspace.Packages.ToastNotification).ToastNotificationConstants;
local v32 = require(script.Parent.Parent.Constants);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local l_PlayerList_0 = l_Parent_0.PlayerList;
local v35 = require(l_PlayerList_0.PlayerListManager);
local l_MenuIconSelectedSignal_0 = l_FocusUtils_0.MenuIconSelectedSignal;
local v37 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false);
local v38 = nil;
local v39 = nil;
local v40 = nil;
task.spawn(function() --[[ Line: 61 ]]
    -- upvalues: v38 (ref), l_CoreGui_0 (copy), v39 (ref), v40 (ref)
    v38 = l_CoreGui_0:WaitForChild("ToastNotification", 3);
    v39 = if v38 ~= nil then v38:WaitForChild("ToastNotificationWrapper", 3) else nil;
    v40 = if v39 ~= nil then v39:FindFirstChild("Toast", true) else nil;
end);
local function _() --[[ Line: 117 ]] --[[ Name: createSelectedCoreObject ]]
    -- upvalues: v30 (copy), l_GuiService_0 (copy)
    local v41 = v30.new(l_GuiService_0.SelectedCoreObject);
    l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 119 ]]
        -- upvalues: v41 (copy), l_GuiService_0 (ref)
        v41:set(l_GuiService_0.SelectedCoreObject);
    end);
    return v41;
end;
local _ = function(v43) --[[ Line: 126 ]] --[[ Name: isInputGamepad ]]
    -- upvalues: v32 (copy)
    for _, v45 in v32.GamepadInputTypes do
        if v43 == v45 then
            return true;
        end;
    end;
    return false;
end;
local v47 = {};
v47.__index = v47;
v47.new = function() --[[ Line: 139 ]] --[[ Name: new ]]
    -- upvalues: l_GuiService_0 (copy), v27 (copy), v26 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v30 (copy), l_UserInputService_0 (copy), v32 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), l_SettingsShowSignal_0 (copy), v35 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), l_GamepadService_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_MenuIconSelectedSignal_0 (copy), v23 (copy), v12 (copy), v47 (copy)
    local v48 = false;
    local v49 = {
        _loggedExperienceMenuGamepadExposure = false, 
        _devSetCoreGuiNavEnabled = l_GuiService_0.CoreGuiNavigationEnabled, 
        _chromeFocused = if v27 then v27:inFocusNav() else false, 
        _lastMenuButtonPress = 0, 
        _dismissFocusConnections = {}
    };
    local v50;
    if v26 and l_FFlagEnableConsoleExpControls_0 then
        local v51 = v30.new(l_GuiService_0.SelectedCoreObject);
        local l_v51_0 = v51 --[[ copy: 2 -> 9 ]];
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 119 ]]
            -- upvalues: l_v51_0 (copy), l_GuiService_0 (ref)
            l_v51_0:set(l_GuiService_0.SelectedCoreObject);
        end);
        v50 = v51;
    else
        v50 = nil;
    end;
    v49._selectedCoreObject = v50;
    v49._connections = {};
    if v26 and l_FFlagEnableConsoleExpControls_0 then
        v50 = v30.new;
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v54;
        for _, v56 in v32.GamepadInputTypes do
            if l_l_UserInputService_0_LastInputType_0 == v56 then
                v54 = true;
                v48 = true;
            end;
            if v48 then
                break;
            end;
        end;
        if not v48 then
            v54 = false;
        end;
        v48 = false;
        v49._gamepadActive = v50(v54);
        v49._tiltMenuOpen = v30.new(false);
        v49._playerListModalOpen = if l_FFlagAddNewPlayerListFocusNav_0 then v30.new(false) else nil;
        v49._showTopBar = v30.new(true);
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v57) --[[ Line: 158 ]]
            -- upvalues: v49 (copy), v32 (ref)
            local v58 = false;
            local l__gamepadActive_0 = v49._gamepadActive;
            local v60;
            for _, v62 in v32.GamepadInputTypes do
                if v57 == v62 then
                    v60 = true;
                    v58 = true;
                end;
                if v58 then
                    break;
                end;
            end;
            if not v58 then
                v60 = false;
            end;
            v58 = false;
            l__gamepadActive_0:set(v60);
        end);
        l_SettingsShowSignal_0:connect(function(v63) --[[ Line: 162 ]]
            -- upvalues: v49 (copy)
            v49._tiltMenuOpen:set(v63);
        end);
        if l_FFlagAddNewPlayerListFocusNav_0 then
            v35:GetVisibilityChangedEvent().Event:Connect(function() --[[ Line: 167 ]]
                -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v35 (ref), v49 (copy)
                local v64 = not l_FFlagAddNewPlayerListMobileFocusNav_0 or v35:GetIsModal();
                v49._playerListModalOpen:set(v64 and v35:GetVisibility());
            end);
        end;
        v50 = function() --[[ Line: 173 ]]
            -- upvalues: v49 (copy), l_UserInputService_0 (ref), l_FFlagAddNewPlayerListFocusNav_0 (ref), l_FFlagShowUnibarOnVirtualCursor_0 (ref), l_GamepadService_0 (ref), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GuiService_0 (ref)
            local v65 = not v49._gamepadActive:get() or v49._chromeFocused:get() or v49._selectedCoreObject:get() ~= nil or l_UserInputService_0.TouchEnabled or v49._tiltMenuOpen:get() or l_FFlagAddNewPlayerListFocusNav_0 and v49._playerListModalOpen:get() or l_FFlagShowUnibarOnVirtualCursor_0 and l_GamepadService_0.GamepadCursorEnabled or l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled;
            v49._showTopBar:set(v65);
            if v65 then
                l_GuiService_0.CoreGuiNavigationEnabled = true;
                return;
            else
                l_GuiService_0.CoreGuiNavigationEnabled = v49._devSetCoreGuiNavEnabled;
                return;
            end;
        end;
        v49._selectedCoreObject:connect(v50);
        v49._chromeFocused:connect(v50);
        v49._tiltMenuOpen:connect(v50);
        if l_FFlagShowUnibarOnVirtualCursor_0 or l_FFlagVirtualCursorTopbarAlwaysVisible_0 then
            l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(v50);
        end;
        v49._gamepadActive:connect(v50, true);
    end;
    if l_FFlagEnableConsoleExpControls_0 then
        l_GuiService_0:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() --[[ Line: 200 ]]
            -- upvalues: v49 (copy), l_GuiService_0 (ref)
            v49._devSetCoreGuiNavEnabled = l_GuiService_0.CoreGuiNavigationEnabled;
        end);
    end;
    v49._isTopBarFocused = function() --[[ Line: 204 ]]
        -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v49 (copy), l_MenuIconSelectedSignal_0 (ref)
        if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
            return false;
        else
            return v49._chromeFocused:get() or l_MenuIconSelectedSignal_0:get();
        end;
    end;
    if v23 then
        v50 = v49._isTopBarFocused();
        local v66, v67 = v12.createSignal(v50);
        v49._topBarFocused = v66;
        v49._setTopBarFocused = v67;
    end;
    return (setmetatable(v49, v47));
end;
v47.connectToTopbar = function(v68) --[[ Line: 219 ]] --[[ Name: connectToTopbar ]]
    -- upvalues: v26 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v23 (copy), l_MenuIconSelectedSignal_0 (copy)
    if v26 then
        if l_FFlagEnableConsoleExpControls_0 then
            v68:disconnectFromTopbar();
        end;
        l_ContextActionService_0:BindCoreAction("FocusGamepadToTopbar", v68:_bindSelf(v68._toggleTopbar), false, Enum.KeyCode.ButtonStart);
        local function v70() --[[ Line: 230 ]]
            -- upvalues: v68 (copy), l_GuiService_0 (ref), v23 (ref)
            local v69 = v68:_isTopBarFocused();
            l_GuiService_0:SetMenuIsOpen(v69, "TopbarMenu");
            if v23 then
                v68._setTopBarFocused(v69);
            end;
            if v69 then
                v68:_addDismissFocusConnections();
                return;
            else
                v68:_removeDismissFocusConnections();
                return;
            end;
        end;
        table.insert(v68._connections, v68._chromeFocused:connect(v70));
        table.insert(v68._connections, l_MenuIconSelectedSignal_0:connect(v70));
    end;
end;
v47.disconnectFromTopbar = function(v71) --[[ Line: 249 ]] --[[ Name: disconnectFromTopbar ]]
    -- upvalues: l_ContextActionService_0 (copy)
    for _, v73 in v71._connections do
        v73:disconnect();
    end;
    v71._connections = {};
    v71:_removeDismissFocusConnections();
    l_ContextActionService_0:UnbindCoreAction("FocusGamepadToTopbar");
end;
v47.getSelectedCoreObject = function(v74) --[[ Line: 259 ]] --[[ Name: getSelectedCoreObject ]]
    return v74._selectedCoreObject;
end;
v47.getShowTopBar = function(v75) --[[ Line: 263 ]] --[[ Name: getShowTopBar ]]
    return v75._showTopBar;
end;
v47.getGamepadActive = function(v76) --[[ Line: 267 ]] --[[ Name: getGamepadActive ]]
    return v76._gamepadActive;
end;
v47.topBarFocused = function(v77, v78) --[[ Line: 271 ]] --[[ Name: topBarFocused ]]
    -- upvalues: v23 (copy)
    if not v23 then
        return;
    else
        return v77._topBarFocused(v78);
    end;
end;
v47._addDismissFocusConnections = function(v79) --[[ Line: 279 ]] --[[ Name: _addDismissFocusConnections ]]
    -- upvalues: l_UserInputService_0 (copy), v8 (copy), v7 (copy)
    v79._dismissFocusConnections = {
        (l_UserInputService_0.InputEnded:Connect(function(v80, v81) --[[ Line: 281 ]]
            -- upvalues: v8 (ref), v7 (ref), v79 (copy)
            local v82 = v8.getLastInputType(false);
            local v83 = false;
            if v82 == v7.Input.Pointer then
                v83 = v80.UserInputType ~= Enum.UserInputType.Keyboard;
            end;
            local v84 = v82 == v7.Input.Touch;
            if v83 or v84 and not v81 then
                v79:_unfocusGamepadFromTopBar();
            end;
        end))
    };
end;
v47._removeDismissFocusConnections = function(v85) --[[ Line: 297 ]] --[[ Name: _removeDismissFocusConnections ]]
    for _, v87 in v85._dismissFocusConnections do
        v87:Disconnect();
    end;
    v85._dismissFocusConnections = {};
end;
v47._toggleTopbar = function(v88, _, v90, _) --[[ Line: 304 ]] --[[ Name: _toggleTopbar ]]
    -- upvalues: v26 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v27 (copy), v37 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), v35 (copy)
    if v26 and not v88:_focusToastNotification(v90) and (not l_FFlagEnableConsoleExpControls_0 and v90 == Enum.UserInputState.End or l_FFlagEnableConsoleExpControls_0 and v90 == Enum.UserInputState.Begin) then
        if l_FFlagEnableConsoleExpControls_0 then
            if v27:integrations().nine_dot == nil then
                return Enum.ContextActionResult.Pass;
            else
                local v92 = not (v88:_isTopBarFocused() or v37.getChatInputBarFocused(false));
                if v92 then
                    v88:_focusGamepadToTopBar();
                else
                    v88:_unfocusGamepadFromTopBar();
                end;
                v88:_logExperienceMenuGamepadExposure();
                l_LogGamepadOpenExperienceControlsMenu_0(v92);
            end;
        else
            v88:_toggleUnibarMenu();
        end;
        if l_FFlagAddNewPlayerListMobileFocusNav_0 and v35:GetIsModal() and v35:GetVisibility() then
            v35:SetVisibility(false);
        end;
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v47._toggleUnibarMenu = function(v93) --[[ Line: 343 ]] --[[ Name: _toggleUnibarMenu ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v27 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy)
    local v94 = v93._chromeFocused:get();
    if v94 then
        if l_FFlagEnableConsoleExpControls_0 then
            v93:_unfocusGamepadFromTopBar();
        else
            v27:disableFocusNav();
        end;
    elseif l_FFlagEnableConsoleExpControls_0 then
        v93:_focusGamepadToTopBar();
    else
        v27:enableFocusNav();
    end;
    v93:_logExperienceMenuGamepadExposure();
    l_LogGamepadOpenExperienceControlsMenu_0(v94);
end;
v47._focusGamepadToTopBar = function(_) --[[ Line: 362 ]] --[[ Name: _focusGamepadToTopBar ]]
    -- upvalues: l_FocusUtils_0 (copy)
    l_FocusUtils_0.FocusOnChrome();
end;
v47._unfocusGamepadFromTopBar = function(_) --[[ Line: 366 ]] --[[ Name: _unfocusGamepadFromTopBar ]]
    -- upvalues: l_FocusUtils_0 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v37 (copy), l_GuiService_0 (copy)
    l_FocusUtils_0.FocusOffChrome(function() --[[ Line: 367 ]]
        -- upvalues: l_FFlagConsoleChatUseChromeFocusUtils_0 (ref), v37 (ref), l_GuiService_0 (ref)
        if l_FFlagConsoleChatUseChromeFocusUtils_0 and v37.getChatInputBarFocused(false) then
            v37.unfocusChatInputBar();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
    end);
end;
v47._focusToastNotification = function(v97, v98) --[[ Line: 375 ]] --[[ Name: _focusToastNotification ]]
    -- upvalues: v40 (ref), l_ToastNotificationConstants_0 (copy)
    local function _() --[[ Line: 376 ]] --[[ Name: buttonHoldTime ]]
        -- upvalues: v97 (copy)
        return tick() - v97._lastMenuButtonPress;
    end;
    local v100 = false;
    if v40 ~= nil then
        v100 = v40.Visible;
    end;
    if v98 == Enum.UserInputState.Begin then
        v97._lastMenuButtonPress = tick();
        return false;
    else
        local v101 = false;
        if v98 == Enum.UserInputState.End then
            v101 = v100 and tick() - v97._lastMenuButtonPress < l_ToastNotificationConstants_0.MenuButtonPressHoldTime;
        end;
        return v101;
    end;
end;
v47._logExperienceMenuGamepadExposure = function(v102) --[[ Line: 391 ]] --[[ Name: _logExperienceMenuGamepadExposure ]]
    -- upvalues: l_FFlagExperienceMenuGamepadExposureEnabled_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy)
    if l_FFlagExperienceMenuGamepadExposureEnabled_0 and not v102._loggedExperienceMenuGamepadExposure then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ExperienceMenuGamepadExposureLayer);
        v102._loggedExperienceMenuGamepadExposure = true;
    end;
end;
v47._bindSelf = function(v103, v104) --[[ Line: 398 ]] --[[ Name: _bindSelf ]]
    return function(...) --[[ Line: 399 ]]
        -- upvalues: v104 (copy), v103 (copy)
        return v104(v103, ...);
    end;
end;
if l_FFlagEnableConsoleExpControls_0 then
    return (v47.new());
else
    return v47;
end;