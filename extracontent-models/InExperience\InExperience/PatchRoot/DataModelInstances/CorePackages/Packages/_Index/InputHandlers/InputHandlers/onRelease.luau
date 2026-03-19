local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(script.Parent.handleInput);
return function(v3) --[[ Line: 7 ]] --[[ Name: onRelease ]]
    -- upvalues: v2 (copy)
    return v2({
        onRelease = v3
    });
end;