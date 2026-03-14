local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Image_0 = require(l_Parent_0.Foundation).Image;
local v5 = require(l_script_FirstAncestor_0.Enums.RoundedVariant);
local v6 = {
    LayoutOrder = 0, 
    cornerRadius = 20, 
    aspectRatio = 1, 
    Visible = true
};
local v7 = {
    NumberSequenceKeypoint.new(0, 1), 
    NumberSequenceKeypoint.new(0.1, 1), 
    NumberSequenceKeypoint.new(0.4, 0), 
    NumberSequenceKeypoint.new(1, 0)
};
return v2.memo(function(v8) --[[ Line: 36 ]] --[[ Name: GameCardThumbnail ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy), v5 (copy), v7 (copy), l_Image_0 (copy)
    local v9 = v3.Dictionary.union(v6, v8);
    local v11 = v2.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v9 (copy), v5 (ref)
        local v10 = math.deg((math.atan(v9.aspectRatio)));
        return {
            [v5.Top] = 90, 
            [v5.Bottom] = 270, 
            [v5.Left] = 0, 
            [v5.Right] = 180, 
            [v5.TopLeft] = v10 + 0, 
            [v5.TopRight] = 180 - v10, 
            [v5.BottomLeft] = v10 + 180, 
            [v5.BottomRight] = 360 - v10
        };
    end, {
        v9.aspectRatio
    });
    local v12 = v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v2 (ref), v9 (copy), v11 (copy), v7 (ref)
        return v2.createElement("UIGradient", {
            Rotation = if v9.roundedVariant then v11[v9.roundedVariant] else 0, 
            Transparency = NumberSequence.new(v7)
        });
    end, {
        v9.roundedVariant, 
        v11
    });
    return v2.createElement(l_Image_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Image = v9.gameThumbnail, 
        ZIndex = 0, 
        LayoutOrder = v9.LayoutOrder, 
        aspectRatio = {
            AspectRatio = v9.aspectRatio, 
            AspectType = Enum.AspectType.ScaleWithParentSize, 
            DominantAxis = Enum.DominantAxis.Width
        }, 
        cornerRadius = UDim.new(0, v9.cornerRadius), 
        onActivated = v9.onActivated, 
        Visible = v9.Visible
    }, {
        OverlayImage = v2.createElement(l_Image_0, {
            tag = "size-full", 
            Image = v9.gameThumbnail, 
            Visible = v9.Visible
        }, {
            TransparencyGradient = v12
        })
    });
end);