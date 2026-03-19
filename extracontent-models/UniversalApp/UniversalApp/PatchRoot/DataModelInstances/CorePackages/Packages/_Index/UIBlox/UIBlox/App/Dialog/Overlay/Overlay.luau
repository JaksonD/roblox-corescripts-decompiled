local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_Core_0 = l_Parent_0.Core;
local v4 = require(l_Core_0.Style.useStyle);
local v5 = require(l_Parent_1.ReactOtter);
local v6 = {
    dampingRatio = 1, 
    frequency = 3
};
local v7 = {
    top = 270, 
    topRight = 305, 
    right = 0, 
    bottomRight = 45, 
    bottom = 90, 
    bottomLeft = 135, 
    left = 180, 
    topLeft = 225
};
return function(v8) --[[ Line: 48 ]] --[[ Name: Overlay ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy), v6 (copy), v7 (copy)
    local l_Theme_0 = v4().Theme;
    local v10 = v8.showGradient and 0 or 1;
    local v11, v12 = v5.useAnimatedBinding(v10);
    v2.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v8 (copy), v12 (copy), v5 (ref), v6 (ref)
        if v8.showGradient == false then
            v12(v5.spring(1, v6));
            return;
        else
            v12(v5.spring(0, v6));
            return;
        end;
    end, {
        v8.showGradient
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        ZIndex = v8.ZIndex
    }, {
        Overlay = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            ZIndex = 1
        }), 
        Gradient = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = v11, 
            ZIndex = 2
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = v7[v8.gradientDirection], 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 0.89)
                })
            })
        })
    });
end;