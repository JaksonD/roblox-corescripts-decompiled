local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_CatalogRowItemCard_0 = require(l_Parent_0.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard;
return function(v4) --[[ Line: 17 ]] --[[ Name: ItemList ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_CatalogRowItemCard_0 (copy)
    local v5 = l_useTokens_0();
    local v6 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v5.Gap.Medium)
        })
    };
    local l_Size_1200_0 = v5.Size.Size_1200;
    for v8, v9 in v4.items do
        local v10 = {
            LayoutOrder = v8, 
            title = v9.title, 
            presentationSlot = v9.presentationSlot, 
            priceLineContent = v9.priceLineContent, 
            headerSize = UDim2.fromOffset(l_Size_1200_0, l_Size_1200_0), 
            footerSize = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        };
        v6[v9.id] = v1.createElement(l_CatalogRowItemCard_0, v10);
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v6);
end;