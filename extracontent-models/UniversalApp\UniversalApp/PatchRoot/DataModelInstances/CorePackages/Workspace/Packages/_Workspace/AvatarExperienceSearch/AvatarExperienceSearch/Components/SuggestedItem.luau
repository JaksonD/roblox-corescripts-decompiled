local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_script_FirstAncestor_0.Components.FlexLayout);
local v6 = require(l_script_FirstAncestor_0.Enums.SuggestedItemTypeEnum);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local function v14(v13) --[[ Line: 19 ]] --[[ Name: mapTokens ]]
    return {
        barBackgroundColor = v13.Semantic.Color.Background.Default.Color3, 
        barBackgroundTransparency = v13.Semantic.Color.Background.Default.Transparency, 
        barHeight = v13.Global.Size_700, 
        iconAndTextInputMargin = v13.Global.Space_200, 
        iconOffsetX = v13.Global.Space_50, 
        iconContainerSize = v13.Global.Size_400, 
        textColorGroup = v13.Semantic.Color.Text.Emphasis, 
        textFontGroup = v13.Semantic.Typography.Body, 
        textIconColor = v13.Semantic.Color.Text.Emphasis.Color3, 
        textIconTransparency = v13.Semantic.Color.Text.Emphasis.Transparency, 
        textSize = v13.Semantic.Typography.Body.FontSize, 
        trailingIconSize = v13.Global.Size_200, 
        autocompleteIconSize = v13.Global.Size_300, 
        recentIconSize = v13.Global.Size_400
    };
end;
local function v16(v15) --[[ Line: 38 ]] --[[ Name: getIconMap ]]
    -- upvalues: l_Images_0 (copy)
    return {
        recent = {
            icon = l_Images_0["icons/menu/recent"], 
            size = v15.recentIconSize
        }, 
        autocomplete = {
            icon = l_Images_0["icons/common/search"], 
            size = v15.autocompleteIconSize
        }
    };
end;
local function _(v17, v18) --[[ Line: 51 ]] --[[ Name: getDisplayProps ]]
    -- upvalues: v16 (copy), v6 (copy)
    local v19 = v16(v18);
    local v20 = nil;
    local v21 = nil;
    local v22 = false;
    if v17 == v6.Recent then
        return v19.recent.icon, v19.recent.size, true;
    else
        if v17 == v6.Autocomplete then
            v20 = v19.autocomplete.icon;
            v21 = v19.autocomplete.size;
        end;
        return v20, v21, v22;
    end;
end;
return v2.forwardRef(function(v24, v25) --[[ Line: 81 ]] --[[ Name: SuggestedItem ]]
    -- upvalues: l_useDesignTokens_0 (copy), v14 (copy), v16 (copy), v6 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v2 (copy), v5 (copy), l_ImageSetLabel_0 (copy), l_StyledTextLabel_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy)
    local v26 = l_useDesignTokens_0(v14);
    local v27 = v24.height or v26.barHeight;
    local l_text_0 = v24.text;
    local l_type_0 = v24.type;
    local v30 = v16(v26);
    local v31 = nil;
    local v32 = nil;
    local v33 = false;
    if l_type_0 == v6.Recent then
        v31 = v30.recent.icon;
        v32 = v30.recent.size;
        v33 = true;
    elseif l_type_0 == v6.Autocomplete then
        v31 = v30.autocomplete.icon;
        v32 = v30.autocomplete.size;
    end;
    local l_v31_0 = v31;
    local l_v32_0 = v32;
    local l_v33_0 = v33;
    v30 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    v31 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    v32 = v26.textFontGroup.FontSize;
    v33 = function() --[[ Line: 94 ]] --[[ Name: onActivate ]]
        -- upvalues: v24 (copy)
        v24.onActivate();
    end;
    local function v37() --[[ Line: 98 ]] --[[ Name: onTrailingButtonActivate ]]
        -- upvalues: v24 (copy)
        if v24.onTrailingButtonActivate then
            v24.onTrailingButtonActivate();
        end;
    end;
    return v2.createElement(v5, {
        Size = UDim2.new(1, 0, 0, v27), 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = v26.barBackgroundColor, 
        BackgroundTransparency = v26.barBackgroundTransparency, 
        LayoutOrder = v24.layoutOrder, 
        BorderSizePixel = 0, 
        margin = v26.iconOffsetX, 
        flexSlot = v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = v33, 
            [v2.Tag] = "data-testid=AvatarExperienceSearch_SuggestedItem_ImageButton", 
            SelectionImageObject = v31, 
            ref = v25
        }, {
            ButtonChildren = v2.createElement(v5, {
                margin = v26.iconOffsetX, 
                reverse = true, 
                rigidSlot = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Size = UDim2.fromOffset(v26.iconContainerSize, v26.iconContainerSize), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0.5, 0)
                }, {
                    SuggestedItemLeadingIcon = v2.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = l_v31_0, 
                        ImageColor3 = v26.textIconColor, 
                        ImageTransparency = v26.textIconTransparency, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.fromOffset(l_v32_0, l_v32_0)
                    })
                }), 
                flexSlot = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v27)
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    TextLabel = v2.createElement(l_StyledTextLabel_0, {
                        fontStyle = v26.textFontGroup, 
                        colorStyle = v26.textColorGroup, 
                        text = l_text_0 or "", 
                        textWrapped = false, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        automaticSize = Enum.AutomaticSize.X, 
                        size = UDim2.new(1, 0, 0, v32)
                    })
                })
            })
        }), 
        rigidSlot = if l_v33_0 then v2.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Image = l_Images_0["icons/navigation/close_small"], 
            ImageColor3 = v26.textIconColor, 
            ImageTransparency = v26.textIconTransparency, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.fromOffset(v26.trailingIconSize, v26.trailingIconSize), 
            [v2.Event.Activated] = v37, 
            [v2.Tag] = "data-testid=AvatarExperienceSearch_SuggestedItem_TrailingButton", 
            SelectionImageObject = v30
        }) else nil
    });
end);