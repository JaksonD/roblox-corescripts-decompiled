local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = {
    testId = "--foundation-circular-progress-bar"
};
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 22 ]] --[[ Name: CircularProgressBar ]]
    -- upvalues: v8 (copy), v9 (copy), v6 (copy), v2 (copy), v5 (copy), v7 (copy), v3 (copy)
    local v12 = v8(v10, v9);
    local v13 = v6();
    local v14 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, v13.Color.Content.Emphasis.Transparency), 
        NumberSequenceKeypoint.new(0.4999, v13.Color.Content.Emphasis.Transparency), 
        NumberSequenceKeypoint.new(0.5, v13.Color.Content.Muted.Transparency), 
        NumberSequenceKeypoint.new(1, v13.Color.Content.Muted.Transparency)
    });
    local v15 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v13.Color.Content.Emphasis.Color3), 
        ColorSequenceKeypoint.new(0.4999, v13.Color.Content.Emphasis.Color3), 
        ColorSequenceKeypoint.new(0.5, v13.Color.Content.Muted.Color3), 
        ColorSequenceKeypoint.new(1, v13.Color.Content.Muted.Color3)
    });
    return v2.createElement(v5, v7(v12, {
        tag = "size-full-full", 
        ref = v11
    }), {
        LeftGradient = v2.createElement(v5, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "position-top-left clip"
        }, {
            Image = v2.createElement(v3, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                tag = "content-emphasis position-top-left", 
                testId = ("%*--left-gradient"):format(v12.testId)
            }, {
                Gradient = v2.createElement("UIGradient", {
                    Transparency = v14, 
                    Color = v15, 
                    Rotation = v12.progress:map(function(v16) --[[ Line: 60 ]]
                        return (math.clamp(v16 * 360, 180, 360));
                    end)
                })
            })
        }), 
        RightGradient = v2.createElement(v5, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "clip position-top-center"
        }, {
            Image = v2.createElement(v3, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                Position = UDim2.fromScale(-1, 0), 
                tag = "content-emphasis", 
                testId = ("%*--right-gradient"):format(v12.testId)
            }, {
                Gradient = v2.createElement("UIGradient", {
                    Transparency = v14, 
                    Color = v15, 
                    Rotation = v12.progress:map(function(v17) --[[ Line: 80 ]]
                        return (math.clamp(v17 * 360, 0, 180));
                    end)
                })
            })
        })
    });
end));