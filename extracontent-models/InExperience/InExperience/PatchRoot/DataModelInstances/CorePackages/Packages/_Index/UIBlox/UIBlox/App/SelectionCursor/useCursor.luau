local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.React);
local l_useCursor_0 = require(l_Parent_0.Foundation).Hooks.useCursor;
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: useCursor ]]
    -- upvalues: l_useCursor_0 (copy)
    return l_useCursor_0({
        radius = v3, 
        offset = v4, 
        borderWidth = v5
    });
end;