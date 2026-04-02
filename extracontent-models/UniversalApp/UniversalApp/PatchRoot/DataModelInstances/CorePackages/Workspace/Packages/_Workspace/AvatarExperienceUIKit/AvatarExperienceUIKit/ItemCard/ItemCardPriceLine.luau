local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceUIKit");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v10 = require(l_script_FirstAncestor_0.ItemCard.Utils.getLocalizedPrice);
local l_FFlagAXUpdateItemCardPriceLineText_0 = v4.FFlagAXUpdateItemCardPriceLineText;
local l_FFlagAXDurablesFooter_0 = v4.FFlagAXDurablesFooter;
local v13 = game:DefineFastFlag("AXAddStyleToItemCardPriceLine", false);
local function v16(v14) --[[ Line: 72 ]] --[[ Name: renderIconTextPair ]]
    -- upvalues: v2 (copy), l_Icon_0 (copy), v13 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_FFlagAXUpdateItemCardPriceLineText_0 (copy)
    local v15 = {};
    if v14.iconName then
        v15[v14.iconKey] = v2.createElement(l_Icon_0, {
            name = v14.iconName, 
            style = if v13 then v14.resolvedColorStyle else v14.tokens.Color.Content.Emphasis, 
            size = l_IconSize_0.Small, 
            LayoutOrder = v14.iconLayoutOrder, 
            testId = v14.iconKey
        });
    end;
    v15[v14.textKey] = v2.createElement(l_Text_0, {
        textStyle = if v13 then v14.resolvedColorStyle else v14.designTokens.Semantic.Color.Text.Emphasis, 
        fontStyle = if l_FFlagAXUpdateItemCardPriceLineText_0 then v14.tokens.Typography.BodyMedium else v14.tokens.Typography.TitleMedium, 
        LayoutOrder = v14.textLayoutOrder, 
        Text = v14.text, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextTruncate = Enum.TextTruncate.SplitWord
    });
    return v15;
end;
local function v28(v17, v18, v19, v20, v21, v22, v23) --[[ Line: 105 ]] --[[ Name: renderContentChildren ]]
    -- upvalues: v10 (copy), v16 (copy)
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if v17.type == "price" then
        v24 = "robux";
        v25 = v10(v17.price);
        v26 = "RobuxIcon";
        v27 = "Amount";
    elseif v17.type == "timedOption" then
        v24 = v17.icon;
        v25 = v17.text;
        v26 = "TimedOptionIcon";
        v27 = "TimedOptionText";
    elseif v17.type == "text" then
        v25 = v17.text;
        v26 = "Text";
        v27 = "Text";
    else
        return {};
    end;
    return (v16({
        iconName = v24, 
        text = v25, 
        iconKey = ("%*%*"):format(v18, v26), 
        textKey = ("%*%*"):format(v18, v27), 
        iconLayoutOrder = v19, 
        textLayoutOrder = if v24 then v20 else v19, 
        resolvedColorStyle = v21, 
        tokens = v22, 
        designTokens = v23
    }));
end;
return function(v29) --[[ Line: 150 ]] --[[ Name: ItemCardPriceLine ]]
    -- upvalues: l_useTokens_0 (copy), l_useDesignTokens_0 (copy), v13 (copy), l_FFlagAXDurablesFooter_0 (copy), v2 (copy), v28 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_FFlagAXUpdateItemCardPriceLineText_0 (copy), v10 (copy)
    local v30 = l_useTokens_0();
    local v31 = l_useDesignTokens_0();
    local v32 = if v13 then if v29.content and v29.content.colorStyle then v29.content.colorStyle else v30.Color.Content.Emphasis else nil;
    if l_FFlagAXDurablesFooter_0 and v29.content.type == "multi" then
        local l_content_0 = v29.content;
        local v34 = {
            ItemCardPriceLineLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v30.Gap.XXSmall)
            })
        };
        local v35 = 1;
        for v36, v37 in l_content_0.contents do
            if v36 > 1 then
                v34[("priceLineSpacer%*"):format(v36)] = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(v30.Gap.XSmall, 0), 
                    LayoutOrder = v35
                });
                v35 = v35 + 1;
            end;
            local v38 = if v13 then if v37.colorStyle then v37.colorStyle else v30.Color.Content.Emphasis else nil;
            for v39, v40 in (v28(v37, ("priceLine%*"):format(v36), v35, v35 + 1, v38, v30, v31)) do
                v34[v39] = v40;
            end;
            v35 = v35 + 2;
        end;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = v29.LayoutOrder
        }, v34);
    else
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = v29.LayoutOrder
        }, {
            ItemCardPriceLineLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v30.Gap.XXSmall)
            }), 
            ItemCardPriceLineRobuxIcon = if v29.content.type == "price" then v2.createElement(l_Icon_0, {
                name = "robux", 
                style = if v13 then v32 else v30.Color.Content.Emphasis, 
                size = l_IconSize_0.Small, 
                LayoutOrder = 1, 
                testId = "priceLineRobuxIcon"
            }) else nil, 
            ItemCardPriceLineAmount = v2.createElement(l_Text_0, {
                textStyle = if v13 then v32 else v31.Semantic.Color.Text.Emphasis, 
                fontStyle = if l_FFlagAXUpdateItemCardPriceLineText_0 then v30.Typography.BodyMedium else v30.Typography.TitleMedium, 
                LayoutOrder = 2, 
                Text = if v29.content.type == "price" then v10(v29.content.price) else v29.content.text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextTruncate = Enum.TextTruncate.SplitWord
            })
        });
    end;
end;