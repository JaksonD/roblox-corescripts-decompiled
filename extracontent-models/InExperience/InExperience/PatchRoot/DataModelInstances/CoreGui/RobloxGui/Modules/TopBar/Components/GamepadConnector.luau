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
local v41 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagEnableUISelector_0 = v41.Flags.FFlagEnableUISelector;
local v43 = if l_FFlagEnableUISelector_0 then v41.Stores.GetUiSelectorSignalStore else nil;
local v44 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false);
local v45 = nil;
local v46 = nil;
local v47 = nil;
task.spawn(function() --[[ Line: 69 ]]
    -- upvalues: v45 (ref), l_CoreGui_0 (copy), v46 (ref), v47 (ref)
    v45 = l_CoreGui_0:WaitForChild("ToastNotification", 3);
    v46 = if v45 ~= nil then v45:WaitForChild("ToastNotificationWrapper", 3) else nil;
    v47 = if v46 ~= nil then v46:FindFirstChild("Toast", true) else nil;
end);
local function _() --[[ Line: 125 ]] --[[ Name: createSelectedCoreObject ]]
    -- upvalues: v33 (copy), l_GuiService_0 (copy)
    local v48 = v33.new(l_GuiService_0.SelectedCoreObject);
    l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 127 ]]
        -- upvalues: v48 (copy), l_GuiService_0 (ref)
        v48:set(l_GuiService_0.SelectedCoreObject);
    end);
    return v48;
end;
local _ = function(v50) --[[ Line: 134 ]] --[[ Name: isInputGamepad ]]
    -- upvalues: v36 (copy)
    for _, v52 in v36.GamepadInputTypes do
        if v50 == v52 then
            return true;
        end;
    end;
    return false;
end;
local v54 = {};
v54.__index = v54;
v54.new = function() --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: l_GuiService_0 (copy), v30 (copy), v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v33 (copy), l_UserInputService_0 (copy), v36 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), l_SettingsShowSignal_0 (copy), v39 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_isSpatial_0 (copy), l_FFlagEnableUISelector_0 (copy), v43 (copy), l_FFlagShowUnibarOnVirtualCursor_0 (copy), l_GamepadService_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_MenuIconSelectedSignal_0 (copy), v24 (copy), v12 (copy), v54 (copy)
    local v55 = false;
    local v56 = {
        _loggedExperienceMenuGamepadExposure = false, 
        _devSetCoreGuiNavEnabled = l_GuiService_0.CoreGuiNavigationEnabled, 
        _chromeFocused = if v30 then v30:inFocusNav() else false, 
        _lastMenuButtonPress = 0, 
        _dismissFocusConnections = {}
    };
    local v57;
    if v29 and l_FFlagEnableConsoleExpControls_0 then
        local v58 = v33.new(l_GuiService_0.SelectedCoreObject);
        local l_v58_0 = v58 --[[ copy: 2 -> 9 ]];
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 127 ]]
            -- upvalues: l_v58_0 (copy), l_GuiService_0 (ref)
            l_v58_0:set(l_GuiService_0.SelectedCoreObject);
        end);
        v57 = v58;
    else
        v57 = nil;
    end;
    v56._selectedCoreObject = v57;
    v56._connections = {};
    if v29 and l_FFlagEnableConsoleExpControls_0 then
        v57 = v33.new;
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v61;
        for _, v63 in v36.GamepadInputTypes do
            if l_l_UserInputService_0_LastInputType_0 == v63 then
                v61 = true;
                v55 = true;
            end;
            if v55 then
                break;
            end;
        end;
        if not v55 then
            v61 = false;
        end;
        v55 = false;
        v56._gamepadActive = v57(v61);
        v56._tiltMenuOpen = v33.new(false);
        v56._playerListModalOpen = if l_FFlagAddNewPlayerListFocusNav_0 then v33.new(false) else nil;
        v56._showTopBar = v33.new(true);
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v64) --[[ Line: 166 ]]
            -- upvalues: v56 (copy), v36 (ref)
            local v65 = false;
            local l__gamepadActive_0 = v56._gamepadActive;
            local v67;
            for _, v69 in v36.GamepadInputTypes do
                if v64 == v69 then
                    v67 = true;
                    v65 = true;
                end;
                if v65 then
                    break;
                end;
            end;
            if not v65 then
                v67 = false;
            end;
            v65 = false;
            l__gamepadActive_0:set(v67);
        end);
        l_SettingsShowSignal_0:connect(function(v70) --[[ Line: 170 ]]
            -- upvalues: v56 (copy)
            v56._tiltMenuOpen:set(v70);
        end);
        if l_FFlagAddNewPlayerListFocusNav_0 then
            v39:GetVisibilityChangedEvent().Event:Connect(function() --[[ Line: 175 ]]
                -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v39 (ref), v56 (copy)
                local v71 = not l_FFlagAddNewPlayerListMobileFocusNav_0 or v39:GetIsModal();
                v56._playerListModalOpen:set(v71 and v39:GetVisibility());
            end);
        end;
        if not l_FFlagDisableGamepadConnectorInVR_0 or not l_isSpatial_0() then
            v57 = function() --[[ Line: 182 ]]
                -- upvalues: v56 (copy), l_FFlagEnableUISelector_0 (ref), v43 (ref), l_UserInputService_0 (ref), l_FFlagAddNewPlayerListFocusNav_0 (ref), l_FFlagShowUnibarOnVirtualCursor_0 (ref), l_GamepadService_0 (ref), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GuiService_0 (ref)
                local v72 = not v56._gamepadActive:get() or v56._chromeFocused:get() or v56._selectedCoreObject:get() ~= nil and (not l_FFlagEnableUISelector_0 or not v43(false).getVisibility()) or l_UserInputService_0.TouchEnabled or v56._tiltMenuOpen:get() or l_FFlagAddNewPlayerListFocusNav_0 and v56._playerListModalOpen:get() or l_FFlagShowUnibarOnVirtualCursor_0 and l_GamepadService_0.GamepadCursorEnabled or l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled;
                v56._showTopBar:set(v72);
                if v72 then
                    l_GuiService_0.CoreGuiNavigationEnabled = true;
                    return;
                else
                    l_GuiService_0.CoreGuiNavigationEnabled = v56._devSetCoreGuiNavEnabled;
                    return;
                end;
            end;
            v56._selectedCoreObject:connect(v57);
            v56._chromeFocused:connect(v57);
            v56._tiltMenuOpen:connect(v57);
            if l_FFlagShowUnibarOnVirtualCursor_0 or l_FFlagVirtualCursorTopbarAlwaysVisible_0 then
                l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(v57);
            end;
            v56._gamepadActive:connect(v57, true);
        end;
    end;
    if l_FFlagEnableConsoleExpControls_0 then
        l_GuiService_0:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() --[[ Line: 210 ]]
            -- upvalues: v56 (copy), l_GuiService_0 (ref)
            v56._devSetCoreGuiNavEnabled = l_GuiService_0.CoreGuiNavigationEnabled;
        end);
    end;
    v56._isTopBarFocused = function() --[[ Line: 214 ]]
        -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v56 (copy), l_MenuIconSelectedSignal_0 (ref)
        if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
            return false;
        else
            return v56._chromeFocused:get() or l_MenuIconSelectedSignal_0:get();
        end;
    end;
    if v24 then
        v57 = v56._isTopBarFocused();
        local v73, v74 = v12.createSignal(v57);
        v56._topBarFocused = v73;
        v56._setTopBarFocused = v74;
    end;
    return (setmetatable(v56, v54));
end;
v54.connectToTopbar = function(v75) --[[ Line: 229 ]] --[[ Name: connectToTopbar ]]
    -- upvalues: v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v24 (copy), l_FFlagSetUnibarShortcutOnTopBarFocus_0 (copy), v30 (copy), v34 (copy), l_MenuIconSelectedSignal_0 (copy)
    if v29 then
        if l_FFlagEnableConsoleExpControls_0 then
            v75:disconnectFromTopbar();
        end;
        l_ContextActionService_0:BindCoreAction("FocusGamepadToTopbar", v75:_bindSelf(v75._toggleTopbar), false, Enum.KeyCode.ButtonStart);
        local function v77() --[[ Line: 240 ]]
            -- upvalues: v75 (copy), l_GuiService_0 (ref), v24 (ref), l_FFlagSetUnibarShortcutOnTopBarFocus_0 (ref), v30 (ref), v34 (ref)
            local v76 = v75:_isTopBarFocused();
            l_GuiService_0:SetMenuIsOpen(v76, "TopbarMenu");
            if v24 then
                v75._setTopBarFocused(v76);
            end;
            if v76 then
                if l_FFlagSetUnibarShortcutOnTopBarFocus_0 then
                    v30:setShortcutBar(v34.UNIBAR_SHORTCUTBAR_ID);
                end;
                v75:_addDismissFocusConnections();
                return;
            else
                v75:_removeDismissFocusConnections();
                return;
            end;
        end;
        table.insert(v75._connections, v75._chromeFocused:connect(v77));
        table.insert(v75._connections, l_MenuIconSelectedSignal_0:connect(v77));
    end;
end;
v54.disconnectFromTopbar = function(v78) --[[ Line: 262 ]] --[[ Name: disconnectFromTopbar ]]
    -- upvalues: l_ContextActionService_0 (copy)
    for _, v80 in v78._connections do
        v80:disconnect();
    end;
    v78._connections = {};
    v78:_removeDismissFocusConnections();
    l_ContextActionService_0:UnbindCoreAction("FocusGamepadToTopbar");
end;
v54.getSelectedCoreObject = function(v81) --[[ Line: 272 ]] --[[ Name: getSelectedCoreObject ]]
    return v81._selectedCoreObject;
end;
v54.getShowTopBar = function(v82) --[[ Line: 276 ]] --[[ Name: getShowTopBar ]]
    return v82._showTopBar;
end;
v54.getGamepadActive = function(v83) --[[ Line: 280 ]] --[[ Name: getGamepadActive ]]
    return v83._gamepadActive;
end;
v54.topBarFocused = function(v84, v85) --[[ Line: 284 ]] --[[ Name: topBarFocused ]]
    -- upvalues: v24 (copy)
    if not v24 then
        return;
    else
        return v84._topBarFocused(v85);
    end;
end;
v54._addDismissFocusConnections = function(v86) --[[ Line: 292 ]] --[[ Name: _addDismissFocusConnections ]]
    -- upvalues: l_UserInputService_0 (copy), v8 (copy), v7 (copy)
    v86._dismissFocusConnections = {
        (l_UserInputService_0.InputEnded:Connect(function(v87, v88) --[[ Line: 294 ]]
            -- upvalues: v8 (ref), v7 (ref), v86 (copy)
            local v89 = v8.getLastInputType(false);
            local v90 = false;
            if v89 == v7.Input.Pointer then
                v90 = v87.UserInputType ~= Enum.UserInputType.Keyboard;
            end;
            local v91 = v89 == v7.Input.Touch;
            if v90 or v91 and not v88 then
                v86:_unfocusGamepadFromTopBar();
            end;
        end))
    };
end;
v54._removeDismissFocusConnections = function(v92) --[[ Line: 310 ]] --[[ Name: _removeDismissFocusConnections ]]
    for _, v94 in v92._dismissFocusConnections do
        v94:Disconnect();
    end;
    v92._dismissFocusConnections = {};
end;
v54._toggleTopbar = function(v95, _, v97, _) --[[ Line: 317 ]] --[[ Name: _toggleTopbar ]]
    -- upvalues: v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagEnableUISelector_0 (copy), l_UserInputService_0 (copy), l_GamepadService_0 (copy), l_GuiService_0 (copy), v43 (copy), v30 (copy), v44 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), v39 (copy)
    if v29 and not v95:_focusToastNotification(v97) and (not l_FFlagEnableConsoleExpControls_0 and v97 == Enum.UserInputState.End or l_FFlagEnableConsoleExpControls_0 and v97 == Enum.UserInputState.Begin) then
        if l_FFlagEnableUISelector_0 and not l_UserInputService_0:GamepadSupports(l_UserInputService_0:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
            if l_GamepadService_0.GamepadCursorEnabled or l_GuiService_0.SelectedObject ~= nil then
                l_GamepadService_0:DisableGamepadCursor();
                l_GuiService_0.SelectedObject = nil;
                return Enum.ContextActionResult.Sink;
            else
                local v99 = v43(false);
                if v99.getVisibility(false) then
                    v99.setVisibility(false);
                    return Enum.ContextActionResult.Sink;
                elseif not v95:_isTopBarFocused() then
                    v99.setVisibility(true);
                    return Enum.ContextActionResult.Sink;
                end;
            end;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            if v30:integrations().nine_dot == nil then
                return Enum.ContextActionResult.Pass;
            else
                local v100 = not (v95:_isTopBarFocused() or v44.getChatInputBarFocused(false));
                if v100 then
                    v95:_focusGamepadToTopBar();
                else
                    v95:_unfocusGamepadFromTopBar();
                end;
                v95:_logExperienceMenuGamepadExposure();
                l_LogGamepadOpenExperienceControlsMenu_0(v100);
            end;
        else
            v95:_toggleUnibarMenu();
        end;
        if l_FFlagAddNewPlayerListMobileFocusNav_0 and v39:GetIsModal() and v39:GetVisibility() then
            v39:SetVisibility(false);
        end;
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v54._toggleUnibarMenu = function(v101) --[[ Line: 372 ]] --[[ Name: _toggleUnibarMenu ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v30 (copy), l_LogGamepadOpenExperienceControlsMenu_0 (copy)
    local v102 = v101._chromeFocused:get();
    if v102 then
        if l_FFlagEnableConsoleExpControls_0 then
            v101:_unfocusGamepadFromTopBar();
        else
            v30:disableFocusNav();
        end;
    elseif l_FFlagEnableConsoleExpControls_0 then
        v101:_focusGamepadToTopBar();
    else
        v30:enableFocusNav();
    end;
    v101:_logExperienceMenuGamepadExposure();
    l_LogGamepadOpenExperienceControlsMenu_0(v102);
end;
v54._focusGamepadToTopBar = function(_) --[[ Line: 391 ]] --[[ Name: _focusGamepadToTopBar ]]
    -- upvalues: l_FocusUtils_0 (copy)
    l_FocusUtils_0.FocusOnChrome();
end;
v54._unfocusGamepadFromTopBar = function(_) --[[ Line: 395 ]] --[[ Name: _unfocusGamepadFromTopBar ]]
    -- upvalues: l_FocusUtils_0 (copy), l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v44 (copy), l_GuiService_0 (copy)
    l_FocusUtils_0.FocusOffChrome(function() --[[ Line: 396 ]]
        -- upvalues: l_FFlagConsoleChatUseChromeFocusUtils_0 (ref), v44 (ref), l_GuiService_0 (ref)
        if l_FFlagConsoleChatUseChromeFocusUtils_0 and v44.getChatInputBarFocused(false) then
            v44.unfocusChatInputBar();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
    end);
end;
v54._focusToastNotification = function(v105, v106) --[[ Line: 404 ]] --[[ Name: _focusToastNotification ]]
    -- upvalues: v47 (ref), l_ToastNotificationConstants_0 (copy)
    local function _() --[[ Line: 405 ]] --[[ Name: buttonHoldTime ]]
        -- upvalues: v105 (copy)
        return tick() - v105._lastMenuButtonPress;
    end;
    local v108 = false;
    if v47 ~= nil then
        v108 = v47.Visible;
    end;
    if v106 == Enum.UserInputState.Begin then
        v105._lastMenuButtonPress = tick();
        return false;
    else
        local v109 = false;
        if v106 == Enum.UserInputState.End then
            v109 = v108 and tick() - v105._lastMenuButtonPress < l_ToastNotificationConstants_0.MenuButtonPressHoldTime;
        end;
        return v109;
    end;
end;
v54._logExperienceMenuGamepadExposure = function(v110) --[[ Line: 420 ]] --[[ Name: _logExperienceMenuGamepadExposure ]]
    -- upvalues: l_FFlagExperienceMenuGamepadExposureEnabled_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy)
    if l_FFlagExperienceMenuGamepadExposureEnabled_0 and not v110._loggedExperienceMenuGamepadExposure then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ExperienceMenuGamepadExposureLayer);
        v110._loggedExperienceMenuGamepadExposure = true;
    end;
end;
v54._bindSelf = function(v111, v112) --[[ Line: 427 ]] --[[ Name: _bindSelf ]]
    return function(...) --[[ Line: 428 ]]
        -- upvalues: v112 (copy), v111 (copy)
        return v112(v111, ...);
    end;
end;
if l_FFlagEnableConsoleExpControls_0 then
    return (v54.new());
else
    return v54;
end;