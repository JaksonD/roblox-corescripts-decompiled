local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Motion);
local l_TransitionPreset_0 = v6.TransitionPreset;
return function(v8, v9) --[[ Line: 41 ]] --[[ Name: useInputMotionStates ]]
    -- upvalues: v4 (copy), v6 (copy), l_TransitionPreset_0 (copy)
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if v4.FoundationToggleVisualUpdate then
        v10 = if v9 and v9.backgroundStyle then v9.backgroundStyle else v8.Color.Content.Default;
        v11 = if v9 and v9.hoverStyle then v9.hoverStyle else v8.Color.Content.Emphasis;
        v12 = if v9 and v9.checkedStyle then v9.checkedStyle else v8.Color.ActionSubEmphasis.Background;
        v13 = if v9 and v9.labelStyle then v9.labelStyle else v8.Color.Content.Default;
        v14 = if v9 and v9.labelHoverStyle then v9.labelHoverStyle else v8.Color.Content.Emphasis;
    else
        v10 = v8.Color.Content.Default;
        v11 = v8.Color.Content.Emphasis;
        v13 = v8.Color.Content.Default;
        v14 = v8.Color.Content.Emphasis;
        v12 = v9 or v8.Color.ActionSubEmphasis.Background;
    end;
    return {
        Default = v6.createState({
            backgroundStyle = {
                Color3 = v10.Color3, 
                Transparency = if v9 and v9.backgroundStyle then v9.backgroundStyle.Transparency else 1
            }, 
            strokeStyle = v10, 
            labelStyle = v13
        }, {
            default = v6.transition(l_TransitionPreset_0.Default, {
                duration = 0.2
            }), 
            transparency = v6.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.2
            })
        }), 
        Hover = v6.createState({
            backgroundStyle = {
                Color3 = v11.Color3, 
                Transparency = if v9 and v9.hoverStyle then v9.hoverStyle.Transparency else 1
            }, 
            strokeStyle = v11, 
            labelStyle = v14
        }, {
            default = v6.transition(l_TransitionPreset_0.Default, {
                duration = 0
            }), 
            transparency = v6.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0
            })
        }), 
        Checked = v6.createState({
            backgroundStyle = v12, 
            strokeStyle = v12, 
            labelStyle = v14
        }, {
            default = v6.transition(l_TransitionPreset_0.Default, {
                duration = 0.2
            }), 
            transparency = v6.transition({
                easingStyle = Enum.EasingStyle.Linear, 
                duration = 0.2
            })
        })
    };
end;