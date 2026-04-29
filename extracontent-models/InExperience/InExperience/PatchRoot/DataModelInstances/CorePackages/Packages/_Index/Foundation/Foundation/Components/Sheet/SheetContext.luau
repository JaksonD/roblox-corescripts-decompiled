local Parent = script:FindFirstAncestor("Foundation").Parent
local React = require(Parent.React)

require(script.Parent.SheetType)

return React.createContext({
	sheetHeightAvailable = nil,
	setSheetHeightAvailable = function(_: number) --[[ setSheetHeightAvailable ]] -- line: 11
		error("No SheetContext available")
	end,
	actionsHeight = nil,
	setActionsHeight = function(_: number) --[[ setActionsHeight ]] -- line: 15
		error("No SheetContext available")
	end,
	hasActionsDivider = nil,
	setHasActionsDivider = function(_: boolean) --[[ setHasActionsDivider ]] -- line: 19
		error("No SheetContext available")
	end,
	sheetContentHeight = nil,
	setSheetContentHeight = function(_: number) --[[ setSheetContentHeight ]] -- line: 23
		error("No SheetContext available")
	end,
	safeAreaPadding = nil,
	bottomPadding = nil,
	innerScrollingEnabled = nil,
	innerScrollY = nil,
	setInnerScrollY = function(_: number) --[[ setInnerScrollY ]] -- line: 30
		error("No SheetContext available")
	end,
	hasHeader = nil,
	setHasHeader = function(_: boolean) --[[ setHasHeader ]] -- line: 34
		error("No SheetContext available")
	end,
	hasFullBleed = false,
	fullBleedHeight = nil,
	setFullBleedHeight = function(_: number) --[[ setFullBleedHeight ]] -- line: 39
		error("No SheetContext available")
	end,
	hasRadius = true,
	closeSheet = nil,
	sheetType = nil,
	innerSurface = nil,
	testId = nil,
	closeAffordanceRef = nil,
	contentStartRef = nil,
	setContentStartRef = function(_) --[[ setContentStartRef ]] -- line: 49
	end
})
