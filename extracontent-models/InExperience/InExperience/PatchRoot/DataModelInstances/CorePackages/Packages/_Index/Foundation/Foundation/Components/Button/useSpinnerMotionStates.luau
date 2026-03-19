local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local _ = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Motion);
local l_TransitionPreset_0 = v2.TransitionPreset;
return function() --[[ Line: 24 ]] --[[ Name: useSpinnerMotionStates ]]
    -- upvalues: v2 (copy), l_TransitionPreset_0 (copy)
    return {
        Default = v2.createState({
            scale = 0, 
            transparency = 1
        }, {
            default = v2.transition(l_TransitionPreset_0.Default, {
                duration = 0.2
            }), 
            transparency = v2.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.2
            })
        }), 
        Loading = v2.createState({
            scale = 1, 
            transparency = 0
        }, {
            default = v2.transition(l_TransitionPreset_0.Default, {
                duration = 0.2, 
                delay = 0.1
            }), 
            transparency = v2.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.2
            })
        })
    };
end;