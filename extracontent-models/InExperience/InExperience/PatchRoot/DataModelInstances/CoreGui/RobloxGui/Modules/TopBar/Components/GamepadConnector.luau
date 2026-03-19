local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v6 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
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
local l_FFlagDisableGamepadConnectorInVR_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR;
local l_FFlagAddNewPlayerListFocusNav_0 = v11.Flags.FFlagAddNewPlayerListFocusNav;
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v11.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_TopBar_0 = l_Parent_0.TopBar;
local v24 = require(l_TopBar_0.Flags.FFlagAddTopBarScrim);
local l_FFlagSetUnibarShortcutOnTopBarFocus_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagSetUnibarShortcutOnTopBarFocus;
local l_isSpatial_0 = v6.isSpatial;
local l_LogGamepadOpenExperienceControlsMenu_0 = require(l_TopBar_0:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu;
local l_Chrome_0 = l_Parent_0.Chrome;
local v29 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v30 = if v29 then require(l_Chrome_0.Service) else nil;
local v31 = require(l_Chrome_0.ChromeShared.Service.ChromeUtils);
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local v33 = if v29 and l_FFlagEnableConsoleExpControls_0 then v31.ObservableValue else nil;
local v34 = if v29 then require(l_Chrome_0.ChromeShared.Unibar.Constants) else nil;
local l_ToastNotificationConstants_0 = require(l_CorePackages_0.Workspace.Packages.ToastNotification).ToastNotificationConstants;
local v36 = require(script.Parent.Parent.Constants);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local l_PlayerList_0 = l_Parent_0.PlayerList;
local v39 = require(l_PlayerList_0.PlayerListManager);
local l_MenuIconSelectedSignal_0 = l_FocusUtils_0.MenuIconSelectedSignal;
local v41 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false);
local v42 = nil;
local v43 = nil;
local v44 = nil;
task.spawn(function() --[[ Line: 64 ]]
    -- upvalues: v42 (ref), l_CoreGui_0 (copy), v43 (ref), v44 (ref)
    v42 = l_CoreGui_0:WaitForChild("ToastNotification", 3);
    v43 = if v42 ~= nil then v42:WaitForChild("ToastNotificationWrapper", 3) else nil;
    v44 = if v43 ~= nil then v43:FindFirstChild("Toast", true) else nil;
end);
local function _() --[[ Line: 120 ]] --[[ Name: createSelectedCoreObject ]]
    -- upvalues: v33 (copy), l_GuiService_0 (copy)
    local v45 = v33.new(l_GuiService_0.SelectedCoreObject);
    l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 122 ]]
        -- upvalues: v45 (copy), l_GuiService_0 (ref)
        v45:set(l_GuiService_0.SelectedCoreObject);
    end);
    return v45;
end;
local _ = function(v47) --[[ Line: 129 ]] --[[ Name: isInputGamepad ]]
    -- upvalues: v36 (copy)
    for _, v49 in v36.GamepadInputTypes do
        if v47 == v49 then
            return true;
        end;
    end;
    return false;
end;
local v51 = {};
v51.__index = v51;
v51.new = function() --[[ Line: 142 ]] --[[ Name: new ]]
    -- upvalues: l_GuiService_0 (copy), v30 (copy), v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v33 (copy), l_UserInputService_0 (copy), v36 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), l_SettingsShowSignal_0 (copy), v39 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_isSpatial_0 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), l_GamepadService_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_MenuIconSelectedSignal_0 (copy), v24 (copy), v12 (copy), v51 (copy)
    local v52 = false;
    local v53 = {
        _loggedExperienceMenuGamepadExposure = false, 
        _devSetCoreGuiNavEnabled = l_GuiService_0.CoreGuiNavigationEnabled, 
        _chromeFocused = if v30 then v30:inFocusNav() else false, 
        _lastMenuButtonPress = 0, 
        _dismissFocusConnections = {}
    };
    local v54;
    if v29 and l_FFlagEnableConsoleExpControls_0 then
        local v55 = v33.new(l_GuiService_0.SelectedCoreObject);
        local l_v55_0 = v55 --[[ copy: 2 -> 9 ]];
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 122 ]]
            -- upvalues: l_v55_0 (copy), l_GuiService_0 (ref)
            l_v55_0:set(l_GuiService_0.SelectedCoreObject);
        end);
        v54 = v55;
    else
        v54 = nil;
    end;
    v53._selectedCoreObject = v54;
    v53._connections = {};
    if v29 and l_FFlagEnableConsoleExpControls_0 then
        v54 = v33.new;
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v58;
        for _, v60 in v36.GamepadInputTypes do
            if l_l_UserInputService_0_LastInputType_0 == v60 then
                v58 = true;
                v52 = true;
            end;
            if v52 then
                break;
            end;
        end;
        if not v52 then
            v58 = false;
        end;
        v52 = false;
        v53._gamepadActive = v54(v58);
        v53._tiltMenuOpen = v33.new(false);
        v53._playerListModalOpen = if l_FFlagAddNewPlayerListFocusNav_0 then v33.new(false) else nil;
        v53._showTopBar = v33.new(true);
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v61) --[[ Line: 161 ]]
            -- upvalues: v53 (copy), v36 (ref)
            local v62 = false;
            local l__gamepadActive_0 = v53._gamepadActive;
            local v64;
            for _, v66 in v36.GamepadInputTypes do
                if v61 == v66 then
                    v64 = true;
                    v62 = true;
                end;
                if v62 then
                    break;
                end;
            end;
            if not v62 then
                v64 = false;
            end;
            v62 = false;
            l__gamepadActive_0:set(v64);
        end);
        l_SettingsShowSignal_0:connect(function(v67) --[[ Line: 165 ]]
            -- upvalues: v53 (copy)
            v53._tiltMenuOpen:set(v67);
        end);
        if l_FFlagAddNewPlayerListFocusNav_0 then
            v39:GetVisibilityChangedEvent().Event:Connect(function() --[[ Line: 170 ]]
                -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v39 (ref), v53 (copy)
                local v68 = not l_FFlagAddNewPlayerListMobileFocusNav_0 or v39:GetIsModal();
                v53._playerListModalOpen:set(v68 and v39:GetVisibility());
            end);
        end;
        if not l_FFlagDisableGamepadConnectorInVR_0 or not l_isSpatial_0() then
            v54 = function() --[[ Line: 177 ]]
                -- upvalues: v53 (copy), l_UserInputService_0 (ref), l_FFlagAddNewPlayerListFocusNav_0 (ref), l_FFlagShowUnibarOnVirtualCursor_0 (ref), l_GamepadService_0 (ref), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GuiService_0 (ref)
                local v69 = not v53._gamepadActive:get() or v53._chromeFocused:get() or v53._selectedCoreObject:get() ~= nil or l_UserInputService_0.TouchEnabled or v53._tiltMenuOpen:get() or l_FFlagAddNewPlayerListFocusNav_0 and v53._playerListModalOpen:get() or l_FFlagShowUnibarOnVirtualCursor_0 and l_GamepadService_0.GamepadCursorEnabled or l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled;
                v53._showTopBar:set(v69);
                if v69 then
                    l_GuiService_0.CoreGuiNavigationEnabled = true;
                    return;
                else
                    l_GuiService_0.CoreGuiNavigationEnabled = v53._devSetCoreGuiNavEnabled;
                    return;
                end;
            end;
            v53._selectedCoreObject:connect(v54);
            v53._chromeFocused:connect(v54);
            v53._tiltMenuOpen:connect(v54);
            if l_FFlagShowUnibarOnVirtualCursor_0 or l_FFlagVirtualCursorTopbarAlwaysVisible_0 then
                l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(v54);
            end;
            v53._gamepadActive:connect(v54, true);
        end;
    end;
    if l_FFlagEnableConsoleExpControls_0 then
        l_GuiService_0:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() --[[ Line: 205 ]]
            -- upvalues: v53 (copy), l_GuiService_0 (ref)
            v53._devSetCoreGuiNavEnabled = l_GuiService_0.CoreGuiNavigationEnabled;
        end);
    end;
    v53._isTopBarFocused = function() --[[ Line: 209 ]]
        -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v53 (copy), l_MenuIconSelectedSignal_0 (ref)
        if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
            return false;
        else
            return v53._chromeFocused:get() or l_MenuIconSelectedSignal_0:get();
        end;
    end;
    if v24 then
        v54 = v53._isTopBarFocused();
        local v70, v71 = v12.createSignal(v54);
        v53._topBarFocused = v70;
        v53._setTopBarFocused = v71;
    end;
    return (setmetatable(v53, v51));
end;
v51.connectToTopbar = function(v72) --[[ Line: 224 ]] --[[ Name: connectToTopbar ]]
    -- upvalues: v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v24 (copy), l_FFlagSetUnibarShortcutOnTopBarFocus_0 (copy), v30 (copy), v34 (copy), l_MenuIconSelectedSignal_0 (copy)
    if v29 then
        if l_FFlagEnableConsoleExpControls_0 then
            v72:disconnectFromTopbar();
        end;
        l_ContextActionService_0:BindCoreAction("FocusGamepadToTopbar", v72:_bindSelf(v72._toggleTopbar), false, Enum.KeyCode.ButtonStart);
        local function v74() --[[ Line: 235 ]]
            -- upvalues: v72 (copy), l_GuiService_0 (ref), v24 (ref), l_FFlagSetUnibarShortcutOnTopBarFocus_0 (ref), v30 (ref), v34 (ref)
            local v73 = v72:_isTopBarFocused();
            l_GuiService_0:SetMenuIsOpen(v73, "TopbarMenu");
            if v24 then
                v72._setTopBarFocused(v73);
            end;
            if v73 then
                if l_FFlagSetUnibarShortcutOnTopBarFocus_0 then
                    v30:setShortcutBar(v34.UNIBAR_SHORTCUTBAR_ID);
                end;
                v72:_addDismissFocusConnections();
                return;
            else
                v72:_removeDismissFocusConnections();
                return;
            end;
        end;
        table.insert(v72._connections, v72._chromeFocused:connect(v74));
        table.insert(v72._connections, l_MenuIconSelectedSignal_0:connect(v74));
    end;
end;
v51.disconnectFromTopbar = function(v75) --[[ Line: 257 ]] --[[ Name: disconnectFromTopbar ]]
    -- upvalues: l_ContextActionService_0 (copy)
    for _, v77 in v75._connections do
        v77:disconnect();
    end;
    v75._connections = {};
    v75:_removeDismissFocusConnections();
    l_ContextActionService_0:UnbindCoreAction("FocusGamepadToTopbar");
end;
v51.getSelectedCoreObject = function(v78) --[[ Line: 267 ]] --[[ Name: getSelectedCoreObject ]]
    return v78._selectedCoreObject;
end;
v51.getShowTopBar = function(v79) --[[ Line: 271 ]] --[[ Name: getShowTopBar ]]
    return v79._showTopBar;
end;
v51.getGamepadActive = function(v80) --[[ Line: 275 ]] --[[ Name: getGamepadActive ]]
    return v80._gamepadActive;
end;
v51.topBarFocused = function(v81, v82) --[[ Line: 279 ]] --[[ Name: topBarFocused ]]
    -- upvalues: v24 (copy)
    if not v24 then
        return;
    else
        return v81._topBarFocused(v82);
    end;
end;
v51._addDismissFocusConnections = function(v83) --[[ Line: 287 ]] --[[ Name: _addDismissFocusConnections ]]
    -- upvalues: l_UserInputService_0 (copy), v8 (copy), v7 (copy)
    v83._dismissFocusConnections = {
        (l_UserInputService_0.InputEnded:Connect(function(v84, v85) --[[ Line: 289 ]]
            -- upvalues: v8 (ref), v7 (ref), v83 (copy)
            local v86 = v8.getLastInputType(false);
            local v87 = false;
            if v86 == v7.Input.Pointer then
                v87 = v84.UserInputType ~= Enum.UserInputType.Keyboard;
            end;
            local v88 = v86 == v7.Input.Touch;
            if v87 or v88 and not v85 then
                v83:_unfocusGamepadFromTopBar();
            end;
        end))
    };
end;
v51._removeDismissFocusConnections = function(v89) --[[ Line: 305 ]] --[[ Name: _removeDismissFocusConnections ]]
    for _, v91 in v89._dismissFocusConnections do
        v91:Disconnect();
    end;
    v89._dismissFocusConnections = {};
end;
v51._toggleTopbar = function(v92, _, v94, _) --[[ Line: 312 ]] --[[ Name: _toggleTopbar ]]
    -- upvalues: v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v30 (copy), v41 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), v39 (copy)
    if v29 and not v92:_focusToastNotification(v94) and (not l_FFlagEnableConsoleExpControls_0 and v94 == Enum.UserInputState.End or l_FFlagEnableConsoleExpControls_0 and v94 == Enum.UserInputState.Begin) then
        if l_FFlagEnableConsoleExpControls_0 then
            if v30:integrations().nine_dot == nil then
                return Enum.ContextActionResult.Pass;
            else
                local v96 = not (v92:_isTopBarFocused() or v41.getChatInputBarFocused(false));
                if v96 then
                    v92:_focusGamepadToTopBar();
                else
                    v92:_unfocusGamepadFromTopBar();
                end;
                v92:_logExperienceMenuGamepadExposure();
                l_LogGamepadOpenExperienceControlsMenu_0(v96);
            end;
        else
            v92:_toggleUnibarMenu();
        end;
        if l_FFlagAddNewPlayerListMobileFocusNav_0 and v39:GetIsModal() and v39:GetVisibility() then
            v39:SetVisibility(false);
        end;
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v51._toggleUnibarMenu = function(v97) --[[ Line: 351 ]] --[[ Name: _toggleUnibarMenu ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v30 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy)
    local v98 = v97._chromeFocused:get();
    if v98 then
        if l_FFlagEnableConsoleExpControls_0 then
            v97:_unfocusGamepadFromTopBar();
        else
            v30:disableFocusNav();
        end;
    elseif l_FFlagEnableConsoleExpControls_0 then
        v97:_focusGamepadToTopBar();
    else
        v30:enableFocusNav();
    end;
    v97:_logExperienceMenuGamepadExposure();
    l_LogGamepadOpenExperienceControlsMenu_0(v98);
end;
v51._focusGamepadToTopBar = function(_) --[[ Line: 370 ]] --[[ Name: _focusGamepadToTopBar ]]
    -- upvalues: l_FocusUtils_0 (copy)
    l_FocusUtils_0.FocusOnChrome();
end;
v51._unfocusGamepadFromTopBar = function(_) --[[ Line: 374 ]] --[[ Name: _unfocusGamepadFromTopBar ]]
    -- upvalues: l_FocusUtils_0 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v41 (copy), l_GuiService_0 (copy)
    l_FocusUtils_0.FocusOffChrome(function() --[[ Line: 375 ]]
        -- upvalues: l_FFlagConsoleChatUseChromeFocusUtils_0 (ref), v41 (ref), l_GuiService_0 (ref)
        if l_FFlagConsoleChatUseChromeFocusUtils_0 and v41.getChatInputBarFocused(false) then
            v41.unfocusChatInputBar();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
    end);
end;
v51._focusToastNotification = function(v101, v102) --[[ Line: 383 ]] --[[ Name: _focusToastNotification ]]
    -- upvalues: v44 (ref), l_ToastNotificationConstants_0 (copy)
    local function _() --[[ Line: 384 ]] --[[ Name: buttonHoldTime ]]
        -- upvalues: v101 (copy)
        return tick() - v101._lastMenuButtonPress;
    end;
    local v104 = false;
    if v44 ~= nil then
        v104 = v44.Visible;
    end;
    if v102 == Enum.UserInputState.Begin then
        v101._lastMenuButtonPress = tick();
        return false;
    else
        local v105 = false;
        if v102 == Enum.UserInputState.End then
            v105 = v104 and tick() - v101._lastMenuButtonPress < l_ToastNotificationConstants_0.MenuButtonPressHoldTime;
        end;
        return v105;
    end;
end;
v51._logExperienceMenuGamepadExposure = function(v106) --[[ Line: 399 ]] --[[ Name: _logExperienceMenuGamepadExposure ]]
    -- upvalues: l_FFlagExperienceMenuGamepadExposureEnabled_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy)
    if l_FFlagExperienceMenuGamepadExposureEnabled_0 and not v106._loggedExperienceMenuGamepadExposure then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ExperienceMenuGamepadExposureLayer);
        v106._loggedExperienceMenuGamepadExposure = true;
    end;
end;
v51._bindSelf = function(v107, v108) --[[ Line: 406 ]] --[[ Name: _bindSelf ]]
    return function(...) --[[ Line: 407 ]]
        -- upvalues: v108 (copy), v107 (copy)
        return v108(v107, ...);
    end;
end;
if l_FFlagEnableConsoleExpControls_0 then
    return (v51.new());
else
    return v51;
end;