local v0 = require(script.Parent.useGuiState);
return function(v1) --[[ Line: 9 ]] --[[ Name: useHoverState ]]
    -- upvalues: v0 (copy)
    return v0(v1) == Enum.GuiState.Hover;
end;