local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_useCursor_0 = require(l_Parent_0.Foundation).Hooks.useCursor;
local _ = require(l_Parent_0.React);
local v3 = require(script.Parent.mapCursorType);
return function(v4) --[[ Line: 8 ]] --[[ Name: useCursorByType ]]
    -- upvalues: l_useCursor_0 (copy), v3 (copy)
    return l_useCursor_0(v3(v4));
end;