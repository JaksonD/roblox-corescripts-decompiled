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
if l_FFlagEnableSideSheet_0 then
    v23 = require(l_CorePackages_0.Workspace.Packages.InExperienceSideSheet).openSideSheet;
end;
local v30 = {};
v30.__index = v30;
v30.AvailabilitySignal = v13.AvailabilitySignalState;
v30.IntegrationStatus = {
    None = 0, 
    Icon = 1, 
    Window = 2
};
noop = function() --[[ Line: 75 ]] --[[ Name: noop ]]

end;
local v31 = {
    id = "div", 
    label = "div", 
    initialAvailability = v30.AvailabilitySignal.Unavailable, 
    availability = l_AvailabilitySignal_0.new(v30.AvailabilitySignal.Unavailable), 
    notification = l_NotifySignal_0.new(), 
    components = {}, 
    hideNotificationCountWhileOpen = false
};
createUnibarLayoutInfo = function(v32, v33) --[[ Line: 219 ]] --[[ Name: createUnibarLayoutInfo ]]
    return Rect.new(v32, v32 + v33);
end;
v30.new = function() --[[ Line: 223 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v22 (copy), v13 (copy), l_ObservableValue_0 (copy), l_NotifySignal_0 (copy), l_Localization_0 (copy), l_Signal_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v30 (copy), v15 (copy), v27 (copy), l_FocusOnChromeSignal_0 (copy), l_FocusOffChromeSignal_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v35 = {
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
    local v36 = setmetatable(v35, v30);
    v15.viewport:connect(function(v37) --[[ Line: 266 ]]
        -- upvalues: v27 (ref), v36 (copy)
        if v27 then
            v36:updateWindowSizeSignals();
            return;
        else
            v36:updateScreenSize(v37.size, v37.isMobileDevice, v37.portraitOrientation, v37.tinyPortrait);
            return;
        end;
    end, true);
    if l_FFlagEnableConsoleExpControls_0 then
        v35._shortcutService.onShortcutBarChanged:connect(function(v38) --[[ Line: 280 ]]
            -- upvalues: v36 (copy)
            v36._currentShortcutBar:set(v38);
        end);
    end;
    l_FocusOnChromeSignal_0:connect(function(v39) --[[ Line: 284 ]]
        -- upvalues: v35 (copy), v36 (copy)
        if v39 and not v35._subMenuConfig.nine_dot[v39] then
            v36:setSelected(v39);
        end;
        v36:enableFocusNav();
    end);
    l_FocusOffChromeSignal_0:connect(function() --[[ Line: 291 ]]
        -- upvalues: v36 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
        v36:disableFocusNav();
        if l_FFlagEnableConsoleExpControls_0 then
            v36:setShortcutBar(nil);
        end;
    end);
    return v36;
end;
v30.storeChromeInteracted = function(_) --[[ Line: 303 ]] --[[ Name: storeChromeInteracted ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        v14.storeForLocalPlayer("ChromeInteracted3", true);
    end;
end;
v30.updateScreenSize = function(v41, _, v43, v44, v45) --[[ Line: 309 ]] --[[ Name: updateScreenSize ]]
    -- upvalues: v21 (copy)
    local v46 = 0;
    v46 = if v43 then if v45 then v21.MOBILE_TINY_PORTRAIT_SLOTS - v21.CORE_SLOTS else if v44 then v21.MOBILE_PORTRAIT_SLOTS - v21.CORE_SLOTS else v21.MOBILE_LANDSCAPE_SLOTS - v21.CORE_SLOTS else v21.NON_MOBILE_SLOTS - v21.CORE_SLOTS;
    if v46 ~= v41._mostRecentlyUsedAndPinnedLimit then
        v41._mostRecentlyUsedAndPinnedLimit = v46;
        v41:updateMenuList();
        v41:updateNotificationTotals();
    end;
    v41:updateWindowSizeSignals();
end;
v30.updateWindowSizeSignals = function(v47) --[[ Line: 345 ]] --[[ Name: updateWindowSizeSignals ]]
    for _, v49 in v47._integrations do
        if v49.windowSize then
            v49.windowSize:updateConstraints();
        end;
    end;
end;
v30.notificationIndicator = function(v50) --[[ Line: 353 ]] --[[ Name: notificationIndicator ]]
    return v50._notificationIndicator;
end;
v30.toggleSubMenu = function(v51, v52) --[[ Line: 357 ]] --[[ Name: toggleSubMenu ]]
    -- upvalues: l_FFlagEnableSideSheet_0 (copy), v23 (ref)
    if l_FFlagEnableSideSheet_0 then
        v23();
        return;
    elseif not v51._subMenuConfig[v52] then
        warn("Not a valid subMenuId:" .. v52);
        return;
    elseif v51._currentSubMenu:get() == v52 then
        v51._currentSubMenu:set(nil);
        return;
    else
        v51._currentSubMenu:set(v52);
        return;
    end;
end;
v30.currentSubMenu = function(v53) --[[ Line: 377 ]] --[[ Name: currentSubMenu ]]
    return v53._currentSubMenu;
end;
v30.inFocusNav = function(v54) --[[ Line: 381 ]] --[[ Name: inFocusNav ]]
    return v54._inFocusNav;
end;
v30.enableFocusNav = function(v55) --[[ Line: 385 ]] --[[ Name: enableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v21 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if not v55._inFocusNav:get() then
            v55._inFocusNav:set(true);
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v55:setShortcutBar(v21.UNIBAR_SHORTCUTBAR_ID);
        end;
        return;
    end;
end;
v30.disableFocusNav = function(v56) --[[ Line: 398 ]] --[[ Name: disableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if v56._inFocusNav:get() then
            v56._inFocusNav:set(false);
            v56._selectedItem:set(nil);
            v56._currentSubMenu:set(nil);
        end;
        return;
    end;
end;
v30.toggleWindow = function(v57, v58) --[[ Line: 410 ]] --[[ Name: toggleWindow ]]
    -- upvalues: v30 (copy), v14 (copy)
    if v57._integrations[v58].components.Window then
        if not v57._integrationsStatus[v58] or v57._integrationsStatus[v58] == v30.IntegrationStatus.None or v57._integrationsStatus[v58] == v30.IntegrationStatus.Icon then
            v57._integrationsStatus[v58] = v30.IntegrationStatus.Window;
        else
            v57._integrationsStatus[v58] = v30.IntegrationStatus.Icon;
        end;
        v57._onIntegrationStatusChanged:fire(v58, v57._integrationsStatus[v58]);
    end;
    if v14.isEnabled() and v57._integrations[v58] and v57._integrations[v58].persistWindowState then
        local v59 = v14.loadForLocalPlayer("ChromeWindowStatus") or {};
        v59[v58] = v57._integrationsStatus[v58] == v30.IntegrationStatus.Window;
        v14.storeForLocalPlayer("ChromeWindowStatus", v59);
    end;
    v57:updateMenuList();
end;
v30.isWindowOpen = function(v60, v61) --[[ Line: 436 ]] --[[ Name: isWindowOpen ]]
    -- upvalues: v30 (copy)
    return v60._integrations[v61].components.Window and v60._integrationsStatus[v61] == v30.IntegrationStatus.Window;
end;
v30.menuList = function(v62) --[[ Line: 440 ]] --[[ Name: menuList ]]
    return v62._menuList;
end;
v30.windowList = function(v63) --[[ Line: 444 ]] --[[ Name: windowList ]]
    return v63._windowList;
end;
v30.dragConnection = function(v64, v65) --[[ Line: 448 ]] --[[ Name: dragConnection ]]
    if v64._integrations[v65] then
        return v64._dragConnection[v65];
    else
        return nil;
    end;
end;
v30.updateLocalization = function(v66, v67) --[[ Line: 456 ]] --[[ Name: updateLocalization ]]
    local v68 = "";
    local v69 = "";
    v66._localizedLabelKeys[v67.id] = {};
    v66._localizedLabelKeys[v67.id].label = v67.label;
    v68 = v67.label;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 467 ]]
        -- upvalues: v68 (ref), v66 (copy)
        v68 = v66._localization:Format(v68);
    end);
    if not l_status_0 then
        v68 = v67.label;
        warn(l_result_0);
    end;
    v67.label = v68;
    if v67.secondaryAction then
        v66._localizedLabelKeys[v67.id].secondaryActionLabel = v67.secondaryAction.label;
        v69 = v67.secondaryAction.label;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 481 ]]
            -- upvalues: v69 (ref), v66 (copy)
            v69 = v66._localization:Format(v69);
        end);
        if not l_status_1 then
            v69 = v67.secondaryAction.label;
            warn(l_result_1);
        end;
        v67.secondaryAction.label = v69;
    end;
    return v67;
end;
v30.register = function(v74, v75) --[[ Line: 496 ]] --[[ Name: register ]]
    -- upvalues: v30 (copy), l_AvailabilitySignal_0 (copy), l_NotifySignal_0 (copy), v16 (copy), v21 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if v74._integrations[v75.id] then
        warn(string.format(v75.id .. "already registered", debug.traceback()));
        for _, v77 in v74._integrationsConnections[v75.id] do
            v77:disconnect();
        end;
    end;
    v74._integrationsConnections[v75.id] = {};
    local v78 = v74._integrationsConnections[v75.id];
    if v75.initialAvailability == nil then
        v75.initialAvailability = v30.AvailabilitySignal.Unavailable;
    end;
    if v75.availability == nil then
        v75.availability = l_AvailabilitySignal_0.new(v75.initialAvailability or v30.AvailabilitySignal.Unavailable);
    end;
    if v75.notification == nil then
        v75.notification = l_NotifySignal_0.new();
    end;
    if v75.components == nil then
        v75.components = {};
    end;
    if v75.availability then
        v78[#v78 + 1] = v75.availability:connect(function() --[[ Line: 525 ]]
            -- upvalues: v74 (copy), v75 (ref)
            v74:availabilityChanged(v75);
        end);
    end;
    if v75.notification and not v75.notification:excludeFromTotalCounts() then
        v78[#v78 + 1] = v75.notification:connect(function() --[[ Line: 531 ]]
            -- upvalues: v74 (copy)
            v74:updateNotificationTotals();
        end);
    end;
    if v75.windowSize == nil and v75.components and v75.components.Window then
        v75.windowSize = v16.new();
    end;
    if v30:getWindowStatusFromStore(v75.id) and v75.persistWindowState or v75.windowDefaultOpen then
        v74._integrationsStatus[v75.id] = v30.IntegrationStatus.Window;
        v74._onIntegrationStatusChanged:fire(v75.id, v74._integrationsStatus[v75.id]);
    end;
    local v79 = UDim2.fromOffset(v21.MENU_ICON_SCREEN_SIDE_OFFSET, v21.WINDOW_DEFAULT_PADDING);
    if v75.startingWindowPosition then
        v79 = if v75.persistWindowState then v74:getWindowPositionFromStore(v75.id) or v75.startingWindowPosition else v75.startingWindowPosition;
    end;
    v74._windowPositions[v75.id] = v79;
    v75 = v74:updateLocalization(v75);
    local l_v75_0 = v75;
    v74._integrations[v75.id] = l_v75_0;
    if l_FFlagEnableConsoleExpControls_0 and v75.selected then
        v78[#v78 + 1] = v74:selectedItem():connect(function(v81) --[[ Line: 565 ]]
            -- upvalues: l_v75_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v75 (ref)
            if l_v75_0.id == v81 then
                if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    v75.selected(l_v75_0);
                end;
            end;
        end);
    end;
    return l_v75_0;
end;
v30.createIconProps = function(v82, v83, v84) --[[ Line: 578 ]] --[[ Name: createIconProps ]]
    -- upvalues: v31 (copy)
    local v85 = v84 or 0;
    if v82._integrations[v83] then
        return {
            id = v83, 
            children = {}, 
            order = v85, 
            component = v82._integrations[v83].components.Icon, 
            integration = v82._integrations[v83], 
            isDivider = false, 
            activated = function() --[[ Line: 588 ]] --[[ Name: activated ]]
                -- upvalues: v82 (copy), v83 (copy)
                v82:activate(v83);
            end
        };
    else
        return {
            id = v83, 
            children = {}, 
            order = v85, 
            activated = noop, 
            integration = v31
        };
    end;
end;
reverseOrder = function(v86) --[[ Line: 603 ]] --[[ Name: reverseOrder ]]
    local v87 = #v86;
    local v88 = {};
    for v89 = 1, v87 do
        v88[v89] = v86[v89].order;
    end;
    for v90 = 1, v87 do
        v86[v90].order = v88[v87 - v90 + 1];
    end;
end;
v30.updateMenuList = function(v91) --[[ Line: 616 ]] --[[ Name: updateMenuList ]]
    -- upvalues: v31 (copy), v30 (copy), l_reverse_0 (copy)
    local v92 = 0;
    local v93 = 0;
    local function v95(v94) --[[ Line: 620 ]] --[[ Name: iconProps ]]
        -- upvalues: v93 (ref), v91 (copy)
        v93 = v93 + 1;
        return v91:createIconProps(v94, v93);
    end;
    local function v97(v96) --[[ Line: 625 ]] --[[ Name: windowProps ]]
        -- upvalues: v93 (ref), v91 (copy), v31 (ref)
        v93 = v93 + 1;
        if v91._integrations[v96] then
            return {
                id = v96, 
                children = {}, 
                order = v93, 
                component = v91._integrations[v96].components.Window, 
                activated = noop, 
                integration = v91._integrations[v96]
            };
        else
            return {
                id = v96, 
                children = {}, 
                order = v93, 
                activated = noop, 
                integration = v31
            };
        end;
    end;
    local function v99(_) --[[ Line: 647 ]] --[[ Name: divider ]]
        -- upvalues: v92 (ref), v93 (ref), v31 (ref)
        v92 = v92 + 1;
        v93 = v93 + 1;
        return {
            id = "DIV" .. v92, 
            order = v93, 
            isDivider = true, 
            children = {}, 
            activated = noop, 
            integration = v31
        };
    end;
    local function _(v100) --[[ Line: 660 ]] --[[ Name: valid ]]
        -- upvalues: v91 (copy), v30 (ref)
        local v101 = v91._integrations[v100];
        if v101 then
            local l_availability_0 = v101.availability;
            return l_availability_0 and l_availability_0:get() ~= v30.AvailabilitySignal.Unavailable;
        else
            return false;
        end;
    end;
    local function v104(v105, v106, v107) --[[ Line: 671 ]] --[[ Name: collectMenu ]]
        -- upvalues: v99 (copy), v92 (ref), v104 (copy), v91 (copy), v30 (ref), v93 (ref), v97 (copy), v95 (copy)
        local v108 = 0;
        for v109, v110 in pairs(v105) do
            if type(v110) == "table" then
                if not #v106.children then
                    table.insert(v106.children, (v99(v92)));
                end;
                if v104(v110, v106, v107) > 0 then
                    table.insert(v106.children, (v99(v92)));
                end;
            else
                if typeof(v110) ~= "string" then
                    error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v110, v109)));
                end;
                if v91._subMenuConfig[v110] then
                    local v111 = v91._integrations[v110];
                    local v112;
                    if v111 then
                        local l_availability_1 = v111.availability;
                        v112 = l_availability_1 and l_availability_1:get() ~= v30.AvailabilitySignal.Unavailable;
                    else
                        v112 = false;
                    end;
                    if v112 then
                        v93 = v93 + 1;
                        v112 = v91:createIconProps(v110, v93);
                        v108 = v108 + 1;
                        v104(v91._subMenuConfig[v110], v112, v107);
                        if #v112.children > 0 then
                            table.insert(v106.children, v112);
                        end;
                    end;
                else
                    local v114 = v91._integrations[v110];
                    local v115;
                    if v114 then
                        local l_availability_2 = v114.availability;
                        v115 = l_availability_2 and l_availability_2:get() ~= v30.AvailabilitySignal.Unavailable;
                    else
                        v115 = false;
                    end;
                    if v115 then
                        if v91:isWindowOpen(v110) then
                            table.insert(v107, (v97(v110)));
                            table.insert(v106.children, v95(v110));
                            v108 = v108 + 1;
                        else
                            table.insert(v106.children, v95(v110));
                            v108 = v108 + 1;
                        end;
                    end;
                end;
            end;
        end;
        return v108;
    end;
    local v117 = {
        children = {}
    };
    local v118 = {};
    v104(v91._menuConfig, v117, v118);
    if #v117.children and v117.children[#v117.children] and v117.children[#v117.children].isDivider then
        table.remove(v117.children, #v117.children);
    end;
    if v91._orderAlignment:get() == Enum.HorizontalAlignment.Left then
        v117.children = l_reverse_0(v117.children);
        reverseOrder(v117.children);
    end;
    v91._menuList:set(v117.children);
    v91._windowList:set(v118);
    v91:repairSelected();
end;
v30.availabilityChanged = function(v119, _) --[[ Line: 741 ]] --[[ Name: availabilityChanged ]]
    v119:updateNotificationTotals();
    v119:updateMenuList();
end;
v30.subMenuNotifications = function(v121, v122) --[[ Line: 746 ]] --[[ Name: subMenuNotifications ]]
    -- upvalues: l_NotifySignal_0 (copy)
    if not v121._subMenuNotifications[v122] then
        v121._subMenuNotifications[v122] = l_NotifySignal_0.new(true);
    end;
    return v121._subMenuNotifications[v122];
end;
v30.totalNotifications = function(v123) --[[ Line: 753 ]] --[[ Name: totalNotifications ]]
    return v123._totalNotifications;
end;
v30.onIntegrationRegistered = function(v124) --[[ Line: 757 ]] --[[ Name: onIntegrationRegistered ]]
    return v124._onIntegrationRegistered;
end;
v30.onIntegrationActivated = function(v125) --[[ Line: 761 ]] --[[ Name: onIntegrationActivated ]]
    return v125._onIntegrationActivated;
end;
v30.onIntegrationHovered = function(v126) --[[ Line: 765 ]] --[[ Name: onIntegrationHovered ]]
    return v126._onIntegrationHovered;
end;
v30.onIntegrationStatusChanged = function(v127) --[[ Line: 769 ]] --[[ Name: onIntegrationStatusChanged ]]
    return v127._onIntegrationStatusChanged;
end;
v30.integrations = function(v128) --[[ Line: 773 ]] --[[ Name: integrations ]]
    return v128._integrations;
end;
v30.updateNotificationTotals = function(v129) --[[ Line: 777 ]] --[[ Name: updateNotificationTotals ]]
    -- upvalues: v30 (copy)
    local v130 = 0;
    for _, v132 in v129._integrations do
        if v132.availability:get() ~= v30.AvailabilitySignal.Unavailable and v132.availability:get() ~= v30.AvailabilitySignal.Pinned and not v132.notification:excludeFromTotalCounts() then
            local v133 = v132.notification:get();
            if v133 and v133.type == "count" then
                assert(typeof(v133.value) == "number", "Expected count value to be number");
                v130 = v130 + v133.value;
            end;
        end;
    end;
    v129._totalNotifications:fireCount(v130);
    for v134, v135 in v129._subMenuNotifications do
        local v136 = v129:withinCurrentTopLevelMenu(v134);
        v130 = 0;
        if v136 then
            for _, v138 in v136.children do
                if not v129:withinCurrentTopLevelMenu(v138.id) and v138.integration.availability:get() ~= v30.AvailabilitySignal.Unavailable and not v138.integration.notification:excludeFromTotalCounts() then
                    local v139 = v138.integration.notification:get();
                    if v139 and v139.type == "count" then
                        assert(typeof(v139.value) == "number", "Expected count value to be number");
                        v130 = v130 + v139.value;
                    end;
                end;
            end;
            v135:fireCount(v130);
        end;
    end;
end;
v30.configureReset = function(v140) --[[ Line: 821 ]] --[[ Name: configureReset ]]
    v140._menuConfig = {};
    v140._subMenuConfig = {};
    v140._subMenuNotifications = {};
    v140:updateMenuList();
end;
v30.configureMenu = function(v141, v142) --[[ Line: 828 ]] --[[ Name: configureMenu ]]
    v141._menuConfig = v142;
    v141:updateNotificationTotals();
    v141:updateMenuList();
end;
v30.configureSubMenu = function(v143, v144, v145) --[[ Line: 834 ]] --[[ Name: configureSubMenu ]]
    -- upvalues: l_NotifySignal_0 (copy)
    v143._subMenuConfig[v144] = v145;
    if not v143._subMenuNotifications[v144] then
        v143._subMenuNotifications[v144] = l_NotifySignal_0.new(true);
    end;
    v143:updateNotificationTotals();
    v143:updateMenuList();
end;
if l_FFlagEnableConsoleExpControls_0 then
    v30.registerShortcut = function(v146, v147) --[[ Line: 844 ]] --[[ Name: registerShortcut ]]
        -- upvalues: v30 (copy)
        v146._shortcutService:registerShortcut(v147);
        local v148 = v146._shortcutService:getShortcut(v147.id);
        if v148.integration and v146._integrations[v148.integration] then
            local v149 = v146._integrations[v148.integration];
            if v149.availability:get() == v30.AvailabilitySignal.Unavailable then
                v148.availability:unavailable();
            end;
            v149.availability:connect(function() --[[ Line: 852 ]]
                -- upvalues: v149 (copy), v30 (ref), v148 (copy)
                local v150 = v149.availability:get();
                if v150 == v30.AvailabilitySignal.Unavailable then
                    v148.availability:unavailable();
                    return;
                else
                    if v150 == v30.AvailabilitySignal.Available or v150 == v30.AvailabilitySignal.Pinned then
                        v148.availability:available();
                    end;
                    return;
                end;
            end);
        end;
    end;
    v30.activateShortcut = function(v151, v152) --[[ Line: 866 ]] --[[ Name: activateShortcut ]]
        -- upvalues: v26 (copy)
        local v153 = v151._shortcutService:getShortcut(v152);
        if v153.integration then
            if v153.activated then
                if v26 then
                    v151._shortcutService:activateShortcut(v152);
                    v151._onIntegrationActivated:fire(v153.integration, {
                        fromShortcut = true
                    });
                    return;
                end;
            elseif v26 then
                v151:activate(v153.integration, {
                    fromShortcut = true
                });
                return;
            else
                v151:activate(v153.integration);
                return;
            end;
        else
            v151._shortcutService:activateShortcut(v152);
        end;
    end;
    v30.configureShortcutBar = function(v154, v155, v156) --[[ Line: 886 ]] --[[ Name: configureShortcutBar ]]
        v154._shortcutService:configureShortcutBar(v155, v156);
    end;
    v30.setShortcutBar = function(v157, v158) --[[ Line: 890 ]] --[[ Name: setShortcutBar ]]
        v157._shortcutService:setShortcutBar(v158);
    end;
    v30.getCurrentShortcutBar = function(v159) --[[ Line: 894 ]] --[[ Name: getCurrentShortcutBar ]]
        return v159._currentShortcutBar;
    end;
    v30.getShortcutsFromBar = function(v160, v161) --[[ Line: 898 ]] --[[ Name: getShortcutsFromBar ]]
        return v160._shortcutService:getShortcutsFromBar(v161, v160._integrations);
    end;
    v30.getCurrentShortcuts = function(v162) --[[ Line: 902 ]] --[[ Name: getCurrentShortcuts ]]
        return v162:getShortcutsFromBar(v162._currentShortcutBar:get());
    end;
    v30.onShortcutBarChanged = function(v163) --[[ Line: 906 ]] --[[ Name: onShortcutBarChanged ]]
        return v163._shortcutService.onShortcutBarChanged;
    end;
    v30.selectMenuIcon = function(v164) --[[ Line: 910 ]] --[[ Name: selectMenuIcon ]]
        v164._triggerMenuIcon:fire();
    end;
    v30.onTriggerMenuIcon = function(v165) --[[ Line: 914 ]] --[[ Name: onTriggerMenuIcon ]]
        return v165._triggerMenuIcon;
    end;
    v30.setHideShortcutBar = function(v166, v167, v168) --[[ Line: 918 ]] --[[ Name: setHideShortcutBar ]]
        v166._shortcutService:setHideShortcutBar(v167, v168);
    end;
    v30.getHideShortcutBar = function(v169) --[[ Line: 922 ]] --[[ Name: getHideShortcutBar ]]
        return v169._shortcutService:getHideShortcutBar();
    end;
end;
if l_isInExperienceUIVREnabled_0 then
    v30.onTriggerVRToggleButton = function(v170) --[[ Line: 928 ]] --[[ Name: onTriggerVRToggleButton ]]
        return v170._triggerVRToggleButton;
    end;
    v30.showTopBar = function(v171) --[[ Line: 932 ]] --[[ Name: showTopBar ]]
        return v171._topBarVisibility:get();
    end;
    v30.getTopBarVisibiity = function(v172) --[[ Line: 936 ]] --[[ Name: getTopBarVisibiity ]]
        return v172._topBarVisibility;
    end;
    v30.connectTopBarVisibility = function(v173, v174) --[[ Line: 940 ]] --[[ Name: connectTopBarVisibility ]]
        v173._topBarVisibility = v174;
    end;
end;
v30.gesture = function(v175, v176, v177, v178) --[[ Line: 945 ]] --[[ Name: gesture ]]
    if v175._integrations[v176] then
        v175._dragConnection[v176] = {
            connection = v177, 
            inputObject = v178
        };
    end;
end;
v30.withinCurrentTopLevelMenu = function(v179, v180) --[[ Line: 958 ]] --[[ Name: withinCurrentTopLevelMenu ]]
    for v181, v182 in (v179._menuList:get()) do
        if v182.id == v180 then
            return v182, v181;
        end;
    end;
    return nil, 0;
end;
v30.withinCurrentSubmenu = function(v183, v184) --[[ Line: 968 ]] --[[ Name: withinCurrentSubmenu ]]
    local v185 = v183._currentSubMenu:get();
    if not v185 then
        return false;
    else
        local v186 = v183._menuList:get();
        local v187 = nil;
        for _, v189 in v186 do
            if v189.id == v185 then
                v187 = v189.children;
                break;
            end;
        end;
        if not v187 then
            return false;
        else
            for _, v191 in v187 do
                if v191.id == v184 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v30.windowPosition = function(v192, v193) --[[ Line: 997 ]] --[[ Name: windowPosition ]]
    return v192._windowPositions[v193];
end;
v30.updateWindowPosition = function(v194, v195, v196) --[[ Line: 1001 ]] --[[ Name: updateWindowPosition ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() and v194._integrations[v195] and v194._integrations[v195].persistWindowState then
        local v197 = v14.loadForLocalPlayer("ChromeWindowPosition") or {};
        v197[v195] = {
            v196.X.Scale, 
            v196.X.Offset, 
            v196.Y.Scale, 
            v196.Y.Offset
        };
        v14.storeForLocalPlayer("ChromeWindowPosition", v197);
    end;
    v194._windowPositions[v195] = v196;
end;
v30.getWindowStatusFromStore = function(_, v199) --[[ Line: 1014 ]] --[[ Name: getWindowStatusFromStore ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        return (v14.loadForLocalPlayer("ChromeWindowStatus") or {})[v199] or false;
    else
        return nil;
    end;
end;
v30.getWindowPositionFromStore = function(_, v201) --[[ Line: 1024 ]] --[[ Name: getWindowPositionFromStore ]]
    -- upvalues: v14 (copy)
    if v14.isEnabled() then
        local v202 = (v14.loadForLocalPlayer("ChromeWindowPosition") or {})[v201] or nil;
        if v202 then
            return (UDim2.new(v202[1], v202[2], v202[3], v202[4]));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v30.activate = function(v203, v204, v205) --[[ Line: 1035 ]] --[[ Name: activate ]]
    -- upvalues: v26 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    local v206 = nil;
    if v203._integrations[v204] then
        local l_activated_0 = v203._integrations[v204].activated;
        if v26 then
            v203._onIntegrationActivated:fire(v204, v205);
        else
            v203._onIntegrationActivated:fire(v204);
        end;
        v203:storeChromeInteracted();
        if l_activated_0 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1051 ]]
                -- upvalues: l_activated_0 (copy), v203 (copy), v204 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
                l_activated_0(v203._integrations[v204]);
                if not l_FFlagEnableConsoleExpControls_0 then
                    v203:disableFocusNav();
                end;
            end);
            if not l_status_2 then
                warn("ChromeService: activate error thrown for " .. v204);
                v206 = l_result_2;
            end;
        else
            if v203._subMenuConfig[v204] then
                v203:toggleSubMenu(v204);
            end;
            v203:toggleWindow(v204);
        end;
        if v203._currentSubMenu:get() ~= v204 then
            v203._currentSubMenu:set(nil);
        end;
    end;
    if v206 then
        error(v206);
    end;
end;
v30.selectedItem = function(v210) --[[ Line: 1079 ]] --[[ Name: selectedItem ]]
    return v210._selectedItem;
end;
v30.setSelected = function(v211, v212) --[[ Line: 1083 ]] --[[ Name: setSelected ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v213, v214 = v211:withinCurrentTopLevelMenu(v212 or "");
    if not v213 then
        return;
    else
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v216 = true;
        if l_l_UserInputService_0_LastInputType_0 ~= Enum.UserInputType.MouseButton1 then
            v216 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Touch;
        end;
        local v217 = v211._currentSubMenu:get();
        if v217 and v217 ~= v212 and not v216 then
            v211:toggleSubMenu(v217);
        end;
        v211._selectedItemIdx = v214;
        v211._selectedItem:set(v212);
        return;
    end;
end;
v30.setSelectedByOffset = function(v218, v219) --[[ Line: 1101 ]] --[[ Name: setSelectedByOffset ]]
    local v220 = v218._menuList:get();
    local _, v222 = v218:withinCurrentTopLevelMenu(v218._selectedItem:get() or "");
    if v222 > 0 then
        v218:setSelected(v220[math.clamp(v222 + v219, 1, #v220)].id);
    end;
end;
v30.repairSelected = function(v223) --[[ Line: 1111 ]] --[[ Name: repairSelected ]]
    if v223._selectedItem:get() then
        local _, v225 = v223:withinCurrentTopLevelMenu(v223._selectedItem:get() or "");
        if v225 == 0 then
            v225 = v223._selectedItemIdx;
        end;
        local v226 = v223._menuList:get();
        v223:setSelected(v226[math.clamp(v225, 1, #v226)].id);
    end;
end;
v30.configureOrderAlignment = function(v227, v228) --[[ Line: 1125 ]] --[[ Name: configureOrderAlignment ]]
    if v227._orderAlignment:get() ~= v228 then
        v227._orderAlignment:set(v228);
        v227:updateMenuList();
    end;
end;
v30.orderAlignment = function(v229) --[[ Line: 1132 ]] --[[ Name: orderAlignment ]]
    return v229._orderAlignment;
end;
v30.setMenuAbsolutePosition = function(v230, v231) --[[ Line: 1136 ]] --[[ Name: setMenuAbsolutePosition ]]
    if v231 ~= v230._menuAbsolutePosition then
        v230._menuAbsolutePosition = v231;
        v230._layout:set(createUnibarLayoutInfo(v231, v230._menuAbsoluteSizeOpen));
    end;
end;
v30.setMenuAbsoluteSize = function(v232, v233) --[[ Line: 1143 ]] --[[ Name: setMenuAbsoluteSize ]]
    if v233 ~= v232._menuAbsoluteSizeOpen then
        v232._menuAbsoluteSizeOpen = v233;
        v232._layout:set(createUnibarLayoutInfo(v232._menuAbsolutePosition, v233));
    end;
end;
v30.layout = function(v234) --[[ Line: 1150 ]] --[[ Name: layout ]]
    return v234._layout;
end;
return v30;