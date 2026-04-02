local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_2.Foundation);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v9 = require(l_Parent_0.ImageSet.getIconSize);
local v10 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v11 = require(l_Parent_0.SelectionImage.CursorKind);
local v12 = require(l_Core_0.Style.useStyle);
local v13 = require(l_Core_0.Control.Enum.ControlState);
local v14 = require(l_Core_0.Control.Interactable);
local v15 = require(l_Core_0.Control.useControlState);
local v16 = require(l_Core_0.Button.getContentStyle);
local v17 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v18 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local l_Skeleton_0 = v6.Skeleton;
local l_Radius_0 = v6.Enums.Radius;
local v21 = require(l_Parent_1.Core.Text.GetTextSize);
local v22 = {
    hasBorder = false, 
    isDisabled = false, 
    isLoading = false, 
    isSelected = false, 
    layoutOrder = 1, 
    text = ""
};
local v23 = {
    [v13.Default] = "SystemPrimaryContent", 
    [v13.Hover] = "SystemPrimaryContent"
};
local v24 = {
    [v13.Default] = "TextDefault", 
    [v13.Hover] = "TextEmphasis"
};
local v25 = {
    [v13.Default] = "SystemPrimaryContent", 
    [v13.Hover] = "SystemPrimaryContent"
};
local v26 = {
    [v13.Default] = "BackgroundUIDefault", 
    [v13.Hover] = "BackgroundUIDefault"
};
local v27 = {
    [v13.Default] = "SystemPrimaryDefault", 
    [v13.Hover] = "SystemPrimaryOnHover"
};
local v28 = {
    [v13.Default] = "BackgroundOnHover", 
    [v13.Hover] = "BackgroundOnHover"
};
local function v67(v29) --[[ Line: 113 ]] --[[ Name: Pillv2 ]]
    -- upvalues: v4 (copy), v22 (copy), v15 (copy), v5 (copy), v12 (copy), v10 (copy), v11 (copy), v25 (copy), v24 (copy), v27 (copy), v26 (copy), v16 (copy), v23 (copy), v28 (copy), v9 (copy), v8 (copy), v21 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v13 (copy), v14 (copy), v17 (copy), v18 (copy), v7 (copy)
    local v30 = v4.Dictionary.join(v22, v29);
    local l_text_0 = v30.text;
    local v32, v33 = v15();
    local v36 = v5.useCallback(function(v34, v35) --[[ Line: 118 ]]
        -- upvalues: v30 (copy), v33 (copy)
        if v30.onStateChanged then
            v30.onStateChanged(v34, v35);
        end;
        v33(v34, v35);
    end, {
        v30.onStateChanged
    });
    local v37 = v12();
    local l_Font_0 = v37.Font;
    local v39 = v10(v11.SmallPill);
    local v40 = if v30.isSelected then v25 else v24;
    local v41 = if v30.isSelected then v27 else v26;
    local v42 = v16(v23, v32, v37);
    local v43 = v16(v40, v32, v37);
    local v44 = v16(v41, v32, v37);
    local v45 = v16(v28, v32, v37);
    local v46 = v9(v8.Small);
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v48 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
    local l_X_0 = v21(l_text_0, v48, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
    local v50 = l_X_0 + 24;
    local v51 = 216;
    if v30.isSelected then
        local v52 = 4 + v46;
        v50 = v50 + v52;
        v51 = v51 - v52;
    end;
    if v30.isLoading then
        return v5.createElement(l_Skeleton_0, {
            LayoutOrder = v30.layoutOrder, 
            Size = UDim2.fromOffset(v50, 28), 
            radius = l_Radius_0.Circle
        });
    else
        local v53 = not v30.isSelected and v32 == v13.Hover;
        local l_createElement_0 = v5.createElement;
        local l_v14_0 = v14;
        local v56 = {
            Size = UDim2.new(0, v50, 0, 28), 
            BackgroundColor3 = v44.Color, 
            BackgroundTransparency = v44.Transparency, 
            ImageColor3 = v44.Color, 
            ImageTransparency = v44.Transparency, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            LayoutOrder = v30.layoutOrder, 
            ScaleType = Enum.ScaleType.Slice, 
            isDisabled = v30.isDisabled, 
            SelectionImageObject = v39, 
            [v5.Event.Activated] = if not v30.isLoading then v30.onActivated else nil, 
            onStateChanged = v36, 
            ref = v30.controlRef, 
            NextSelectionLeft = v30.NextSelectionLeft, 
            NextSelectionRight = v30.NextSelectionRight, 
            NextSelectionUp = v30.NextSelectionUp, 
            NextSelectionDown = v30.NextSelectionDown
        };
        local v57 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UISizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = Vector2.new(28, 28), 
                MaxSize = Vector2.new(240, 28)
            })
        };
        local l_createElement_1 = v5.createElement;
        local v59 = "Frame";
        local v60 = {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v45.Color, 
            BackgroundTransparency = if v53 then v45.Transparency else 1
        };
        local v61 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UIStroke = if v30.hasBorder then v5.createElement("UIStroke", {
                Color = v37.Theme.Divider.Color, 
                Transparency = v37.Theme.Divider.Transparency, 
                Thickness = 1
            }) else nil
        };
        local l_createElement_2 = v5.createElement;
        local v63 = "Frame";
        local v64 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, l_X_0 + 4 + v46, 1, 0), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        };
        local v65 = {
            UIListLayout = v5.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        };
        local v66 = false;
        if string.len(l_text_0) > 0 then
            v66 = v5.createElement("Frame", {
                Size = UDim2.fromOffset(l_X_0, v48), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                PillText = v5.createElement(v17, {
                    Text = l_text_0, 
                    BackgroundTransparency = 1, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    colorStyle = v43, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.fromOffset(v51, v48), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }); 
                v5.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v51, 28)
                })
            });
        end;
        v65.TextArea = v66;
        v65.CloseIcon = v30.isSelected and v5.createElement(v18.Label, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v46, v46), 
            BackgroundTransparency = 1, 
            Image = v7["icons/navigation/close_small"], 
            ImageColor3 = v42.Color, 
            ImageTransparency = v42.Transparency
        });
        v65.UISizeConstraint = v5.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(216, 28)
        });
        v61.Content = l_createElement_2(v63, v64, v65);
        v57.BackgroundLayer2 = l_createElement_1(v59, v60, v61);
        return l_createElement_0(l_v14_0, v56, v57);
    end;
end;
return v5.forwardRef(function(v68, v69) --[[ Line: 256 ]]
    -- upvalues: v5 (copy), v67 (copy), v4 (copy)
    return v5.createElement(v67, v4.Dictionary.join(v68, {
        controlRef = v69
    }));
end);