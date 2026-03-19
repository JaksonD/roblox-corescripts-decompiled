local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_0.ImageSet.Images);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v10 = require(l_Parent_0.SelectionImage.CursorKind);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Enum.ControlState);
local v13 = require(l_Core_0.Control.Interactable);
local v14 = require(l_Core_0.Control.useControlState);
local v15 = require(l_Core_0.Button.getContentStyle);
local v16 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v17 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v18 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v19 = require(l_Parent_1.Core.Text.GetTextSize);
local v20 = {
    hasBorder = false, 
    isDisabled = false, 
    isLoading = false, 
    isSelected = false, 
    layoutOrder = 1, 
    text = ""
};
local v21 = {
    [v12.Default] = "SystemPrimaryContent", 
    [v12.Hover] = "SystemPrimaryContent"
};
local v22 = {
    [v12.Default] = "TextDefault", 
    [v12.Hover] = "TextEmphasis"
};
local v23 = {
    [v12.Default] = "SystemPrimaryContent", 
    [v12.Hover] = "SystemPrimaryContent"
};
local v24 = {
    [v12.Default] = "BackgroundUIDefault", 
    [v12.Hover] = "BackgroundUIDefault"
};
local v25 = {
    [v12.Default] = "SystemPrimaryDefault", 
    [v12.Hover] = "SystemPrimaryOnHover"
};
local v26 = {
    [v12.Default] = "BackgroundOnHover", 
    [v12.Hover] = "BackgroundOnHover"
};
local function v65(v27) --[[ Line: 111 ]] --[[ Name: Pillv2 ]]
    -- upvalues: v4 (copy), v20 (copy), v14 (copy), v5 (copy), v11 (copy), v9 (copy), v10 (copy), v23 (copy), v22 (copy), v25 (copy), v24 (copy), v15 (copy), v21 (copy), v26 (copy), v8 (copy), v7 (copy), v19 (copy), v18 (copy), v12 (copy), v13 (copy), v16 (copy), v17 (copy), v6 (copy)
    local v28 = v4.Dictionary.join(v20, v27);
    local l_text_0 = v28.text;
    local v30, v31 = v14();
    local v34 = v5.useCallback(function(v32, v33) --[[ Line: 116 ]]
        -- upvalues: v28 (copy), v31 (copy)
        if v28.onStateChanged then
            v28.onStateChanged(v32, v33);
        end;
        v31(v32, v33);
    end, {
        v28.onStateChanged
    });
    local v35 = v11();
    local l_Font_0 = v35.Font;
    local v37 = v9(v10.SmallPill);
    local v38 = if v28.isSelected then v23 else v22;
    local v39 = if v28.isSelected then v25 else v24;
    local v40 = v15(v21, v30, v35);
    local v41 = v15(v38, v30, v35);
    local v42 = v15(v39, v30, v35);
    local v43 = v15(v26, v30, v35);
    local v44 = v8(v7.Small);
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v46 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
    local l_X_0 = v19(l_text_0, v46, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
    local v48 = l_X_0 + 24;
    local v49 = 216;
    if v28.isSelected then
        local v50 = 4 + v44;
        v48 = v48 + v50;
        v49 = v49 - v50;
    end;
    if v28.isLoading then
        return v5.createElement(v18, {
            LayoutOrder = v28.layoutOrder, 
            Size = UDim2.new(0, v48, 0, 28), 
            cornerRadius = UDim.new(1, 0)
        });
    else
        local v51 = not v28.isSelected and v30 == v12.Hover;
        local l_createElement_0 = v5.createElement;
        local l_v13_0 = v13;
        local v54 = {
            Size = UDim2.new(0, v48, 0, 28), 
            BackgroundColor3 = v42.Color, 
            BackgroundTransparency = v42.Transparency, 
            ImageColor3 = v42.Color, 
            ImageTransparency = v42.Transparency, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            LayoutOrder = v28.layoutOrder, 
            ScaleType = Enum.ScaleType.Slice, 
            isDisabled = v28.isDisabled, 
            SelectionImageObject = v37, 
            [v5.Event.Activated] = if not v28.isLoading then v28.onActivated else nil, 
            onStateChanged = v34, 
            ref = v28.controlRef, 
            NextSelectionLeft = v28.NextSelectionLeft, 
            NextSelectionRight = v28.NextSelectionRight, 
            NextSelectionUp = v28.NextSelectionUp, 
            NextSelectionDown = v28.NextSelectionDown
        };
        local v55 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UISizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = Vector2.new(28, 28), 
                MaxSize = Vector2.new(240, 28)
            })
        };
        local l_createElement_1 = v5.createElement;
        local v57 = "Frame";
        local v58 = {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v43.Color, 
            BackgroundTransparency = if v51 then v43.Transparency else 1
        };
        local v59 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UIStroke = if v28.hasBorder then v5.createElement("UIStroke", {
                Color = v35.Theme.Divider.Color, 
                Transparency = v35.Theme.Divider.Transparency, 
                Thickness = 1
            }) else nil
        };
        local l_createElement_2 = v5.createElement;
        local v61 = "Frame";
        local v62 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, l_X_0 + 4 + v44, 1, 0), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        };
        local v63 = {
            UIListLayout = v5.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        };
        local v64 = false;
        if string.len(l_text_0) > 0 then
            v64 = v5.createElement("Frame", {
                Size = UDim2.fromOffset(l_X_0, v46), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                PillText = v5.createElement(v16, {
                    Text = l_text_0, 
                    BackgroundTransparency = 1, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    colorStyle = v41, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.fromOffset(v49, v46), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }); 
                v5.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v49, 28)
                })
            });
        end;
        v63.TextArea = v64;
        v63.CloseIcon = v28.isSelected and v5.createElement(v17.Label, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v44, v44), 
            BackgroundTransparency = 1, 
            Image = v6["icons/navigation/close_small"], 
            ImageColor3 = v40.Color, 
            ImageTransparency = v40.Transparency
        });
        v63.UISizeConstraint = v5.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(216, 28)
        });
        v59.Content = l_createElement_2(v61, v62, v63);
        v55.BackgroundLayer2 = l_createElement_1(v57, v58, v59);
        return l_createElement_0(l_v13_0, v54, v55);
    end;
end;
return v5.forwardRef(function(v66, v67) --[[ Line: 254 ]]
    -- upvalues: v5 (copy), v65 (copy), v4 (copy)
    return v5.createElement(v65, v4.Dictionary.join(v66, {
        controlRef = v67
    }));
end);