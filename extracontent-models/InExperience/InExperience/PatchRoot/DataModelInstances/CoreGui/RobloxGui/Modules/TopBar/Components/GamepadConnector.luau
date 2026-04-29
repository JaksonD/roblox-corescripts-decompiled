local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local AppCommonLib = require(CorePackages.Workspace.Packages.AppCommonLib)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local v9 = Responsive.GetInputModeStore(false)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local PlayerList = require(CorePackages.Workspace.Packages.PlayerList)
local Signals = require(CorePackages.Packages.Signals)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlags.FFlagEnableConsoleExpControls
local FFlagShowUnibarOnVirtualCursor = SharedFlags.FFlagShowUnibarOnVirtualCursor
local FFlagConsoleChatUseChromeFocusUtils = SharedFlags.FFlagConsoleChatUseChromeFocusUtils
local FFlagExperienceMenuGamepadExposureEnabled = SharedFlags.FFlagExperienceMenuGamepadExposureEnabled
local FFlagDisableGamepadConnectorInVR = require(CorePackages.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR
local FFlagAddNewPlayerListFocusNav = PlayerList.Flags.FFlagAddNewPlayerListFocusNav
local FFlagAddNewPlayerListMobileFocusNav = PlayerList.Flags.FFlagAddNewPlayerListMobileFocusNav
local ParentParent = script.Parent.Parent.Parent
local TopBar = ParentParent.TopBar
local FFlagAddTopBarScrim = require(TopBar.Flags.FFlagAddTopBarScrim)
local FFlagSetUnibarShortcutOnTopBarFocus = require(CorePackages.Workspace.Packages.Chrome).Flags.FFlagSetUnibarShortcutOnTopBarFocus
local isSpatial = AppCommonLib.isSpatial
local LogGamepadOpenExperienceControlsMenu = require(TopBar:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu
local Chrome = ParentParent.Chrome
local v29 = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local v30 = if not v29 then nil else require(Chrome.Service)
local ChromeUtils = require(Chrome.ChromeShared.Service.ChromeUtils)
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local v33 = if not v29 or not FFlagEnableConsoleExpControls then nil else ChromeUtils.ObservableValue
local v34 = if not v29 then nil else require(Chrome.ChromeShared.Unibar.Constants)
local ToastNotificationConstants = require(CorePackages.Workspace.Packages.ToastNotification).ToastNotificationConstants
local Constants = require(script.Parent.Parent.Constants)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local PlayerList2 = ParentParent.PlayerList
local PlayerListManager = require(PlayerList2.PlayerListManager)
local MenuIconSelectedSignal = FocusUtils.MenuIconSelectedSignal
local CoreGuiCommon = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagEnableUISelector = CoreGuiCommon.Flags.FFlagEnableUISelector
local v43 = if not FFlagEnableUISelector then nil else CoreGuiCommon.Stores.GetUiSelectorSignalStore
local v44 = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local ToastNotification = nil
local u46 = nil
local u47 = nil

task.spawn(function() -- line: 68
	-- upvalues: ToastNotification (ref), CoreGui (copy), u46 (ref), u47 (ref)
	ToastNotification = CoreGui:WaitForChild("ToastNotification", 3)
	u46 = if ToastNotification == nil then nil else ToastNotification:WaitForChild("ToastNotificationWrapper", 3)
	u47 = if u46 == nil then nil else u46:FindFirstChild("Toast", true)
end)

local t1 = {}

t1.__index = t1

function t1.new() -- line: 146
	-- upvalues: GuiService (copy), v30 (copy), v29 (copy), FFlagEnableConsoleExpControls (copy), v33 (copy), UserInputService (copy), Constants (copy), FFlagAddNewPlayerListFocusNav (copy), SettingsShowSignal (copy), PlayerListManager (copy), FFlagAddNewPlayerListMobileFocusNav (copy), FFlagDisableGamepadConnectorInVR (copy), isSpatial (copy), FFlagEnableUISelector (copy), v43 (copy), FFlagShowUnibarOnVirtualCursor (copy), GamepadService (copy), MenuIconSelectedSignal (copy), FFlagAddTopBarScrim (copy), Signals (copy), t1 (copy)
	local t2 = {
		_loggedExperienceMenuGamepadExposure = false,
		_devSetCoreGuiNavEnabled = GuiService.CoreGuiNavigationEnabled,
		_chromeFocused = not not v30 and v30:inFocusNav(),
		_lastMenuButtonPress = 0,
		_dismissFocusConnections = {}
	}
	local g61 = nil
	local v60 = nil
	local v55

	if v29 and FFlagEnableConsoleExpControls then
		local v54 = v33.new(GuiService.SelectedCoreObject)

		GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() -- line: 126
			-- upvalues: v54 (copy), GuiService (copy)
			v54:set(GuiService.SelectedCoreObject)
		end)
		v55 = v54
	else
		v55 = nil
	end

	t2._selectedCoreObject = v55
	t2._connections = {}

	if v29 and FFlagEnableConsoleExpControls then
		local new = v33.new
		local LastInputType = UserInputService:GetLastInputType()

		for _, v59 in Constants.GamepadInputTypes do
			if LastInputType == v59 then
				v60 = true
				g61 = true
			end

			if g61 then
				break
			end
		end

		if not g61 then
			v60 = false
		end

		g61 = false
		t2._gamepadActive = new(v60)
		t2._tiltMenuOpen = v33.new(false)
		t2._playerListModalOpen = if not FFlagAddNewPlayerListFocusNav then nil else v33.new(false)
		t2._showTopBar = v33.new(true)
		UserInputService.LastInputTypeChanged:Connect(function(p1) -- line: 165
			-- upvalues: t2 (copy), Constants (copy)
			local _gamepadActive = t2._gamepadActive
			local g101 = nil
			local v100 = nil

			for _, v99 in Constants.GamepadInputTypes do
				if p1 == v99 then
					v100 = true
					g101 = true
				end

				if g101 then
					break
				end
			end

			if not g101 then
				v100 = false
			end

			g101 = false
			_gamepadActive:set(v100)
		end)
		SettingsShowSignal:connect(function(p2) -- line: 169
			-- upvalues: t2 (copy)
			t2._tiltMenuOpen:set(p2)
		end)

		if FFlagAddNewPlayerListFocusNav then
			PlayerListManager:GetVisibilityChangedEvent().Event:Connect(function() -- line: 174
				-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy), PlayerListManager (copy), t2 (copy)
				local v103 = not FFlagAddNewPlayerListMobileFocusNav or PlayerListManager:GetIsModal()

				t2._playerListModalOpen:set(v103 and PlayerListManager:GetVisibility())
			end)
		end

		if not FFlagDisableGamepadConnectorInVR or not isSpatial() then
			local function v62() -- line: 181
				-- upvalues: t2 (copy), FFlagEnableUISelector (copy), v43 (copy), UserInputService (copy), FFlagAddNewPlayerListFocusNav (copy), FFlagShowUnibarOnVirtualCursor (copy), GamepadService (copy), GuiService (copy)
				local v104 = not t2._gamepadActive:get() or (t2._chromeFocused:get() or (t2._selectedCoreObject:get() ~= nil and (not FFlagEnableUISelector or not v43(false).getVisibility()) or (UserInputService.TouchEnabled or (t2._tiltMenuOpen:get() or (FFlagAddNewPlayerListFocusNav and t2._playerListModalOpen:get() or (FFlagShowUnibarOnVirtualCursor and GamepadService.GamepadCursorEnabled or GamepadService.GamepadCursorEnabled))))))

				t2._showTopBar:set(v104)

				if v104 then
					GuiService.CoreGuiNavigationEnabled = true

					return
				end

				GuiService.CoreGuiNavigationEnabled = t2._devSetCoreGuiNavEnabled
			end

			t2._selectedCoreObject:connect(v62)
			t2._chromeFocused:connect(v62)
			t2._tiltMenuOpen:connect(v62)
			GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(v62)
			t2._gamepadActive:connect(v62, true)
		end
	end

	if FFlagEnableConsoleExpControls then
		GuiService:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() -- line: 207
			-- upvalues: t2 (copy), GuiService (copy)
			t2._devSetCoreGuiNavEnabled = GuiService.CoreGuiNavigationEnabled
		end)
	end

	function t2._isTopBarFocused() -- line: 211
		-- upvalues: GamepadService (copy), t2 (copy), MenuIconSelectedSignal (copy)
		if GamepadService.GamepadCursorEnabled then
			return false
		end

		return t2._chromeFocused:get() or MenuIconSelectedSignal:get()
	end

	if FFlagAddTopBarScrim then
		local v63 = t2._isTopBarFocused()
		local v64, v65 = Signals.createSignal(v63)

		t2._topBarFocused = v64
		t2._setTopBarFocused = v65
	end

	return (setmetatable(t2, t1))
end
function t1.connectToTopbar(p3) -- line: 226
	-- upvalues: v29 (copy), FFlagEnableConsoleExpControls (copy), ContextActionService (copy), GuiService (copy), FFlagAddTopBarScrim (copy), FFlagSetUnibarShortcutOnTopBarFocus (copy), v30 (copy), v34 (copy), MenuIconSelectedSignal (copy)
	if v29 then
		if FFlagEnableConsoleExpControls then
			p3:disconnectFromTopbar()
		end

		ContextActionService:BindCoreAction("FocusGamepadToTopbar", p3:_bindSelf(p3._toggleTopbar), false, Enum.KeyCode.ButtonStart)

		local function v67() -- line: 237
			-- upvalues: p3 (copy), GuiService (copy), FFlagAddTopBarScrim (copy), FFlagSetUnibarShortcutOnTopBarFocus (copy), v30 (copy), v34 (copy)
			local v105 = p3:_isTopBarFocused()

			GuiService:SetMenuIsOpen(v105, "TopbarMenu")

			if FFlagAddTopBarScrim then
				p3._setTopBarFocused(v105)
			end

			if v105 then
				if FFlagSetUnibarShortcutOnTopBarFocus then
					v30:setShortcutBar(v34.UNIBAR_SHORTCUTBAR_ID)
				end

				p3:_addDismissFocusConnections()

				return
			end

			p3:_removeDismissFocusConnections()
		end

		table.insert(p3._connections, p3._chromeFocused:connect(v67))
		table.insert(p3._connections, MenuIconSelectedSignal:connect(v67))
	end
end
function t1.disconnectFromTopbar(p4) -- line: 259
	-- upvalues: ContextActionService (copy)
	for _, v70 in p4._connections do
		v70:disconnect()
	end

	p4._connections = {}
	p4:_removeDismissFocusConnections()
	ContextActionService:UnbindCoreAction("FocusGamepadToTopbar")
end
function t1.getSelectedCoreObject(p5) -- line: 269
	return p5._selectedCoreObject
end
function t1.getShowTopBar(p6) -- line: 273
	return p6._showTopBar
end
function t1.getGamepadActive(p7) -- line: 277
	return p7._gamepadActive
end
function t1.topBarFocused(p8, p9) -- line: 281
	-- upvalues: FFlagAddTopBarScrim (copy)
	if not FFlagAddTopBarScrim then
		return
	end

	return p8._topBarFocused(p9)
end
function t1._addDismissFocusConnections(p10) -- line: 289
	-- upvalues: UserInputService (copy), v9 (copy), Responsive (copy)
	p10._dismissFocusConnections = { (UserInputService.InputEnded:Connect(function(input, b1: boolean) -- line: 291
		-- upvalues: v9 (copy), Responsive (copy), p10 (copy)
		local v108 = v9.getLastInputType(false)
		local v109 = v108 == Responsive.Input.Pointer and input.UserInputType ~= Enum.UserInputType.Keyboard
		local v110 = v108 == Responsive.Input.Touch

		if v109 or v110 and not b1 then
			p10:_unfocusGamepadFromTopBar()
		end
	end)) }
end
function t1._removeDismissFocusConnections(p11) -- line: 307
	for _, v79 in p11._dismissFocusConnections do
		v79:Disconnect()
	end

	p11._dismissFocusConnections = {}
end
function t1._toggleTopbar(p12, _, p14, _) -- line: 314
	-- upvalues: v29 (copy), FFlagEnableConsoleExpControls (copy), FFlagEnableUISelector (copy), UserInputService (copy), GamepadService (copy), GuiService (copy), v43 (copy), v30 (copy), v44 (copy), LogGamepadOpenExperienceControlsMenu (copy), FFlagAddNewPlayerListMobileFocusNav (copy), PlayerListManager (copy)
	if v29 and not p12:_focusToastNotification(p14) and (not FFlagEnableConsoleExpControls and p14 == Enum.UserInputState.End or FFlagEnableConsoleExpControls and p14 == Enum.UserInputState.Begin) then
		if FFlagEnableUISelector and not UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
			if GamepadService.GamepadCursorEnabled or GuiService.SelectedObject ~= nil then
				GamepadService:DisableGamepadCursor()
				GuiService.SelectedObject = nil

				return Enum.ContextActionResult.Sink
			end

			local v84 = v43(false)

			if v84.getVisibility(false) then
				v84.setVisibility(false)

				return Enum.ContextActionResult.Sink
			end

			if not p12:_isTopBarFocused() then
				v84.setVisibility(true)

				return Enum.ContextActionResult.Sink
			end
		end

		if FFlagEnableConsoleExpControls then
			if v30:integrations().nine_dot == nil then
				return Enum.ContextActionResult.Pass
			end

			local v85 = not (p12:_isTopBarFocused() or v44.getChatInputBarFocused(false))

			if v85 then
				p12:_focusGamepadToTopBar()
			else
				p12:_unfocusGamepadFromTopBar()
			end

			p12:_logExperienceMenuGamepadExposure()
			LogGamepadOpenExperienceControlsMenu(v85)
		else
			p12:_toggleUnibarMenu()
		end

		if FFlagAddNewPlayerListMobileFocusNav and PlayerListManager:GetIsModal() and PlayerListManager:GetVisibility() then
			PlayerListManager:SetVisibility(false)
		end

		return Enum.ContextActionResult.Sink
	end

	return Enum.ContextActionResult.Pass
end
function t1._toggleUnibarMenu(p16) -- line: 369
	-- upvalues: FFlagEnableConsoleExpControls (copy), v30 (copy), LogGamepadOpenExperienceControlsMenu (copy)
	local v87 = p16._chromeFocused:get()

	if v87 then
		if FFlagEnableConsoleExpControls then
			p16:_unfocusGamepadFromTopBar()
		else
			v30:disableFocusNav()
		end
	elseif FFlagEnableConsoleExpControls then
		p16:_focusGamepadToTopBar()
	else
		v30:enableFocusNav()
	end

	p16:_logExperienceMenuGamepadExposure()
	LogGamepadOpenExperienceControlsMenu(v87)
end
function t1._focusGamepadToTopBar(_) -- line: 388
	-- upvalues: FocusUtils (copy)
	FocusUtils.FocusOnChrome()
end
function t1._unfocusGamepadFromTopBar(_) -- line: 392
	-- upvalues: FocusUtils (copy), FFlagConsoleChatUseChromeFocusUtils (copy), v44 (copy), GuiService (copy)
	FocusUtils.FocusOffChrome(function() -- line: 393
		-- upvalues: FFlagConsoleChatUseChromeFocusUtils (copy), v44 (copy), GuiService (copy)
		if FFlagConsoleChatUseChromeFocusUtils and v44.getChatInputBarFocused(false) then
			v44.unfocusChatInputBar()
		end

		GuiService.SelectedCoreObject = nil
	end)
end
function t1._focusToastNotification(p19, p20) -- line: 401
	-- upvalues: u47 (ref), ToastNotificationConstants (copy)
	local v92 = u47 ~= nil and u47.Visible

	if p20 == Enum.UserInputState.Begin then
		p19._lastMenuButtonPress = tick()

		return false
	end

	return p20 == Enum.UserInputState.End and (v92 and tick() - p19._lastMenuButtonPress < ToastNotificationConstants.MenuButtonPressHoldTime)
end
function t1._logExperienceMenuGamepadExposure(p21) -- line: 417
	-- upvalues: FFlagExperienceMenuGamepadExposureEnabled (copy), IXPServiceWrapper (copy), AppUserLayers (copy)
	if FFlagExperienceMenuGamepadExposureEnabled and not p21._loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.ExperienceMenuGamepadExposureLayer)
		p21._loggedExperienceMenuGamepadExposure = true
	end
end
function t1._bindSelf(t3: {[any]: any}, p22: ((...any) -> ...any)) -- line: 424
	return function(...) -- line: 425
		-- upvalues: p22 (copy), t3 (copy)
		return p22(t3, ...)
	end
end

if FFlagEnableConsoleExpControls then
	return (t1.new())
end

return t1
