local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(script.Parent.handleInput);
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: onLongPress ]]
    -- upvalues: v2 (copy)
    return v2({
        hold = {
            durationSeconds = v3, 
            onComplete = v4, 
            onStep = v5
        }
    });
end;