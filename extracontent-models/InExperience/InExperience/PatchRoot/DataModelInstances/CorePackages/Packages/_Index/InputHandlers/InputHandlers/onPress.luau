local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(script.Parent.handleInput);
return function(v3) --[[ Line: 7 ]] --[[ Name: onPress ]]
    -- upvalues: v2 (copy)
    return v2({
        onPress = v3
    });
end;