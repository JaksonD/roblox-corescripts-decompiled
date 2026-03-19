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
local l_FFlagEnableConsoleExpControls_0 = v6.FFlagEnableConsoleExpControls;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v25 = require(l_script_FirstAncestor_0.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry);
local v26 = game:DefineFastFlag("ChromeDeprecateMRUs", false);
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v6.FFlagVirtualCursorTopbarAlwaysVisible;
local v28 = {};
v28.__index = v28;
v28.AvailabilitySignal = v13.AvailabilitySignalState;
v28.IntegrationStatus = {
    None = 0, 
    Icon = 1, 
    Window = 2
};
noop = function() --[[ Line: 69 ]] --[[ Name: noop ]]

end;
local v29 = {
    id = "div", 
    label = "div", 
    initialAvailability = v28.AvailabilitySignal.Unavailable, 
    availability = l_AvailabilitySignal_0.new(v28.AvailabilitySignal.Unavailable), 
    notification = l_NotifySignal_0.new(), 
    components = {}, 
    hideNotificationCountWhileOpen = false
};
createUnibarLayoutInfo = function(v30, v31) --[[ Line: 213 ]] --[[ Name: createUnibarLayoutInfo ]]
    return Rect.new(v30, v30 + v31);
end;
v28.new = function() --[[ Line: 217 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v22 (copy), v13 (copy), l_ObservableValue_0 (copy), l_NotifySignal_0 (copy), l_Localization_0 (copy), l_Signal_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v28 (copy), v15 (copy), v26 (copy), l_FocusOnChromeSignal_0 (copy), l_FocusOffChromeSignal_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v33 = {
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
    local v34 = setmetatable(v33, v28);
    v15.viewport:connect(function(v35) --[[ Line: 260 ]]
        -- upvalues: v26 (ref), v34 (copy)
        if v26 then
            v34:updateWindowSizeSignals();
            return;
        else
            v34:updateScreenSize(v35.size, v35.isMobileDevice, v35.portraitOrientation, v35.tinyPortrait);
            return;
        end;
    end, true);
    if l_FFlagEnableConsoleExpControls_0 then
        v33._shortcutService.onShortcutBarChanged:connect(function(v36) --[[ Line: 274 ]]
            -- upvalues: v34 (copy)
            v34._currentShortcutBar:set(v36);
        end);
    end;
    l_FocusOnChromeSignal_0:connect(function(v37) --[[ Line: 278 ]]
        -- upvalues: v33 (copy), v34 (copy)
        if v37 and not v33._subMenuConfig.nine_dot[v37] then
            v34:setSelected(v37);
        end;
        v34:enableFocusNav();
    end);
    l_FocusOffChromeSignal_0:connect(function() --[[ Line: 285 ]]
        -- upvalues: v34 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
        v34:disableFocusNav();
        if l_FFlagEnableConsoleExpControls_0 then
            v34:setShortcutBar(nil);
        end;
    end);
    return v34;
end;
v28.storeChromeInteracted = function(_) --[[ Line: 297 ]] --[[ Name: storeChromeInteracted ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        v14.storeForLocalPlayer("ChromeInteracted3", true);
    end;
end;
v28.updateScreenSize = function(v39, _, v41, v42, v43) --[[ Line: 303 ]] --[[ Name: updateScreenSize ]]
    -- upvalues: v21 (copy)
    local v44 = 0;
    v44 = if v41 then if v43 then v21.MOBILE_TINY_PORTRAIT_SLOTS - v21.CORE_SLOTS else if v42 then v21.MOBILE_PORTRAIT_SLOTS - v21.CORE_SLOTS else v21.MOBILE_LANDSCAPE_SLOTS - v21.CORE_SLOTS else v21.NON_MOBILE_SLOTS - v21.CORE_SLOTS;
    if v44 ~= v39._mostRecentlyUsedAndPinnedLimit then
        v39._mostRecentlyUsedAndPinnedLimit = v44;
        v39:updateMenuList();
        v39:updateNotificationTotals();
    end;
    v39:updateWindowSizeSignals();
end;
v28.updateWindowSizeSignals = function(v45) --[[ Line: 339 ]] --[[ Name: updateWindowSizeSignals ]]
    for _, v47 in v45._integrations do
        if v47.windowSize then
            v47.windowSize:updateConstraints();
        end;
    end;
end;
v28.notificationIndicator = function(v48) --[[ Line: 347 ]] --[[ Name: notificationIndicator ]]
    return v48._notificationIndicator;
end;
v28.toggleSubMenu = function(v49, v50) --[[ Line: 351 ]] --[[ Name: toggleSubMenu ]]
    if not v49._subMenuConfig[v50] then
        warn("Not a valid subMenuId:" .. v50);
        return;
    elseif v49._currentSubMenu:get() == v50 then
        v49._currentSubMenu:set(nil);
        return;
    else
        v49._currentSubMenu:set(v50);
        return;
    end;
end;
v28.currentSubMenu = function(v51) --[[ Line: 366 ]] --[[ Name: currentSubMenu ]]
    return v51._currentSubMenu;
end;
v28.inFocusNav = function(v52) --[[ Line: 370 ]] --[[ Name: inFocusNav ]]
    return v52._inFocusNav;
end;
v28.enableFocusNav = function(v53) --[[ Line: 374 ]] --[[ Name: enableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v21 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if not v53._inFocusNav:get() then
            v53._inFocusNav:set(true);
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v53:setShortcutBar(v21.UNIBAR_SHORTCUTBAR_ID);
        end;
        return;
    end;
end;
v28.disableFocusNav = function(v54) --[[ Line: 387 ]] --[[ Name: disableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if v54._inFocusNav:get() then
            v54._inFocusNav:set(false);
            v54._selectedItem:set(nil);
            v54._currentSubMenu:set(nil);
        end;
        return;
    end;
end;
v28.toggleWindow = function(v55, v56) --[[ Line: 399 ]] --[[ Name: toggleWindow ]]
    -- upvalues: v28 (copy), v14 (copy)
    if v55._integrations[v56].components.Window then
        if not v55._integrationsStatus[v56] or v55._integrationsStatus[v56] == v28.IntegrationStatus.None or v55._integrationsStatus[v56] == v28.IntegrationStatus.Icon then
            v55._integrationsStatus[v56] = v28.IntegrationStatus.Window;
        else
            v55._integrationsStatus[v56] = v28.IntegrationStatus.Icon;
        end;
        v55._onIntegrationStatusChanged:fire(v56, v55._integrationsStatus[v56]);
    end;
    if v14.isEnabled() and v55._integrations[v56] and v55._integrations[v56].persistWindowState then
        local v57 = v14.loadForLocalPlayer("ChromeWindowStatus") or {};
        v57[v56] = v55._integrationsStatus[v56] == v28.IntegrationStatus.Window;
        v14.storeForLocalPlayer("ChromeWindowStatus", v57);
    end;
    v55:updateMenuList();
end;
v28.isWindowOpen = function(v58, v59) --[[ Line: 425 ]] --[[ Name: isWindowOpen ]]
    -- upvalues: v28 (copy)
    return v58._integrations[v59].components.Window and v58._integrationsStatus[v59] == v28.IntegrationStatus.Window;
end;
v28.menuList = function(v60) --[[ Line: 429 ]] --[[ Name: menuList ]]
    return v60._menuList;
end;
v28.windowList = function(v61) --[[ Line: 433 ]] --[[ Name: windowList ]]
    return v61._windowList;
end;
v28.dragConnection = function(v62, v63) --[[ Line: 437 ]] --[[ Name: dragConnection ]]
    if v62._integrations[v63] then
        return v62._dragConnection[v63];
    else
        return nil;
    end;
end;
v28.updateLocalization = function(v64, v65) --[[ Line: 445 ]] --[[ Name: updateLocalization ]]
    local v66 = "";
    local v67 = "";
    v64._localizedLabelKeys[v65.id] = {};
    v64._localizedLabelKeys[v65.id].label = v65.label;
    v66 = v65.label;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 456 ]]
        -- upvalues: v66 (ref), v64 (copy)
        v66 = v64._localization:Format(v66);
    end);
    if not l_status_0 then
        v66 = v65.label;
        warn(l_result_0);
    end;
    v65.label = v66;
    if v65.secondaryAction then
        v64._localizedLabelKeys[v65.id].secondaryActionLabel = v65.secondaryAction.label;
        v67 = v65.secondaryAction.label;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 470 ]]
            -- upvalues: v67 (ref), v64 (copy)
            v67 = v64._localization:Format(v67);
        end);
        if not l_status_1 then
            v67 = v65.secondaryAction.label;
            warn(l_result_1);
        end;
        v65.secondaryAction.label = v67;
    end;
    return v65;
end;
v28.register = function(v72, v73) --[[ Line: 485 ]] --[[ Name: register ]]
    -- upvalues: v28 (copy), l_AvailabilitySignal_0 (copy), l_NotifySignal_0 (copy), v16 (copy), v21 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if v72._integrations[v73.id] then
        warn(string.format(v73.id .. "already registered", debug.traceback()));
        for _, v75 in v72._integrationsConnections[v73.id] do
            v75:disconnect();
        end;
    end;
    v72._integrationsConnections[v73.id] = {};
    local v76 = v72._integrationsConnections[v73.id];
    if v73.initialAvailability == nil then
        v73.initialAvailability = v28.AvailabilitySignal.Unavailable;
    end;
    if v73.availability == nil then
        v73.availability = l_AvailabilitySignal_0.new(v73.initialAvailability or v28.AvailabilitySignal.Unavailable);
    end;
    if v73.notification == nil then
        v73.notification = l_NotifySignal_0.new();
    end;
    if v73.components == nil then
        v73.components = {};
    end;
    if v73.availability then
        v76[#v76 + 1] = v73.availability:connect(function() --[[ Line: 514 ]]
            -- upvalues: v72 (copy), v73 (ref)
            v72:availabilityChanged(v73);
        end);
    end;
    if v73.notification and not v73.notification:excludeFromTotalCounts() then
        v76[#v76 + 1] = v73.notification:connect(function() --[[ Line: 520 ]]
            -- upvalues: v72 (copy)
            v72:updateNotificationTotals();
        end);
    end;
    if v73.windowSize == nil and v73.components and v73.components.Window then
        v73.windowSize = v16.new();
    end;
    if v28:getWindowStatusFromStore(v73.id) and v73.persistWindowState or v73.windowDefaultOpen then
        v72._integrationsStatus[v73.id] = v28.IntegrationStatus.Window;
        v72._onIntegrationStatusChanged:fire(v73.id, v72._integrationsStatus[v73.id]);
    end;
    local v77 = UDim2.fromOffset(v21.MENU_ICON_SCREEN_SIDE_OFFSET, v21.WINDOW_DEFAULT_PADDING);
    if v73.startingWindowPosition then
        v77 = if v73.persistWindowState then v72:getWindowPositionFromStore(v73.id) or v73.startingWindowPosition else v73.startingWindowPosition;
    end;
    v72._windowPositions[v73.id] = v77;
    v73 = v72:updateLocalization(v73);
    local l_v73_0 = v73;
    v72._integrations[v73.id] = l_v73_0;
    if l_FFlagEnableConsoleExpControls_0 and v73.selected then
        v76[#v76 + 1] = v72:selectedItem():connect(function(v79) --[[ Line: 554 ]]
            -- upvalues: l_v73_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v73 (ref)
            if l_v73_0.id == v79 then
                if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    v73.selected(l_v73_0);
                end;
            end;
        end);
    end;
    return l_v73_0;
end;
v28.createIconProps = function(v80, v81, v82) --[[ Line: 567 ]] --[[ Name: createIconProps ]]
    -- upvalues: v29 (copy)
    local v83 = v82 or 0;
    if v80._integrations[v81] then
        return {
            id = v81, 
            children = {}, 
            order = v83, 
            component = v80._integrations[v81].components.Icon, 
            integration = v80._integrations[v81], 
            isDivider = false, 
            activated = function() --[[ Line: 577 ]] --[[ Name: activated ]]
                -- upvalues: v80 (copy), v81 (copy)
                v80:activate(v81);
            end
        };
    else
        return {
            id = v81, 
            children = {}, 
            order = v83, 
            activated = noop, 
            integration = v29
        };
    end;
end;
reverseOrder = function(v84) --[[ Line: 592 ]] --[[ Name: reverseOrder ]]
    local v85 = #v84;
    local v86 = {};
    for v87 = 1, v85 do
        v86[v87] = v84[v87].order;
    end;
    for v88 = 1, v85 do
        v84[v88].order = v86[v85 - v88 + 1];
    end;
end;
v28.updateMenuList = function(v89) --[[ Line: 605 ]] --[[ Name: updateMenuList ]]
    -- upvalues: v29 (copy), v28 (copy), l_reverse_0 (copy)
    local v90 = 0;
    local v91 = 0;
    local function v93(v92) --[[ Line: 609 ]] --[[ Name: iconProps ]]
        -- upvalues: v91 (ref), v89 (copy)
        v91 = v91 + 1;
        return v89:createIconProps(v92, v91);
    end;
    local function v95(v94) --[[ Line: 614 ]] --[[ Name: windowProps ]]
        -- upvalues: v91 (ref), v89 (copy), v29 (ref)
        v91 = v91 + 1;
        if v89._integrations[v94] then
            return {
                id = v94, 
                children = {}, 
                order = v91, 
                component = v89._integrations[v94].components.Window, 
                activated = noop, 
                integration = v89._integrations[v94]
            };
        else
            return {
                id = v94, 
                children = {}, 
                order = v91, 
                activated = noop, 
                integration = v29
            };
        end;
    end;
    local function v97(_) --[[ Line: 636 ]] --[[ Name: divider ]]
        -- upvalues: v90 (ref), v91 (ref), v29 (ref)
        v90 = v90 + 1;
        v91 = v91 + 1;
        return {
            id = "DIV" .. v90, 
            order = v91, 
            isDivider = true, 
            children = {}, 
            activated = noop, 
            integration = v29
        };
    end;
    local function _(v98) --[[ Line: 649 ]] --[[ Name: valid ]]
        -- upvalues: v89 (copy), v28 (ref)
        local v99 = v89._integrations[v98];
        if v99 then
            local l_availability_0 = v99.availability;
            return l_availability_0 and l_availability_0:get() ~= v28.AvailabilitySignal.Unavailable;
        else
            return false;
        end;
    end;
    local function v102(v103, v104, v105) --[[ Line: 660 ]] --[[ Name: collectMenu ]]
        -- upvalues: v97 (copy), v90 (ref), v102 (copy), v89 (copy), v28 (ref), v91 (ref), v95 (copy), v93 (copy)
        local v106 = 0;
        for v107, v108 in pairs(v103) do
            if type(v108) == "table" then
                if not #v104.children then
                    table.insert(v104.children, (v97(v90)));
                end;
                if v102(v108, v104, v105) > 0 then
                    table.insert(v104.children, (v97(v90)));
                end;
            else
                if typeof(v108) ~= "string" then
                    error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v108, v107)));
                end;
                if v89._subMenuConfig[v108] then
                    local v109 = v89._integrations[v108];
                    local v110;
                    if v109 then
                        local l_availability_1 = v109.availability;
                        v110 = l_availability_1 and l_availability_1:get() ~= v28.AvailabilitySignal.Unavailable;
                    else
                        v110 = false;
                    end;
                    if v110 then
                        v91 = v91 + 1;
                        v110 = v89:createIconProps(v108, v91);
                        v106 = v106 + 1;
                        v102(v89._subMenuConfig[v108], v110, v105);
                        if #v110.children > 0 then
                            table.insert(v104.children, v110);
                        end;
                    end;
                else
                    local v112 = v89._integrations[v108];
                    local v113;
                    if v112 then
                        local l_availability_2 = v112.availability;
                        v113 = l_availability_2 and l_availability_2:get() ~= v28.AvailabilitySignal.Unavailable;
                    else
                        v113 = false;
                    end;
                    if v113 then
                        if v89:isWindowOpen(v108) then
                            table.insert(v105, (v95(v108)));
                            table.insert(v104.children, v93(v108));
                            v106 = v106 + 1;
                        else
                            table.insert(v104.children, v93(v108));
                            v106 = v106 + 1;
                        end;
                    end;
                end;
            end;
        end;
        return v106;
    end;
    local v115 = {
        children = {}
    };
    local v116 = {};
    v102(v89._menuConfig, v115, v116);
    if #v115.children and v115.children[#v115.children] and v115.children[#v115.children].isDivider then
        table.remove(v115.children, #v115.children);
    end;
    if v89._orderAlignment:get() == Enum.HorizontalAlignment.Left then
        v115.children = l_reverse_0(v115.children);
        reverseOrder(v115.children);
    end;
    v89._menuList:set(v115.children);
    v89._windowList:set(v116);
    v89:repairSelected();
end;
v28.availabilityChanged = function(v117, _) --[[ Line: 730 ]] --[[ Name: availabilityChanged ]]
    v117:updateNotificationTotals();
    v117:updateMenuList();
end;
v28.subMenuNotifications = function(v119, v120) --[[ Line: 735 ]] --[[ Name: subMenuNotifications ]]
    -- upvalues: l_NotifySignal_0 (copy)
    if not v119._subMenuNotifications[v120] then
        v119._subMenuNotifications[v120] = l_NotifySignal_0.new(true);
    end;
    return v119._subMenuNotifications[v120];
end;
v28.totalNotifications = function(v121) --[[ Line: 742 ]] --[[ Name: totalNotifications ]]
    return v121._totalNotifications;
end;
v28.onIntegrationRegistered = function(v122) --[[ Line: 746 ]] --[[ Name: onIntegrationRegistered ]]
    return v122._onIntegrationRegistered;
end;
v28.onIntegrationActivated = function(v123) --[[ Line: 750 ]] --[[ Name: onIntegrationActivated ]]
    return v123._onIntegrationActivated;
end;
v28.onIntegrationHovered = function(v124) --[[ Line: 754 ]] --[[ Name: onIntegrationHovered ]]
    return v124._onIntegrationHovered;
end;
v28.onIntegrationStatusChanged = function(v125) --[[ Line: 758 ]] --[[ Name: onIntegrationStatusChanged ]]
    return v125._onIntegrationStatusChanged;
end;
v28.integrations = function(v126) --[[ Line: 762 ]] --[[ Name: integrations ]]
    return v126._integrations;
end;
v28.updateNotificationTotals = function(v127) --[[ Line: 766 ]] --[[ Name: updateNotificationTotals ]]
    -- upvalues: v28 (copy)
    local v128 = 0;
    for _, v130 in v127._integrations do
        if v130.availability:get() ~= v28.AvailabilitySignal.Unavailable and v130.availability:get() ~= v28.AvailabilitySignal.Pinned and not v130.notification:excludeFromTotalCounts() then
            local v131 = v130.notification:get();
            if v131 and v131.type == "count" then
                assert(typeof(v131.value) == "number", "Expected count value to be number");
                v128 = v128 + v131.value;
            end;
        end;
    end;
    v127._totalNotifications:fireCount(v128);
    for v132, v133 in v127._subMenuNotifications do
        local v134 = v127:withinCurrentTopLevelMenu(v132);
        v128 = 0;
        if v134 then
            for _, v136 in v134.children do
                if not v127:withinCurrentTopLevelMenu(v136.id) and v136.integration.availability:get() ~= v28.AvailabilitySignal.Unavailable and not v136.integration.notification:excludeFromTotalCounts() then
                    local v137 = v136.integration.notification:get();
                    if v137 and v137.type == "count" then
                        assert(typeof(v137.value) == "number", "Expected count value to be number");
                        v128 = v128 + v137.value;
                    end;
                end;
            end;
            v133:fireCount(v128);
        end;
    end;
end;
v28.configureReset = function(v138) --[[ Line: 810 ]] --[[ Name: configureReset ]]
    v138._menuConfig = {};
    v138._subMenuConfig = {};
    v138._subMenuNotifications = {};
    v138:updateMenuList();
end;
v28.configureMenu = function(v139, v140) --[[ Line: 817 ]] --[[ Name: configureMenu ]]
    v139._menuConfig = v140;
    v139:updateNotificationTotals();
    v139:updateMenuList();
end;
v28.configureSubMenu = function(v141, v142, v143) --[[ Line: 823 ]] --[[ Name: configureSubMenu ]]
    -- upvalues: l_NotifySignal_0 (copy)
    v141._subMenuConfig[v142] = v143;
    if not v141._subMenuNotifications[v142] then
        v141._subMenuNotifications[v142] = l_NotifySignal_0.new(true);
    end;
    v141:updateNotificationTotals();
    v141:updateMenuList();
end;
if l_FFlagEnableConsoleExpControls_0 then
    v28.registerShortcut = function(v144, v145) --[[ Line: 833 ]] --[[ Name: registerShortcut ]]
        -- upvalues: v28 (copy)
        v144._shortcutService:registerShortcut(v145);
        local v146 = v144._shortcutService:getShortcut(v145.id);
        if v146.integration and v144._integrations[v146.integration] then
            local v147 = v144._integrations[v146.integration];
            if v147.availability:get() == v28.AvailabilitySignal.Unavailable then
                v146.availability:unavailable();
            end;
            v147.availability:connect(function() --[[ Line: 841 ]]
                -- upvalues: v147 (copy), v28 (ref), v146 (copy)
                local v148 = v147.availability:get();
                if v148 == v28.AvailabilitySignal.Unavailable then
                    v146.availability:unavailable();
                    return;
                else
                    if v148 == v28.AvailabilitySignal.Available or v148 == v28.AvailabilitySignal.Pinned then
                        v146.availability:available();
                    end;
                    return;
                end;
            end);
        end;
    end;
    v28.activateShortcut = function(v149, v150) --[[ Line: 855 ]] --[[ Name: activateShortcut ]]
        -- upvalues: v25 (copy)
        local v151 = v149._shortcutService:getShortcut(v150);
        if v151.integration then
            if v151.activated then
                if v25 then
                    v149._shortcutService:activateShortcut(v150);
                    v149._onIntegrationActivated:fire(v151.integration, {
                        fromShortcut = true
                    });
                    return;
                end;
            elseif v25 then
                v149:activate(v151.integration, {
                    fromShortcut = true
                });
                return;
            else
                v149:activate(v151.integration);
                return;
            end;
        else
            v149._shortcutService:activateShortcut(v150);
        end;
    end;
    v28.configureShortcutBar = function(v152, v153, v154) --[[ Line: 875 ]] --[[ Name: configureShortcutBar ]]
        v152._shortcutService:configureShortcutBar(v153, v154);
    end;
    v28.setShortcutBar = function(v155, v156) --[[ Line: 879 ]] --[[ Name: setShortcutBar ]]
        v155._shortcutService:setShortcutBar(v156);
    end;
    v28.getCurrentShortcutBar = function(v157) --[[ Line: 883 ]] --[[ Name: getCurrentShortcutBar ]]
        return v157._currentShortcutBar;
    end;
    v28.getShortcutsFromBar = function(v158, v159) --[[ Line: 887 ]] --[[ Name: getShortcutsFromBar ]]
        return v158._shortcutService:getShortcutsFromBar(v159, v158._integrations);
    end;
    v28.getCurrentShortcuts = function(v160) --[[ Line: 891 ]] --[[ Name: getCurrentShortcuts ]]
        return v160:getShortcutsFromBar(v160._currentShortcutBar:get());
    end;
    v28.onShortcutBarChanged = function(v161) --[[ Line: 895 ]] --[[ Name: onShortcutBarChanged ]]
        return v161._shortcutService.onShortcutBarChanged;
    end;
    v28.selectMenuIcon = function(v162) --[[ Line: 899 ]] --[[ Name: selectMenuIcon ]]
        v162._triggerMenuIcon:fire();
    end;
    v28.onTriggerMenuIcon = function(v163) --[[ Line: 903 ]] --[[ Name: onTriggerMenuIcon ]]
        return v163._triggerMenuIcon;
    end;
    v28.setHideShortcutBar = function(v164, v165, v166) --[[ Line: 907 ]] --[[ Name: setHideShortcutBar ]]
        v164._shortcutService:setHideShortcutBar(v165, v166);
    end;
    v28.getHideShortcutBar = function(v167) --[[ Line: 911 ]] --[[ Name: getHideShortcutBar ]]
        return v167._shortcutService:getHideShortcutBar();
    end;
end;
if l_isInExperienceUIVREnabled_0 then
    v28.onTriggerVRToggleButton = function(v168) --[[ Line: 917 ]] --[[ Name: onTriggerVRToggleButton ]]
        return v168._triggerVRToggleButton;
    end;
    v28.showTopBar = function(v169) --[[ Line: 921 ]] --[[ Name: showTopBar ]]
        return v169._topBarVisibility:get();
    end;
    v28.getTopBarVisibiity = function(v170) --[[ Line: 925 ]] --[[ Name: getTopBarVisibiity ]]
        return v170._topBarVisibility;
    end;
    v28.connectTopBarVisibility = function(v171, v172) --[[ Line: 929 ]] --[[ Name: connectTopBarVisibility ]]
        v171._topBarVisibility = v172;
    end;
end;
v28.gesture = function(v173, v174, v175, v176) --[[ Line: 934 ]] --[[ Name: gesture ]]
    if v173._integrations[v174] then
        v173._dragConnection[v174] = {
            connection = v175, 
            inputObject = v176
        };
    end;
end;
v28.withinCurrentTopLevelMenu = function(v177, v178) --[[ Line: 947 ]] --[[ Name: withinCurrentTopLevelMenu ]]
    for v179, v180 in (v177._menuList:get()) do
        if v180.id == v178 then
            return v180, v179;
        end;
    end;
    return nil, 0;
end;
v28.withinCurrentSubmenu = function(v181, v182) --[[ Line: 957 ]] --[[ Name: withinCurrentSubmenu ]]
    local v183 = v181._currentSubMenu:get();
    if not v183 then
        return false;
    else
        local v184 = v181._menuList:get();
        local v185 = nil;
        for _, v187 in v184 do
            if v187.id == v183 then
                v185 = v187.children;
                break;
            end;
        end;
        if not v185 then
            return false;
        else
            for _, v189 in v185 do
                if v189.id == v182 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v28.windowPosition = function(v190, v191) --[[ Line: 986 ]] --[[ Name: windowPosition ]]
    return v190._windowPositions[v191];
end;
v28.updateWindowPosition = function(v192, v193, v194) --[[ Line: 990 ]] --[[ Name: updateWindowPosition ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() and v192._integrations[v193] and v192._integrations[v193].persistWindowState then
        local v195 = v14.loadForLocalPlayer("ChromeWindowPosition") or {};
        v195[v193] = {
            v194.X.Scale, 
            v194.X.Offset, 
            v194.Y.Scale, 
            v194.Y.Offset
        };
        v14.storeForLocalPlayer("ChromeWindowPosition", v195);
    end;
    v192._windowPositions[v193] = v194;
end;
v28.getWindowStatusFromStore = function(_, v197) --[[ Line: 1003 ]] --[[ Name: getWindowStatusFromStore ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        return (v14.loadForLocalPlayer("ChromeWindowStatus") or {})[v197] or false;
    else
        return nil;
    end;
end;
v28.getWindowPositionFromStore = function(_, v199) --[[ Line: 1013 ]] --[[ Name: getWindowPositionFromStore ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        local v200 = (v14.loadForLocalPlayer("ChromeWindowPosition") or {})[v199] or nil;
        if v200 then
            return (UDim2.new(v200[1], v200[2], v200[3], v200[4]));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v28.activate = function(v201, v202, v203) --[[ Line: 1024 ]] --[[ Name: activate ]]
    -- upvalues: v25 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    local v204 = nil;
    if v201._integrations[v202] then
        local l_activated_0 = v201._integrations[v202].activated;
        if v25 then
            v201._onIntegrationActivated:fire(v202, v203);
        else
            v201._onIntegrationActivated:fire(v202);
        end;
        v201:storeChromeInteracted();
        if l_activated_0 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1040 ]]
                -- upvalues: l_activated_0 (copy), v201 (copy), v202 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
                l_activated_0(v201._integrations[v202]);
                if not l_FFlagEnableConsoleExpControls_0 then
                    v201:disableFocusNav();
                end;
            end);
            if not l_status_2 then
                warn("ChromeService: activate error thrown for " .. v202);
                v204 = l_result_2;
            end;
        else
            if v201._subMenuConfig[v202] then
                v201:toggleSubMenu(v202);
            end;
            v201:toggleWindow(v202);
        end;
        if v201._currentSubMenu:get() ~= v202 then
            v201._currentSubMenu:set(nil);
        end;
    end;
    if v204 then
        error(v204);
    end;
end;
v28.selectedItem = function(v208) --[[ Line: 1068 ]] --[[ Name: selectedItem ]]
    return v208._selectedItem;
end;
v28.setSelected = function(v209, v210) --[[ Line: 1072 ]] --[[ Name: setSelected ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v211, v212 = v209:withinCurrentTopLevelMenu(v210 or "");
    if not v211 then
        return;
    else
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v214 = true;
        if l_l_UserInputService_0_LastInputType_0 ~= Enum.UserInputType.MouseButton1 then
            v214 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Touch;
        end;
        local v215 = v209._currentSubMenu:get();
        if v215 and v215 ~= v210 and not v214 then
            v209:toggleSubMenu(v215);
        end;
        v209._selectedItemIdx = v212;
        v209._selectedItem:set(v210);
        return;
    end;
end;
v28.setSelectedByOffset = function(v216, v217) --[[ Line: 1090 ]] --[[ Name: setSelectedByOffset ]]
    local v218 = v216._menuList:get();
    local _, v220 = v216:withinCurrentTopLevelMenu(v216._selectedItem:get() or "");
    if v220 > 0 then
        v216:setSelected(v218[math.clamp(v220 + v217, 1, #v218)].id);
    end;
end;
v28.repairSelected = function(v221) --[[ Line: 1100 ]] --[[ Name: repairSelected ]]
    if v221._selectedItem:get() then
        local _, v223 = v221:withinCurrentTopLevelMenu(v221._selectedItem:get() or "");
        if v223 == 0 then
            v223 = v221._selectedItemIdx;
        end;
        local v224 = v221._menuList:get();
        v221:setSelected(v224[math.clamp(v223, 1, #v224)].id);
    end;
end;
v28.configureOrderAlignment = function(v225, v226) --[[ Line: 1114 ]] --[[ Name: configureOrderAlignment ]]
    if v225._orderAlignment:get() ~= v226 then
        v225._orderAlignment:set(v226);
        v225:updateMenuList();
    end;
end;
v28.orderAlignment = function(v227) --[[ Line: 1121 ]] --[[ Name: orderAlignment ]]
    return v227._orderAlignment;
end;
v28.setMenuAbsolutePosition = function(v228, v229) --[[ Line: 1125 ]] --[[ Name: setMenuAbsolutePosition ]]
    if v229 ~= v228._menuAbsolutePosition then
        v228._menuAbsolutePosition = v229;
        v228._layout:set(createUnibarLayoutInfo(v229, v228._menuAbsoluteSizeOpen));
    end;
end;
v28.setMenuAbsoluteSize = function(v230, v231) --[[ Line: 1132 ]] --[[ Name: setMenuAbsoluteSize ]]
    if v231 ~= v230._menuAbsoluteSizeOpen then
        v230._menuAbsoluteSizeOpen = v231;
        v230._layout:set(createUnibarLayoutInfo(v230._menuAbsolutePosition, v231));
    end;
end;
v28.layout = function(v232) --[[ Line: 1139 ]] --[[ Name: layout ]]
    return v232._layout;
end;
return v28;