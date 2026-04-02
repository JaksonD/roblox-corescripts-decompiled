local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.Foundation);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.Style.StyleTypes);
local l_Label_0 = require(l_Parent_1.Core.ImageSet.ImageSetComponent).Label;
local l_Skeleton_0 = v5.Skeleton;
local v10 = require(l_Parent_1.Core.Style.useStyle);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = require(l_Parent_1.Utility.OpenTypeSupport);
local function v14(v13) --[[ Line: 81 ]] --[[ Name: getStyleDefaults ]]
    return {
        iconLabelSpacing = v13.Global.Space_25, 
        iconSize = v13.Semantic.Icon.Size.Small, 
        iconColorStyle = v13.Semantic.Color.Icon.Default, 
        labelTypography = v13.Semantic.Typography.CaptionHeader, 
        labelColorStyle = v13.Semantic.Color.Text.Default
    };
end;
local function _(v15) --[[ Line: 91 ]] --[[ Name: getDisplayNameStyleDefaults ]]
    return {
        iconLabelSpacing = v15.Global.Space_25, 
        iconSize = v15.Semantic.Icon.Size.Small, 
        labelTypography = v15.Semantic.Typography.Subheader, 
        labelColorStyle = v15.Semantic.Color.Text.Emphasis
    };
end;
local function v18(v17) --[[ Line: 100 ]] --[[ Name: getUserNameStyleDefaults ]]
    return {
        iconLabelSpacing = v17.Global.Space_25, 
        iconSize = v17.Global.Size_150, 
        iconColorStyle = v17.Semantic.Color.Icon.Default, 
        labelTypography = v17.Semantic.Typography.CaptionHeader, 
        labelColorStyle = v17.Semantic.Color.Text.Default
    };
end;
local function v39(v19) --[[ Line: 110 ]] --[[ Name: NameItem ]]
    -- upvalues: v4 (copy), v3 (copy), l_Label_0 (copy), l_Skeleton_0 (copy), v11 (copy)
    local l_layoutOrder_0 = v19.layoutOrder;
    local l_isReversed_0 = v19.isReversed;
    local l_itemProps_0 = v19.itemProps;
    local l_itemStyleDefaults_0 = v19.itemStyleDefaults;
    local l_icon_0 = l_itemProps_0.icon;
    local l_labelText_0 = l_itemProps_0.labelText;
    local l_useTextAsIcon_0 = l_itemProps_0.useTextAsIcon;
    local l_onActivated_0 = l_itemProps_0.onActivated;
    local v28 = l_itemProps_0.isLoading ~= nil and l_itemProps_0.isLoading;
    local v29 = v4.Dictionary.join(l_itemStyleDefaults_0, l_itemProps_0.styleProps or {});
    local l_iconLabelSpacing_0 = v29.iconLabelSpacing;
    local l_iconSize_0 = v29.iconSize;
    local v32 = v29.iconColorStyle or {};
    local l_labelTypography_0 = v29.labelTypography;
    local l_labelColorStyle_0 = v29.labelColorStyle;
    local v35 = not v28 and (l_icon_0 and true or false);
    local v36 = not v28 and (l_onActivated_0 and true or false);
    local v37 = nil;
    if v28 then
        v37 = if l_icon_0 then math.max(l_iconSize_0, l_labelTypography_0.FontSize) else l_labelTypography_0.FontSize;
    end;
    local v38 = nil;
    if v35 then
        v38 = if l_useTextAsIcon_0 then v3.createElement("TextLabel", {
            LayoutOrder = l_isReversed_0 and 2 or 1, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            BackgroundTransparency = 1, 
            Text = l_icon_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_labelTypography_0.Font, 
            TextSize = l_iconSize_0, 
            TextColor3 = v32.Color3, 
            TextTransparency = if v32.Transparency then v32.Transparency else 0, 
            Selectable = false
        }) else v3.createElement(l_Label_0, {
            LayoutOrder = l_isReversed_0 and 2 or 1, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            Image = l_icon_0, 
            ImageColor3 = v32.Color3, 
            ImageTransparency = if v32.Transparency then v32.Transparency else 0, 
            BackgroundTransparency = 1, 
            Selectable = false
        });
    end;
    return v3.createElement(v36 and "TextButton" or "Frame", {
        Text = v36 and "" or nil, 
        AutoButtonColor = not v36 and nil, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        Selectable = v36 and true or false, 
        [v3.Event.Activated] = if v36 then l_onActivated_0 else nil
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_iconLabelSpacing_0)
        }), 
        Shimmer = if v28 then v3.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v37)
        }) else nil, 
        Icon = v38, 
        Label = if not v28 then v3.createElement("TextLabel", {
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
            OpenTypeFeatures = if v11.enableOpenTypeSupport and v19.openTypeFeatures then v19.openTypeFeatures else nil
        }) else nil
    });
end;
return function(v40) --[[ Line: 215 ]] --[[ Name: PlayerName ]]
    -- upvalues: v10 (copy), v3 (copy), v39 (copy), v11 (copy), v12 (copy), v18 (copy), v14 (copy)
    local v41 = v10();
    local l_position_0 = v40.position;
    local l_anchorPoint_0 = v40.anchorPoint;
    local l_size_0 = v40.size;
    local v45 = v40.automaticSize or Enum.AutomaticSize.Y;
    local l_layoutOrder_1 = v40.layoutOrder;
    local v47 = v40.namesSpacing or v41.Tokens.Global.Space_50;
    local l_displayNameItem_0 = v40.displayNameItem;
    local l_userNameItem_0 = v40.userNameItem;
    local l_vendorNameItem_0 = v40.vendorNameItem;
    local l_aliasItem_0 = v40.aliasItem;
    local l_createElement_0 = v3.createElement;
    local v53 = "Frame";
    local v54 = {
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        Size = l_size_0, 
        AutomaticSize = v45, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_1, 
        Selectable = false
    };
    local v55 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v47)
        })
    };
    local v56;
    if l_displayNameItem_0 then
        v56 = v3.createElement;
        local l_v39_0 = v39;
        local v58 = {
            layoutOrder = 1, 
            isReversed = true, 
            itemProps = l_displayNameItem_0
        };
        local l_Tokens_0 = v41.Tokens;
        v58.itemStyleDefaults = {
            iconLabelSpacing = l_Tokens_0.Global.Space_25, 
            iconSize = l_Tokens_0.Semantic.Icon.Size.Small, 
            labelTypography = l_Tokens_0.Semantic.Typography.Subheader, 
            labelColorStyle = l_Tokens_0.Semantic.Color.Text.Emphasis
        };
        v56 = v56(l_v39_0, v58);
    else
        v56 = nil;
    end;
    v55.DisplayName = v56;
    v55.UserName = if l_userNameItem_0 then v3.createElement(v39, {
        layoutOrder = 2, 
        itemProps = l_userNameItem_0, 
        openTypeFeatures = if v11.enableOpenTypeSupport then v12:getUserNameStylisticAlternative() else nil, 
        itemStyleDefaults = v18(v41.Tokens)
    }) else nil;
    v55.VendorName = if l_vendorNameItem_0 then v3.createElement(v39, {
        layoutOrder = 3, 
        itemProps = l_vendorNameItem_0, 
        itemStyleDefaults = v14(v41.Tokens)
    }) else nil;
    v55.Alias = if l_aliasItem_0 then v3.createElement(v39, {
        layoutOrder = 4, 
        itemProps = l_aliasItem_0, 
        itemStyleDefaults = v14(v41.Tokens)
    }) else nil;
    return l_createElement_0(v53, v54, v55);
end;