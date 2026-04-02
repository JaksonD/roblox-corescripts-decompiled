local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.FoundationImages);
local v3 = require(l_Parent_0.React);
local l_Images_0 = v2.Images;
local v5 = require(script.Parent.Parent.CursorComponent);
local v6 = require(l_script_FirstAncestor_0.Enums.CursorType);
local _ = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_Components_0 = script.Parent.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.Image.ImageSet.getScaledSlice);
local v11 = {
    [v6.BulletUp] = {
        Tag = "SlicedImage", 
        Image = "component_assets/bulletUp_17_stroke_3", 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        InsetAdjustment = Vector2.new(2, 2)
    }, 
    [v6.BulletDown] = {
        Tag = "SlicedImage", 
        Image = "component_assets/bulletDown_17_stroke_3", 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        InsetAdjustment = Vector2.new(2, 2)
    }, 
    [v6.InputFields] = {
        Tag = "SlicedImage", 
        Image = "component_assets/circle_22_stroke_3", 
        SliceCenter = Rect.new(11, 11, 12, 12), 
        InsetAdjustment = Vector2.new(7, 0)
    }, 
    [v6.SelectionCell] = {
        Tag = "SlicedImage", 
        Image = "component_assets/square_7_stroke_3", 
        SliceCenter = Rect.new(3.5, 3.5, 3.5, 3.5), 
        InsetAdjustment = Vector2.new(2, 2), 
        Padding = 50
    }, 
    [v6.SelectedKnob] = {
        Tag = "FixedSizeImage", 
        Image = "component_assets/circle_42_stroke_3", 
        Size = 42
    }, 
    [v6.UnselectedKnob] = {
        Tag = "FixedSizeImage", 
        Image = "component_assets/circle_52_stroke_3", 
        Size = 52
    }, 
    [v6.InputButton] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 11), 
        Offset = 11, 
        BorderWidth = 3
    }, 
    [v6.RoundedRect] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 8), 
        Offset = 9, 
        BorderWidth = 3
    }, 
    [v6.RoundedRectNoInset] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 8), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.RoundedSlot] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 7), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.SkinToneCircle] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0.5, 0), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.SmallPill] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 15), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.LargePill] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 26), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.Square] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 0), 
        Offset = 2, 
        BorderWidth = 3
    }, 
    [v6.Toggle] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 13), 
        Offset = 0, 
        BorderWidth = 3
    }
};
return (v3.forwardRef(function(v12, v13) --[[ Line: 140 ]]
    -- upvalues: v8 (copy), v6 (copy), v3 (copy), v11 (copy), l_Images_0 (copy), v10 (copy), v5 (copy)
    local v14 = v8();
    local l_colorMode_0 = v12.colorMode;
    if v12.cursorType == v6.NavHighlight then
        return v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, -3), 
            Size = UDim2.new(1, 0, 0, 3), 
            BorderSizePixel = 1, 
            BackgroundColor3 = v14[l_colorMode_0].Selection.Start.Color3, 
            BackgroundTransparency = 0, 
            BorderColor3 = v14[l_colorMode_0].Selection.Start.Color3, 
            ref = v13
        });
    elseif v12.cursorType == v6.Invisible then
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ref = v13
        });
    else
        local v16 = v11[v12.cursorType];
        if v16.Tag == "FixedSizeImage" then
            local v17 = UDim2.fromOffset(v16.Size, v16.Size);
            local v18 = UDim2.new(0.5, -v17.X.Offset / 2, 0.5, -v17.Y.Offset / 2);
            return v3.createElement("ImageLabel", {
                Image = l_Images_0[v16.Image].Image, 
                BackgroundTransparency = 1, 
                ImageRectOffset = l_Images_0[v16.Image].ImageRectOffset, 
                ImageRectSize = l_Images_0[v16.Image].ImageRectSize, 
                Size = v17, 
                Position = v18, 
                ImageColor3 = v14[l_colorMode_0].Selection.Start.Color3, 
                ImageTransparency = v14[l_colorMode_0].Selection.Start.Transparency, 
                ref = v13
            });
        elseif v16.Tag == "SlicedImage" then
            local l_InsetAdjustment_0 = v16.InsetAdjustment;
            local v20 = UDim2.new(1, l_InsetAdjustment_0.X * 2, 1, l_InsetAdjustment_0.Y * 2);
            local v21 = v10(v16.SliceCenter);
            local v22 = if v16.Padding then v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v16.Padding), 
                PaddingBottom = UDim.new(0, v16.Padding), 
                PaddingLeft = UDim.new(0, v16.Padding), 
                PaddingRight = UDim.new(0, v16.Padding)
            }) else nil;
            return v3.createElement("ImageLabel", {
                Image = l_Images_0[v16.Image].Image, 
                BackgroundTransparency = 1, 
                ImageRectOffset = l_Images_0[v16.Image].ImageRectOffset, 
                ImageRectSize = l_Images_0[v16.Image].ImageRectSize, 
                SliceCenter = v21.center, 
                SliceScale = v21.scale, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = v20, 
                Position = UDim2.fromOffset(-l_InsetAdjustment_0.X, -l_InsetAdjustment_0.Y), 
                ImageColor3 = v14[l_colorMode_0].Selection.Start.Color3, 
                ImageTransparency = v14[l_colorMode_0].Selection.Start.Transparency, 
                ref = v13
            }, {
                Padding = v22
            });
        elseif v16.Tag == "RoundedImage" then
            return v3.createElement(v5, {
                isVisible = v12.isVisible, 
                cornerRadius = v16.CornerRadius, 
                offset = v16.Offset - v16.BorderWidth, 
                borderWidth = v16.BorderWidth, 
                colorMode = v12.colorMode, 
                ref = v13
            });
        else
            return nil;
        end;
    end;
end));