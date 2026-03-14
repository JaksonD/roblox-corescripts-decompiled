local v0 = require(script.Parent.FocusNavigationEventNameEnum);
return {
    [Enum.KeyCode.ButtonB] = v0.NavigateBack, 
    [Enum.KeyCode.Escape] = v0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = v0.Search, 
    [Enum.KeyCode.Slash] = v0.Search, 
    [Enum.KeyCode.PageUp] = v0.ScrollUp, 
    [Enum.KeyCode.LeftBracket] = v0.ScrollUp, 
    [Enum.KeyCode.PageDown] = v0.ScrollDown, 
    [Enum.KeyCode.RightBracket] = v0.ScrollDown
};