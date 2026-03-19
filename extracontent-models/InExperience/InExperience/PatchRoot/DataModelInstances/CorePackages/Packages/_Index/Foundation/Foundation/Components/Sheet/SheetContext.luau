local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(script.Parent.SheetType);
return v1.createContext({
    sheetHeightAvailable = nil, 
    setSheetHeightAvailable = function(_) --[[ Line: 11 ]] --[[ Name: setSheetHeightAvailable ]]
        error("No SheetContext available");
    end, 
    actionsHeight = nil, 
    setActionsHeight = function(_) --[[ Line: 15 ]] --[[ Name: setActionsHeight ]]
        error("No SheetContext available");
    end, 
    hasActionsDivider = nil, 
    setHasActionsDivider = function(_) --[[ Line: 19 ]] --[[ Name: setHasActionsDivider ]]
        error("No SheetContext available");
    end, 
    sheetContentHeight = nil, 
    setSheetContentHeight = function(_) --[[ Line: 23 ]] --[[ Name: setSheetContentHeight ]]
        error("No SheetContext available");
    end, 
    safeAreaPadding = nil, 
    bottomPadding = nil, 
    innerScrollingEnabled = nil, 
    innerScrollY = nil, 
    setInnerScrollY = function(_) --[[ Line: 30 ]] --[[ Name: setInnerScrollY ]]
        error("No SheetContext available");
    end, 
    hasHeader = nil, 
    setHasHeader = function(_) --[[ Line: 34 ]] --[[ Name: setHasHeader ]]
        error("No SheetContext available");
    end, 
    closeSheet = nil, 
    sheetType = nil, 
    innerSurface = nil, 
    testId = nil, 
    closeAffordanceRef = nil, 
    contentStartRef = nil, 
    setContentStartRef = function(_) --[[ Line: 43 ]] --[[ Name: setContentStartRef ]]

    end
});