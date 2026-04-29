local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local reverse = require(CorePackages.Packages.LuauPolyfill).Array.reverse
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local AppCommonLib = require(CorePackages.Workspace.Packages.AppCommonLib)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local Chrome = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetPlacement = Chrome.Enums.SideSheetPlacement
local Signal = AppCommonLib.Signal
local FocusUtils = Chrome.FocusUtils
local FocusOnChromeSignal = FocusUtils.FocusOnChromeSignal
local FocusOffChromeSignal = FocusUtils.FocusOffChromeSignal
local ChromeUtils = require(ChromeShared.Service.ChromeUtils)
local LocalStore = require(ChromeShared.Service.LocalStore)
local ViewportUtil = require(ChromeShared.Service.ViewportUtil)
local WindowSizeSignal = require(ChromeShared.Service.WindowSizeSignal)
local ObservableValue = ChromeUtils.ObservableValue
local NotifySignal = ChromeUtils.NotifySignal
local AvailabilitySignal = ChromeUtils.AvailabilitySignal
local Constants = require(ChromeShared.Unibar.Constants)
local ShortcutService = require(ChromeShared.Service.ShortcutService)
local FFlagEnableConsoleExpControls = SharedFlags.FFlagEnableConsoleExpControls
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagIntegrationsChromeShortcutTelemetry = require(ChromeShared.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local v28 = game:DefineFastFlag("ChromeDeprecateMRUs", false)
local FFlagEnableSideSheet = SharedFlags.FFlagEnableSideSheet
local FFlagRequireSideSheetPackage = SharedFlags.FFlagRequireSideSheetPackage
local FFlagAddIGMToSideSheet = SharedFlags.FFlagAddIGMToSideSheet
local FFlagEnableChromeWindowsNotInMenu = require(ChromeShared.Flags).FFlagEnableChromeWindowsNotInMenu
local toggleSideSheet = nil
local getSideSheetVisibility = nil
local registerSideSheetIntegrations = nil

if FFlagRequireSideSheetPackage then
	local InExperienceSideSheet = require(CorePackages.Workspace.Packages.InExperienceSideSheet)

	toggleSideSheet = InExperienceSideSheet.toggleSideSheet
	getSideSheetVisibility = InExperienceSideSheet.getSideSheetVisibility
	registerSideSheetIntegrations = InExperienceSideSheet.registerSideSheetIntegrations
end

local t1 = {}

t1.__index = t1
t1.AvailabilitySignal = ChromeUtils.AvailabilitySignalState
t1.IntegrationStatus = {
	None = 0,
	Icon = 1,
	Window = 2
}

function noop() -- line: 101
end

local t2 = {
	id = "div",
	label = "div",
	initialAvailability = t1.AvailabilitySignal.Unavailable,
	availability = AvailabilitySignal.new(t1.AvailabilitySignal.Unavailable),
	notification = NotifySignal.new(),
	components = {},
	hideNotificationCountWhileOpen = false,
	sideSheetPlacement = if not FFlagEnableSideSheet then nil else SideSheetPlacement.None
}

function createUnibarLayoutInfo(vector2: Vector2, vector2_2: Vector2) -- line: 245
	return Rect.new(vector2, vector2 + vector2_2)
end
function t1.new() -- line: 249
	-- upvalues: LocalizationService (copy), FFlagEnableConsoleExpControls (copy), ShortcutService (copy), ChromeUtils (copy), ObservableValue (copy), NotifySignal (copy), Localization (copy), Signal (copy), isInExperienceUIVREnabled (copy), t1 (copy), ViewportUtil (copy), v28 (copy), FocusOnChromeSignal (copy), FocusOffChromeSignal (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local t3 = {
		_shortcutService = if not FFlagEnableConsoleExpControls then nil else ShortcutService.new(),
		_layout = ChromeUtils.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero)),
		_menuAbsolutePosition = Vector2.zero,
		_menuAbsoluteSizeOpen = Vector2.zero,
		_currentSubMenu = ChromeUtils.ObservableValue.new(nil),
		_selectedItem = ChromeUtils.ObservableValue.new(nil),
		_selectedItemIdx = 0,
		_integrations = {},
		_integrationsConnections = {},
		_integrationsStatus = {},
		_menuConfig = {},
		_subMenuConfig = {},
		_subMenuNotifications = {},
		_menuList = ObservableValue.new({}),
		_windowList = ObservableValue.new({}),
		_dragConnection = {},
		_windowPositions = ObservableValue.new({}),
		_totalNotifications = NotifySignal.new(true),
		_mostRecentlyUsedAndPinnedLimit = -1,
		_localization = Localization.new(RobloxLocaleId),
		_localizedLabelKeys = {},
		_currentShortcutBar = ObservableValue.new(nil),
		_notificationIndicator = ObservableValue.new(nil),
		_orderAlignment = ObservableValue.new(Enum.HorizontalAlignment.Left),
		_onIntegrationRegistered = Signal.new(),
		_onIntegrationActivated = Signal.new(),
		_onIntegrationStatusChanged = Signal.new(),
		_onIntegrationHovered = Signal.new(),
		_triggerMenuIcon = Signal.new(),
		_triggerVRToggleButton = if not isInExperienceUIVREnabled then nil else Signal.new(),
		_topBarVisibility = if not isInExperienceUIVREnabled then nil else ObservableValue.new(nil),
		_inFocusNav = ObservableValue.new(false)
	}
	local v43 = setmetatable(t3, t1)

	ViewportUtil.viewport:connect(function(p1) -- line: 292
		-- upvalues: v28 (copy), v43 (copy)
		if v28 then
			v43:updateWindowSizeSignals()

			return
		end

		v43:updateScreenSize(p1.size, p1.isMobileDevice, p1.portraitOrientation, p1.tinyPortrait)
	end, true)

	if FFlagEnableConsoleExpControls then
		t3._shortcutService.onShortcutBarChanged:connect(function(p2) -- line: 306
			-- upvalues: v43 (copy)
			v43._currentShortcutBar:set(p2)
		end)
	end

	FocusOnChromeSignal:connect(function(p3) -- line: 310
		-- upvalues: t3 (copy), v43 (copy)
		if p3 and not t3._subMenuConfig.nine_dot[p3] then
			v43:setSelected(p3)
		end

		v43:enableFocusNav()
	end)
	FocusOffChromeSignal:connect(function() -- line: 317
		-- upvalues: v43 (copy), FFlagEnableConsoleExpControls (copy)
		v43:disableFocusNav()

		if FFlagEnableConsoleExpControls then
			v43:setShortcutBar(nil)
		end
	end)

	return v43
end
function t1.storeChromeInteracted(_) -- line: 329
	-- upvalues: LocalStore (copy)
	if LocalStore.isEnabled() then
		LocalStore.storeForLocalPlayer("ChromeInteracted3", true)
	end
end
function t1.updateScreenSize(t4: {[any]: any}, _: Vector2, b1: boolean, b2: boolean, b3: boolean) -- line: 335
	-- upvalues: Constants (copy)
	local v50 = if not b1 then Constants.NON_MOBILE_SLOTS - Constants.CORE_SLOTS else if not b3 then if not b2 then Constants.MOBILE_LANDSCAPE_SLOTS - Constants.CORE_SLOTS else Constants.MOBILE_PORTRAIT_SLOTS - Constants.CORE_SLOTS else Constants.MOBILE_TINY_PORTRAIT_SLOTS - Constants.CORE_SLOTS

	if v50 ~= t4._mostRecentlyUsedAndPinnedLimit then
		t4._mostRecentlyUsedAndPinnedLimit = v50
		t4:updateMenuList()
		t4:updateNotificationTotals()
	end

	t4:updateWindowSizeSignals()
end
function t1.updateWindowSizeSignals(p5) -- line: 371
	for _, v53 in p5._integrations do
		if v53.windowSize then
			v53.windowSize:updateConstraints()
		end
	end
end
function t1.notificationIndicator(p6) -- line: 379
	return p6._notificationIndicator
end
function t1.toggleSubMenu(p7, p8) -- line: 383
	-- upvalues: FFlagEnableSideSheet (copy), toggleSideSheet (ref)
	if FFlagEnableSideSheet and toggleSideSheet then
		toggleSideSheet(true)

		return
	end

	if not p7._subMenuConfig[p8] then
		warn("Not a valid subMenuId:" .. p8)

		return
	end

	if p8 == p7._currentSubMenu:get() then
		p7._currentSubMenu:set(nil)

		return
	end

	p7._currentSubMenu:set(p8)
end
function t1.currentSubMenu(p9) -- line: 403
	return p9._currentSubMenu
end
function t1.inFocusNav(p10) -- line: 407
	return p10._inFocusNav
end
function t1.enableFocusNav(p11) -- line: 411
	-- upvalues: GamepadService (copy), FFlagEnableConsoleExpControls (copy), Constants (copy)
	if GamepadService.GamepadCursorEnabled then
		return
	end

	if not p11._inFocusNav:get() then
		p11._inFocusNav:set(true)
	end

	if FFlagEnableConsoleExpControls then
		p11:setShortcutBar(Constants.UNIBAR_SHORTCUTBAR_ID)
	end
end
function t1.disableFocusNav(p12) -- line: 424
	-- upvalues: GamepadService (copy)
	if GamepadService.GamepadCursorEnabled then
		return
	end

	if p12._inFocusNav:get() then
		p12._inFocusNav:set(false)
		p12._selectedItem:set(nil)
		p12._currentSubMenu:set(nil)
	end
end
function t1.toggleWindow(p13, p14) -- line: 436
	-- upvalues: t1 (copy), LocalStore (copy)
	if p13._integrations[p14].components.Window then
		if not p13._integrationsStatus[p14] or p13._integrationsStatus[p14] == t1.IntegrationStatus.None or p13._integrationsStatus[p14] == t1.IntegrationStatus.Icon then
			p13._integrationsStatus[p14] = t1.IntegrationStatus.Window
		else
			p13._integrationsStatus[p14] = t1.IntegrationStatus.Icon
		end

		p13._onIntegrationStatusChanged:fire(p14, p13._integrationsStatus[p14])
	end

	if LocalStore.isEnabled() and p13._integrations[p14] and p13._integrations[p14].persistWindowState then
		local v63 = LocalStore.loadForLocalPlayer("ChromeWindowStatus") or {}

		v63[p14] = p13._integrationsStatus[p14] == t1.IntegrationStatus.Window
		LocalStore.storeForLocalPlayer("ChromeWindowStatus", v63)
	end

	p13:updateMenuList()
end
function t1.isWindowOpen(p15, p16) -- line: 462
	-- upvalues: t1 (copy)
	return p15._integrations[p16].components.Window and p15._integrationsStatus[p16] == t1.IntegrationStatus.Window
end
function t1.menuList(p17) -- line: 466
	return p17._menuList
end
function t1.windowList(p18) -- line: 470
	return p18._windowList
end
function t1.dragConnection(p19, p20) -- line: 474
	if p19._integrations[p20] then
		return p19._dragConnection[p20]
	end

	return nil
end
function t1.updateLocalization(p21, p22) -- line: 482
	local s1 = ""

	p21._localizedLabelKeys[p22.id] = {}
	p21._localizedLabelKeys[p22.id].label = p22.label

	local label = p22.label
	local ok, result = pcall(function() -- line: 493
		-- upvalues: label (ref), p21 (copy)
		label = p21._localization:Format(label)
	end)

	if not ok then
		label = p22.label
		warn(result)
	end

	p22.label = label

	if p22.secondaryAction then
		p21._localizedLabelKeys[p22.id].secondaryActionLabel = p22.secondaryAction.label
		s1 = p22.secondaryAction.label

		local ok2, result2 = pcall(function() -- line: 507
			-- upvalues: s1 (ref), p21 (copy)
			s1 = p21._localization:Format(s1)
		end)

		if not ok2 then
			s1 = p22.secondaryAction.label
			warn(result2)
		end

		p22.secondaryAction.label = s1
	end

	return p22
end
function t1.register(p23, p24) -- line: 522
	-- upvalues: FFlagEnableSideSheet (copy), SideSheetPlacement (copy), t1 (copy), AvailabilitySignal (copy), NotifySignal (copy), WindowSizeSignal (copy), Constants (copy), FFlagEnableConsoleExpControls (copy), GamepadService (copy)
	if p23._integrations[p24.id] then
		warn(string.format(p24.id .. "already registered", debug.traceback()))

		for _, v82 in p23._integrationsConnections[p24.id] do
			v82:disconnect()
		end
	end

	p23._integrationsConnections[p24.id] = {}

	local v83 = p23._integrationsConnections[p24.id]

	if FFlagEnableSideSheet and p24.sideSheetPlacement == nil then
		p24.sideSheetPlacement = SideSheetPlacement.Vertical
	end

	if p24.initialAvailability == nil then
		p24.initialAvailability = t1.AvailabilitySignal.Unavailable
	end

	if p24.availability == nil then
		p24.availability = AvailabilitySignal.new(p24.initialAvailability or t1.AvailabilitySignal.Unavailable)
	end

	if p24.notification == nil then
		p24.notification = NotifySignal.new()
	end

	if p24.components == nil then
		p24.components = {}
	end

	if p24.availability then
		v83[#v83 + 1] = p24.availability:connect(function() -- line: 557
			-- upvalues: p23 (copy), p24 (ref)
			p23:availabilityChanged(p24)
		end)
	end

	if p24.notification and not p24.notification:excludeFromTotalCounts() then
		v83[#v83 + 1] = p24.notification:connect(function() -- line: 563
			-- upvalues: p23 (copy)
			p23:updateNotificationTotals()
		end)
	end

	if p24.windowSize == nil and p24.components and p24.components.Window then
		p24.windowSize = WindowSizeSignal.new()
	end

	if t1:getWindowStatusFromStore(p24.id) and p24.persistWindowState or p24.windowDefaultOpen then
		p23._integrationsStatus[p24.id] = t1.IntegrationStatus.Window
		p23._onIntegrationStatusChanged:fire(p24.id, p23._integrationsStatus[p24.id])
	end

	local uDim2 = UDim2.fromOffset(Constants.MENU_ICON_SCREEN_SIDE_OFFSET, Constants.WINDOW_DEFAULT_PADDING)

	if p24.startingWindowPosition then
		uDim2 = if not p24.persistWindowState then p24.startingWindowPosition else p23:getWindowPositionFromStore(p24.id) or p24.startingWindowPosition
	end

	p23._windowPositions[p24.id] = uDim2
	p24 = p23:updateLocalization(p24)

	local v85 = p24

	p23._integrations[p24.id] = v85

	if FFlagEnableConsoleExpControls and p24.selected then
		v83[#v83 + 1] = p23:selectedItem():connect(function(p25) -- line: 597
			-- upvalues: v85 (copy), GamepadService (copy), p24 (ref)
			if p25 == v85.id then
				if GamepadService.GamepadCursorEnabled then
					return
				end

				p24.selected(v85)
			end
		end)
	end

	return v85
end
function t1.createIconProps(t5: {[any]: any}, p26, n1: number?) -- line: 610
	-- upvalues: t2 (copy)
	local v89 = n1 or 0

	if t5._integrations[p26] then
		return {
			id = p26,
			children = {},
			order = v89,
			component = t5._integrations[p26].components.Icon,
			integration = t5._integrations[p26],
			isDivider = false,
			activated = function() --[[ activated ]] -- line: 620
				-- upvalues: t5 (copy), p26 (copy)
				t5:activate(p26)
			end
		}
	end

	return {
		id = p26,
		children = {},
		order = v89,
		activated = noop,
		integration = t2
	}
end
function reverseOrder(p27) -- line: 635
	local v91 = #p27
	local t6 = {}

	for i = 1, v91 do
		t6[i] = p27[i].order
	end

	for i = 1, v91 do
		p27[i].order = t6[v91 - i + 1]
	end
end
function t1.isIntegrationValid(p28, p29) -- line: 646
	-- upvalues: t1 (copy)
	local v97 = p28._integrations[p29]

	if v97 then
		local availability = v97.availability

		return availability and availability:get() ~= t1.AvailabilitySignal.Unavailable
	end

	return false
end
function t1.updateMenuList(p30) -- line: 659
	-- upvalues: t2 (copy), FFlagEnableSideSheet (copy), reverse (copy), FFlagEnableChromeWindowsNotInMenu (copy)
	local n2 = 0
	local n3 = 0

	local function iconProps(p31) -- line: 663
		-- upvalues: n3 (ref), p30 (copy)
		n3 += 1

		return p30:createIconProps(p31, n3)
	end
	local function windowProps(p32) -- line: 668
		-- upvalues: n3 (ref), p30 (copy), t2 (copy)
		n3 += 1

		if p30._integrations[p32] then
			return {
				id = p32,
				children = {},
				order = n3,
				component = p30._integrations[p32].components.Window,
				activated = noop,
				integration = p30._integrations[p32]
			}
		end

		return {
			id = p32,
			children = {},
			order = n3,
			activated = noop,
			integration = t2
		}
	end
	local function divider(_) -- line: 690
		-- upvalues: n2 (ref), n3 (ref), t2 (copy)
		n2 += 1
		n3 += 1

		return {
			id = "DIV" .. n2,
			order = n3,
			isDivider = true,
			children = {},
			activated = noop,
			integration = t2
		}
	end
	local function collectMenu(p34, p35, p36) -- line: 703
		-- upvalues: divider (copy), n2 (ref), collectMenu (copy), FFlagEnableSideSheet (copy), p30 (copy), n3 (ref), windowProps (copy), iconProps (copy)
		local n4 = 0

		for k, v in pairs(p34) do
			if type(v) == "table" then
				if not #p35.children then
					table.insert(p35.children, (divider(n2)))
				end

				if collectMenu(v, p35, p36) > 0 then
					table.insert(p35.children, (divider(n2)))
				end
			else
				if typeof(v) ~= "string" then
					error(`Only tables or strings should be passed into the items list, received { v } (at key { k })`)
				end

				if not FFlagEnableSideSheet and p30._subMenuConfig[v] then
					if p30:isIntegrationValid(v) then
						n3 += 1

						local v258 = p30:createIconProps(v, n3)

						n4 += 1
						collectMenu(p30._subMenuConfig[v], v258, p36)

						if #v258.children > 0 then
							table.insert(p35.children, v258)
						end
					end
				elseif p30:isIntegrationValid(v) then
					if p30:isWindowOpen(v) then
						table.insert(p36, (windowProps(v)))
						table.insert(p35.children, iconProps(v))
						n4 += 1
					else
						table.insert(p35.children, iconProps(v))
						n4 += 1
					end
				end
			end
		end

		return n4
	end

	local t7 = {
		children = {}
	}
	local t8 = {}

	collectMenu(p30._menuConfig, t7, t8)

	if #t7.children and (t7.children[#t7.children] and t7.children[#t7.children].isDivider) then
		table.remove(t7.children, #t7.children)
	end

	if p30._orderAlignment:get() == Enum.HorizontalAlignment.Left then
		t7.children = reverse(t7.children)
		reverseOrder(t7.children)
	end

	if FFlagEnableChromeWindowsNotInMenu then
		local t9 = {}

		for _, v110 in t8 do
			t9[v110.id] = true
		end

		for v111, _ in p30._integrations do
			if p30:isWindowOpen(v111) and not t9[v111] then
				table.insert(t8, (windowProps(v111)))
			end
		end
	end

	p30._menuList:set(t7.children)
	p30._windowList:set(t8)
	p30:repairSelected()
end

if FFlagEnableSideSheet then
	function t1.updateSideSheet(p37) -- line: 782
		-- upvalues: SideSheetPlacement (copy), FFlagAddIGMToSideSheet (copy), reverse (copy), registerSideSheetIntegrations (ref)
		local n5 = 0
		local t10 = {}
		local t11 = {}
		local t12 = {}

		local function addIntegration(p38) -- line: 788
			-- upvalues: p37 (copy), SideSheetPlacement (copy), t11 (ref), n5 (ref), FFlagAddIGMToSideSheet (copy), t12 (copy), t10 (copy)
			local v260 = p37._integrations[p38]

			if not v260 or (v260.sideSheetPlacement == SideSheetPlacement.None or not p37:isIntegrationValid(p38)) then
				return
			end

			if v260.sideSheetPlacement == SideSheetPlacement.Unibar then
				table.insert(t11, p37:createIconProps(p38, n5))

				return
			end

			if FFlagAddIGMToSideSheet and v260.sideSheetPlacement == SideSheetPlacement.Page then
				table.insert(t12, p37:createIconProps(p38, n5))

				return
			end

			table.insert(t10, p37:createIconProps(p38, n5))
		end

		for _, v120 in p37._menuConfig do
			for _, v122 in v120 do
				n5 += 1
				addIntegration(v122)
			end
		end

		for _, v124 in p37._subMenuConfig do
			for _, v126 in v124 do
				n5 += 1
				addIntegration(v126)
			end
		end

		if p37._orderAlignment:get() == Enum.HorizontalAlignment.Left then
			t11 = reverse(t11)
		end

		registerSideSheetIntegrations({
			unibarIntegrations = t11,
			verticalIntegrations = t10,
			pageIntegrations = if not FFlagAddIGMToSideSheet then {} else t12
		})
	end
end

function t1.availabilityChanged(p39, _) -- line: 834
	-- upvalues: FFlagEnableSideSheet (copy)
	p39:updateNotificationTotals()
	p39:updateMenuList()

	if FFlagEnableSideSheet then
		p39:updateSideSheet()
	end
end
function t1.subMenuNotifications(p41, p42) -- line: 842
	-- upvalues: NotifySignal (copy)
	if not p41._subMenuNotifications[p42] then
		p41._subMenuNotifications[p42] = NotifySignal.new(true)
	end

	return p41._subMenuNotifications[p42]
end
function t1.totalNotifications(p43) -- line: 849
	return p43._totalNotifications
end
function t1.onIntegrationRegistered(p44) -- line: 853
	return p44._onIntegrationRegistered
end
function t1.onIntegrationActivated(p45) -- line: 857
	return p45._onIntegrationActivated
end
function t1.onIntegrationHovered(p46) -- line: 861
	return p46._onIntegrationHovered
end
function t1.onIntegrationStatusChanged(p47) -- line: 865
	return p47._onIntegrationStatusChanged
end
function t1.integrations(p48) -- line: 869
	return p48._integrations
end
function t1.updateNotificationTotals(p49) -- line: 873
	-- upvalues: t1 (copy)
	local n6 = 0

	for _, v140 in p49._integrations do
		if v140.availability:get() ~= t1.AvailabilitySignal.Unavailable and v140.availability:get() ~= t1.AvailabilitySignal.Pinned and not v140.notification:excludeFromTotalCounts() then
			local v141 = v140.notification:get()

			if v141 and v141.type == "count" then
				assert(typeof(v141.value) == "number", "Expected count value to be number")
				n6 += v141.value
			end
		end
	end

	p49._totalNotifications:fireCount(n6)

	for v142, v143 in p49._subMenuNotifications do
		local v144 = p49:withinCurrentTopLevelMenu(v142)
		local n7 = 0

		if v144 then
			for _, v147 in v144.children do
				if not p49:withinCurrentTopLevelMenu(v147.id) and v147.integration.availability:get() ~= t1.AvailabilitySignal.Unavailable and not v147.integration.notification:excludeFromTotalCounts() then
					local v148 = v147.integration.notification:get()

					if v148 and v148.type == "count" then
						assert(typeof(v148.value) == "number", "Expected count value to be number")
						n7 += v148.value
					end
				end
			end

			v143:fireCount(n7)
		end
	end
end
function t1.configureMenu(p50, p51) -- line: 917
	p50._menuConfig = p51
	p50:updateNotificationTotals()
	p50:updateMenuList()
end
function t1.configureSubMenu(p52, p53, p54) -- line: 923
	-- upvalues: NotifySignal (copy), FFlagEnableSideSheet (copy)
	p52._subMenuConfig[p53] = p54

	if not p52._subMenuNotifications[p53] then
		p52._subMenuNotifications[p53] = NotifySignal.new(true)
	end

	p52:updateNotificationTotals()
	p52:updateMenuList()

	if FFlagEnableSideSheet then
		p52:updateSideSheet()
	end
end

if FFlagEnableConsoleExpControls then
	function t1.registerShortcut(p55, p56) -- line: 936
		-- upvalues: t1 (copy)
		p55._shortcutService:registerShortcut(p56)

		local v156 = p55._shortcutService:getShortcut(p56.id)

		if v156.integration and p55._integrations[v156.integration] then
			local v157 = p55._integrations[v156.integration]

			if v157.availability:get() == t1.AvailabilitySignal.Unavailable then
				v156.availability:unavailable()
			end

			v157.availability:connect(function() -- line: 944
				-- upvalues: v157 (copy), t1 (copy), v156 (copy)
				local v261 = v157.availability:get()

				if v261 == t1.AvailabilitySignal.Unavailable then
					v156.availability:unavailable()

					return
				end

				if v261 == t1.AvailabilitySignal.Available or v261 == t1.AvailabilitySignal.Pinned then
					v156.availability:available()
				end
			end)
		end
	end
	function t1.activateShortcut(p57, p58) -- line: 958
		-- upvalues: FFlagIntegrationsChromeShortcutTelemetry (copy)
		local v160 = p57._shortcutService:getShortcut(p58)

		if v160.integration then
			if not v160.activated then
				if FFlagIntegrationsChromeShortcutTelemetry then
					p57:activate(v160.integration, {
						fromShortcut = true
					})

					return
				end

				p57:activate(v160.integration)

				return
			end

			if FFlagIntegrationsChromeShortcutTelemetry then
				p57._shortcutService:activateShortcut(p58)
				p57._onIntegrationActivated:fire(v160.integration, {
					fromShortcut = true
				})

				return
			end
		else
			p57._shortcutService:activateShortcut(p58)
		end
	end
	function t1.configureShortcutBar(p59, p60, p61) -- line: 978
		p59._shortcutService:configureShortcutBar(p60, p61)
	end
	function t1.setShortcutBar(p62, p63) -- line: 982
		p62._shortcutService:setShortcutBar(p63)
	end
	function t1.getCurrentShortcutBar(p64) -- line: 986
		return p64._currentShortcutBar
	end
	function t1.getShortcutsFromBar(p65, p66) -- line: 990
		return p65._shortcutService:getShortcutsFromBar(p66, p65._integrations)
	end
	function t1.getCurrentShortcuts(p67) -- line: 994
		return p67:getShortcutsFromBar(p67._currentShortcutBar:get())
	end
	function t1.onShortcutBarChanged(p68) -- line: 998
		return p68._shortcutService.onShortcutBarChanged
	end
	function t1.selectMenuIcon(p69) -- line: 1002
		p69._triggerMenuIcon:fire()
	end
	function t1.onTriggerMenuIcon(p70) -- line: 1006
		return p70._triggerMenuIcon
	end
	function t1.setHideShortcutBar(t13: {[any]: any}, p71, b4: boolean?) -- line: 1010
		t13._shortcutService:setHideShortcutBar(p71, b4)
	end
	function t1.getHideShortcutBar(p72) -- line: 1014
		return p72._shortcutService:getHideShortcutBar()
	end
end

if isInExperienceUIVREnabled then
	function t1.onTriggerVRToggleButton(p73) -- line: 1020
		return p73._triggerVRToggleButton
	end
	function t1.showTopBar(p74) -- line: 1024
		return p74._topBarVisibility:get()
	end
	function t1.getTopBarVisibiity(p75) -- line: 1028
		return p75._topBarVisibility
	end
	function t1.connectTopBarVisibility(p76, p77) -- line: 1032
		p76._topBarVisibility = p77
	end
end

function t1.gesture(t14: {[any]: any}, p78, t15: {[any]: any}?, p79) -- line: 1037
	if t14._integrations[p78] then
		t14._dragConnection[p78] = {
			connection = t15,
			inputObject = p79
		}
	end
end
function t1.withinCurrentTopLevelMenu(p80, p81) -- line: 1050
	for v188, v189 in (p80._menuList:get()) do
		if p81 == v189.id then
			return v189, v188
		end
	end

	return nil, 0
end
function t1.withinCurrentSubmenu(p82, p83) -- line: 1060
	local v192 = p82._currentSubMenu:get()

	if not v192 then
		return false
	end

	local children = nil

	for _, v195 in (p82._menuList:get()) do
		if v192 == v195.id then
			children = v195.children

			break
		end
	end

	if not children then
		return false
	end

	for _, v197 in children do
		if p83 == v197.id then
			return true
		end
	end

	return false
end

if FFlagEnableSideSheet then
	function t1.withinOpenSideSheet(p84, p85) -- line: 1090
		-- upvalues: getSideSheetVisibility (ref), SideSheetPlacement (copy)
		if not getSideSheetVisibility() then
			return false
		end

		for _, v201 in p84._integrations do
			if p85 == v201.id and v201.sideSheetPlacement ~= SideSheetPlacement.None then
				return true
			end
		end

		return false
	end
end

function t1.windowPosition(p86, p87) -- line: 1105
	return p86._windowPositions[p87]
end
function t1.updateWindowPosition(t16: {[any]: any}, p88, uDim2: UDim2) -- line: 1109
	-- upvalues: LocalStore (copy)
	if LocalStore.isEnabled() and (t16._integrations[p88] and t16._integrations[p88].persistWindowState) then
		local v207 = LocalStore.loadForLocalPlayer("ChromeWindowPosition") or {}

		v207[p88] = {
			uDim2.X.Scale,
			uDim2.X.Offset,
			uDim2.Y.Scale,
			uDim2.Y.Offset
		}
		LocalStore.storeForLocalPlayer("ChromeWindowPosition", v207)
	end

	t16._windowPositions[p88] = uDim2
end
function t1.getWindowStatusFromStore(_, p90) -- line: 1122
	-- upvalues: LocalStore (copy)
	if LocalStore.isEnabled() then
		return (LocalStore.loadForLocalPlayer("ChromeWindowStatus") or {})[p90] or false
	end

	return nil
end
function t1.getWindowPositionFromStore(_, p92) -- line: 1132
	-- upvalues: LocalStore (copy)
	if LocalStore.isEnabled() then
		local v212 = (LocalStore.loadForLocalPlayer("ChromeWindowPosition") or {})[p92] or nil

		if v212 then
			return (UDim2.new(v212[1], v212[2], v212[3], v212[4]))
		end

		return nil
	end

	return nil
end
function t1.activate(p93, p94, p95) -- line: 1143
	-- upvalues: FFlagIntegrationsChromeShortcutTelemetry (copy), FFlagEnableConsoleExpControls (copy)
	local v216 = nil

	if p93._integrations[p94] then
		local activated = p93._integrations[p94].activated

		if FFlagIntegrationsChromeShortcutTelemetry then
			p93._onIntegrationActivated:fire(p94, p95)
		else
			p93._onIntegrationActivated:fire(p94)
		end

		p93:storeChromeInteracted()

		if activated then
			local ok, result = pcall(function() -- line: 1159
				-- upvalues: activated (copy), p93 (copy), p94 (copy), FFlagEnableConsoleExpControls (copy)
				activated(p93._integrations[p94])

				if not FFlagEnableConsoleExpControls then
					p93:disableFocusNav()
				end
			end)

			if not ok then
				warn("ChromeService: activate error thrown for " .. p94)
				v216 = result
			end
		else
			if p93._subMenuConfig[p94] then
				p93:toggleSubMenu(p94)
			end

			p93:toggleWindow(p94)
		end

		if p94 ~= p93._currentSubMenu:get() then
			p93._currentSubMenu:set(nil)
		end
	end

	if v216 then
		error(v216)
	end
end
function t1.selectedItem(p96) -- line: 1187
	return p96._selectedItem
end
function t1.setSelected(p97, p98) -- line: 1191
	-- upvalues: UserInputService (copy)
	local v223, v224 = p97:withinCurrentTopLevelMenu(p98 or "")

	if not v223 then
		return
	end

	local LastInputType = UserInputService:GetLastInputType()
	local v226 = LastInputType == Enum.UserInputType.MouseButton1 or LastInputType == Enum.UserInputType.Touch
	local v227 = p97._currentSubMenu:get()

	if v227 and v227 ~= p98 and not v226 then
		p97:toggleSubMenu(v227)
	end

	p97._selectedItemIdx = v224
	p97._selectedItem:set(p98)
end
function t1.setSelectedByOffset(t17: {[any]: any}, n8: number) -- line: 1209
	local v230 = t17._menuList:get()
	local _, v232 = t17:withinCurrentTopLevelMenu(t17._selectedItem:get() or "")

	if v232 > 0 then
		t17:setSelected(v230[math.clamp(v232 + n8, 1, #v230)].id)
	end
end
function t1.repairSelected(p99) -- line: 1219
	if p99._selectedItem:get() then
		local _, v235 = p99:withinCurrentTopLevelMenu(p99._selectedItem:get() or "")

		if v235 == 0 then
			v235 = p99._selectedItemIdx
		end

		local v236 = p99._menuList:get()

		p99:setSelected(v236[math.clamp(v235, 1, #v236)].id)
	end
end
function t1.configureOrderAlignment(p100, p101) -- line: 1233
	if p101 ~= p100._orderAlignment:get() then
		p100._orderAlignment:set(p101)
		p100:updateMenuList()
	end
end
function t1.orderAlignment(p102) -- line: 1240
	return p102._orderAlignment
end
function t1.setMenuAbsolutePosition(t18: {[any]: any}, vector2: Vector2) -- line: 1244
	if vector2 ~= t18._menuAbsolutePosition then
		t18._menuAbsolutePosition = vector2
		t18._layout:set(createUnibarLayoutInfo(vector2, t18._menuAbsoluteSizeOpen))
	end
end
function t1.setMenuAbsoluteSize(t19: {[any]: any}, vector2: Vector2) -- line: 1251
	if vector2 ~= t19._menuAbsoluteSizeOpen then
		t19._menuAbsoluteSizeOpen = vector2
		t19._layout:set(createUnibarLayoutInfo(t19._menuAbsolutePosition, vector2))
	end
end
function t1.layout(p103) -- line: 1258
	return p103._layout
end

return t1
