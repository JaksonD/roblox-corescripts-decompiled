local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Enums.BlurDirection);
local function v8(v4, v5) --[[ Line: 24 ]] --[[ Name: getImageRect ]]
    -- upvalues: v3 (copy)
    local l_X_0 = v5.X;
    local l_Y_0 = v5.Y;
    if v4 == v3.Up then
        return Vector2.new(0, 0), Vector2.new(l_X_0, 1);
    elseif v4 == v3.Down then
        return Vector2.new(0, l_Y_0 - 1), Vector2.new(l_X_0, 1);
    elseif v4 == v3.Left then
        return Vector2.new(0, 0), Vector2.new(1, l_Y_0);
    elseif v4 == v3.Right then
        return Vector2.new(l_X_0 - 1, 0), Vector2.new(1, l_Y_0);
    else
        return nil;
    end;
end;
local function _(v9) --[[ Line: 40 ]] --[[ Name: getGradientRotation ]]
    -- upvalues: v3 (copy)
    if v9 == v3.Up then
        return 270;
    elseif v9 == v3.Down then
        return 90;
    elseif v9 == v3.Left then
        return 180;
    elseif v9 == v3.Right then
        return 0;
    else
        return nil;
    end;
end;
local function v12(v11) --[[ Line: 54 ]] --[[ Name: getRadialGradientPosition ]]
    -- upvalues: v3 (copy)
    if v11 == v3.Up then
        return UDim2.fromScale(0.5, 1);
    elseif v11 == v3.Down then
        return UDim2.fromScale(0.5, 0);
    elseif v11 == v3.Left then
        return UDim2.fromScale(1, 0.5);
    elseif v11 == v3.Right then
        return UDim2.fromScale(0, 0.5);
    else
        return nil;
    end;
end;
local function v16(v13, v14) --[[ Line: 68 ]] --[[ Name: getTransparency ]]
    if not v14 then
        return v13;
    else
        return v14:map(function(v15) --[[ Line: 76 ]]
            -- upvalues: v13 (copy)
            return v13 + (1 - v13) * v15;
        end);
    end;
end;
return function(v17) --[[ Line: 81 ]] --[[ Name: ImageBlurEffect ]]
    -- upvalues: v8 (copy), v12 (copy), v2 (copy), v16 (copy), v3 (copy)
    local v18 = if v17.gradientColor then v17.gradientColor else Color3.new(0, 0, 0);
    local v19, v20 = v8(v17.direction, v17.imageSize);
    local v21 = v12(v17.direction);
    local v22 = v2.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: v16 (ref), v17 (copy)
        return v16(0, v17.transparencyBinding);
    end, {
        v17.transparencyBinding
    });
    local v23 = v2.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v16 (ref), v17 (copy)
        return v16(0.9, v17.transparencyBinding);
    end, {
        v17.transparencyBinding
    });
    local v24 = v2.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v16 (ref), v17 (copy)
        return v16(0.8, v17.transparencyBinding);
    end, {
        v17.transparencyBinding
    });
    local l_createElement_0 = v2.createElement;
    local v26 = "ImageLabel";
    local v27 = {
        AnchorPoint = v17.AnchorPoint, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = v17.image, 
        ImageRectOffset = v19, 
        ImageRectSize = v20, 
        ImageTransparency = v22, 
        Position = v17.Position, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = v17.Size, 
        ZIndex = v17.ZIndex
    };
    local v28 = {};
    local l_createElement_1 = v2.createElement;
    local v30 = "UIGradient";
    local v31 = {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
            ColorSequenceKeypoint.new(1, v18)
        })
    };
    local l_direction_0 = v17.direction;
    v31.Rotation = l_direction_0 == v3.Up and 270 or l_direction_0 == v3.Down and 90 or l_direction_0 == v3.Left and 180 or l_direction_0 == v3.Right and 0 or nil;
    v31.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3), 
        NumberSequenceKeypoint.new(0.5, 0.5), 
        NumberSequenceKeypoint.new(1, 1)
    });
    v28.UIGradient = l_createElement_1(v30, v31);
    v28.RadialBlur = v2.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/shadowblurmask.png", 
        ImageTransparency = v23, 
        Position = v21, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(2, 2), 
        ZIndex = 1
    });
    v28.SoftEdges = v2.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/edgeBlur.png", 
        ImageTransparency = v24, 
        Position = v21, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1.5, 2), 
        ZIndex = 2
    });
    return l_createElement_0(v26, v27, v28);
end;