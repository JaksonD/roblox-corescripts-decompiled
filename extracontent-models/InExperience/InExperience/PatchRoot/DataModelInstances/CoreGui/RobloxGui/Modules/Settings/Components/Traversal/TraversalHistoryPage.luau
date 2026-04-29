local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Cryo = require(CorePackages.Packages.Cryo)
local Foundation = require(CorePackages.Packages.Foundation)
local React = require(CorePackages.Packages.React)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local CoreScriptsRoactCommon = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local ParentParent = script.Parent.Parent.Parent
local ReactPageSignal = require(ParentParent.ReactPageSignal)
local TraversalLeaveConfirmation = require(script.Parent.TraversalLeaveConfirmation)
local getRbxThumb = Foundation.Utility.getRbxThumb
local ThumbnailSize = Foundation.Enums.ThumbnailSize
local ThumbnailType = Foundation.Enums.ThumbnailType
local View = Foundation.View
local Traversal = CoreScriptsRoactCommon.Traversal
local default = Traversal.LocalTraversalHistory.default
local GetInputModeStore = Responsive.GetInputModeStore
local Input = Responsive.Input
local Constants = Traversal.Constants
local HistoryPage = Traversal.HistoryPage
local useHistoryItems = Traversal.useHistoryItems
local FIntMaximumTraversalHistoryItemsFetch = Traversal.Flags.FIntMaximumTraversalHistoryItemsFetch
local FFlagTraversalExpPagePaddingFixes = Traversal.Flags.FFlagTraversalExpPagePaddingFixes
local FFlagTraversalPerfFixes = Traversal.Flags.FFlagTraversalPerfFixes
local FFlagFixTraversalHistoryMenuFixesV3 = Traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3

return React.memo(React.forwardRef(function(_: {[any]: any}, p1) --[[ TraversalHistoryPage ]] -- line: 36
	-- upvalues: React (copy), FIntMaximumTraversalHistoryItemsFetch (copy), useHistoryItems (copy), Constants (copy), SignalsReact (copy), ReactPageSignal (copy), FFlagFixTraversalHistoryMenuFixesV3 (copy), UserInputService (copy), GetInputModeStore (copy), Input (copy), GuiService (copy), Cryo (copy), getRbxThumb (copy), ThumbnailType (copy), ThumbnailSize (copy), FFlagTraversalPerfFixes (copy), default (copy), View (copy), FFlagTraversalExpPagePaddingFixes (copy), HistoryPage (copy), TraversalLeaveConfirmation (copy)
	local v30 = React.useRef(nil)

	React.useImperativeHandle(p1, function() -- line: 38
		-- upvalues: v30 (copy)
		return v30.current
	end, {})

	local v31, v32 = React.useState(FIntMaximumTraversalHistoryItemsFetch)
	local v33 = useHistoryItems(v31)
	local v34, v35 = React.useState(Constants.NO_UNIVERSE_ID)
	local v36 = SignalsReact.useSignalState(ReactPageSignal)

	if FFlagFixTraversalHistoryMenuFixesV3 then
		React.useEffect(function() -- line: 47
			-- upvalues: UserInputService (copy), GetInputModeStore (copy), Input (copy), v30 (copy), GuiService (copy)
			local LastInputType = UserInputService:GetLastInputType()
			local v46 = GetInputModeStore().getLastInputType()

			if (v46 == Input.Directional or v46 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard) and v30.current then
				GuiService.SelectedCoreObject = v30.current
			end
		end, {})
	end

	local v37 = React.useCallback(function(n1: number) -- line: 57
		-- upvalues: v35 (copy)
		v35(n1)
	end, { v35 })
	local v38 = React.useCallback(function() -- line: 61
		-- upvalues: v35 (copy), Constants (copy), UserInputService (copy), GetInputModeStore (copy), Input (copy), v30 (copy), GuiService (copy)
		v35(Constants.NO_UNIVERSE_ID)

		local LastInputType = UserInputService:GetLastInputType()
		local v49 = GetInputModeStore().getLastInputType()

		if (v49 == Input.Directional or v49 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard) and v30.current then
			GuiService.SelectedCoreObject = v30.current
		end
	end, {})
	local v39 = React.useMemo(function() -- line: 71
		-- upvalues: Cryo (copy), v33 (copy), getRbxThumb (copy), ThumbnailType (copy), ThumbnailSize (copy)
		return (Cryo.List.map(v33, function(p2) -- line: 72
			-- upvalues: getRbxThumb (copy), ThumbnailType (copy), ThumbnailSize (copy)
			return {
				placeId = p2.placeId,
				universeId = p2.universeId,
				name = p2.name,
				image = getRbxThumb(ThumbnailType.GameIcon, p2.universeId, ThumbnailSize.Medium),
				rating = p2.rating
			}
		end))
	end, { v33 })
	local u40 = nil
	local u41 = nil

	if not FFlagTraversalPerfFixes then
		local v42, v43 = React.useState(false)

		u40 = v42
		u41 = v43
		React.useEffect(function() -- line: 87
			-- upvalues: v33 (copy), u41 (ref)
			if v33 ~= nil then
				u41(false)
			end
		end, {
			v33,
			u41
		})
	end

	local v44 = React.useCallback(function(n2: number) -- line: 93
		-- upvalues: FFlagTraversalPerfFixes (copy), v31 (copy), default (copy), u40 (ref), u41 (ref), v32 (copy)
		if FFlagTraversalPerfFixes then
			if v31 >= #default:getUniverseHistory() then
				return
			end
		else
			if u40 then
				return
			end

			u41(true)
		end

		v32(v31 + n2)
	end, if not FFlagTraversalPerfFixes then {
		v31,
		v32,
		u40,
		u41
	} else { v31 })

	return next(v39) ~= nil and React.createElement(View, {
		tag = "size-full " .. (not FFlagTraversalExpPagePaddingFixes and "padding-large" or "padding-top-medium")
	}, {
		HistoryPage = React.createElement(HistoryPage, {
			historyItems = v39,
			onHistoryClose = function() --[[ onHistoryClose ]] -- line: 112
				-- upvalues: v36 (copy)
				v36.setCurrentReactPage(nil)
			end,
			onCardItemActivated = v37,
			onLoadMoreHistory = v44,
			ref = v30
		})
	}, {
		Dialog = React.createElement(TraversalLeaveConfirmation, {
			isDialogOpen = v34 > Constants.NO_UNIVERSE_ID,
			onCancel = v38,
			onClose = v38,
			universeId = v34,
			source = "history_landing_page"
		})
	})
end))
