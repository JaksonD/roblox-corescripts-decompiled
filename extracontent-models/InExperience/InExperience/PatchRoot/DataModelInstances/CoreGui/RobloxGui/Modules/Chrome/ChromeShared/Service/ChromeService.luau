local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_reverse_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array.reverse;
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v9 = require(l_CorePackages_0.Workspace.Packages.Chrome);
local l_SideSheetPlacement_0 = v9.Enums.SideSheetPlacement;
local l_Signal_0 = v7.Signal;
local l_FocusUtils_0 = v9.FocusUtils;
local l_FocusOnChromeSignal_0 = l_FocusUtils_0.FocusOnChromeSignal;
local l_FocusOffChromeSignal_0 = l_FocusUtils_0.FocusOffChromeSignal;
local v15 = require(l_script_FirstAncestor_0.Service.ChromeUtils);
local v16 = require(l_script_FirstAncestor_0.Service.LocalStore);
local v17 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v18 = require(l_script_FirstAncestor_0.Service.WindowSizeSignal);
local l_ObservableValue_0 = v15.ObservableValue;
local l_NotifySignal_0 = v15.NotifySignal;
local l_AvailabilitySignal_0 = v15.AvailabilitySignal;
local v22 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v23 = require(l_script_FirstAncestor_0.Service.ShortcutService);
local l_FFlagEnableConsoleExpControls_0 = v6.FFlagEnableConsoleExpControls;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v26 = require(l_script_FirstAncestor_0.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry);
local v27 = game:DefineFastFlag("ChromeDeprecateMRUs", false);
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v6.FFlagVirtualCursorTopbarAlwaysVisible;
local l_FFlagEnableSideSheet_0 = v6.FFlagEnableSideSheet;
local l_FFlagRequireSideSheetPackage_0 = v6.FFlagRequireSideSheetPackage;
local l_FFlagAddIGMToSideSheet_0 = v6.FFlagAddIGMToSideSheet;
local l_FFlagEnableChromeWindowsNotInMenu_0 = require(l_script_FirstAncestor_0.Flags).FFlagEnableChromeWindowsNotInMenu;
local v33 = nil;
local v34 = nil;
local v35 = nil;
if l_FFlagRequireSideSheetPackage_0 then
    local v36 = require(l_CorePackages_0.Workspace.Packages.InExperienceSideSheet);
    v33 = v36.toggleSideSheet;
    v34 = v36.getSideSheetVisibility;
    v35 = v36.registerSideSheetIntegrations;
end;
local v37 = {};
v37.__index = v37;
v37.AvailabilitySignal = v15.AvailabilitySignalState;
v37.IntegrationStatus = {
    None = 0, 
    Icon = 1, 
    Window = 2
};
noop = function() --[[ Line: 102 ]] --[[ Name: noop ]]

end;
local v38 = {
    id = "div", 
    label = "div", 
    initialAvailability = v37.AvailabilitySignal.Unavailable, 
    availability = l_AvailabilitySignal_0.new(v37.AvailabilitySignal.Unavailable), 
    notification = l_NotifySignal_0.new(), 
    components = {}, 
    hideNotificationCountWhileOpen = false, 
    sideSheetPlacement = if l_FFlagEnableSideSheet_0 then l_SideSheetPlacement_0.None else nil
};
createUnibarLayoutInfo = function(v39, v40) --[[ Line: 246 ]] --[[ Name: createUnibarLayoutInfo ]]
    return Rect.new(v39, v39 + v40);
end;
v37.new = function() --[[ Line: 250 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v23 (copy), v15 (copy), l_ObservableValue_0 (copy), l_NotifySignal_0 (copy), l_Localization_0 (copy), l_Signal_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v37 (copy), v17 (copy), v27 (copy), l_FocusOnChromeSignal_0 (copy), l_FocusOffChromeSignal_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v42 = {
        _shortcutService = if l_FFlagEnableConsoleExpControls_0 then v23.new() else nil, 
        _layout = v15.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero)), 
        _menuAbsolutePosition = Vector2.zero, 
        _menuAbsoluteSizeOpen = Vector2.zero, 
        _currentSubMenu = v15.ObservableValue.new(nil), 
        _selectedItem = v15.ObservableValue.new(nil), 
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
    local v43 = setmetatable(v42, v37);
    v17.viewport:connect(function(v44) --[[ Line: 293 ]]
        -- upvalues: v27 (ref), v43 (copy)
        if v27 then
            v43:updateWindowSizeSignals();
            return;
        else
            v43:updateScreenSize(v44.size, v44.isMobileDevice, v44.portraitOrientation, v44.tinyPortrait);
            return;
        end;
    end, true);
    if l_FFlagEnableConsoleExpControls_0 then
        v42._shortcutService.onShortcutBarChanged:connect(function(v45) --[[ Line: 307 ]]
            -- upvalues: v43 (copy)
            v43._currentShortcutBar:set(v45);
        end);
    end;
    l_FocusOnChromeSignal_0:connect(function(v46) --[[ Line: 311 ]]
        -- upvalues: v42 (copy), v43 (copy)
        if v46 and not v42._subMenuConfig.nine_dot[v46] then
            v43:setSelected(v46);
        end;
        v43:enableFocusNav();
    end);
    l_FocusOffChromeSignal_0:connect(function() --[[ Line: 318 ]]
        -- upvalues: v43 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
        v43:disableFocusNav();
        if l_FFlagEnableConsoleExpControls_0 then
            v43:setShortcutBar(nil);
        end;
    end);
    return v43;
end;
v37.storeChromeInteracted = function(_) --[[ Line: 330 ]] --[[ Name: storeChromeInteracted ]]
    -- upvalues: v16 (copy)
    if v16.isEnabled() then
        v16.storeForLocalPlayer("ChromeInteracted3", true);
    end;
end;
v37.updateScreenSize = function(v48, _, v50, v51, v52) --[[ Line: 336 ]] --[[ Name: updateScreenSize ]]
    -- upvalues: v22 (copy)
    local v53 = 0;
    v53 = if v50 then if v52 then v22.MOBILE_TINY_PORTRAIT_SLOTS - v22.CORE_SLOTS else if v51 then v22.MOBILE_PORTRAIT_SLOTS - v22.CORE_SLOTS else v22.MOBILE_LANDSCAPE_SLOTS - v22.CORE_SLOTS else v22.NON_MOBILE_SLOTS - v22.CORE_SLOTS;
    if v53 ~= v48._mostRecentlyUsedAndPinnedLimit then
        v48._mostRecentlyUsedAndPinnedLimit = v53;
        v48:updateMenuList();
        v48:updateNotificationTotals();
    end;
    v48:updateWindowSizeSignals();
end;
v37.updateWindowSizeSignals = function(v54) --[[ Line: 372 ]] --[[ Name: updateWindowSizeSignals ]]
    for _, v56 in v54._integrations do
        if v56.windowSize then
            v56.windowSize:updateConstraints();
        end;
    end;
end;
v37.notificationIndicator = function(v57) --[[ Line: 380 ]] --[[ Name: notificationIndicator ]]
    return v57._notificationIndicator;
end;
v37.toggleSubMenu = function(v58, v59) --[[ Line: 384 ]] --[[ Name: toggleSubMenu ]]
    -- upvalues: l_FFlagEnableSideSheet_0 (copy), v33 (ref)
    if l_FFlagEnableSideSheet_0 and v33 then
        v33(true);
        return;
    elseif not v58._subMenuConfig[v59] then
        warn("Not a valid subMenuId:" .. v59);
        return;
    elseif v58._currentSubMenu:get() == v59 then
        v58._currentSubMenu:set(nil);
        return;
    else
        v58._currentSubMenu:set(v59);
        return;
    end;
end;
v37.currentSubMenu = function(v60) --[[ Line: 404 ]] --[[ Name: currentSubMenu ]]
    return v60._currentSubMenu;
end;
v37.inFocusNav = function(v61) --[[ Line: 408 ]] --[[ Name: inFocusNav ]]
    return v61._inFocusNav;
end;
v37.enableFocusNav = function(v62) --[[ Line: 412 ]] --[[ Name: enableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v22 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if not v62._inFocusNav:get() then
            v62._inFocusNav:set(true);
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v62:setShortcutBar(v22.UNIBAR_SHORTCUTBAR_ID);
        end;
        return;
    end;
end;
v37.disableFocusNav = function(v63) --[[ Line: 425 ]] --[[ Name: disableFocusNav ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        if v63._inFocusNav:get() then
            v63._inFocusNav:set(false);
            v63._selectedItem:set(nil);
            v63._currentSubMenu:set(nil);
        end;
        return;
    end;
end;
v37.toggleWindow = function(v64, v65) --[[ Line: 437 ]] --[[ Name: toggleWindow ]]
    -- upvalues: v37 (copy), v16 (copy)
    if v64._integrations[v65].components.Window then
        if not v64._integrationsStatus[v65] or v64._integrationsStatus[v65] == v37.IntegrationStatus.None or v64._integrationsStatus[v65] == v37.IntegrationStatus.Icon then
            v64._integrationsStatus[v65] = v37.IntegrationStatus.Window;
        else
            v64._integrationsStatus[v65] = v37.IntegrationStatus.Icon;
        end;
        v64._onIntegrationStatusChanged:fire(v65, v64._integrationsStatus[v65]);
    end;
    if v16.isEnabled() and v64._integrations[v65] and v64._integrations[v65].persistWindowState then
        local v66 = v16.loadForLocalPlayer("ChromeWindowStatus") or {};
        v66[v65] = v64._integrationsStatus[v65] == v37.IntegrationStatus.Window;
        v16.storeForLocalPlayer("ChromeWindowStatus", v66);
    end;
    v64:updateMenuList();
end;
v37.isWindowOpen = function(v67, v68) --[[ Line: 463 ]] --[[ Name: isWindowOpen ]]
    -- upvalues: v37 (copy)
    return v67._integrations[v68].components.Window and v67._integrationsStatus[v68] == v37.IntegrationStatus.Window;
end;
v37.menuList = function(v69) --[[ Line: 467 ]] --[[ Name: menuList ]]
    return v69._menuList;
end;
v37.windowList = function(v70) --[[ Line: 471 ]] --[[ Name: windowList ]]
    return v70._windowList;
end;
v37.dragConnection = function(v71, v72) --[[ Line: 475 ]] --[[ Name: dragConnection ]]
    if v71._integrations[v72] then
        return v71._dragConnection[v72];
    else
        return nil;
    end;
end;
v37.updateLocalization = function(v73, v74) --[[ Line: 483 ]] --[[ Name: updateLocalization ]]
    local v75 = "";
    local v76 = "";
    v73._localizedLabelKeys[v74.id] = {};
    v73._localizedLabelKeys[v74.id].label = v74.label;
    v75 = v74.label;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 494 ]]
        -- upvalues: v75 (ref), v73 (copy)
        v75 = v73._localization:Format(v75);
    end);
    if not l_status_0 then
        v75 = v74.label;
        warn(l_result_0);
    end;
    v74.label = v75;
    if v74.secondaryAction then
        v73._localizedLabelKeys[v74.id].secondaryActionLabel = v74.secondaryAction.label;
        v76 = v74.secondaryAction.label;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 508 ]]
            -- upvalues: v76 (ref), v73 (copy)
            v76 = v73._localization:Format(v76);
        end);
        if not l_status_1 then
            v76 = v74.secondaryAction.label;
            warn(l_result_1);
        end;
        v74.secondaryAction.label = v76;
    end;
    return v74;
end;
v37.register = function(v81, v82) --[[ Line: 523 ]] --[[ Name: register ]]
    -- upvalues: l_FFlagEnableSideSheet_0 (copy), l_SideSheetPlacement_0 (copy), v37 (copy), l_AvailabilitySignal_0 (copy), l_NotifySignal_0 (copy), v18 (copy), v22 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy)
    if v81._integrations[v82.id] then
        warn(string.format(v82.id .. "already registered", debug.traceback()));
        for _, v84 in v81._integrationsConnections[v82.id] do
            v84:disconnect();
        end;
    end;
    v81._integrationsConnections[v82.id] = {};
    local v85 = v81._integrationsConnections[v82.id];
    if l_FFlagEnableSideSheet_0 and v82.sideSheetPlacement == nil then
        v82.sideSheetPlacement = l_SideSheetPlacement_0.Vertical;
    end;
    if v82.initialAvailability == nil then
        v82.initialAvailability = v37.AvailabilitySignal.Unavailable;
    end;
    if v82.availability == nil then
        v82.availability = l_AvailabilitySignal_0.new(v82.initialAvailability or v37.AvailabilitySignal.Unavailable);
    end;
    if v82.notification == nil then
        v82.notification = l_NotifySignal_0.new();
    end;
    if v82.components == nil then
        v82.components = {};
    end;
    if v82.availability then
        v85[#v85 + 1] = v82.availability:connect(function() --[[ Line: 558 ]]
            -- upvalues: v81 (copy), v82 (ref)
            v81:availabilityChanged(v82);
        end);
    end;
    if v82.notification and not v82.notification:excludeFromTotalCounts() then
        v85[#v85 + 1] = v82.notification:connect(function() --[[ Line: 564 ]]
            -- upvalues: v81 (copy)
            v81:updateNotificationTotals();
        end);
    end;
    if v82.windowSize == nil and v82.components and v82.components.Window then
        v82.windowSize = v18.new();
    end;
    if v37:getWindowStatusFromStore(v82.id) and v82.persistWindowState or v82.windowDefaultOpen then
        v81._integrationsStatus[v82.id] = v37.IntegrationStatus.Window;
        v81._onIntegrationStatusChanged:fire(v82.id, v81._integrationsStatus[v82.id]);
    end;
    local v86 = UDim2.fromOffset(v22.MENU_ICON_SCREEN_SIDE_OFFSET, v22.WINDOW_DEFAULT_PADDING);
    if v82.startingWindowPosition then
        v86 = if v82.persistWindowState then v81:getWindowPositionFromStore(v82.id) or v82.startingWindowPosition else v82.startingWindowPosition;
    end;
    v81._windowPositions[v82.id] = v86;
    v82 = v81:updateLocalization(v82);
    local l_v82_0 = v82;
    v81._integrations[v82.id] = l_v82_0;
    if l_FFlagEnableConsoleExpControls_0 and v82.selected then
        v85[#v85 + 1] = v81:selectedItem():connect(function(v88) --[[ Line: 598 ]]
            -- upvalues: l_v82_0 (copy), l_FFlagVirtualCursorTopbarAlwaysVisible_0 (ref), l_GamepadService_0 (ref), v82 (ref)
            if l_v82_0.id == v88 then
                if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    v82.selected(l_v82_0);
                end;
            end;
        end);
    end;
    return l_v82_0;
end;
v37.createIconProps = function(v89, v90, v91) --[[ Line: 611 ]] --[[ Name: createIconProps ]]
    -- upvalues: v38 (copy)
    local v92 = v91 or 0;
    if v89._integrations[v90] then
        return {
            id = v90, 
            children = {}, 
            order = v92, 
            component = v89._integrations[v90].components.Icon, 
            integration = v89._integrations[v90], 
            isDivider = false, 
            activated = function() --[[ Line: 621 ]] --[[ Name: activated ]]
                -- upvalues: v89 (copy), v90 (copy)
                v89:activate(v90);
            end
        };
    else
        return {
            id = v90, 
            children = {}, 
            order = v92, 
            activated = noop, 
            integration = v38
        };
    end;
end;
reverseOrder = function(v93) --[[ Line: 636 ]] --[[ Name: reverseOrder ]]
    local v94 = #v93;
    local v95 = {};
    for v96 = 1, v94 do
        v95[v96] = v93[v96].order;
    end;
    for v97 = 1, v94 do
        v93[v97].order = v95[v94 - v97 + 1];
    end;
end;
v37.isIntegrationValid = function(v98, v99) --[[ Line: 647 ]] --[[ Name: isIntegrationValid ]]
    -- upvalues: v37 (copy)
    local v100 = v98._integrations[v99];
    if v100 then
        local l_availability_0 = v100.availability;
        return l_availability_0 and l_availability_0:get() ~= v37.AvailabilitySignal.Unavailable;
    else
        return false;
    end;
end;
v37.updateMenuList = function(v102) --[[ Line: 660 ]] --[[ Name: updateMenuList ]]
    -- upvalues: v38 (copy), l_FFlagEnableSideSheet_0 (copy), l_reverse_0 (copy), l_FFlagEnableChromeWindowsNotInMenu_0 (copy)
    local v103 = 0;
    local v104 = 0;
    local function v106(v105) --[[ Line: 664 ]] --[[ Name: iconProps ]]
        -- upvalues: v104 (ref), v102 (copy)
        v104 = v104 + 1;
        return v102:createIconProps(v105, v104);
    end;
    local function v108(v107) --[[ Line: 669 ]] --[[ Name: windowProps ]]
        -- upvalues: v104 (ref), v102 (copy), v38 (ref)
        v104 = v104 + 1;
        if v102._integrations[v107] then
            return {
                id = v107, 
                children = {}, 
                order = v104, 
                component = v102._integrations[v107].components.Window, 
                activated = noop, 
                integration = v102._integrations[v107]
            };
        else
            return {
                id = v107, 
                children = {}, 
                order = v104, 
                activated = noop, 
                integration = v38
            };
        end;
    end;
    local function v110(_) --[[ Line: 691 ]] --[[ Name: divider ]]
        -- upvalues: v103 (ref), v104 (ref), v38 (ref)
        v103 = v103 + 1;
        v104 = v104 + 1;
        return {
            id = "DIV" .. v103, 
            order = v104, 
            isDivider = true, 
            children = {}, 
            activated = noop, 
            integration = v38
        };
    end;
    local function v111(v112, v113, v114) --[[ Line: 704 ]] --[[ Name: collectMenu ]]
        -- upvalues: v110 (copy), v103 (ref), v111 (copy), l_FFlagEnableSideSheet_0 (ref), v102 (copy), v104 (ref), v108 (copy), v106 (copy)
        local v115 = 0;
        for v116, v117 in pairs(v112) do
            if type(v117) == "table" then
                if not #v113.children then
                    table.insert(v113.children, (v110(v103)));
                end;
                if v111(v117, v113, v114) > 0 then
                    table.insert(v113.children, (v110(v103)));
                end;
            else
                if typeof(v117) ~= "string" then
                    error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v117, v116)));
                end;
                if not l_FFlagEnableSideSheet_0 and v102._subMenuConfig[v117] then
                    if v102:isIntegrationValid(v117) then
                        v104 = v104 + 1;
                        local v118 = v102:createIconProps(v117, v104);
                        v115 = v115 + 1;
                        v111(v102._subMenuConfig[v117], v118, v114);
                        if #v118.children > 0 then
                            table.insert(v113.children, v118);
                        end;
                    end;
                elseif v102:isIntegrationValid(v117) then
                    if v102:isWindowOpen(v117) then
                        table.insert(v114, (v108(v117)));
                        table.insert(v113.children, v106(v117));
                        v115 = v115 + 1;
                    else
                        table.insert(v113.children, v106(v117));
                        v115 = v115 + 1;
                    end;
                end;
            end;
        end;
        return v115;
    end;
    local v119 = {
        children = {}
    };
    local v120 = {};
    v111(v102._menuConfig, v119, v120);
    if #v119.children and v119.children[#v119.children] and v119.children[#v119.children].isDivider then
        table.remove(v119.children, #v119.children);
    end;
    if v102._orderAlignment:get() == Enum.HorizontalAlignment.Left then
        v119.children = l_reverse_0(v119.children);
        reverseOrder(v119.children);
    end;
    if l_FFlagEnableChromeWindowsNotInMenu_0 then
        local v121 = {};
        for _, v123 in v120 do
            v121[v123.id] = true;
        end;
        for v124, _ in v102._integrations do
            if v102:isWindowOpen(v124) and not v121[v124] then
                table.insert(v120, (v108(v124)));
            end;
        end;
    end;
    v102._menuList:set(v119.children);
    v102._windowList:set(v120);
    v102:repairSelected();
end;
if l_FFlagEnableSideSheet_0 then
    v37.updateSideSheet = function(v126) --[[ Line: 783 ]] --[[ Name: updateSideSheet ]]
        -- upvalues: l_SideSheetPlacement_0 (copy), l_FFlagAddIGMToSideSheet_0 (copy), l_reverse_0 (copy), v35 (ref)
        local v127 = 0;
        local v128 = {};
        local v129 = {};
        local v130 = {};
        local function v133(v131) --[[ Line: 789 ]] --[[ Name: addIntegration ]]
            -- upvalues: v126 (copy), l_SideSheetPlacement_0 (ref), v129 (ref), v127 (ref), l_FFlagAddIGMToSideSheet_0 (ref), v130 (copy), v128 (copy)
            local v132 = v126._integrations[v131];
            if not v132 or v132.sideSheetPlacement == l_SideSheetPlacement_0.None or not v126:isIntegrationValid(v131) then
                return;
            elseif v132.sideSheetPlacement == l_SideSheetPlacement_0.Unibar then
                table.insert(v129, v126:createIconProps(v131, v127));
                return;
            elseif l_FFlagAddIGMToSideSheet_0 and v132.sideSheetPlacement == l_SideSheetPlacement_0.Page then
                table.insert(v130, v126:createIconProps(v131, v127));
                return;
            else
                table.insert(v128, v126:createIconProps(v131, v127));
                return;
            end;
        end;
        for _, v135 in v126._menuConfig do
            for _, v137 in v135 do
                v127 = v127 + 1;
                v133(v137);
            end;
        end;
        for _, v139 in v126._subMenuConfig do
            for _, v141 in v139 do
                v127 = v127 + 1;
                v133(v141);
            end;
        end;
        if v126._orderAlignment:get() == Enum.HorizontalAlignment.Left then
            v129 = l_reverse_0(v129);
        end;
        v35({
            unibarIntegrations = v129, 
            verticalIntegrations = v128, 
            pageIntegrations = if l_FFlagAddIGMToSideSheet_0 then v130 else {}
        });
    end;
end;
v37.availabilityChanged = function(v142, _) --[[ Line: 835 ]] --[[ Name: availabilityChanged ]]
    -- upvalues: l_FFlagEnableSideSheet_0 (copy)
    v142:updateNotificationTotals();
    v142:updateMenuList();
    if l_FFlagEnableSideSheet_0 then
        v142:updateSideSheet();
    end;
end;
v37.subMenuNotifications = function(v144, v145) --[[ Line: 843 ]] --[[ Name: subMenuNotifications ]]
    -- upvalues: l_NotifySignal_0 (copy)
    if not v144._subMenuNotifications[v145] then
        v144._subMenuNotifications[v145] = l_NotifySignal_0.new(true);
    end;
    return v144._subMenuNotifications[v145];
end;
v37.totalNotifications = function(v146) --[[ Line: 850 ]] --[[ Name: totalNotifications ]]
    return v146._totalNotifications;
end;
v37.onIntegrationRegistered = function(v147) --[[ Line: 854 ]] --[[ Name: onIntegrationRegistered ]]
    return v147._onIntegrationRegistered;
end;
v37.onIntegrationActivated = function(v148) --[[ Line: 858 ]] --[[ Name: onIntegrationActivated ]]
    return v148._onIntegrationActivated;
end;
v37.onIntegrationHovered = function(v149) --[[ Line: 862 ]] --[[ Name: onIntegrationHovered ]]
    return v149._onIntegrationHovered;
end;
v37.onIntegrationStatusChanged = function(v150) --[[ Line: 866 ]] --[[ Name: onIntegrationStatusChanged ]]
    return v150._onIntegrationStatusChanged;
end;
v37.integrations = function(v151) --[[ Line: 870 ]] --[[ Name: integrations ]]
    return v151._integrations;
end;
v37.updateNotificationTotals = function(v152) --[[ Line: 874 ]] --[[ Name: updateNotificationTotals ]]
    -- upvalues: v37 (copy)
    local v153 = 0;
    for _, v155 in v152._integrations do
        if v155.availability:get() ~= v37.AvailabilitySignal.Unavailable and v155.availability:get() ~= v37.AvailabilitySignal.Pinned and not v155.notification:excludeFromTotalCounts() then
            local v156 = v155.notification:get();
            if v156 and v156.type == "count" then
                assert(typeof(v156.value) == "number", "Expected count value to be number");
                v153 = v153 + v156.value;
            end;
        end;
    end;
    v152._totalNotifications:fireCount(v153);
    for v157, v158 in v152._subMenuNotifications do
        local v159 = v152:withinCurrentTopLevelMenu(v157);
        v153 = 0;
        if v159 then
            for _, v161 in v159.children do
                if not v152:withinCurrentTopLevelMenu(v161.id) and v161.integration.availability:get() ~= v37.AvailabilitySignal.Unavailable and not v161.integration.notification:excludeFromTotalCounts() then
                    local v162 = v161.integration.notification:get();
                    if v162 and v162.type == "count" then
                        assert(typeof(v162.value) == "number", "Expected count value to be number");
                        v153 = v153 + v162.value;
                    end;
                end;
            end;
            v158:fireCount(v153);
        end;
    end;
end;
v37.configureMenu = function(v163, v164) --[[ Line: 918 ]] --[[ Name: configureMenu ]]
    v163._menuConfig = v164;
    v163:updateNotificationTotals();
    v163:updateMenuList();
end;
v37.configureSubMenu = function(v165, v166, v167) --[[ Line: 924 ]] --[[ Name: configureSubMenu ]]
    -- upvalues: l_NotifySignal_0 (copy), l_FFlagEnableSideSheet_0 (copy)
    v165._subMenuConfig[v166] = v167;
    if not v165._subMenuNotifications[v166] then
        v165._subMenuNotifications[v166] = l_NotifySignal_0.new(true);
    end;
    v165:updateNotificationTotals();
    v165:updateMenuList();
    if l_FFlagEnableSideSheet_0 then
        v165:updateSideSheet();
    end;
end;
if l_FFlagEnableConsoleExpControls_0 then
    v37.registerShortcut = function(v168, v169) --[[ Line: 937 ]] --[[ Name: registerShortcut ]]
        -- upvalues: v37 (copy)
        v168._shortcutService:registerShortcut(v169);
        local v170 = v168._shortcutService:getShortcut(v169.id);
        if v170.integration and v168._integrations[v170.integration] then
            local v171 = v168._integrations[v170.integration];
            if v171.availability:get() == v37.AvailabilitySignal.Unavailable then
                v170.availability:unavailable();
            end;
            v171.availability:connect(function() --[[ Line: 945 ]]
                -- upvalues: v171 (copy), v37 (ref), v170 (copy)
                local v172 = v171.availability:get();
                if v172 == v37.AvailabilitySignal.Unavailable then
                    v170.availability:unavailable();
                    return;
                else
                    if v172 == v37.AvailabilitySignal.Available or v172 == v37.AvailabilitySignal.Pinned then
                        v170.availability:available();
                    end;
                    return;
                end;
            end);
        end;
    end;
    v37.activateShortcut = function(v173, v174) --[[ Line: 959 ]] --[[ Name: activateShortcut ]]
        -- upvalues: v26 (copy)
        local v175 = v173._shortcutService:getShortcut(v174);
        if v175.integration then
            if v175.activated then
                if v26 then
                    v173._shortcutService:activateShortcut(v174);
                    v173._onIntegrationActivated:fire(v175.integration, {
                        fromShortcut = true
                    });
                    return;
                end;
            elseif v26 then
                v173:activate(v175.integration, {
                    fromShortcut = true
                });
                return;
            else
                v173:activate(v175.integration);
                return;
            end;
        else
            v173._shortcutService:activateShortcut(v174);
        end;
    end;
    v37.configureShortcutBar = function(v176, v177, v178) --[[ Line: 979 ]] --[[ Name: configureShortcutBar ]]
        v176._shortcutService:configureShortcutBar(v177, v178);
    end;
    v37.setShortcutBar = function(v179, v180) --[[ Line: 983 ]] --[[ Name: setShortcutBar ]]
        v179._shortcutService:setShortcutBar(v180);
    end;
    v37.getCurrentShortcutBar = function(v181) --[[ Line: 987 ]] --[[ Name: getCurrentShortcutBar ]]
        return v181._currentShortcutBar;
    end;
    v37.getShortcutsFromBar = function(v182, v183) --[[ Line: 991 ]] --[[ Name: getShortcutsFromBar ]]
        return v182._shortcutService:getShortcutsFromBar(v183, v182._integrations);
    end;
    v37.getCurrentShortcuts = function(v184) --[[ Line: 995 ]] --[[ Name: getCurrentShortcuts ]]
        return v184:getShortcutsFromBar(v184._currentShortcutBar:get());
    end;
    v37.onShortcutBarChanged = function(v185) --[[ Line: 999 ]] --[[ Name: onShortcutBarChanged ]]
        return v185._shortcutService.onShortcutBarChanged;
    end;
    v37.selectMenuIcon = function(v186) --[[ Line: 1003 ]] --[[ Name: selectMenuIcon ]]
        v186._triggerMenuIcon:fire();
    end;
    v37.onTriggerMenuIcon = function(v187) --[[ Line: 1007 ]] --[[ Name: onTriggerMenuIcon ]]
        return v187._triggerMenuIcon;
    end;
    v37.setHideShortcutBar = function(v188, v189, v190) --[[ Line: 1011 ]] --[[ Name: setHideShortcutBar ]]
        v188._shortcutService:setHideShortcutBar(v189, v190);
    end;
    v37.getHideShortcutBar = function(v191) --[[ Line: 1015 ]] --[[ Name: getHideShortcutBar ]]
        return v191._shortcutService:getHideShortcutBar();
    end;
end;
if l_isInExperienceUIVREnabled_0 then
    v37.onTriggerVRToggleButton = function(v192) --[[ Line: 1021 ]] --[[ Name: onTriggerVRToggleButton ]]
        return v192._triggerVRToggleButton;
    end;
    v37.showTopBar = function(v193) --[[ Line: 1025 ]] --[[ Name: showTopBar ]]
        return v193._topBarVisibility:get();
    end;
    v37.getTopBarVisibiity = function(v194) --[[ Line: 1029 ]] --[[ Name: getTopBarVisibiity ]]
        return v194._topBarVisibility;
    end;
    v37.connectTopBarVisibility = function(v195, v196) --[[ Line: 1033 ]] --[[ Name: connectTopBarVisibility ]]
        v195._topBarVisibility = v196;
    end;
end;
v37.gesture = function(v197, v198, v199, v200) --[[ Line: 1038 ]] --[[ Name: gesture ]]
    if v197._integrations[v198] then
        v197._dragConnection[v198] = {
            connection = v199, 
            inputObject = v200
        };
    end;
end;
v37.withinCurrentTopLevelMenu = function(v201, v202) --[[ Line: 1051 ]] --[[ Name: withinCurrentTopLevelMenu ]]
    for v203, v204 in (v201._menuList:get()) do
        if v204.id == v202 then
            return v204, v203;
        end;
    end;
    return nil, 0;
end;
v37.withinCurrentSubmenu = function(v205, v206) --[[ Line: 1061 ]] --[[ Name: withinCurrentSubmenu ]]
    local v207 = v205._currentSubMenu:get();
    if not v207 then
        return false;
    else
        local v208 = v205._menuList:get();
        local v209 = nil;
        for _, v211 in v208 do
            if v211.id == v207 then
                v209 = v211.children;
                break;
            end;
        end;
        if not v209 then
            return false;
        else
            for _, v213 in v209 do
                if v213.id == v206 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
if l_FFlagEnableSideSheet_0 then
    v37.withinOpenSideSheet = function(v214, v215) --[[ Line: 1091 ]] --[[ Name: withinOpenSideSheet ]]
        -- upvalues: v34 (ref), l_SideSheetPlacement_0 (copy)
        if not v34() then
            return false;
        else
            for _, v217 in v214._integrations do
                if v217.id == v215 and v217.sideSheetPlacement ~= l_SideSheetPlacement_0.None then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v37.windowPosition = function(v218, v219) --[[ Line: 1106 ]] --[[ Name: windowPosition ]]
    return v218._windowPositions[v219];
end;
v37.updateWindowPosition = function(v220, v221, v222) --[[ Line: 1110 ]] --[[ Name: updateWindowPosition ]]
    -- upvalues: v16 (copy)
    if v16.isEnabled() and v220._integrations[v221] and v220._integrations[v221].persistWindowState then
        local v223 = v16.loadForLocalPlayer("ChromeWindowPosition") or {};
        v223[v221] = {
            v222.X.Scale, 
            v222.X.Offset, 
            v222.Y.Scale, 
            v222.Y.Offset
        };
        v16.storeForLocalPlayer("ChromeWindowPosition", v223);
    end;
    v220._windowPositions[v221] = v222;
end;
v37.getWindowStatusFromStore = function(_, v225) --[[ Line: 1123 ]] --[[ Name: getWindowStatusFromStore ]]
    -- upvalues: v16 (copy)
    if v16.isEnabled() then
        return (v16.loadForLocalPlayer("ChromeWindowStatus") or {})[v225] or false;
    else
        return nil;
    end;
end;
v37.getWindowPositionFromStore = function(_, v227) --[[ Line: 1133 ]] --[[ Name: getWindowPositionFromStore ]]
    -- upvalues: v16 (copy)
    if v16.isEnabled() then
        local v228 = (v16.loadForLocalPlayer("ChromeWindowPosition") or {})[v227] or nil;
        if v228 then
            return (UDim2.new(v228[1], v228[2], v228[3], v228[4]));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v37.activate = function(v229, v230, v231) --[[ Line: 1144 ]] --[[ Name: activate ]]
    -- upvalues: v26 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    local v232 = nil;
    if v229._integrations[v230] then
        local l_activated_0 = v229._integrations[v230].activated;
        if v26 then
            v229._onIntegrationActivated:fire(v230, v231);
        else
            v229._onIntegrationActivated:fire(v230);
        end;
        v229:storeChromeInteracted();
        if l_activated_0 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1160 ]]
                -- upvalues: l_activated_0 (copy), v229 (copy), v230 (copy), l_FFlagEnableConsoleExpControls_0 (ref)
                l_activated_0(v229._integrations[v230]);
                if not l_FFlagEnableConsoleExpControls_0 then
                    v229:disableFocusNav();
                end;
            end);
            if not l_status_2 then
                warn("ChromeService: activate error thrown for " .. v230);
                v232 = l_result_2;
            end;
        else
            if v229._subMenuConfig[v230] then
                v229:toggleSubMenu(v230);
            end;
            v229:toggleWindow(v230);
        end;
        if v229._currentSubMenu:get() ~= v230 then
            v229._currentSubMenu:set(nil);
        end;
    end;
    if v232 then
        error(v232);
    end;
end;
v37.selectedItem = function(v236) --[[ Line: 1188 ]] --[[ Name: selectedItem ]]
    return v236._selectedItem;
end;
v37.setSelected = function(v237, v238) --[[ Line: 1192 ]] --[[ Name: setSelected ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v239, v240 = v237:withinCurrentTopLevelMenu(v238 or "");
    if not v239 then
        return;
    else
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v242 = true;
        if l_l_UserInputService_0_LastInputType_0 ~= Enum.UserInputType.MouseButton1 then
            v242 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Touch;
        end;
        local v243 = v237._currentSubMenu:get();
        if v243 and v243 ~= v238 and not v242 then
            v237:toggleSubMenu(v243);
        end;
        v237._selectedItemIdx = v240;
        v237._selectedItem:set(v238);
        return;
    end;
end;
v37.setSelectedByOffset = function(v244, v245) --[[ Line: 1210 ]] --[[ Name: setSelectedByOffset ]]
    local v246 = v244._menuList:get();
    local _, v248 = v244:withinCurrentTopLevelMenu(v244._selectedItem:get() or "");
    if v248 > 0 then
        v244:setSelected(v246[math.clamp(v248 + v245, 1, #v246)].id);
    end;
end;
v37.repairSelected = function(v249) --[[ Line: 1220 ]] --[[ Name: repairSelected ]]
    if v249._selectedItem:get() then
        local _, v251 = v249:withinCurrentTopLevelMenu(v249._selectedItem:get() or "");
        if v251 == 0 then
            v251 = v249._selectedItemIdx;
        end;
        local v252 = v249._menuList:get();
        v249:setSelected(v252[math.clamp(v251, 1, #v252)].id);
    end;
end;
v37.configureOrderAlignment = function(v253, v254) --[[ Line: 1234 ]] --[[ Name: configureOrderAlignment ]]
    if v253._orderAlignment:get() ~= v254 then
        v253._orderAlignment:set(v254);
        v253:updateMenuList();
    end;
end;
v37.orderAlignment = function(v255) --[[ Line: 1241 ]] --[[ Name: orderAlignment ]]
    return v255._orderAlignment;
end;
v37.setMenuAbsolutePosition = function(v256, v257) --[[ Line: 1245 ]] --[[ Name: setMenuAbsolutePosition ]]
    if v257 ~= v256._menuAbsolutePosition then
        v256._menuAbsolutePosition = v257;
        v256._layout:set(createUnibarLayoutInfo(v257, v256._menuAbsoluteSizeOpen));
    end;
end;
v37.setMenuAbsoluteSize = function(v258, v259) --[[ Line: 1252 ]] --[[ Name: setMenuAbsoluteSize ]]
    if v259 ~= v258._menuAbsoluteSizeOpen then
        v258._menuAbsoluteSizeOpen = v259;
        v258._layout:set(createUnibarLayoutInfo(v258._menuAbsolutePosition, v259));
    end;
end;
v37.layout = function(v260) --[[ Line: 1259 ]] --[[ Name: layout ]]
    return v260._layout;
end;
return v37;