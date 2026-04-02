local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_reverse_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array.reverse;
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_Signal_0 = v7.Signal;
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local l_FocusOnChromeSignal_0 = l_FocusUtils_0.FocusOnChromeSignal;
local l_FocusOffChromeSignal_0 = l_FocusUtils_0.FocusOffChromeSignal;
local v13 = require(l_script_FirstAncestor_0.Service.ChromeUtils);
local v14 = require(l_script_FirstAncestor_0.Service.LocalStore);
local v15 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v16 = require(l_script_FirstAncestor_0.Service.WindowSizeSignal);
local l_ObservableValue_0 = v13.ObservableValue;
local l_NotifySignal_0 = v13.NotifySignal;
local l_AvailabilitySignal_0 = v13.AvailabilitySignal;
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v21 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v22 = require(l_script_FirstAncestor_0.Service.ShortcutService);
local v23 = nil;
local l_FFlagEnableConsoleExpControls_0 = v6.FFlagEnableConsoleExpControls;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v26 = require(l_script_FirstAncestor_0.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry);
local v27 = game:DefineFastFlag("ChromeDeprecateMRUs", false);
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v6.FFlagVirtualCursorTopbarAlwaysVisible;
local l_FFlagEnableSideSheet_0 = v6.FFlagEnableSideSheet;
local l_FFlagEnableChromeWindowsNotInMenu_0 = require(l_script_FirstAncestor_0.Flags).FFlagEnableChromeWindowsNotInMenu;
if l_FFlagEnableSideSheet_0 then
    v23 = require(l_CorePackages_0.Workspace.Packages.InExperienceSideSheet).openSideSheet;
end;
local v31 = {};
v31.__index = v31;
v31.AvailabilitySignal = v13.AvailabilitySignalState;
v31.IntegrationStatus = {
    None = 0, 
    Icon = 1, 
    Window = 2
};
noop = function() --[[ Line: 76 ]] --[[ Name: noop ]]

end;
local v32 = {
    id = "div", 
    label = "div", 
    initialAvailability = v31.AvailabilitySignal.Unavailable, 
    availability = l_AvailabilitySignal_0.new(v31.AvailabilitySignal.Unavailable), 
    notification = l_NotifySignal_0.new(), 
    components = {}, 
    hideNotificationCountWhileOpen = false
};
createUnibarLayoutInfo = function(v33, v34) --[[ Line: 220 ]] --[[ Name: createUnibarLayoutInfo ]]
    return Rect.new(v33, v33 + v34);
end;
v31.new = function() --[[ Line: 224 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v22 (copy), v13 (copy), l_ObservableValue_0 (copy), l_NotifySignal_0 (copy), l_Localization_0 (copy), l_Signal_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v31 (copy), v15 (copy), v27 (copy), l_FocusOnChromeSignal_0 (copy), l_FocusOffChromeSignal_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v36 = {
        _shortcutService = if l_FFlagEnableConsoleExpControls_0 then v22.new() else nil, 
        _layout = v13.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero)), 
        _menuAbsolutePosition = Vector2.zero, 
        _menuAbsoluteSizeOpen = Vector2.zero, 
        _currentSubMenu = v13.ObservableValue.new(nil), 
        _selectedItem = v13.ObservableValue.new(nil), 
        _selectedItemIdx = 0, 
        _integrations = {}, 
        _integrationsConnections = {}, 
        _integrationsStatus = {}, 
        _menuConfig = {}, 
        _subMenuConfig = {}, 
        _subMenuNotifications = {}, 
        _menuList = l_ObservableValue_0.new({}), 
        _windowList = l_ObservableValue_0.new({}), 
        _dragConnection = {}, 
        _windowPositions = l_ObservableValue_0.new({}), 
        _totalNotifications = l_NotifySignal_0.new(true), 
        _mostRecentlyUsedAndPinnedLimit = -1, 
        _localization = l_Localization_0.new(l_RobloxLocaleId_0), 
        _localizedLabelKeys = {}, 
        _currentShortcutBar = l_ObservableValue_0.new(nil), 
        _notificationIndicator = l_ObservableValue_0.new(nil), 
        _orderAlignment = l_ObservableValue_0.new(Enum.HorizontalAlignment.Left), 
        _onIntegrationRegistered = l_Signal_0.new(), 
        _onIntegrationActivated = l_Signal_0.new(), 
        _onIntegrationStatusChanged = l_Signal_0.new(), 
        _onIntegrationHovered = l_Signal_0.new(), 
        _triggerMenuIcon = l_Signal_0.new(), 
        _triggerVRToggleButton = if l_isInExperienceUIVREnabled_0 then l_Signal_0.new() else nil, 
        _topBarVisibility = if l_isInExperienceUIVREnabled_0 then l_ObservableValue_0.new(nil) else nil, 
        _inFocusNav = l_ObservableValue_0.new(false)
    };
    local v37 = setmetatable(v36, v31);
    v15.viewport:connect(function(v38) --[[ Line: 267 ]]
        -- upvalues: v27 (ref), v37 (copy)
        if v27 then
            v37:updateWindowSizeSignals();
            return;
        else
            v37:updateScreenSize(v38.size, v38.isMobileDevice, v38.portraitOrientation, v38.tinyPortrait);
            return;
        end;
    end, true);
    if l_FFlagEnableConsoleExpControls_0 then
        v36._shortcutService.onShortcutBarChanged:connect(function(v39) --[[ Line: 281 ]]
            -- upvalues: v37 (copy)
            v37._currentShortcutBar:set(v39);
        end);
    end;
    l_FocusOnChromeSignal_0:connect(function(v40) --[[ Line: 285 ]]
        -- upvalues: v36 (copy), v37 (copy)
        if v40 and not v36._subMenuConfig.nine_dot[v40] then
            v37:setSelected(v40);
        end;
        v37:enableFocusNav();
    end);
    l_FocusOffChromeSignal_0:connect(function() --[[ Line: 292 ]]
        -- upvalues: v37 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
        v37:disableFocusNav();
        if l_FFlagEnableConsoleExpControls_0 then
            v37:setShortcutBar(nil);
        end;
    end);
    return v37;
end;
v31.storeChromeInteracted = function(_) --[[ Line: 304 ]] --[[ Name: storeChromeInteracted ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        v14.storeForLocalPlayer("ChromeInteracted3", true);
    end;
end;
v31.updateScreenSize = function(v42, _, v44, v45, v46) --[[ Line: 310 ]] --[[ Name: updateScreenSize ]]
    -- upvalues: v21 (copy)
    local v47 = 0;
    v47 = if v44 then if v46 then v21.MOBILE_TINY_PORTRAIT_SLOTS - v21.CORE_SLOTS else if v45 then v21.MOBILE_PORTRAIT_SLOTS - v21.CORE_SLOTS else v21.MOBILE_LANDSCAPE_SLOTS - v21.CORE_SLOTS else v21.NON_MOBILE_SLOTS - v21.CORE_SLOTS;
    if v47 ~= v42._mostRecentlyUsedAndPinnedLimit then
        v42._mostRecentlyUsedAndPinnedLimit = v47;
        v42:updateMenuList();
        v42:updateNotificationTotals();
    end;
    v42:updateWindowSizeSignals();
end;
v31.updateWindowSizeSignals = function(v48) --[[ Line: 346 ]] --[[ Name: updateWindowSizeSignals ]]
    for _, v50 in v48._integrations do
        if v50.windowSize then
            v50.windowSize:updateConstraints();
        end;
    end;
end;
v31.notificationIndicator = function(v51) --[[ Line: 354 ]] --[[ Name: notificationIndicator ]]
    return v51._notificationIndicator;
end;
v31.toggleSubMenu = function(v52, v53) --[[ Line: 358 ]] --[[ Name: toggleSubMenu ]]
    -- upvalues: l_FFlagEnableSideSheet_0 (copy), v23 (ref)
    if l_FFlagEnableSideSheet_0 then
        v23();
        return;
    elseif not v52._subMenuConfig[v53] then
        warn("Not a valid subMenuId:" .. v53);
        return;
    elseif v52._currentSubMenu:get() == v53 then
        v52._currentSubMenu:set(nil);
        return;
    else
        v52._currentSubMenu:set(v53);
        return;
    end;
end;
v31.currentSubMenu = function(v54) --[[ Line: 378 ]] --[[ Name: currentSubMenu ]]
    return v54._currentSubMenu;
end;
v31.inFocusNav = function(v55) --[[ Line: 382 ]] --[[ Name: inFocusNav ]]
    return v55._inFocusNav;
end;
v31.enableFocusNav = function(v56) --[[ Line: 386 ]] --[[ Name: enableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v21 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if not v56._inFocusNav:get() then
            v56._inFocusNav:set(true);
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v56:setShortcutBar(v21.UNIBAR_SHORTCUTBAR_ID);
        end;
        return;
    end;
end;
v31.disableFocusNav = function(v57) --[[ Line: 399 ]] --[[ Name: disableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if v57._inFocusNav:get() then
            v57._inFocusNav:set(false);
            v57._selectedItem:set(nil);
            v57._currentSubMenu:set(nil);
        end;
        return;
    end;
end;
v31.toggleWindow = function(v58, v59) --[[ Line: 411 ]] --[[ Name: toggleWindow ]]
    -- upvalues: v31 (copy), v14 (copy)
    if v58._integrations[v59].components.Window then
        if not v58._integrationsStatus[v59] or v58._integrationsStatus[v59] == v31.IntegrationStatus.None or v58._integrationsStatus[v59] == v31.IntegrationStatus.Icon then
            v58._integrationsStatus[v59] = v31.IntegrationStatus.Window;
        else
            v58._integrationsStatus[v59] = v31.IntegrationStatus.Icon;
        end;
        v58._onIntegrationStatusChanged:fire(v59, v58._integrationsStatus[v59]);
    end;
    if v14.isEnabled() and v58._integrations[v59] and v58._integrations[v59].persistWindowState then
        local v60 = v14.loadForLocalPlayer("ChromeWindowStatus") or {};
        v60[v59] = v58._integrationsStatus[v59] == v31.IntegrationStatus.Window;
        v14.storeForLocalPlayer("ChromeWindowStatus", v60);
    end;
    v58:updateMenuList();
end;
v31.isWindowOpen = function(v61, v62) --[[ Line: 437 ]] --[[ Name: isWindowOpen ]]
    -- upvalues: v31 (copy)
    return v61._integrations[v62].components.Window and v61._integrationsStatus[v62] == v31.IntegrationStatus.Window;
end;
v31.menuList = function(v63) --[[ Line: 441 ]] --[[ Name: menuList ]]
    return v63._menuList;
end;
v31.windowList = function(v64) --[[ Line: 445 ]] --[[ Name: windowList ]]
    return v64._windowList;
end;
v31.dragConnection = function(v65, v66) --[[ Line: 449 ]] --[[ Name: dragConnection ]]
    if v65._integrations[v66] then
        return v65._dragConnection[v66];
    else
        return nil;
    end;
end;
v31.updateLocalization = function(v67, v68) --[[ Line: 457 ]] --[[ Name: updateLocalization ]]
    local v69 = "";
    local v70 = "";
    v67._localizedLabelKeys[v68.id] = {};
    v67._localizedLabelKeys[v68.id].label = v68.label;
    v69 = v68.label;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 468 ]]
        -- upvalues: v69 (ref), v67 (copy)
        v69 = v67._localization:Format(v69);
    end);
    if not l_status_0 then
        v69 = v68.label;
        warn(l_result_0);
    end;
    v68.label = v69;
    if v68.secondaryAction then
        v67._localizedLabelKeys[v68.id].secondaryActionLabel = v68.secondaryAction.label;
        v70 = v68.secondaryAction.label;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 482 ]]
            -- upvalues: v70 (ref), v67 (copy)
            v70 = v67._localization:Format(v70);
        end);
        if not l_status_1 then
            v70 = v68.secondaryAction.label;
            warn(l_result_1);
        end;
        v68.secondaryAction.label = v70;
    end;
    return v68;
end;
v31.register = function(v75, v76) --[[ Line: 497 ]] --[[ Name: register ]]
    -- upvalues: v31 (copy), l_AvailabilitySignal_0 (copy), l_NotifySignal_0 (copy), v16 (copy), v21 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if v75._integrations[v76.id] then
        warn(string.format(v76.id .. "already registered", debug.traceback()));
        for _, v78 in v75._integrationsConnections[v76.id] do
            v78:disconnect();
        end;
    end;
    v75._integrationsConnections[v76.id] = {};
    local v79 = v75._integrationsConnections[v76.id];
    if v76.initialAvailability == nil then
        v76.initialAvailability = v31.AvailabilitySignal.Unavailable;
    end;
    if v76.availability == nil then
        v76.availability = l_AvailabilitySignal_0.new(v76.initialAvailability or v31.AvailabilitySignal.Unavailable);
    end;
    if v76.notification == nil then
        v76.notification = l_NotifySignal_0.new();
    end;
    if v76.components == nil then
        v76.components = {};
    end;
    if v76.availability then
        v79[#v79 + 1] = v76.availability:connect(function() --[[ Line: 526 ]]
            -- upvalues: v75 (copy), v76 (ref)
            v75:availabilityChanged(v76);
        end);
    end;
    if v76.notification and not v76.notification:excludeFromTotalCounts() then
        v79[#v79 + 1] = v76.notification:connect(function() --[[ Line: 532 ]]
            -- upvalues: v75 (copy)
            v75:updateNotificationTotals();
        end);
    end;
    if v76.windowSize == nil and v76.components and v76.components.Window then
        v76.windowSize = v16.new();
    end;
    if v31:getWindowStatusFromStore(v76.id) and v76.persistWindowState or v76.windowDefaultOpen then
        v75._integrationsStatus[v76.id] = v31.IntegrationStatus.Window;
        v75._onIntegrationStatusChanged:fire(v76.id, v75._integrationsStatus[v76.id]);
    end;
    local v80 = UDim2.fromOffset(v21.MENU_ICON_SCREEN_SIDE_OFFSET, v21.WINDOW_DEFAULT_PADDING);
    if v76.startingWindowPosition then
        v80 = if v76.persistWindowState then v75:getWindowPositionFromStore(v76.id) or v76.startingWindowPosition else v76.startingWindowPosition;
    end;
    v75._windowPositions[v76.id] = v80;
    v76 = v75:updateLocalization(v76);
    local l_v76_0 = v76;
    v75._integrations[v76.id] = l_v76_0;
    if l_FFlagEnableConsoleExpControls_0 and v76.selected then
        v79[#v79 + 1] = v75:selectedItem():connect(function(v82) --[[ Line: 566 ]]
            -- upvalues: l_v76_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v76 (ref)
            if l_v76_0.id == v82 then
                if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    v76.selected(l_v76_0);
                end;
            end;
        end);
    end;
    return l_v76_0;
end;
v31.createIconProps = function(v83, v84, v85) --[[ Line: 579 ]] --[[ Name: createIconProps ]]
    -- upvalues: v32 (copy)
    local v86 = v85 or 0;
    if v83._integrations[v84] then
        return {
            id = v84, 
            children = {}, 
            order = v86, 
            component = v83._integrations[v84].components.Icon, 
            integration = v83._integrations[v84], 
            isDivider = false, 
            activated = function() --[[ Line: 589 ]] --[[ Name: activated ]]
                -- upvalues: v83 (copy), v84 (copy)
                v83:activate(v84);
            end
        };
    else
        return {
            id = v84, 
            children = {}, 
            order = v86, 
            activated = noop, 
            integration = v32
        };
    end;
end;
reverseOrder = function(v87) --[[ Line: 604 ]] --[[ Name: reverseOrder ]]
    local v88 = #v87;
    local v89 = {};
    for v90 = 1, v88 do
        v89[v90] = v87[v90].order;
    end;
    for v91 = 1, v88 do
        v87[v91].order = v89[v88 - v91 + 1];
    end;
end;
v31.updateMenuList = function(v92) --[[ Line: 617 ]] --[[ Name: updateMenuList ]]
    -- upvalues: v32 (copy), v31 (copy), l_reverse_0 (copy), l_FFlagEnableChromeWindowsNotInMenu_0 (copy)
    local v93 = 0;
    local v94 = 0;
    local function v96(v95) --[[ Line: 621 ]] --[[ Name: iconProps ]]
        -- upvalues: v94 (ref), v92 (copy)
        v94 = v94 + 1;
        return v92:createIconProps(v95, v94);
    end;
    local function v98(v97) --[[ Line: 626 ]] --[[ Name: windowProps ]]
        -- upvalues: v94 (ref), v92 (copy), v32 (ref)
        v94 = v94 + 1;
        if v92._integrations[v97] then
            return {
                id = v97, 
                children = {}, 
                order = v94, 
                component = v92._integrations[v97].components.Window, 
                activated = noop, 
                integration = v92._integrations[v97]
            };
        else
            return {
                id = v97, 
                children = {}, 
                order = v94, 
                activated = noop, 
                integration = v32
            };
        end;
    end;
    local function v100(_) --[[ Line: 648 ]] --[[ Name: divider ]]
        -- upvalues: v93 (ref), v94 (ref), v32 (ref)
        v93 = v93 + 1;
        v94 = v94 + 1;
        return {
            id = "DIV" .. v93, 
            order = v94, 
            isDivider = true, 
            children = {}, 
            activated = noop, 
            integration = v32
        };
    end;
    local function _(v101) --[[ Line: 661 ]] --[[ Name: valid ]]
        -- upvalues: v92 (copy), v31 (ref)
        local v102 = v92._integrations[v101];
        if v102 then
            local l_availability_0 = v102.availability;
            return l_availability_0 and l_availability_0:get() ~= v31.AvailabilitySignal.Unavailable;
        else
            return false;
        end;
    end;
    local function v105(v106, v107, v108) --[[ Line: 672 ]] --[[ Name: collectMenu ]]
        -- upvalues: v100 (copy), v93 (ref), v105 (copy), v92 (copy), v31 (ref), v94 (ref), v98 (copy), v96 (copy)
        local v109 = 0;
        for v110, v111 in pairs(v106) do
            if type(v111) == "table" then
                if not #v107.children then
                    table.insert(v107.children, (v100(v93)));
                end;
                if v105(v111, v107, v108) > 0 then
                    table.insert(v107.children, (v100(v93)));
                end;
            else
                if typeof(v111) ~= "string" then
                    error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v111, v110)));
                end;
                if v92._subMenuConfig[v111] then
                    local v112 = v92._integrations[v111];
                    local v113;
                    if v112 then
                        local l_availability_1 = v112.availability;
                        v113 = l_availability_1 and l_availability_1:get() ~= v31.AvailabilitySignal.Unavailable;
                    else
                        v113 = false;
                    end;
                    if v113 then
                        v94 = v94 + 1;
                        v113 = v92:createIconProps(v111, v94);
                        v109 = v109 + 1;
                        v105(v92._subMenuConfig[v111], v113, v108);
                        if #v113.children > 0 then
                            table.insert(v107.children, v113);
                        end;
                    end;
                else
                    local v115 = v92._integrations[v111];
                    local v116;
                    if v115 then
                        local l_availability_2 = v115.availability;
                        v116 = l_availability_2 and l_availability_2:get() ~= v31.AvailabilitySignal.Unavailable;
                    else
                        v116 = false;
                    end;
                    if v116 then
                        if v92:isWindowOpen(v111) then
                            table.insert(v108, (v98(v111)));
                            table.insert(v107.children, v96(v111));
                            v109 = v109 + 1;
                        else
                            table.insert(v107.children, v96(v111));
                            v109 = v109 + 1;
                        end;
                    end;
                end;
            end;
        end;
        return v109;
    end;
    local v118 = {
        children = {}
    };
    local v119 = {};
    v105(v92._menuConfig, v118, v119);
    if #v118.children and v118.children[#v118.children] and v118.children[#v118.children].isDivider then
        table.remove(v118.children, #v118.children);
    end;
    if v92._orderAlignment:get() == Enum.HorizontalAlignment.Left then
        v118.children = l_reverse_0(v118.children);
        reverseOrder(v118.children);
    end;
    if l_FFlagEnableChromeWindowsNotInMenu_0 then
        local v120 = {};
        for _, v122 in v119 do
            v120[v122.id] = true;
        end;
        for v123, _ in v92._integrations do
            if v92:isWindowOpen(v123) and not v120[v123] then
                table.insert(v119, (v98(v123)));
            end;
        end;
    end;
    v92._menuList:set(v118.children);
    v92._windowList:set(v119);
    v92:repairSelected();
end;
v31.availabilityChanged = function(v125, _) --[[ Line: 754 ]] --[[ Name: availabilityChanged ]]
    v125:updateNotificationTotals();
    v125:updateMenuList();
end;
v31.subMenuNotifications = function(v127, v128) --[[ Line: 759 ]] --[[ Name: subMenuNotifications ]]
    -- upvalues: l_NotifySignal_0 (copy)
    if not v127._subMenuNotifications[v128] then
        v127._subMenuNotifications[v128] = l_NotifySignal_0.new(true);
    end;
    return v127._subMenuNotifications[v128];
end;
v31.totalNotifications = function(v129) --[[ Line: 766 ]] --[[ Name: totalNotifications ]]
    return v129._totalNotifications;
end;
v31.onIntegrationRegistered = function(v130) --[[ Line: 770 ]] --[[ Name: onIntegrationRegistered ]]
    return v130._onIntegrationRegistered;
end;
v31.onIntegrationActivated = function(v131) --[[ Line: 774 ]] --[[ Name: onIntegrationActivated ]]
    return v131._onIntegrationActivated;
end;
v31.onIntegrationHovered = function(v132) --[[ Line: 778 ]] --[[ Name: onIntegrationHovered ]]
    return v132._onIntegrationHovered;
end;
v31.onIntegrationStatusChanged = function(v133) --[[ Line: 782 ]] --[[ Name: onIntegrationStatusChanged ]]
    return v133._onIntegrationStatusChanged;
end;
v31.integrations = function(v134) --[[ Line: 786 ]] --[[ Name: integrations ]]
    return v134._integrations;
end;
v31.updateNotificationTotals = function(v135) --[[ Line: 790 ]] --[[ Name: updateNotificationTotals ]]
    -- upvalues: v31 (copy)
    local v136 = 0;
    for _, v138 in v135._integrations do
        if v138.availability:get() ~= v31.AvailabilitySignal.Unavailable and v138.availability:get() ~= v31.AvailabilitySignal.Pinned and not v138.notification:excludeFromTotalCounts() then
            local v139 = v138.notification:get();
            if v139 and v139.type == "count" then
                assert(typeof(v139.value) == "number", "Expected count value to be number");
                v136 = v136 + v139.value;
            end;
        end;
    end;
    v135._totalNotifications:fireCount(v136);
    for v140, v141 in v135._subMenuNotifications do
        local v142 = v135:withinCurrentTopLevelMenu(v140);
        v136 = 0;
        if v142 then
            for _, v144 in v142.children do
                if not v135:withinCurrentTopLevelMenu(v144.id) and v144.integration.availability:get() ~= v31.AvailabilitySignal.Unavailable and not v144.integration.notification:excludeFromTotalCounts() then
                    local v145 = v144.integration.notification:get();
                    if v145 and v145.type == "count" then
                        assert(typeof(v145.value) == "number", "Expected count value to be number");
                        v136 = v136 + v145.value;
                    end;
                end;
            end;
            v141:fireCount(v136);
        end;
    end;
end;
v31.configureReset = function(v146) --[[ Line: 834 ]] --[[ Name: configureReset ]]
    v146._menuConfig = {};
    v146._subMenuConfig = {};
    v146._subMenuNotifications = {};
    v146:updateMenuList();
end;
v31.configureMenu = function(v147, v148) --[[ Line: 841 ]] --[[ Name: configureMenu ]]
    v147._menuConfig = v148;
    v147:updateNotificationTotals();
    v147:updateMenuList();
end;
v31.configureSubMenu = function(v149, v150, v151) --[[ Line: 847 ]] --[[ Name: configureSubMenu ]]
    -- upvalues: l_NotifySignal_0 (copy)
    v149._subMenuConfig[v150] = v151;
    if not v149._subMenuNotifications[v150] then
        v149._subMenuNotifications[v150] = l_NotifySignal_0.new(true);
    end;
    v149:updateNotificationTotals();
    v149:updateMenuList();
end;
if l_FFlagEnableConsoleExpControls_0 then
    v31.registerShortcut = function(v152, v153) --[[ Line: 857 ]] --[[ Name: registerShortcut ]]
        -- upvalues: v31 (copy)
        v152._shortcutService:registerShortcut(v153);
        local v154 = v152._shortcutService:getShortcut(v153.id);
        if v154.integration and v152._integrations[v154.integration] then
            local v155 = v152._integrations[v154.integration];
            if v155.availability:get() == v31.AvailabilitySignal.Unavailable then
                v154.availability:unavailable();
            end;
            v155.availability:connect(function() --[[ Line: 865 ]]
                -- upvalues: v155 (copy), v31 (ref), v154 (copy)
                local v156 = v155.availability:get();
                if v156 == v31.AvailabilitySignal.Unavailable then
                    v154.availability:unavailable();
                    return;
                else
                    if v156 == v31.AvailabilitySignal.Available or v156 == v31.AvailabilitySignal.Pinned then
                        v154.availability:available();
                    end;
                    return;
                end;
            end);
        end;
    end;
    v31.activateShortcut = function(v157, v158) --[[ Line: 879 ]] --[[ Name: activateShortcut ]]
        -- upvalues: v26 (copy)
        local v159 = v157._shortcutService:getShortcut(v158);
        if v159.integration then
            if v159.activated then
                if v26 then
                    v157._shortcutService:activateShortcut(v158);
                    v157._onIntegrationActivated:fire(v159.integration, {
                        fromShortcut = true
                    });
                    return;
                end;
            elseif v26 then
                v157:activate(v159.integration, {
                    fromShortcut = true
                });
                return;
            else
                v157:activate(v159.integration);
                return;
            end;
        else
            v157._shortcutService:activateShortcut(v158);
        end;
    end;
    v31.configureShortcutBar = function(v160, v161, v162) --[[ Line: 899 ]] --[[ Name: configureShortcutBar ]]
        v160._shortcutService:configureShortcutBar(v161, v162);
    end;
    v31.setShortcutBar = function(v163, v164) --[[ Line: 903 ]] --[[ Name: setShortcutBar ]]
        v163._shortcutService:setShortcutBar(v164);
    end;
    v31.getCurrentShortcutBar = function(v165) --[[ Line: 907 ]] --[[ Name: getCurrentShortcutBar ]]
        return v165._currentShortcutBar;
    end;
    v31.getShortcutsFromBar = function(v166, v167) --[[ Line: 911 ]] --[[ Name: getShortcutsFromBar ]]
        return v166._shortcutService:getShortcutsFromBar(v167, v166._integrations);
    end;
    v31.getCurrentShortcuts = function(v168) --[[ Line: 915 ]] --[[ Name: getCurrentShortcuts ]]
        return v168:getShortcutsFromBar(v168._currentShortcutBar:get());
    end;
    v31.onShortcutBarChanged = function(v169) --[[ Line: 919 ]] --[[ Name: onShortcutBarChanged ]]
        return v169._shortcutService.onShortcutBarChanged;
    end;
    v31.selectMenuIcon = function(v170) --[[ Line: 923 ]] --[[ Name: selectMenuIcon ]]
        v170._triggerMenuIcon:fire();
    end;
    v31.onTriggerMenuIcon = function(v171) --[[ Line: 927 ]] --[[ Name: onTriggerMenuIcon ]]
        return v171._triggerMenuIcon;
    end;
    v31.setHideShortcutBar = function(v172, v173, v174) --[[ Line: 931 ]] --[[ Name: setHideShortcutBar ]]
        v172._shortcutService:setHideShortcutBar(v173, v174);
    end;
    v31.getHideShortcutBar = function(v175) --[[ Line: 935 ]] --[[ Name: getHideShortcutBar ]]
        return v175._shortcutService:getHideShortcutBar();
    end;
end;
if l_isInExperienceUIVREnabled_0 then
    v31.onTriggerVRToggleButton = function(v176) --[[ Line: 941 ]] --[[ Name: onTriggerVRToggleButton ]]
        return v176._triggerVRToggleButton;
    end;
    v31.showTopBar = function(v177) --[[ Line: 945 ]] --[[ Name: showTopBar ]]
        return v177._topBarVisibility:get();
    end;
    v31.getTopBarVisibiity = function(v178) --[[ Line: 949 ]] --[[ Name: getTopBarVisibiity ]]
        return v178._topBarVisibility;
    end;
    v31.connectTopBarVisibility = function(v179, v180) --[[ Line: 953 ]] --[[ Name: connectTopBarVisibility ]]
        v179._topBarVisibility = v180;
    end;
end;
v31.gesture = function(v181, v182, v183, v184) --[[ Line: 958 ]] --[[ Name: gesture ]]
    if v181._integrations[v182] then
        v181._dragConnection[v182] = {
            connection = v183, 
            inputObject = v184
        };
    end;
end;
v31.withinCurrentTopLevelMenu = function(v185, v186) --[[ Line: 971 ]] --[[ Name: withinCurrentTopLevelMenu ]]
    for v187, v188 in (v185._menuList:get()) do
        if v188.id == v186 then
            return v188, v187;
        end;
    end;
    return nil, 0;
end;
v31.withinCurrentSubmenu = function(v189, v190) --[[ Line: 981 ]] --[[ Name: withinCurrentSubmenu ]]
    local v191 = v189._currentSubMenu:get();
    if not v191 then
        return false;
    else
        local v192 = v189._menuList:get();
        local v193 = nil;
        for _, v195 in v192 do
            if v195.id == v191 then
                v193 = v195.children;
                break;
            end;
        end;
        if not v193 then
            return false;
        else
            for _, v197 in v193 do
                if v197.id == v190 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v31.windowPosition = function(v198, v199) --[[ Line: 1010 ]] --[[ Name: windowPosition ]]
    return v198._windowPositions[v199];
end;
v31.updateWindowPosition = function(v200, v201, v202) --[[ Line: 1014 ]] --[[ Name: updateWindowPosition ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() and v200._integrations[v201] and v200._integrations[v201].persistWindowState then
        local v203 = v14.loadForLocalPlayer("ChromeWindowPosition") or {};
        v203[v201] = {
            v202.X.Scale, 
            v202.X.Offset, 
            v202.Y.Scale, 
            v202.Y.Offset
        };
        v14.storeForLocalPlayer("ChromeWindowPosition", v203);
    end;
    v200._windowPositions[v201] = v202;
end;
v31.getWindowStatusFromStore = function(_, v205) --[[ Line: 1027 ]] --[[ Name: getWindowStatusFromStore ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        return (v14.loadForLocalPlayer("ChromeWindowStatus") or {})[v205] or false;
    else
        return nil;
    end;
end;
v31.getWindowPositionFromStore = function(_, v207) --[[ Line: 1037 ]] --[[ Name: getWindowPositionFromStore ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        local v208 = (v14.loadForLocalPlayer("ChromeWindowPosition") or {})[v207] or nil;
        if v208 then
            return (UDim2.new(v208[1], v208[2], v208[3], v208[4]));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v31.activate = function(v209, v210, v211) --[[ Line: 1048 ]] --[[ Name: activate ]]
    -- upvalues: v26 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    local v212 = nil;
    if v209._integrations[v210] then
        local l_activated_0 = v209._integrations[v210].activated;
        if v26 then
            v209._onIntegrationActivated:fire(v210, v211);
        else
            v209._onIntegrationActivated:fire(v210);
        end;
        v209:storeChromeInteracted();
        if l_activated_0 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1064 ]]
                -- upvalues: l_activated_0 (copy), v209 (copy), v210 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
                l_activated_0(v209._integrations[v210]);
                if not l_FFlagEnableConsoleExpControls_0 then
                    v209:disableFocusNav();
                end;
            end);
            if not l_status_2 then
                warn("ChromeService: activate error thrown for " .. v210);
                v212 = l_result_2;
            end;
        else
            if v209._subMenuConfig[v210] then
                v209:toggleSubMenu(v210);
            end;
            v209:toggleWindow(v210);
        end;
        if v209._currentSubMenu:get() ~= v210 then
            v209._currentSubMenu:set(nil);
        end;
    end;
    if v212 then
        error(v212);
    end;
end;
v31.selectedItem = function(v216) --[[ Line: 1092 ]] --[[ Name: selectedItem ]]
    return v216._selectedItem;
end;
v31.setSelected = function(v217, v218) --[[ Line: 1096 ]] --[[ Name: setSelected ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v219, v220 = v217:withinCurrentTopLevelMenu(v218 or "");
    if not v219 then
        return;
    else
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v222 = true;
        if l_l_UserInputService_0_LastInputType_0 ~= Enum.UserInputType.MouseButton1 then
            v222 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Touch;
        end;
        local v223 = v217._currentSubMenu:get();
        if v223 and v223 ~= v218 and not v222 then
            v217:toggleSubMenu(v223);
        end;
        v217._selectedItemIdx = v220;
        v217._selectedItem:set(v218);
        return;
    end;
end;
v31.setSelectedByOffset = function(v224, v225) --[[ Line: 1114 ]] --[[ Name: setSelectedByOffset ]]
    local v226 = v224._menuList:get();
    local _, v228 = v224:withinCurrentTopLevelMenu(v224._selectedItem:get() or "");
    if v228 > 0 then
        v224:setSelected(v226[math.clamp(v228 + v225, 1, #v226)].id);
    end;
end;
v31.repairSelected = function(v229) --[[ Line: 1124 ]] --[[ Name: repairSelected ]]
    if v229._selectedItem:get() then
        local _, v231 = v229:withinCurrentTopLevelMenu(v229._selectedItem:get() or "");
        if v231 == 0 then
            v231 = v229._selectedItemIdx;
        end;
        local v232 = v229._menuList:get();
        v229:setSelected(v232[math.clamp(v231, 1, #v232)].id);
    end;
end;
v31.configureOrderAlignment = function(v233, v234) --[[ Line: 1138 ]] --[[ Name: configureOrderAlignment ]]
    if v233._orderAlignment:get() ~= v234 then
        v233._orderAlignment:set(v234);
        v233:updateMenuList();
    end;
end;
v31.orderAlignment = function(v235) --[[ Line: 1145 ]] --[[ Name: orderAlignment ]]
    return v235._orderAlignment;
end;
v31.setMenuAbsolutePosition = function(v236, v237) --[[ Line: 1149 ]] --[[ Name: setMenuAbsolutePosition ]]
    if v237 ~= v236._menuAbsolutePosition then
        v236._menuAbsolutePosition = v237;
        v236._layout:set(createUnibarLayoutInfo(v237, v236._menuAbsoluteSizeOpen));
    end;
end;
v31.setMenuAbsoluteSize = function(v238, v239) --[[ Line: 1156 ]] --[[ Name: setMenuAbsoluteSize ]]
    if v239 ~= v238._menuAbsoluteSizeOpen then
        v238._menuAbsoluteSizeOpen = v239;
        v238._layout:set(createUnibarLayoutInfo(v238._menuAbsolutePosition, v239));
    end;
end;
v31.layout = function(v240) --[[ Line: 1163 ]] --[[ Name: layout ]]
    return v240._layout;
end;
return v31;