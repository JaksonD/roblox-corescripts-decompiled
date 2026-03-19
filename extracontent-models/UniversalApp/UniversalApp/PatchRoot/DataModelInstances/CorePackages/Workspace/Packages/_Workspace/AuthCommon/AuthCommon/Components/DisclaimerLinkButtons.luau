local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useSelectionCursor_0 = v2.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local function v13(v10, v11, v12) --[[ Line: 39 ]]
    if v10 == Enum.FillDirection.Horizontal then
        return {
            CellSize = UDim2.new(0.5, -v12, 0, v11)
        };
    else
        return {
            CellSize = UDim2.new(1, 0, 0, v11)
        };
    end;
end;
local function v20(v14) --[[ Line: 51 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_useDesignTokens_0();
    local v17 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v18 = v16.Global.Size_700 or 80;
    local v19 = v16.Global.Size_350 or 42;
    return v1.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v18), 
        BackgroundTransparency = 1, 
        LayoutOrder = v14.layoutOrder, 
        [v1.Event.Activated] = v14.activated, 
        SelectionImageObject = v17
    }, {
        padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 36), 
            PaddingRight = UDim.new(0, 36)
        }), 
        ButtonText = v1.createElement(l_StyledTextLabel_0, {
            text = v14.text, 
            automaticSize = Enum.AutomaticSize.X, 
            size = UDim2.new(1, 0, 0, v18), 
            textXAlignment = Enum.TextXAlignment.Left, 
            fontStyle = v15.Font.Header1, 
            colorStyle = v15.Theme.TextDefault, 
            layoutOrder = 1
        }), 
        LinkIconImage = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v19, 0, v19), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ScaleType = Enum.ScaleType.Fit, 
            Image = l_Images_0["icons/navigation/externallink_medium"], 
            ImageColor3 = v15.Theme.UIEmphasis.Color, 
            ImageTransparency = 0
        })
    });
end;
return function(v21) --[[ Line: 94 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v13 (copy), v1 (copy), v20 (copy)
    local v22 = l_useDesignTokens_0();
    local v23 = v22.Global.Size_700 or 80;
    local v24 = v22.Global.Space_150 or 18;
    local v25 = v21.fillDirection or Enum.FillDirection.Vertical;
    local v26 = v13(v25, v23, v24);
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 0), 
        Selectable = false, 
        LayoutOrder = v21.layoutOrder
    }, {
        gridlayout = v1.createElement("UIGridLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = v25, 
            CellPadding = UDim2.new(0, v24, 0, v24), 
            CellSize = v26.CellSize
        }), 
        ButtonTos = v1.createElement(v20, {
            text = v21.textTos, 
            activated = v21.activatedTos, 
            layoutOrder = 1
        }), 
        ButtonPrivacy = v1.createElement(v20, {
            text = v21.textPrivacy, 
            activated = v21.activatedPrivacy, 
            layoutOrder = 2
        })
    });
end;