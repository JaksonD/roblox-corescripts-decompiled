local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Motion);
local l_TransitionPreset_0 = v3.TransitionPreset;
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v6, v7) --[[ Line: 28 ]] --[[ Name: useSliderMotionStates ]]
    -- upvalues: v3 (copy), l_TransitionPreset_0 (copy)
    return {
        Hidden = v3.createState({
            transparency = 1, 
            knobStyle = {
                Color3 = v6.Color3, 
                Transparency = 1
            }
        }, {
            default = v3.transition(l_TransitionPreset_0.Default, {
                duration = 0.15
            })
        }), 
        Idle = v3.createState({
            transparency = 0, 
            knobStyle = v6
        }, {
            default = v3.transition(l_TransitionPreset_0.Default, {
                duration = 0.15
            })
        }), 
        Dragging = v3.createState({
            transparency = 0, 
            knobStyle = v7
        }, {
            default = v3.transition(l_TransitionPreset_0.Default, {
                duration = 0.1
            })
        })
    };
end;