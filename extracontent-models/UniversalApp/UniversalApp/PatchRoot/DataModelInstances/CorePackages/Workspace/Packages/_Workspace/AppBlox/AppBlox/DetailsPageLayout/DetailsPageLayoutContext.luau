local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
return require(l_Parent_0.React).createContext({
    hasFullBleed = false, 
    hasHeader = nil, 
    hasActions = nil, 
    setHasHeader = function() --[[ Line: 96 ]] --[[ Name: setHasHeader ]]

    end, 
    setHasActions = function() --[[ Line: 97 ]] --[[ Name: setHasActions ]]

    end, 
    isFullscreen = false, 
    headerBarHeight = 0, 
    actionBarHeight = nil, 
    setActionBarHeight = function() --[[ Line: 101 ]] --[[ Name: setActionBarHeight ]]

    end, 
    onCanvasPositionChanged = nil, 
    contentTopOffset = nil, 
    maxContentWidth = nil, 
    fullBleedOverlap = 180, 
    initialScrollY = 0, 
    hasValidContainerSize = false, 
    containerHeight = nil, 
    headerOpacity = nil, 
    stickyHeaderActive = false, 
    onClose = nil, 
    testId = nil, 
    onCanvasSizeChanged = nil
});