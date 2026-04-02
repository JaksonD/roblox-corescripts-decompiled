local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.Foundation);
local v6 = require(l_Core_0.Control.Enum.ControlState);
local v7 = require(l_Core_0.Button.getContentStyle);
local v8 = require(l_Core_0.Control.Interactable);
local v9 = require(l_Core_0.Style.useStyle);
local v10 = require(l_Core_0.ImageSet.ImageSetComponent);
local l_Skeleton_0 = v5.Skeleton;
local v12 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v13 = require(l_Parent_0.ImageSet.Images);
local v14 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v15 = require(l_Parent_0.ImageSet.getIconSize);
local v16 = v13["component_assets/circle_9"];
local v17 = v13["component_assets/circle_9_stroke_1"];
local v18 = {
    [v6.Default] = "SecondaryDefault", 
    [v6.Hover] = "SecondaryOnHover"
};
local v19 = {
    [v6.Default] = "SecondaryDefault", 
    [v6.Hover] = "SecondaryDefault"
};
local v20 = {
    [v6.Default] = "TextDefault", 
    [v6.Hover] = "TextEmphasis"
};
local v21 = {
    [v6.Default] = "TextEmphasis", 
    [v6.Hover] = "TextEmphasis"
};
local v22 = {
    [v6.Default] = "BackgroundMuted"
};
local v23 = {
    [v6.Default] = "PlaceHolder"
};
local v24 = {
    [v6.Default] = "PlaceHolder"
};
local v25 = {
    [v6.Default] = "TextEmphasis"
};
return function(v26) --[[ Line: 97 ]] --[[ Name: TileSlot ]]
    -- upvalues: v4 (copy), v6 (copy), v9 (copy), v7 (copy), v19 (copy), v18 (copy), v21 (copy), v20 (copy), v25 (copy), v23 (copy), v22 (copy), v24 (copy), v8 (copy), v10 (copy), v16 (copy), v17 (copy), v15 (copy), v14 (copy), v12 (copy), l_Skeleton_0 (copy)
    local v27, v28 = v4.useState(v6.Initialize);
    local v29, v30 = v4.useState(false);
    local v31 = v4.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v26 (copy)
        v26.onActivated(v26.index);
    end, {
        v26.onActivated, 
        v26.index
    });
    local v34 = v4.useCallback(function(v32, v33) --[[ Line: 105 ]]
        -- upvalues: v28 (copy), v6 (ref), v30 (copy), v26 (copy)
        v28(v33);
        if v33 == v6.Hover then
            v30(true);
        else
            v30(false);
        end;
        if v26.onStateChanged then
            v26.onStateChanged(v32, v33);
        end;
    end, {
        v26.onStateChanged
    });
    local v35 = v9();
    local l_isDisabled_0 = v26.isDisabled;
    local l_isLoading_0 = v26.isLoading;
    local v38 = l_isDisabled_0 and v6.Disabled or v27;
    local l_isSelected_0 = v26.isSelected;
    local v40 = v29 or l_isSelected_0;
    local v41 = l_isSelected_0 and v7(v19, v38, v35) or v7(v18, v38, v35);
    local v42 = l_isSelected_0 and v7(v21, v38, v35) or v7(v20, v38, v35);
    local v43 = v7(v25, v38, v35);
    local v44 = l_isSelected_0 and v7(v23, v38, v35) or v7(v22, v38, v35);
    local v45 = v7(v24, v38, v35);
    local l_SubHeader1_0 = v35.Font.SubHeader1;
    local l_thumbnail_0 = v26.thumbnail;
    local v48 = v26.thumbnail ~= nil;
    local v49 = v26.displayText ~= nil;
    local v50 = l_isDisabled_0 or l_isLoading_0;
    if v50 then
        v40 = false;
    end;
    return v4.createElement(v8, {
        Size = UDim2.fromOffset(48, 48), 
        Position = v26.position or UDim2.fromScale(0, 0), 
        BackgroundTransparency = 1, 
        onStateChanged = v34, 
        [v4.Event.Activated] = not v50 and v31 or nil
    }, {
        Button = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Background = v4.createElement(v10.Label, {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                Image = v16, 
                ImageColor3 = v49 and v44.Color or v45.Color, 
                ImageTransparency = v49 and v44.Transparency or v45.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(4, 4, 5, 5), 
                ZIndex = 1
            }), 
            Border = if v40 then v4.createElement(v10.Label, {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                Image = v17, 
                ImageColor3 = v41.Color, 
                ImageTransparency = v41.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(4, 4, 5, 5), 
                ZIndex = 2
            }) else nil, 
            ButtonContentLayer = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                Thumbnail = if not l_isLoading_0 and v48 then v4.createElement(v10.Label, {
                    Size = UDim2.fromOffset(v15(v14.Medium), v15(v14.Medium)), 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_thumbnail_0, 
                    ImageColor3 = v43.Color, 
                    ImageTransparency = v43.Transparency, 
                    ZIndex = 3
                }) else nil, 
                Text = if not l_isLoading_0 and v49 then v4.createElement(v12, {
                    Size = UDim2.new(1, -24, 1, -24), 
                    BackgroundTransparency = 1, 
                    Text = v26.displayText, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    fontStyle = l_SubHeader1_0, 
                    colorStyle = v42, 
                    ZIndex = 3
                }) else nil, 
                LoadingShimmer = if l_isLoading_0 then v4.createElement(l_Skeleton_0, {
                    Size = UDim2.fromScale(1, 1)
                }) else nil
            })
        })
    });
end;