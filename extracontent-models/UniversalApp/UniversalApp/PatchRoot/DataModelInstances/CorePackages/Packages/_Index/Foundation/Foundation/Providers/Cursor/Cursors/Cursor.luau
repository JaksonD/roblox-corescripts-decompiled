local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.FoundationImages);
local v4 = require(l_Parent_0.React);
local l_Images_0 = v3.Images;
local v6 = require(script.Parent.Parent.CursorComponent);
local v7 = require(l_script_FirstAncestor_0.Enums.CursorType);
local v8 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_Components_0 = script.Parent.Parent.Parent.Parent.Components;
local v11 = require(l_Components_0.Image.ImageSet.getScaledSlice);
local v12 = {
    [v7.BulletUp] = {
        Tag = "SlicedImage", 
        Image = "component_assets/bulletUp_17_stroke_3", 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        InsetAdjustment = Vector2.new(2, 2)
    }, 
    [v7.BulletDown] = {
        Tag = "SlicedImage", 
        Image = "component_assets/bulletDown_17_stroke_3", 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        InsetAdjustment = Vector2.new(2, 2)
    }, 
    [v7.InputFields] = {
        Tag = "SlicedImage", 
        Image = "component_assets/circle_22_stroke_3", 
        SliceCenter = Rect.new(11, 11, 12, 12), 
        InsetAdjustment = Vector2.new(7, 0)
    }, 
    [v7.SelectionCell] = {
        Tag = "SlicedImage", 
        Image = "component_assets/square_7_stroke_3", 
        SliceCenter = Rect.new(3.5, 3.5, 3.5, 3.5), 
        InsetAdjustment = Vector2.new(2, 2), 
        Padding = 50
    }, 
    [v7.SelectedKnob] = {
        Tag = "FixedSizeImage", 
        Image = "component_assets/circle_42_stroke_3", 
        Size = 42
    }, 
    [v7.UnselectedKnob] = {
        Tag = "FixedSizeImage", 
        Image = "component_assets/circle_52_stroke_3", 
        Size = 52
    }, 
    [v7.InputButton] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 11), 
        Offset = 11, 
        BorderWidth = 3
    }, 
    [v7.RoundedRect] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 8), 
        Offset = 9, 
        BorderWidth = 3
    }, 
    [v7.RoundedRectNoInset] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 8), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v7.RoundedSlot] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 7), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v7.SkinToneCircle] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0.5, 0), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v7.SmallPill] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 15), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v7.LargePill] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 26), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v7.Square] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 0), 
        Offset = 2, 
        BorderWidth = 3
    }, 
    [v7.Toggle] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 13), 
        Offset = 0, 
        BorderWidth = 3
    }
};
return (v4.forwardRef(function(v13, v14) --[[ Line: 141 ]]
    -- upvalues: v9 (copy), v2 (copy), v8 (copy), v7 (copy), v4 (copy), v12 (copy), l_Images_0 (copy), v11 (copy), v6 (copy)
    local v15 = v9();
    local v16 = if v2.FoundationSupportPresentationContextInSelectionCursor then v13.colorMode else v8.Color;
    if v13.cursorType == v7.NavHighlight then
        return v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, -3), 
            Size = UDim2.new(1, 0, 0, 3), 
            BorderSizePixel = 1, 
            BackgroundColor3 = v15[v16].Selection.Start.Color3, 
            BackgroundTransparency = 0, 
            BorderColor3 = v15[v16].Selection.Start.Color3, 
            ref = v14
        });
    elseif v13.cursorType == v7.Invisible then
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ref = v14
        });
    else
        local v17 = v12[v13.cursorType];
        if v17.Tag == "FixedSizeImage" then
            local v18 = UDim2.fromOffset(v17.Size, v17.Size);
            local v19 = UDim2.new(0.5, -v18.X.Offset / 2, 0.5, -v18.Y.Offset / 2);
            return v4.createElement("ImageLabel", {
                Image = l_Images_0[v17.Image].Image, 
                BackgroundTransparency = 1, 
                ImageRectOffset = l_Images_0[v17.Image].ImageRectOffset, 
                ImageRectSize = l_Images_0[v17.Image].ImageRectSize, 
                Size = v18, 
                Position = v19, 
                ImageColor3 = v15[v16].Selection.Start.Color3, 
                ImageTransparency = v15[v16].Selection.Start.Transparency, 
                ref = v14
            });
        elseif v17.Tag == "SlicedImage" then
            local l_InsetAdjustment_0 = v17.InsetAdjustment;
            local v21 = UDim2.new(1, l_InsetAdjustment_0.X * 2, 1, l_InsetAdjustment_0.Y * 2);
            local v22 = v11(v17.SliceCenter);
            local v23 = if v17.Padding then v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v17.Padding), 
                PaddingBottom = UDim.new(0, v17.Padding), 
                PaddingLeft = UDim.new(0, v17.Padding), 
                PaddingRight = UDim.new(0, v17.Padding)
            }) else nil;
            return v4.createElement("ImageLabel", {
                Image = l_Images_0[v17.Image].Image, 
                BackgroundTransparency = 1, 
                ImageRectOffset = l_Images_0[v17.Image].ImageRectOffset, 
                ImageRectSize = l_Images_0[v17.Image].ImageRectSize, 
                SliceCenter = v22.center, 
                SliceScale = v22.scale, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = v21, 
                Position = UDim2.fromOffset(-l_InsetAdjustment_0.X, -l_InsetAdjustment_0.Y), 
                ImageColor3 = v15[v16].Selection.Start.Color3, 
                ImageTransparency = v15[v16].Selection.Start.Transparency, 
                ref = v14
            }, {
                Padding = v23
            });
        elseif v17.Tag == "RoundedImage" then
            return v4.createElement(v6, {
                isVisible = v13.isVisible, 
                cornerRadius = v17.CornerRadius, 
                offset = v17.Offset - v17.BorderWidth, 
                borderWidth = v17.BorderWidth, 
                colorMode = v13.colorMode, 
                ref = v14
            });
        else
            return nil;
        end;
    end;
end));