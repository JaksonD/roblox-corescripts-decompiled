local l_Parent_0 = script:FindFirstAncestor("UserTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_useTokens_0 = v2.Hooks.useTokens;
local function v9(v6) --[[ Line: 21 ]] --[[ Name: calculateAngle ]]
    local v7 = v6 >= 50 and 180 or math.map(v6, 0, 50, 360, 180);
    local v8 = v6 <= 50 and 180 or math.map(v6, 50, 100, 180, 0);
    return {
        leftAngle = v7, 
        rightAngle = v8
    };
end;
return function(v10) --[[ Line: 30 ]] --[[ Name: AnimatedRing ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v9 (copy), l_View_0 (copy), l_Image_0 (copy)
    local v11 = l_useTokens_0();
    local v12 = v1.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v9 (ref), v10 (copy)
        return (v9(v10.percentFilled));
    end, {
        v10.percentFilled
    });
    return v1.createElement(l_View_0, {
        tag = "size-full-full", 
        LayoutOrder = v10.layoutOrder
    }, {
        left = v1.createElement(l_View_0, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "position-top-left clip"
        }, {
            image = v1.createElement(l_Image_0, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                tag = "content-emphasis position-top-left"
            }, {
                gradient = v1.createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.4999, 1), 
                        NumberSequenceKeypoint.new(0.5, 0), 
                        NumberSequenceKeypoint.new(1, 0)
                    }), 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v11.Color.System.Emphasis.Color3), 
                        ColorSequenceKeypoint.new(1, v11.Color.System.Emphasis.Color3)
                    }), 
                    Rotation = v12.leftAngle
                })
            })
        }), 
        right = v1.createElement(l_View_0, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "clip position-top-center"
        }, {
            image = v1.createElement(l_Image_0, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                Position = UDim2.fromScale(-1, 0), 
                tag = "content-emphasis position-top-right"
            }, {
                gradient = v1.createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.4999, 1), 
                        NumberSequenceKeypoint.new(0.5, 0), 
                        NumberSequenceKeypoint.new(1, 0)
                    }), 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v11.Color.System.Emphasis.Color3), 
                        ColorSequenceKeypoint.new(1, v11.Color.System.Emphasis.Color3)
                    }), 
                    Rotation = v12.rightAngle
                })
            })
        })
    });
end;