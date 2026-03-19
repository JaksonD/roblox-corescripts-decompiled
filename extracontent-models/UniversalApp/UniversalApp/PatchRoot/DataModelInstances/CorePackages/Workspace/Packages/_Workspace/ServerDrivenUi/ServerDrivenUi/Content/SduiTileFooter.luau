local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v5 = require(l_Parent_0.TextSize);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v7) --[[ Line: 69 ]] --[[ Name: SduiTileFooter ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v5 (copy), l_useTokens_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if l_FFlagSduiServerCompat_0 then
        v8 = v7.layoutOrder;
        v9 = v7.anchorPoint;
        v10 = v7.automaticSize;
        v11 = v7.size;
        v12 = v7.zIndex;
        v13 = v7.position;
        v14 = v7.selectable;
    else
        v8 = v7.LayoutOrder;
        v9 = v7.AnchorPoint;
        v10 = v7.AutomaticSize;
        v11 = v7.Size;
        v12 = v7.ZIndex;
        v13 = v7.Position;
        v14 = v7.Selectable;
    end;
    local v15 = v5.getTextSizeStore(false).getTextSizeOffset(false);
    local v16 = l_useTokens_0();
    local v17 = v7.fontStyle or v16.Typography.BodyMedium;
    local v18 = v7.textColor or v16.Color.Content.Default.Color3;
    local v19 = if v7.iconWidth then UDim2.new(0, v7.iconWidth, 0, v7.iconWidth) else UDim2.new(0, v16.Size.Size_350, 0, v16.Size.Size_350);
    local v20 = v7.iconColor or v18;
    local v21 = math.ceil(v17.LineHeight * v17.FontSize + v15);
    local v22 = v7.textIconGap or v16.Gap.XSmall;
    local v23 = v7.sectionGap or v16.Gap.Small;
    local v24 = v7.onActivated ~= nil;
    if not v7.leftIcon and not v7.leftIconComponent and not v7.rightIcon and not v7.rightIconComponent and not v7.rightText and not v24 then
        return v1.createElement("TextLabel", {
            [v1.Tag] = if v7.testId then ("data-testid=%*"):format(v7.testId) else nil, 
            Position = v13, 
            AnchorPoint = v9, 
            AutomaticSize = v10 or Enum.AutomaticSize.X, 
            Size = v11 or UDim2.new(0, 0, 0, v21), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v8, 
            ZIndex = v12, 
            Text = v7.leftText or "", 
            Font = v17.Font, 
            TextSize = v17.FontSize, 
            TextTransparency = 0, 
            TextColor3 = v18, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            UIFlexItem = v7.leftTextFlexMode and v1.createElement("UIFlexItem", {
                FlexMode = v7.leftTextFlexMode
            }) or nil
        });
    else
        local v25 = true;
        if v7.rightIcon == nil then
            v25 = true;
            if v7.rightIconComponent == nil then
                v25 = v7.rightText ~= nil;
            end;
        end;
        return v1.createElement(v24 and "TextButton" or "Frame", {
            [v1.Tag] = if v7.testId then ("data-testid=%*"):format(v7.testId) else nil, 
            Position = v13, 
            AnchorPoint = v9, 
            AutomaticSize = v10 or Enum.AutomaticSize.X, 
            Size = v11 or UDim2.new(0, 0, 0, v21), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v8, 
            ZIndex = v12, 
            Text = v24 and "" or nil, 
            TextTransparency = v24 and 1 or nil, 
            AutoButtonColor = not v24 and nil, 
            [v1.Event.Activated] = if v24 then v7.onActivated else nil, 
            Active = v24, 
            Selectable = v14 ~= nil and v14
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.Name, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v22), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            ["1_LeftIcon"] = v7.leftIconComponent or v7.leftIcon and v1.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                Size = v19, 
                BackgroundTransparency = 1, 
                ImageColor3 = v20, 
                ImageTransparency = 0, 
                Image = v7.leftIcon
            }) or nil, 
            ["2_LeftText"] = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v7.leftText or "", 
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.new(0, 0, 0, v21), 
                Font = v17.Font, 
                TextSize = v17.FontSize, 
                TextTransparency = 0, 
                TextColor3 = v18, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            }, {
                UIFlexItem = v7.leftTextFlexMode and v1.createElement("UIFlexItem", {
                    FlexMode = v7.leftTextFlexMode
                }) or nil, 
                UIPadding = if v25 then v1.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v23 - v22)
                }) else nil
            }), 
            ["3_RightIcon"] = v7.rightIconComponent or v7.rightIcon and v1.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 3, 
                Size = v19, 
                BackgroundTransparency = 1, 
                ImageColor3 = v20, 
                ImageTransparency = 0, 
                Image = v7.rightIcon
            }) or nil, 
            ["4_RightText"] = v7.rightText and v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v7.rightText or "", 
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.new(0, 0, 0, v21), 
                Font = v17.Font, 
                TextSize = v17.FontSize, 
                TextTransparency = 0, 
                TextColor3 = v18, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 4
            }, {
                UIFlexItem = v1.createElement("UIFlexItem", {
                    FlexMode = v7.rightTextFlexMode or Enum.UIFlexMode.Shrink
                })
            }) or nil
        });
    end;
end);