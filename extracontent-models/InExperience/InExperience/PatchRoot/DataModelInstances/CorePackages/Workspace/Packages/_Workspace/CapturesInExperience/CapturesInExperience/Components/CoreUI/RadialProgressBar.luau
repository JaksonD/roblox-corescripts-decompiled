local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
return v1.memo(v1.forwardRef(function(v6) --[[ Line: 18 ]] --[[ Name: RadialProgressBar ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy)
    local v7 = l_useTokens_0();
    local l_Background_0 = v7.Color.ActionSubtle.Background;
    local l_Foreground_0 = v7.Color.ActionSubtle.Foreground;
    local v10 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, l_Foreground_0.Transparency), 
        NumberSequenceKeypoint.new(0.4999, l_Foreground_0.Transparency), 
        NumberSequenceKeypoint.new(0.5, l_Background_0.Transparency), 
        NumberSequenceKeypoint.new(1, l_Background_0.Transparency)
    });
    local v11 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, l_Foreground_0.Color3), 
        ColorSequenceKeypoint.new(0.4999, l_Foreground_0.Color3), 
        ColorSequenceKeypoint.new(0.5, l_Background_0.Color3), 
        ColorSequenceKeypoint.new(1, l_Background_0.Color3)
    });
    return v1.createElement(l_View_0, {
        BackgroundTransparency = 1, 
        tag = "anchor-center-center bg-action-subtle position-center-center size-full"
    }, {
        LeftGradient = v1.createElement(l_View_0, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "bg-action-subtle clip"
        }, {
            Image = v1.createElement(l_Image_0, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1)
            }, {
                Gradient = v1.createElement("UIGradient", {
                    Transparency = v10, 
                    Color = v11, 
                    Rotation = v6.progress:map(function(v12) --[[ Line: 52 ]]
                        return (math.clamp(v12 * 360, 180, 360));
                    end)
                })
            })
        }), 
        RightGradient = v1.createElement(l_View_0, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "bg-action-subtle clip position-top-center"
        }, {
            Image = v1.createElement(l_Image_0, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                Position = UDim2.fromScale(-1, 0)
            }, {
                Gradient = v1.createElement("UIGradient", {
                    Transparency = v10, 
                    Color = v11, 
                    Rotation = v6.progress:map(function(v13) --[[ Line: 71 ]]
                        return (math.clamp(v13 * 360, 0, 180));
                    end)
                })
            })
        })
    });
end));