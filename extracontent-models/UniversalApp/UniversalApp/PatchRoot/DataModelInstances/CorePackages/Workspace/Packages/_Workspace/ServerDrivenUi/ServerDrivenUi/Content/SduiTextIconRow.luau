local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_checkAndFormatPossibleLink_0 = require(l_Parent_0.CollectionViews).checkAndFormatPossibleLink;
local v7 = require(l_Parent_0.TextSize);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v9 = {
    anchorPoint = "AnchorPoint", 
    automaticSize = "AutomaticSize", 
    backgroundColor3 = "BackgroundColor3", 
    backgroundTransparency = "BackgroundTransparency", 
    layoutOrder = "LayoutOrder", 
    position = "Position", 
    richText = "RichText", 
    size = "Size", 
    text = "Text", 
    textTruncate = "TextTruncate", 
    textWrapped = "TextWrapped", 
    textXAlignment = "TextXAlignment", 
    textYAlignment = "TextYAlignment", 
    zIndex = "ZIndex"
};
local function v15(v10, v11) --[[ Line: 99 ]] --[[ Name: applyOverrides ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v9 (copy), v2 (copy)
    if v11 == nil then
        return v10;
    elseif l_FFlagSduiServerCompat_0 then
        local v12 = {};
        for v13, v14 in v11 do
            v12[v9[v13] or v13] = v14;
        end;
        return v2.Dictionary.join(v10, v12);
    else
        return v2.Dictionary.join(v10, v11);
    end;
end;
return v1.memo(function(v16) --[[ Line: 113 ]] --[[ Name: SduiTextIconRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v7 (copy), l_useTokens_0 (copy), l_checkAndFormatPossibleLink_0 (copy), v1 (copy), v15 (copy), l_ImageSetLabel_0 (copy)
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    if l_FFlagSduiServerCompat_0 then
        v17 = v16.layoutOrder;
        v18 = v16.anchorPoint;
        v19 = v16.automaticSize;
        v20 = v16.size;
        v21 = v16.zIndex;
        v22 = v16.position;
        v23 = v16.selectable;
    else
        v17 = v16.LayoutOrder;
        v18 = v16.AnchorPoint;
        v19 = v16.AutomaticSize;
        v20 = v16.Size;
        v21 = v16.ZIndex;
        v22 = v16.Position;
        v23 = v16.Selectable;
    end;
    local v24 = v7.getTextSizeStore(false).getTextSizeOffset(false);
    local v25 = l_useTokens_0();
    local v26 = v16.fontStyle or v25.Typography.HeadingSmall;
    local v27 = v16.textColor or v25.Color.Content.Emphasis.Color3;
    local v28 = math.ceil(v26.LineHeight * v26.FontSize + v24);
    local v29 = if v16.iconWidth then UDim2.new(0, v16.iconWidth, 0, v16.iconWidth) else UDim2.new(0, v28, 0, v28);
    local v30 = v16.iconColor or v27;
    local v31 = v16.onActivated ~= nil;
    local v32, v33 = l_checkAndFormatPossibleLink_0(v16.text);
    return v1.createElement(v31 and "TextButton" or "Frame", {
        Position = v22, 
        AnchorPoint = v18, 
        AutomaticSize = v19, 
        Size = v20 or UDim2.new(1, 0, 0, v28), 
        BackgroundTransparency = v16.backgroundStyle and v16.backgroundStyle.Transparency or 1, 
        BackgroundColor3 = v16.backgroundStyle and v16.backgroundStyle.Color3 or nil, 
        BorderSizePixel = 0, 
        LayoutOrder = v17, 
        ZIndex = v21, 
        Text = v31 and "" or nil, 
        TextTransparency = v31 and 1 or nil, 
        AutoButtonColor = not v31 and nil, 
        [v1.Event.Activated] = if v31 then v16.onActivated else nil, 
        Active = v31, 
        Selectable = v23, 
        [v1.Tag] = if v16.testId then ("data-testid=%*"):format(v16.testId) else v31 and "data-testid=--sdui-text-icon-row-button" or "data-testid=--sdui-text-icon-row"
    }, {
        UICorner = if v16.cornerRadius then v1.createElement("UICorner", {
            CornerRadius = v16.cornerRadius
        }) else nil, 
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v16.gap or 0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Text = v1.createElement("TextLabel", v15({
            BackgroundTransparency = 1, 
            Text = v33 or "", 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = v20 or UDim2.new(0, 0, 0, v28), 
            Font = v26.Font, 
            TextSize = v26.FontSize, 
            TextTransparency = 0, 
            TextColor3 = v27, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = (v16.iconFirst and -1 or 1) * 1, 
            RichText = v32 and true or nil, 
            [v1.Tag] = "data-testid=--sdui-text-icon-row-text"
        }, v16.textOverrides), {
            UIFlexItem = if v16.textFlexMode then v1.createElement("UIFlexItem", {
                FlexMode = v16.textFlexMode
            }) else nil
        }), 
        Icon = if v16.icon then v1.createElement(l_ImageSetLabel_0, v15({
            LayoutOrder = (v16.iconFirst and -1 or 1) * 2, 
            Size = v29, 
            BackgroundTransparency = 1, 
            ImageColor3 = v30, 
            ImageTransparency = 0, 
            Image = v16.icon, 
            [v1.Tag] = "data-testid=--sdui-text-icon-row-icon"
        }, v16.iconOverrides)) else nil
    });
end);