local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local _ = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Motion);
local l_TransitionPreset_0 = v2.TransitionPreset;
return function(v4, v5) --[[ Line: 27 ]] --[[ Name: useButtonMotionStates ]]
    -- upvalues: v2 (copy), l_TransitionPreset_0 (copy)
    return {
        Default = v2.createState({
            transparency = v4 or 0, 
            textTransparency = v4 or 0, 
            iconScale = 1
        }, {
            iconTransparency = v2.transition(l_TransitionPreset_0.Default, {
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.5
            }), 
            transparency = v2.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.2
            }), 
            default = v2.transition(l_TransitionPreset_0.Default, {
                duration = 0.2
            })
        }), 
        Loading = v2.createState({
            transparency = 0, 
            textTransparency = 1, 
            iconTransparency = 1, 
            iconScale = 0
        }, {
            iconTransparency = v2.transition(l_TransitionPreset_0.Default, {
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.2
            }), 
            default = v2.transition(l_TransitionPreset_0.Default, {
                duration = 0.2
            })
        }), 
        Disabled = v2.createState({
            transparency = v5, 
            textTransparency = v5
        }, {
            default = v2.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.1
            })
        })
    };
end;