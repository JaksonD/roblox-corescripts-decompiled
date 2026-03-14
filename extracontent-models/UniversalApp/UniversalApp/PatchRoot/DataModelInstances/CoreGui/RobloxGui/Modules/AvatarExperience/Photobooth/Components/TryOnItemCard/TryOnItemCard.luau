local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogItemCard_0 = v3.Components.CatalogItemCard.CatalogItemCard;
local l_CatalogItemCardItemInfoEnum_0 = v3.Components.CatalogItemCard.CatalogItemCardItemInfoEnum;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local l_InventoryItemType_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemType;
return function(v8) --[[ Line: 29 ]] --[[ Name: TryOnItemCard ]]
    -- upvalues: l_InventoryItemType_0 (copy), v1 (copy), l_CatalogItemCard_0 (copy), l_CatalogItemCardItemInfoEnum_0 (copy), v2 (copy), l_ItemCardThumbnail_0 (copy)
    local v9 = v8.inventoryItemType == l_InventoryItemType_0.Asset and "Asset" or v8.inventoryItemType == l_InventoryItemType_0.Outfit and "Outfit" or nil;
    local l_tokens_0 = v8.tokens;
    local l_Size_50_0 = l_tokens_0.Size.Size_50;
    return v1.createElement(l_CatalogItemCard_0, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        isSelected = v8.isSelected, 
        title = v8.itemName, 
        ref = v8.ref, 
        itemInfo = if v8.showDynamicHeadIcon then l_CatalogItemCardItemInfoEnum_0.DynamicHead else nil, 
        onActivated = v8.onActivated, 
        presentationSlot = v1.createElement(v2.View, {
            tag = "size-full-full", 
            ref = v8.thumbnailRef
        }, {
            UIPadding = if v8.isSelected then v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Size_50_0), 
                PaddingBottom = UDim.new(0, l_Size_50_0), 
                PaddingLeft = UDim.new(0, l_Size_50_0), 
                PaddingRight = UDim.new(0, l_Size_50_0)
            }) else nil, 
            InnerContent = v1.createElement(v2.View, {
                Size = UDim2.fromScale(1, 1), 
                tag = ("clip radius-medium %*"):format(v8.impressionsTag), 
                backgroundStyle = {
                    Transparency = 1
                }
            }, {
                UIStroke = if v8.isSelected then v1.createElement("UIStroke", {
                    Thickness = l_Size_50_0, 
                    Color = l_tokens_0.Color.ActionSubEmphasis.Background.Color3, 
                    Transparency = 0
                }) else nil, 
                Thumbnail = v9 and v1.createElement(l_ItemCardThumbnail_0, {
                    url = ("rbxthumb://type=%*&id=%*&w=150&h=150&filter=0"):format(v9, v8.itemId)
                })
            })
        })
    });
end;