local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.Cryo);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.Style.StyleTypes);
local l_Label_0 = require(l_Parent_1.Core.ImageSet.ImageSetComponent).Label;
local v8 = require(l_Parent_0.Loading.ShimmerPanel);
local v9 = require(l_Parent_1.Core.Style.useStyle);
local v10 = require(l_Parent_1.UIBloxConfig);
local v11 = require(l_Parent_1.Utility.OpenTypeSupport);
local function v13(v12) --[[ Line: 80 ]] --[[ Name: getStyleDefaults ]]
    return {
        iconLabelSpacing = v12.Global.Space_25, 
        iconSize = v12.Semantic.Icon.Size.Small, 
        iconColorStyle = v12.Semantic.Color.Icon.Default, 
        labelTypography = v12.Semantic.Typography.CaptionHeader, 
        labelColorStyle = v12.Semantic.Color.Text.Default
    };
end;
local function _(v14) --[[ Line: 90 ]] --[[ Name: getDisplayNameStyleDefaults ]]
    return {
        iconLabelSpacing = v14.Global.Space_25, 
        iconSize = v14.Semantic.Icon.Size.Small, 
        labelTypography = v14.Semantic.Typography.Subheader, 
        labelColorStyle = v14.Semantic.Color.Text.Emphasis
    };
end;
local function v17(v16) --[[ Line: 99 ]] --[[ Name: getUserNameStyleDefaults ]]
    return {
        iconLabelSpacing = v16.Global.Space_25, 
        iconSize = v16.Global.Size_150, 
        iconColorStyle = v16.Semantic.Color.Icon.Default, 
        labelTypography = v16.Semantic.Typography.CaptionHeader, 
        labelColorStyle = v16.Semantic.Color.Text.Default
    };
end;
local function v38(v18) --[[ Line: 109 ]] --[[ Name: NameItem ]]
    -- upvalues: v4 (copy), v3 (copy), l_Label_0 (copy), v8 (copy), v10 (copy)
    local l_layoutOrder_0 = v18.layoutOrder;
    local l_isReversed_0 = v18.isReversed;
    local l_itemProps_0 = v18.itemProps;
    local l_itemStyleDefaults_0 = v18.itemStyleDefaults;
    local l_icon_0 = l_itemProps_0.icon;
    local l_labelText_0 = l_itemProps_0.labelText;
    local l_useTextAsIcon_0 = l_itemProps_0.useTextAsIcon;
    local l_onActivated_0 = l_itemProps_0.onActivated;
    local v27 = l_itemProps_0.isLoading ~= nil and l_itemProps_0.isLoading;
    local v28 = v4.Dictionary.join(l_itemStyleDefaults_0, l_itemProps_0.styleProps or {});
    local l_iconLabelSpacing_0 = v28.iconLabelSpacing;
    local l_iconSize_0 = v28.iconSize;
    local v31 = v28.iconColorStyle or {};
    local l_labelTypography_0 = v28.labelTypography;
    local l_labelColorStyle_0 = v28.labelColorStyle;
    local v34 = not v27 and (l_icon_0 and true or false);
    local v35 = not v27 and (l_onActivated_0 and true or false);
    local v36 = nil;
    if v27 then
        v36 = if l_icon_0 then math.max(l_iconSize_0, l_labelTypography_0.FontSize) else l_labelTypography_0.FontSize;
    end;
    local v37 = nil;
    if v34 then
        v37 = if l_useTextAsIcon_0 then v3.createElement("TextLabel", {
            LayoutOrder = l_isReversed_0 and 2 or 1, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            BackgroundTransparency = 1, 
            Text = l_icon_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_labelTypography_0.Font, 
            TextSize = l_iconSize_0, 
            TextColor3 = v31.Color3, 
            TextTransparency = if v31.Transparency then v31.Transparency else 0, 
            Selectable = false
        }) else v3.createElement(l_Label_0, {
            LayoutOrder = l_isReversed_0 and 2 or 1, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            Image = l_icon_0, 
            ImageColor3 = v31.Color3, 
            ImageTransparency = if v31.Transparency then v31.Transparency else 0, 
            BackgroundTransparency = 1, 
            Selectable = false
        });
    end;
    return v3.createElement(v35 and "TextButton" or "Frame", {
        Text = v35 and "" or nil, 
        AutoButtonColor = not v35 and nil, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        Selectable = v35 and true or false, 
        [v3.Event.Activated] = if v35 then l_onActivated_0 else nil
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_iconLabelSpacing_0)
        }), 
        Shimmer = if v27 then v3.createElement(v8, {
            Size = UDim2.new(1, 0, 0, v36)
        }) else nil, 
        Icon = v37, 
        Label = if not v27 then v3.createElement("TextLabel", {
            LayoutOrder = l_isReversed_0 and 1 or 2, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(0, 0), 
            BackgroundTransparency = 1, 
            Text = l_labelText_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_labelTypography_0.Font, 
            TextSize = l_labelTypography_0.FontSize, 
            TextColor3 = l_labelColorStyle_0.Color3, 
            TextTransparency = l_labelColorStyle_0.Transparency, 
            Selectable = false, 
            OpenTypeFeatures = if v10.enableOpenTypeSupport and v18.openTypeFeatures then v18.openTypeFeatures else nil
        }) else nil
    });
end;
return function(v39) --[[ Line: 214 ]] --[[ Name: PlayerName ]]
    -- upvalues: v9 (copy), v3 (copy), v38 (copy), v10 (copy), v11 (copy), v17 (copy), v13 (copy)
    local v40 = v9();
    local l_position_0 = v39.position;
    local l_anchorPoint_0 = v39.anchorPoint;
    local l_size_0 = v39.size;
    local v44 = v39.automaticSize or Enum.AutomaticSize.Y;
    local l_layoutOrder_1 = v39.layoutOrder;
    local v46 = v39.namesSpacing or v40.Tokens.Global.Space_50;
    local l_displayNameItem_0 = v39.displayNameItem;
    local l_userNameItem_0 = v39.userNameItem;
    local l_vendorNameItem_0 = v39.vendorNameItem;
    local l_aliasItem_0 = v39.aliasItem;
    local l_createElement_0 = v3.createElement;
    local v52 = "Frame";
    local v53 = {
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        Size = l_size_0, 
        AutomaticSize = v44, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_1, 
        Selectable = false
    };
    local v54 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v46)
        })
    };
    local v55;
    if l_displayNameItem_0 then
        v55 = v3.createElement;
        local l_v38_0 = v38;
        local v57 = {
            layoutOrder = 1, 
            isReversed = true, 
            itemProps = l_displayNameItem_0
        };
        local l_Tokens_0 = v40.Tokens;
        v57.itemStyleDefaults = {
            iconLabelSpacing = l_Tokens_0.Global.Space_25, 
            iconSize = l_Tokens_0.Semantic.Icon.Size.Small, 
            labelTypography = l_Tokens_0.Semantic.Typography.Subheader, 
            labelColorStyle = l_Tokens_0.Semantic.Color.Text.Emphasis
        };
        v55 = v55(l_v38_0, v57);
    else
        v55 = nil;
    end;
    v54.DisplayName = v55;
    v54.UserName = if l_userNameItem_0 then v3.createElement(v38, {
        layoutOrder = 2, 
        itemProps = l_userNameItem_0, 
        openTypeFeatures = if v10.enableOpenTypeSupport then v11:getUserNameStylisticAlternative() else nil, 
        itemStyleDefaults = v17(v40.Tokens)
    }) else nil;
    v54.VendorName = if l_vendorNameItem_0 then v3.createElement(v38, {
        layoutOrder = 3, 
        itemProps = l_vendorNameItem_0, 
        itemStyleDefaults = v13(v40.Tokens)
    }) else nil;
    v54.Alias = if l_aliasItem_0 then v3.createElement(v38, {
        layoutOrder = 4, 
        itemProps = l_aliasItem_0, 
        itemStyleDefaults = v13(v40.Tokens)
    }) else nil;
    return l_createElement_0(v52, v53, v54);
end;