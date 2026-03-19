local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Enums.TransitionPreset);
local v3 = {
    presets = {
        [v2.Default] = {
            duration = 0.3, 
            easingStyle = {
                0.2, 
                0, 
                0, 
                1
            }, 
            delay = 0
        }, 
        [v2.Quick] = {
            duration = 0.05, 
            easingStyle = {
                0.2, 
                0, 
                0, 
                1
            }, 
            delay = 0
        }, 
        [v2.Slow] = {
            duration = 1, 
            easingStyle = {
                0.2, 
                0, 
                0, 
                1
            }, 
            delay = 0
        }
    }
};
v3.getDefaultTransition = function() --[[ Line: 28 ]] --[[ Name: getDefaultTransition ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v4 = v3.presets[v2.Default];
    return {
        duration = v4.duration, 
        easingStyle = v4.easingStyle, 
        delay = v4.delay
    };
end;
v3.createDefaultTransitionState = function() --[[ Line: 39 ]] --[[ Name: createDefaultTransitionState ]]
    -- upvalues: v3 (copy)
    return {
        default = v3.getDefaultTransition()
    };
end;
return v3;