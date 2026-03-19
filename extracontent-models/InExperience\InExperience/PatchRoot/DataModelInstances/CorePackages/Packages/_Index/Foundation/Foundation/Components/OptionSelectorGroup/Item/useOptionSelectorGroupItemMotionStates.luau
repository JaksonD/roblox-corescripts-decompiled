local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v4 = require(l_Parent_0.Motion);
local l_TransitionPreset_0 = v4.TransitionPreset;
return function(v6, v7) --[[ Line: 27 ]] --[[ Name: useOptionSelectorGroupItemMotionStates ]]
    -- upvalues: v3 (copy), v4 (copy), l_TransitionPreset_0 (copy)
    local v8 = v3();
    return {
        Default = v4.createState({
            transparency = v6 or 0, 
            textTransparency = v6 or 0
        }, {
            iconTransparency = v4.transition(l_TransitionPreset_0.Default, {
                easingStyle = Enum.EasingStyle.Linear, 
                duration = v8.Time.Time_500
            }), 
            transparency = v4.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = v8.Time.Time_200
            }), 
            default = v4.transition(l_TransitionPreset_0.Default, {
                duration = v8.Time.Time_200
            })
        }), 
        Disabled = v4.createState({
            transparency = v7, 
            textTransparency = v7
        }, {
            default = v4.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = v8.Time.Time_100
            })
        })
    };
end;