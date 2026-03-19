local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local v4 = require(script.Parent.ItemCardPriceLine);
local v5 = require(script.Parent.ItemCardCreatorName);
local v6 = require(script.Parent.ItemCardTitle);
local l_FFlagAXAddTextXAlignmentProp_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp;
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v3.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
return function(v9) --[[ Line: 29 ]] --[[ Name: ItemCardFooter ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), v6 (copy), l_FFlagAXAddTextXAlignmentProp_0 (copy), v5 (copy), v4 (copy)
    local v10 = l_useTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v9.LayoutOrder, 
        ClipsDescendants = l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 and true or nil
    }, {
        ItemCardFooterLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v10.Gap.XSmall)
        }), 
        ItemCardFooterInfo = if not not v9.title or v9.creatorName then v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            ItemCardFooterInfoLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v10.Gap.XXSmall)
            }), 
            ItemCardFooterInfoTitle = if v9.title then v1.createElement(v6, {
                title = v9.title, 
                titleTextSize = v9.titleTextSize, 
                LayoutOrder = 1, 
                TextXAlignment = if l_FFlagAXAddTextXAlignmentProp_0 then v9.TextXAlignment else nil
            }) else nil, 
            ItemCardFooterInfoCreatorName = if v9.creatorName then v1.createElement(v5, {
                name = v9.creatorName, 
                hasVerifiedBadge = v9.creatorHasVerifiedBadge, 
                LayoutOrder = 2, 
                TextXAlignment = if l_FFlagAXAddTextXAlignmentProp_0 then v9.TextXAlignment else nil
            }) else nil
        }) else nil, 
        ItemCardFooterPrice = if v9.priceLineContent then v1.createElement(v4, {
            content = v9.priceLineContent, 
            LayoutOrder = 2
        }) else nil
    });
end;