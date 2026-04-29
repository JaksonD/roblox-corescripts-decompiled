local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Foundation = require(CorePackages.Packages.Foundation)
local React = require(CorePackages.Packages.React)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local CoreScriptsCommon = require(CorePackages.Workspace.Packages.CoreScriptsCommon)
local CoreScriptsRoactCommon = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local TraversalLeaveConfirmation = require(script.Parent.TraversalLeaveConfirmation)
local ParentParent = script.Parent.Parent.Parent
local EnumReactPage = require(ParentParent.EnumReactPage)
local ReactPageSignal = require(ParentParent.ReactPageSignal)
local Utility = require(ParentParent.Utility)
local View = Foundation.View
local ThumbnailType = Foundation.Enums.ThumbnailType
local ThumbnailSize = Foundation.Enums.ThumbnailSize
local getRbxThumb = Foundation.Utility.getRbxThumb
local SettingsShowSignal = CoreScriptsCommon.SettingsShowSignal
local Traversal = CoreScriptsRoactCommon.Traversal
local default = Traversal.LocalTraversalHistory.default
local GetInputModeStore = Responsive.GetInputModeStore
local Input = Responsive.Input
local Constants = Traversal.Constants
local HistoryMenu = Traversal.HistoryMenu
local useHistoryItems = Traversal.useHistoryItems
local useTokens = Foundation.Hooks.useTokens
local FFlagAddTraversalHistoryReactMenuButtons = require(ParentParent.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local FFlagTraversalHistoryMenuFocusNavFix = Traversal.Flags.FFlagTraversalHistoryMenuFocusNavFix
local FFlagTraversalPerfFixes = Traversal.Flags.FFlagTraversalPerfFixes

local function historyToMenuItems(p1) -- line: 46
	-- upvalues: getRbxThumb (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local t1 = {}

	for _, v35 in p1 do
		table.insert(t1, {
			universeId = v35.universeId,
			text = v35.name,
			icon = getRbxThumb(ThumbnailType.GameIcon, v35.universeId, ThumbnailSize.Small)
		})
	end

	return t1
end

return React.memo(React.forwardRef(function(t2: {[any]: any}, _) --[[ TraversalHistoryMenu ]] -- line: 58
	-- upvalues: React (copy), FFlagAddTraversalHistoryReactMenuButtons (copy), useHistoryItems (copy), FFlagTraversalPerfFixes (copy), historyToMenuItems (copy), Constants (copy), useTokens (copy), SignalsReact (copy), ReactPageSignal (copy), FFlagTraversalHistoryMenuFocusNavFix (copy), SettingsShowSignal (copy), GuiService (copy), UserInputService (copy), GetInputModeStore (copy), Input (copy), Utility (copy), EnumReactPage (copy), default (copy), View (copy), HistoryMenu (copy), TraversalLeaveConfirmation (copy)
	local u38 = React.useRef(t2.anchorParent)

	if FFlagAddTraversalHistoryReactMenuButtons and t2.anchorRef then
		u38 = t2.anchorRef
	end

	local v39 = useHistoryItems()
	local v40 = if not FFlagTraversalPerfFixes then historyToMenuItems(v39) else React.useMemo(function() -- line: 66
		-- upvalues: historyToMenuItems (copy), v39 (copy)
		return (historyToMenuItems(v39))
	end, { v39 })
	local v41 = if t2.idleButtonStateIsDown == nil then Constants.DEFAULT_CHEVRON_BUTTON_STATE else t2.idleButtonStateIsDown
	local v42, v43 = React.useBinding(Enum.SelectionBehavior.Stop)
	local v44 = nil

	if FFlagTraversalPerfFixes then
		v44 = React.useMemo(function() -- line: 77
			-- upvalues: v41 (copy), v42 (copy)
			return {
				SelectionBehaviorUp = if not v41 then Enum.SelectionBehavior.Stop else v42,
				SelectionBehaviorDown = if v41 then Enum.SelectionBehavior.Stop else v42
			}
		end, { v41 })
	end

	local v45 = useTokens()
	local v46, v47 = React.useState(Constants.NO_UNIVERSE_ID)
	local v48 = SignalsReact.useSignalState(ReactPageSignal)
	local u49 = nil
	local u50 = nil
	local v51 = nil

	if FFlagTraversalHistoryMenuFocusNavFix then
		v51 = React.useCallback(function(p3) -- line: 90
			-- upvalues: SettingsShowSignal (copy), FFlagAddTraversalHistoryReactMenuButtons (copy), t2 (copy), GuiService (copy)
			return {
				onSettingsVisible = SettingsShowSignal:connect(function(p4) -- line: 92
					-- upvalues: p3 (copy)
					if not p4 then
						p3()
					end
				end),
				onPageChanged = if not not FFlagAddTraversalHistoryReactMenuButtons and not t2.currentPageChangeSignal then nil else t2.currentPageChangeSignal:connect(function() -- line: 98
					-- upvalues: p3 (copy)
					p3()
				end),
				onNativeClose = GuiService.NativeClose:Connect(function() -- line: 102
					-- upvalues: p3 (copy)
					p3()
				end)
			}
		end, {
			t2.currentPageChangeSignal,
			SettingsShowSignal,
			GuiService.NativeClose
		})
	else
		local v52, v53 = React.useState(false)

		u49 = v52
		u50 = v53
		React.useEffect(function() -- line: 110
			-- upvalues: SettingsShowSignal (copy), u50 (ref), FFlagAddTraversalHistoryReactMenuButtons (copy), t2 (copy), GuiService (copy)
			local t3 = {
				onSettingsVisible = SettingsShowSignal:connect(function(p5) -- line: 112
					-- upvalues: u50 (ref)
					if not p5 then
						u50(true)
					end
				end),
				onPageChanged = if not not FFlagAddTraversalHistoryReactMenuButtons and not t2.currentPageChangeSignal then nil else t2.currentPageChangeSignal:connect(function() -- line: 118
					-- upvalues: u50 (ref)
					u50(true)
				end),
				onNativeClose = GuiService.NativeClose:Connect(function() -- line: 122
					-- upvalues: u50 (ref)
					u50(true)
				end)
			}

			return function() -- line: 125
				-- upvalues: t3 (ref)
				for _, v70 in t3 do
					v70:Disconnect()
				end

				t3 = {}
			end
		end, {
			t2.currentPageChangeSignal,
			SettingsShowSignal,
			GuiService.NativeClose
		})
		React.useEffect(function() -- line: 132
			-- upvalues: u49 (ref), u50 (ref)
			if u49 then
				u50(false)
			end
		end, {
			u49,
			u50
		})
	end

	local v54 = React.useCallback(function(n1: number) -- line: 140
		-- upvalues: v47 (copy), v43 (copy)
		v47(n1)
		v43(Enum.SelectionBehavior.Stop)
	end, { v47 })
	local v55 = React.useCallback(function() -- line: 145
		-- upvalues: v47 (copy), Constants (copy), UserInputService (copy), GetInputModeStore (copy), Input (copy), u38 (ref), GuiService (copy)
		v47(Constants.NO_UNIVERSE_ID)

		local LastInputType = UserInputService:GetLastInputType()
		local v65 = GetInputModeStore().getLastInputType()

		if (v65 == Input.Directional or v65 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard) and u38.current then
			GuiService.SelectedCoreObject = u38.current
		end
	end, {})
	local v56 = React.useCallback(function(b1: boolean) -- line: 155
		-- upvalues: v43 (copy)
		if b1 then
			v43(Enum.SelectionBehavior.Escape)

			return
		end

		v43(Enum.SelectionBehavior.Stop)
	end, { if not FFlagTraversalPerfFixes then v43 else nil })
	local v57 = React.useMemo(function() -- line: 163
		-- upvalues: FFlagAddTraversalHistoryReactMenuButtons (copy), t2 (copy), v45 (copy)
		if FFlagAddTraversalHistoryReactMenuButtons and t2.isDarkOnDarkMode then
			return v45.Color.Surface.Surface_0
		end

		return {
			Color3 = v45.Color.Stroke.Default.Color3,
			Transparency = 0.33
		}
	end, {})
	local v58 = Utility:IsSmallTouchScreen()
	local v59 = nil

	if FFlagTraversalPerfFixes then
		v59 = React.useMemo(function() -- line: 178
			-- upvalues: v58 (copy)
			return {
				["padding-small"] = v58,
				["padding-medium"] = not v58
			}
		end, { v58 })
	end

	local v60 = nil

	if FFlagTraversalPerfFixes then
		v60 = React.useCallback(function() -- line: 188
			-- upvalues: v48 (copy), EnumReactPage (copy), FFlagTraversalHistoryMenuFocusNavFix (copy), v43 (copy)
			v48.setCurrentReactPage(EnumReactPage.TraversalHistory)

			if FFlagTraversalHistoryMenuFocusNavFix then
				v43(Enum.SelectionBehavior.Stop)
			end
		end, { v48 })
	end

	return React.useMemo(function() -- line: 196
		-- upvalues: default (copy)
		return #default:getUniverseHistory() > 0
	end, {}) and React.createElement(View, {
		tag = "auto-xy row align-y-center size-0-full",
		selectionGroup = if not FFlagTraversalPerfFixes then {
			SelectionBehaviorUp = if not v41 then Enum.SelectionBehavior.Stop else v42,
			SelectionBehaviorDown = if v41 then Enum.SelectionBehavior.Stop else v42
		} else v44,
		ref = if not FFlagAddTraversalHistoryReactMenuButtons or (t2.anchorRef or t2.anchorParent) then nil else u38
	}, {
		DividerLeft = React.createElement(View, {
			Size = UDim2.new(0, v45.Stroke.Thick, 1, 0),
			backgroundStyle = v57
		}),
		HistoryMenu = React.createElement(HistoryMenu, {
			historyButtonTags = if not FFlagTraversalPerfFixes then {
				["padding-small"] = v58,
				["padding-medium"] = not v58
			} else v59,
			historyItems = v40,
			onHistorySelected = not FFlagTraversalPerfFixes and function() -- line: 221
				-- upvalues: v48 (copy), EnumReactPage (copy), FFlagTraversalHistoryMenuFocusNavFix (copy), v43 (copy)
				v48.setCurrentReactPage(EnumReactPage.TraversalHistory)

				if FFlagTraversalHistoryMenuFocusNavFix then
					v43(Enum.SelectionBehavior.Stop)
				end
			end or v60,
			onMenuItemSelected = v54,
			onMenuToggled = v56,
			forceMenuClose = if not FFlagTraversalHistoryMenuFocusNavFix then u49 else nil,
			closeMenuConn = if not FFlagTraversalHistoryMenuFocusNavFix then nil else v51,
			idleButtonStateIsDown = if not FFlagTraversalPerfFixes then v41 else nil,
			menuSide = if not FFlagTraversalPerfFixes then nil else t2.menuSide,
			ref = u38
		})
	}, {
		Dialog = React.createElement(TraversalLeaveConfirmation, {
			isDialogOpen = v46 > Constants.NO_UNIVERSE_ID,
			onCancel = v55,
			onClose = v55,
			universeId = v46,
			source = "history_dropdown"
		})
	})
end))
