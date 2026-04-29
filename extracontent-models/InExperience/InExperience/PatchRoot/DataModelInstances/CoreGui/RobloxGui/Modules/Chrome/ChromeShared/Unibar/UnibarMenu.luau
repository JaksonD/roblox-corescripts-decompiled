local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local React = require(CorePackages.Packages.React)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagDebugEnableUnibarDummyIntegrations = SharedFlags.GetFFlagDebugEnableUnibarDummyIntegrations
local GetFIntIconSelectionTimeout = SharedFlags.GetFIntIconSelectionTimeout
local GetFFlagChromeCentralizedConfiguration = SharedFlags.GetFFlagChromeCentralizedConfiguration
local FFlagEnableConsoleExpControls = SharedFlags.FFlagEnableConsoleExpControls
local GetFFlagSimpleChatUnreadMessageCount = SharedFlags.GetFFlagSimpleChatUnreadMessageCount
local FFlagAddUILessMode = SharedFlags.FFlagAddUILessMode
local FIntAddUILessModeVariant = SharedFlags.FIntAddUILessModeVariant
local FFlagEnableInExperienceAvatarSwitcher = SharedFlags.FFlagEnableInExperienceAvatarSwitcher
local FFlagEnableSideSheet = SharedFlags.FFlagEnableSideSheet
local FFlagAddIGMToSideSheet = SharedFlags.FFlagAddIGMToSideSheet
local FFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local Flags = require(ChromeShared.Flags)
local FFlagTokenizeUnibarConstantsWithStyleProvider = Flags.FFlagTokenizeUnibarConstantsWithStyleProvider
local FFlagFixSpatialSubMenuSizing = Flags.FFlagFixSpatialSubMenuSizing
local useStyle = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local Service = require(ChromeShared.Service)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle

if GetFFlagChromeCentralizedConfiguration() then
else
	require(ChromeShared.Parent.Integrations)
end

local SubMenu = require(ChromeShared.Unibar.SubMenu)
local WindowManager = require(ChromeShared.Unibar.WindowManager)
local ShortcutBar = require(ChromeShared.Shortcuts.ShortcutBar)
local Constants = require(ChromeShared.Unibar.Constants)
local useChromeMenuItems = require(ChromeShared.Hooks.useChromeMenuItems)
local useObservableValue = require(ChromeShared.Hooks.useObservableValue)
local useMappedObservableValue = require(ChromeShared.Hooks.useMappedObservableValue)
local IconHost = require(ChromeShared.Unibar.ComponentHosts.IconHost)
local ReactOtter = require(CorePackages.Packages.ReactOtter)
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagReduceTopBarInsetsWhileHidden = SharedFlags.FFlagReduceTopBarInsetsWhileHidden
local Stores = require(CorePackages.Workspace.Packages.CoreGuiCommon).Stores
local createEffect = require(CorePackages.Packages.Signals).createEffect
local Constants2 = require(ChromeShared.Parent.Integrations.Party.Constants)
local isConnectUnibarEnabled = require(ChromeShared.Parent.Integrations.Connect.isConnectUnibarEnabled)
local isConnectDropdownEnabled = require(ChromeShared.Parent.Integrations.Connect.isConnectDropdownEnabled)
local v40 = if not FFlagEnableConsoleExpControls then nil else require(ChromeShared.Parent.Parent.TopBar.Components.GamepadConnector)
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local Panel3DInSpatialUI = nil
local PanelType = nil
local u44 = nil

if isInExperienceUIVREnabled then
	local VrSpatialUi = require(CorePackages.Workspace.Packages.VrSpatialUi)

	Panel3DInSpatialUI = VrSpatialUi.Panel3DInSpatialUI
	PanelType = VrSpatialUi.Constants.PanelType
	u44 = require(CorePackages.Workspace.Packages.Observable).ObservableValue.new(true)
end

if not GetFFlagChromeCentralizedConfiguration() then
	function configureUnibar() -- line: 77
		-- upvalues: isConnectDropdownEnabled (copy), GetFFlagDebugEnableUnibarDummyIntegrations (copy), isConnectUnibarEnabled (copy), Constants2 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), Service (copy), FFlagEnableInExperienceAvatarSwitcher (copy), Constants (copy), GuiService (copy), FFlagEnableSideSheet (copy), FFlagAddIGMToSideSheet (copy)
		local t1 = {
			"leaderboard",
			"emotes",
			"backpack"
		}

		table.insert(t1, "respawn")
		table.insert(t1, 1, "trust_and_safety")

		if isConnectDropdownEnabled() then
			table.insert(t1, 1, "connect_dropdown")
		end

		local t2 = {
			"toggle_mic_mute",
			"chat",
			"nine_dot"
		}

		table.insert(t2, 2, "join_voice")

		if GetFFlagDebugEnableUnibarDummyIntegrations() then
			table.insert(t2, 1, "dummy_window")
			table.insert(t2, 1, "dummy_window_2")
		end

		if isConnectUnibarEnabled() then
			table.insert(t2, 1, "connect_unibar")
		end

		local v51 = table.find(t2, "toggle_mic_mute")

		if v51 then
			table.insert(t2, v51 + 1, Constants2.TOGGLE_MIC_INTEGRATION_ID)
		end

		if isInExperienceUIVREnabled and isSpatial() then
			Service:configureMenu({
				{
					"vr_toggle_button",
					"vr_safety_bubble"
				},
				t2
			})
		else
			Service:configureMenu({ t2 })
		end

		if isInExperienceUIVREnabled then
			if not isSpatial() then
				table.insert(t1, 2, "camera_entrypoint")
				table.insert(t1, 2, "selfie_view")
			end
		else
			table.insert(t1, 2, "camera_entrypoint")
			table.insert(t1, 2, "selfie_view")
		end

		if FFlagEnableInExperienceAvatarSwitcher then
			table.insert(t1, 3, Constants.AVATAR_SWITCHER_ID)
		end

		if not isSpatial() and not GuiService:IsTenFootInterface() then
			table.insert(t1, 4, "music_entrypoint")
		end

		if FFlagEnableSideSheet and FFlagAddIGMToSideSheet then
			table.insert(t1, "people")
			table.insert(t1, "settings")
			table.insert(t1, "gallery")
			table.insert(t1, "help")
		end

		Service:configureSubMenu("nine_dot", t1)
	end

	configureUnibar()

	if FFlagEnableConsoleExpControls then
		require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)()
	end
end

function IconDivider(t3: {[any]: any}) -- line: 163
	-- upvalues: useStyle (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy)
	local v53 = useStyle()
	local v54 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.ICON_DIVIDER_POSITION else UnibarStyle.use().ICON_DIVIDER_POSITION

	return React.createElement("Frame", {
		Position = t3.position,
		Size = UDim2.new(0, Constants.DIVIDER_CELL_WIDTH, 1, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1
	}, {
		DividerBar = React.createElement("Frame", {
			Position = v54,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = Constants.ICON_DIVIDER_SIZE,
			BorderSizePixel = 0,
			BackgroundColor3 = v53.Theme.Divider.Color,
			BackgroundTransparency = if not t3.toggleTransition then v53.Theme.Divider.Transparency else t3.toggleTransition:map(function(p1) -- line: 187
				-- upvalues: v53 (copy)
				return v53.Theme.Divider.Transparency + (1 - p1) * (1 - v53.Theme.Divider.Transparency)
			end),
			Visible = t3.visible or true
		})
	})
end
function AnimationStateHelper(p2) -- line: 202
	-- upvalues: useObservableValue (copy), Service (copy), React (copy), FFlagEnableConsoleExpControls (copy), ContextActionService (copy), GuiService (copy), Constants (copy), FFlagUnibarMenuOpenSubmenu (copy), ReactOtter (copy), GetFIntIconSelectionTimeout (copy)
	local v58 = useObservableValue(Service:currentSubMenu())
	local v59 = useObservableValue(Service:selectedItem())
	local v60 = useObservableValue(Service:inFocusNav())

	React.useEffect(function() -- line: 208
		-- upvalues: v60 (copy), FFlagEnableConsoleExpControls (copy), ContextActionService (copy), Service (copy), GuiService (copy), p2 (copy), v59 (copy), Constants (copy), FFlagUnibarMenuOpenSubmenu (copy)
		if v60 then
			if not FFlagEnableConsoleExpControls then
				ContextActionService:BindCoreAction("RBXEscapeUnibar", function(_, p4, _) -- line: 211
					-- upvalues: FFlagEnableConsoleExpControls (copy), Service (copy), GuiService (copy)
					if FFlagEnableConsoleExpControls then
						if p4 == Enum.UserInputState.End then
							Service:disableFocusNav()
							GuiService.SelectedCoreObject = nil

							return
						end
					else
						Service:disableFocusNav()
					end
				end, false, Enum.KeyCode.ButtonB)
			end

			if FFlagEnableConsoleExpControls then
				if p2.menuFrameRef.current then
					local menuFrameRef = p2.menuFrameRef
					local v163 = v59
					local v164 = menuFrameRef.current:FindFirstChild(Constants.ICON_NAME_PREFIX .. tostring(v163), true)

					if v164 then
						GuiService.SelectedCoreObject = v164

						return
					end

					if FFlagUnibarMenuOpenSubmenu then
						if FFlagEnableConsoleExpControls then
							Service:selectedItem():set("nine_dot")
						end

						Service:toggleSubMenu("nine_dot")

						return
					end

					GuiService:Select(p2.menuFrameRef.current)

					return
				end
			elseif p2.menuFrameRef.current then
				GuiService:Select(p2.menuFrameRef.current)

				return
			end
		else
			ContextActionService:UnbindCoreAction("RBXEscapeUnibar")

			if GuiService.SelectedCoreObject and p2.menuFrameRef.current:IsAncestorOf(GuiService.SelectedCoreObject) then
				GuiService.SelectedCoreObject = nil
			end
		end
	end, { v60 })
	React.useEffect(function() -- line: 256
		-- upvalues: v58 (copy), FFlagUnibarMenuOpenSubmenu (copy), v60 (copy), GuiService (copy), p2 (copy), ReactOtter (copy), Constants (copy)
		if v58 == "nine_dot" then
			if FFlagUnibarMenuOpenSubmenu and v60 then
				GuiService:Select(p2.subMenuHostRef.current)
			end

			p2.setToggleSubmenuTransition((ReactOtter.spring(1, Constants.MENU_ANIMATION_SPRING)))

			return
		end

		p2.setToggleSubmenuTransition((ReactOtter.spring(0, Constants.MENU_ANIMATION_SPRING)))
	end, { v58 })
	React.useEffect(function() -- line: 267
		-- upvalues: FFlagEnableConsoleExpControls (copy), v58 (copy), v59 (copy), GetFIntIconSelectionTimeout (copy), p2 (copy), Constants (copy), GuiService (copy)
		if FFlagEnableConsoleExpControls and v58 == v59 then
			return
		end

		local co = coroutine.create(function() -- line: 272
			-- upvalues: GetFIntIconSelectionTimeout (copy), p2 (copy), v59 (copy), FFlagEnableConsoleExpControls (copy), Constants (copy), GuiService (copy)
			local n1 = 0
			local v194

			repeat
				repeat
					if not (n1 < GetFIntIconSelectionTimeout()) then
						return
					end

					n1 += 1
					task.wait()
				until p2.menuFrameRef.current and v59

				if FFlagEnableConsoleExpControls then
					local menuFrameRef = p2.menuFrameRef
					local v193 = v59

					v194 = menuFrameRef.current:FindFirstChild(Constants.ICON_NAME_PREFIX .. tostring(v193), true)
				else
					v194 = p2.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v59, true)
				end
			until v194

			GuiService.SelectedCoreObject = v194
		end)

		coroutine.resume(co)
	end, {
		v59,
		if not FFlagEnableConsoleExpControls then nil else v58
	})

	return nil
end
function linearInterpolation(n2: number, n3: number, n4: number) -- line: 298
	return n2 * (1 - n4) + n3 * n4
end
function IconPositionBinding(p6, n5: number, n6: number, n7: number, p7, p8, b1: boolean, b2: boolean?, p9) -- line: 302
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy)
	local u73 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.UNIBAR_END_PADDING else UnibarStyle.use().UNIBAR_END_PADDING

	return (React.joinBindings({
		p6,
		p7,
		p8
	}):map(function(t4: {[any]: any}) -- line: 322
		-- upvalues: p9 (copy), n6 (copy), n5 (copy), n7 (copy), b2 (copy), b1 (copy), u73 (ref)
		local v167 = if not p9.current then linearInterpolation(n5, n6, t4[2]) else linearInterpolation(n6, n5, t4[2])
		local v168 = n7

		if b2 and not b1 then
			v168 = n7 - t4[3]
		end

		local v169 = v167 - v168

		return UDim2.new(0, u73 + v168 + v169 * t4[1], 0, 0)
	end))
end

local function onUnibarSelectionChanged(p10, _: boolean, _, p12) -- line: 340
	-- upvalues: Service (copy)
	if not p10:IsAncestorOf(p12) then
		Service:disableFocusNav()
	end
end

function isLeft(p13) -- line: 359
	return p13 == Enum.HorizontalAlignment.Left
end
function Unibar(t5: {[any]: any}) -- line: 363
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), Stores (copy), useChromeMenuItems (copy), ReactOtter (copy), Service (copy), FFlagReduceTopBarInsetsWhileHidden (copy), v40 (copy), useMappedObservableValue (copy), IconHost (copy), GetFFlagSimpleChatUnreadMessageCount (copy), createEffect (copy), useStyle (copy), FFlagUnibarMenuOpenSubmenu (copy)
	local ICON_CELL_WIDTH, UNIBAR_END_PADDING

	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local v80 = UnibarStyle.use()

		ICON_CELL_WIDTH = v80.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = v80.UNIBAR_END_PADDING
	else
		ICON_CELL_WIDTH = Constants.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = Constants.UNIBAR_END_PADDING
	end

	local t6 = {}
	local v84 = React.useRef({})
	local v85 = React.useRef(Vector2.zero)
	local v86 = React.useRef(Vector2.zero)
	local u87 = nil

	if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and Stores.GetUILessStore then
		u87 = React.useRef(Stores.GetUILessStore(false))
	end

	local v88 = false
	local v89 = v84.current or {}
	local v90 = useChromeMenuItems()
	local v91, v92 = ReactOtter.useAnimatedBinding(1)
	local v93, v94 = ReactOtter.useAnimatedBinding(1)
	local v95, v96 = ReactOtter.useAnimatedBinding(0)
	local v97 = React.useRef(0)
	local v98, v99 = ReactOtter.useAnimatedBinding(1)
	local v100 = React.useRef(false)
	local v101 = React.useRef(0)
	local v102 = Service:currentSubMenu():get() == "nine_dot"
	local v103, v104 = ReactOtter.useAnimatedBinding(not v102 and 0 or 1)
	local t7 = {}
	local n8 = 0
	local n9 = 0
	local n10 = 0
	local n11 = 0
	local v110 = React.useCallback(function(p14) -- line: 411
		-- upvalues: v85 (copy), Service (copy), FFlagReduceTopBarInsetsWhileHidden (copy), v86 (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), u87 (ref), v40 (copy), t5 (copy), Constants (copy)
		local zero = Vector2.zero
		local zero2 = Vector2.zero

		if p14 then
			zero = p14.AbsolutePosition
			zero2 = p14.AbsoluteSize

			if zero ~= v85.current then
				v85.current = zero
				Service:setMenuAbsolutePosition(zero)
			end

			if FFlagReduceTopBarInsetsWhileHidden and zero2 ~= v86.current then
				v86.current = zero2
			end

			if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and u87.current.getUILessModeEnabled(false) then
				if zero ~= v85.current then
					v85.current = zero
					Service:setMenuAbsolutePosition(zero)
				end

				if zero2 ~= v86.current then
					v86.current = zero2
				end
			end
		end

		if FFlagReduceTopBarInsetsWhileHidden and v40 then
			if p14 and t5.onAreaChanged and v40:getShowTopBar():get() then
				t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, zero, zero2)

				return
			end
		elseif FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and u87.current.getUILessModeEnabled(false) then
			if p14 and t5.onAreaChanged and u87.current.getUIVisible(false) then
				t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, zero, zero2)

				return
			end
		elseif p14 and t5.onAreaChanged then
			t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, zero, p14.AbsoluteSize)
		end
	end, {})
	local v111 = React.joinBindings({
		v93,
		v95
	}):map(function(t8: {[any]: any}) -- line: 460
		-- upvalues: n11 (ref), ICON_CELL_WIDTH (ref)
		return UDim2.new(0, linearInterpolation(n11, t8[2], t8[1]), 0, ICON_CELL_WIDTH)
	end)
	local v112 = useMappedObservableValue(Service:orderAlignment(), isLeft)

	for _, v114 in v90 do
		if v114.integration.availability:get() == Service.AvailabilitySignal.Pinned then
			n8 += 1
		end
	end

	local v115 = if not v112 then math.max(n8 - 1, 0) else 1

	for v116, v117 in v90 do
		if v117.isDivider then
			local v118 = n9 + ICON_CELL_WIDTH * v115
			local v119 = v89[v117.id] or n9

			t6[v117.id] = n9
			v88 = v88 or v119 ~= n9

			local v120 = IconPositionBinding(v91, v119, n9, v118, v98, v95, false, v112, v100)
			local v121 = if not v112 then React.joinBindings({
				v120,
				v111
			}):map(function(p15) -- line: 507
				-- upvalues: ICON_CELL_WIDTH (ref)
				local v176 = p15[1]
				local v177 = p15[2]

				return v176.X.Offset <= v177.X.Offset - ICON_CELL_WIDTH
			end) else React.joinBindings({
				v120,
				v111
			}):map(function(p16) -- line: 502
				-- upvalues: ICON_CELL_WIDTH (ref)
				return p16[1].X.Offset >= ICON_CELL_WIDTH * 0.5
			end)

			t7[v117.id or "icon" .. v116] = React.createElement(IconDivider, {
				position = v120,
				visible = v121,
				toggleTransition = v93
			})
			n9 += Constants.DIVIDER_CELL_WIDTH
		elseif v117.integration then
			local v122 = false
			local v123 = n9 + ICON_CELL_WIDTH * v115

			if v117.integration.availability:get() == Service.AvailabilitySignal.Pinned then
				v122 = true
				v123 = n10
			end

			local v124 = if v89[v117.id] ~= nil then v89[v117.id] else n9

			t6[v117.id] = n9
			v88 = v88 or v124 ~= n9

			local v125 = IconPositionBinding(v91, v124, n9, v123, v98, v95, v122, v112, v100)
			local v126 = if not v112 then React.joinBindings({
				v125,
				v111
			}):map(function(p17) -- line: 551
				-- upvalues: ICON_CELL_WIDTH (ref)
				local v180 = p17[1]
				local v181 = p17[2]

				return v180.X.Offset <= v181.X.Offset - ICON_CELL_WIDTH * 1.5
			end) else React.joinBindings({
				v125,
				v111
			}):map(function(p18) -- line: 546
				-- upvalues: ICON_CELL_WIDTH (ref)
				return p18[1].X.Offset >= ICON_CELL_WIDTH * 0.5
			end)

			t7[v117.id or "icon" .. v116] = React.createElement(IconHost, {
				position = v125,
				visible = v122 or v126,
				toggleTransition = v103,
				integration = v117,
				disableBadgeNumber = not not GetFFlagSimpleChatUnreadMessageCount() and v117.id == "chat"
			})
			n9 += ICON_CELL_WIDTH

			if v122 then
				n10 += ICON_CELL_WIDTH
			end
		end
	end

	n11 = n9

	if t5.onMinWidthChanged then
		t5.onMinWidthChanged(n11)
	end

	local u127 = UNIBAR_END_PADDING * 2 + n9

	React.useEffect(function() -- line: 580
		-- upvalues: v97 (copy), v95 (copy), v96 (copy), ReactOtter (copy), u127 (ref), Constants (copy), Service (copy), ICON_CELL_WIDTH (ref)
		local current = v97.current

		if v95:getValue() == 0 then
			v96((ReactOtter.instant(u127)))
			v97.current = u127
		elseif current ~= u127 then
			v96(ReactOtter.spring(u127, Constants.MENU_ANIMATION_SPRING))
			v97.current = u127
		end

		Service:setMenuAbsoluteSize(Vector2.new(u127, ICON_CELL_WIDTH))
	end, { u127 })

	if v88 then
		v101.current = (v101.current or 0) + 1
	end

	v84.current = t6
	React.useEffect(function() -- line: 598
		-- upvalues: v100 (copy), v99 (copy), ReactOtter (copy), Constants (copy)
		if not v100.current then
			v99(ReactOtter.spring(0, Constants.MENU_ANIMATION_SPRING))
			v100.current = true

			return
		end

		v99(ReactOtter.spring(1, Constants.MENU_ANIMATION_SPRING))
		v100.current = false
	end, {
		v101.current,
		v100
	})
	React.useEffect(function() -- line: 610
		-- upvalues: FFlagReduceTopBarInsetsWhileHidden (copy), v40 (copy), t5 (copy), Constants (copy), v85 (copy), v86 (copy)
		if FFlagReduceTopBarInsetsWhileHidden and v40 then
			local v183 = v40:getShowTopBar()

			v183:connect(function() -- line: 613
				-- upvalues: v183 (copy), t5 (copy), Constants (copy), v85 (copy), v86 (copy)
				if v183:get() then
					t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, v85.current, v86.current)

					return
				end

				t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
	end, {})
	React.useEffect(function() -- line: 628
		-- upvalues: FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), u87 (ref), createEffect (copy), t5 (copy), Constants (copy), v85 (copy), v86 (copy)
		local u184 = nil

		if FFlagAddUILessMode and (FIntAddUILessModeVariant ~= 0 and u87.current.getUILessModeEnabled(false)) then
			u184 = createEffect(function(p19) -- line: 631
				-- upvalues: u87 (ref), t5 (copy), Constants (copy), v85 (copy), v86 (copy)
				if u87.current.getUIVisible(p19) then
					t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, v85.current, v86.current)

					return
				end

				t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			t5.onAreaChanged(Constants.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end

		return function() -- line: 645
			-- upvalues: u184 (ref)
			if u184 then
				u184()
			end
		end
	end, {})

	local v128 = useStyle()

	return React.createElement("Frame", {
		Size = v111,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = t5.menuFrameRef,
		[React.Change.AbsoluteSize] = v110,
		[React.Change.AbsolutePosition] = v110
	}, {
		React.createElement(AnimationStateHelper, {
			setToggleIconTransition = v92,
			setToggleWidthTransition = v94,
			setToggleSubmenuTransition = v104,
			menuFrameRef = t5.menuFrameRef,
			subMenuHostRef = if not FFlagUnibarMenuOpenSubmenu then nil else t5.subMenuHostRef
		}),
		React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = v128.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = v128.Theme.BackgroundUIContrast.Transparency * v128.Settings.PreferredTransparency
		}, {
			UICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			})
		}),
		React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundTransparency = 1
		}, t7)
	})
end

local function UnibarPills(t9: {[any]: any}) -- line: 700
	-- upvalues: useStyle (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), useChromeMenuItems (copy), Service (copy), ReactOtter (copy), React (copy), IconHost (copy)
	local v130 = useStyle()
	local UNIBAR_END_PADDING, MENU_SUBMENU_PADDING

	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local v131 = UnibarStyle.use()

		UNIBAR_END_PADDING = v131.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = v131.MENU_SUBMENU_PADDING
	else
		UNIBAR_END_PADDING = Constants.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = Constants.MENU_SUBMENU_PADDING
	end

	local v134 = useChromeMenuItems()
	local v135 = Service:currentSubMenu():get() == "nine_dot"
	local v136, v137 = ReactOtter.useAnimatedBinding(not v135 and 0 or 1)

	assert(v134 ~= nil, "Menu items should not be nil")

	local t10 = {}
	local t11 = {}

	for v140, v141 in v134 do
		if v141.integration and v141.isDivider == false then
			t11["icon_host" .. v140] = React.createElement(IconHost, {
				toggleTransition = v136,
				integration = v141
			})
		end

		if v141.isDivider or v140 == #v134 then
			local v142 = React.createElement("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BorderSizePixel = 0,
				BackgroundColor3 = v130.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = v130.Theme.BackgroundUIContrast.Transparency * v130.Settings.PreferredTransparency
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}),
				Padding = React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UNIBAR_END_PADDING),
					PaddingRight = UDim.new(0, UNIBAR_END_PADDING)
				}),
				PillsHorizontalList = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				})
			}, t11)

			t10["pill_" .. v140] = v142
			t11 = {}
		end
	end

	return React.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = t9.menuFrameRef,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		React.createElement(AnimationStateHelper, {
			setToggleSubmenuTransition = v137,
			menuFrameRef = t9.menuFrameRef,
			subMenuHostRef = t9.subMenuHostRef
		}),
		React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, MENU_SUBMENU_PADDING)
		})
	}, t10)
end
local function SubMenuWrapper(p20) -- line: 792
	-- upvalues: isInExperienceUIVREnabled (copy), isSpatial (copy), Panel3DInSpatialUI (ref), useObservableValue (copy), Service (copy), u44 (ref), React (copy), SubMenu (copy), FFlagFixSpatialSubMenuSizing (copy), PanelType (ref)
	if isInExperienceUIVREnabled and (isSpatial() and Panel3DInSpatialUI) then
		local v144 = useObservableValue(Service:currentSubMenu())

		u44:set(v144 ~= nil)
	end

	local v145 = React.useCallback(function(vector2: Vector2) -- line: 797
		-- upvalues: React (copy), SubMenu (copy), p20 (copy), FFlagFixSpatialSubMenuSizing (copy)
		return (React.createElement(SubMenu, {
			subMenuHostRef = p20.subMenuHostRef,
			panelSize = if not FFlagFixSpatialSubMenuSizing then nil else vector2
		}))
	end, { p20.subMenuHostRef })

	if isInExperienceUIVREnabled and isSpatial() and Panel3DInSpatialUI then
		return (React.createElement(Panel3DInSpatialUI, {
			panelType = PanelType.ChromeSubMenu,
			renderFunction = v145,
			visibilityObservable = u44
		}))
	end

	return (React.createElement(SubMenu, {
		subMenuHostRef = p20.subMenuHostRef
	}))
end

return React.memo(function(t12: {[any]: any}) -- line: 816
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy), FFlagEnableConsoleExpControls (copy), FFlagUnibarMenuOpenSubmenu (copy), useMappedObservableValue (copy), Service (copy), v40 (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), Stores (copy), createEffect (copy), onUnibarSelectionChanged (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), UnibarPills (copy), SubMenuWrapper (copy), SubMenu (copy), ShortcutBar (copy), WindowManager (copy)
	local v147 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.MENU_SUBMENU_PADDING else UnibarStyle.use().MENU_SUBMENU_PADDING
	local u148 = React.useRef(nil)

	if FFlagEnableConsoleExpControls and t12.menuRef then
		u148 = t12.menuRef
	end

	local v149 = React.useRef(nil)
	local v150 = nil

	if FFlagUnibarMenuOpenSubmenu then
		v150 = React.useRef(nil)
	end

	local function updateSize() -- line: 838
		-- upvalues: v149 (copy), u148 (ref)
		if v149.current and u148.current then
			v149.current.Size = u148.current.Size
		end
	end

	local v152 = useMappedObservableValue(Service:orderAlignment(), isLeft)
	local v153 = nil
	local u154 = nil
	local u155 = nil

	if FFlagEnableConsoleExpControls and v40 then
		local v156

		v153, v156 = React.useBinding(v40:getShowTopBar():get())
		u154 = v156
		u155 = v40:getShowTopBar()
	end

	local u157 = nil

	if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and Stores.GetUILessStore then
		u157 = React.useRef(Stores.GetUILessStore(false))

		if u157.current.getUILessModeEnabled(false) then
			local v158

			v153, v158 = React.useBinding(true)
			u154 = v158
		end
	end

	React.useEffect(function() -- line: 863
		-- upvalues: u148 (ref), updateSize (copy), v149 (copy), FFlagEnableConsoleExpControls (copy), u155 (ref), u154 (ref)
		local connection = nil

		if u148 and u148.current then
			connection = u148.current:GetPropertyChangedSignal("Size"):Connect(updateSize)
		end

		if v149.current and u148.current then
			v149.current.Size = u148.current.Size
		end

		if FFlagEnableConsoleExpControls then
			u155:connect(function() -- line: 872
				-- upvalues: u154 (ref), u155 (ref)
				u154(u155:get())
			end)
		end

		return function() -- line: 877
			-- upvalues: connection (ref)
			if connection then
				connection:disconnect()
			end
		end
	end)
	React.useEffect(function() -- line: 884
		-- upvalues: FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), u157 (ref), createEffect (copy), u154 (ref)
		local u187 = nil

		if FFlagAddUILessMode and (FIntAddUILessModeVariant ~= 0 and u157.current.getUILessModeEnabled(false)) then
			u187 = createEffect(function(p21) -- line: 887
				-- upvalues: u154 (ref), u157 (ref)
				u154(u157.current.getUIVisible(p21))
			end)
		end

		return function() -- line: 892
			-- upvalues: u187 (ref)
			if u187 then
				u187()
			end
		end
	end, {})

	return { React.createElement("Frame", {
		Name = "UnibarMenu",
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = t12.layoutOrder,
		SelectionGroup = true,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = if not FFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		ref = v149,
		[React.Event.SelectionChanged] = if not FFlagEnableConsoleExpControls then nil else onUnibarSelectionChanged,
		Visible = if not FFlagEnableConsoleExpControls and (not FFlagAddUILessMode or (FIntAddUILessModeVariant == 0 or not u157.current.getUILessModeEnabled(false))) then nil else v153
	}, {
		React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = if not v152 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, v147)
		}),
		if not isInExperienceUIVREnabled or not isSpatial() then React.createElement(Unibar, {
			menuFrameRef = u148,
			subMenuHostRef = if not FFlagUnibarMenuOpenSubmenu then nil else v150,
			onAreaChanged = t12.onAreaChanged,
			onMinWidthChanged = t12.onMinWidthChanged
		}) else React.createElement(UnibarPills, {
			menuFrameRef = u148,
			subMenuHostRef = v150
		}),
		if not isInExperienceUIVREnabled then React.createElement(SubMenu, {
			subMenuHostRef = v150
		}) else React.createElement(SubMenuWrapper, {
			subMenuHostRef = v150
		}),
		if not FFlagEnableConsoleExpControls then nil else React.createElement(ShortcutBar),
		(React.createElement(WindowManager))
	}) }
end, function(_, _) -- line: 950
	return true
end)
