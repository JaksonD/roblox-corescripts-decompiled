local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local l_useCursor_0 = require(l_Parent_0.Foundation).Hooks.useCursor;
local v3 = require(l_Parent_1.App.SelectionCursor.mapCursorType);
return function(v4) --[[ Line: 14 ]] --[[ Name: useSelectionCursor ]]
    -- upvalues: l_useCursor_0 (copy), v3 (copy)
    return l_useCursor_0(v3(v4, true));
end;