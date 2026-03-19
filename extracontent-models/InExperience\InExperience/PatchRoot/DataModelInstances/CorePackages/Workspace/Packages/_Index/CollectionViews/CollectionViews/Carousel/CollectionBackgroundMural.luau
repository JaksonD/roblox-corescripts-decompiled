local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
return v1.memo(function(v4) --[[ Line: 22 ]] --[[ Name: CollectionBackgroundMural ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v1 (copy)
    local l_Color_0 = l_useStyle_0().Theme.BackgroundDefault.Color;
    local v6 = l_useDesignTokens_0();
    return v1.createElement("ImageLabel", {
        ImageTransparency = 0, 
        Image = v4.backgroundMuralUrl, 
        BackgroundTransparency = 1, 
        Size = v4.containerSizeBinding:map(function(v7) --[[ Line: 33 ]]
            return UDim2.new(1, 0, 0, v7.Y);
        end), 
        ZIndex = v4.ZIndex or -1, 
        LayoutOrder = v4.LayoutOrder, 
        ScaleType = Enum.ScaleType.Crop
    }, {
        GradientFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v6.Global.Color.Black.Color3), 
                    ColorSequenceKeypoint.new(1, l_Color_0)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end);