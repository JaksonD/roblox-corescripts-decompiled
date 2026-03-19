local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.BaseComponents.CollectionGridViews.SquareCollectionGridView);
local l_CatalogItemCard_0 = require(l_Parent_0.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_Parent_0.UserLib);
local l_Constants_0 = v7.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagProfileStoreEnableFreeItemPriceLabelFix);
local v14 = {
    numColumns = 3
};
local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
local l_BundleThumbnail_0 = l_Constants_0.RbxthumbTypes.BundleThumbnail;
local function v18(v17) --[[ Line: 38 ]]
    return v17 + 49;
end;
return function(v19) --[[ Line: 42 ]] --[[ Name: StoreGrid ]]
    -- upvalues: l_useLocalization_0 (copy), v12 (copy), v2 (copy), v6 (copy), l_BundleThumbnail_0 (copy), l_Asset_0 (copy), v13 (copy), l_CatalogItemCard_0 (copy), l_ItemCardThumbnail_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v3 (copy), v18 (copy), v14 (copy)
    local v20 = l_useLocalization_0({
        store = v12.Store, 
        free = v12.CatalogLabelFree
    });
    local v25 = v2.useCallback(function(v21, v22) --[[ Line: 48 ]]
        -- upvalues: v6 (ref), l_BundleThumbnail_0 (ref), l_Asset_0 (ref), v13 (ref), v20 (copy), v2 (ref), l_CatalogItemCard_0 (ref), l_ItemCardThumbnail_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v19 (copy)
        local v23 = if v21.itemType == v6.ItemTypes.Bundle then l_BundleThumbnail_0 else l_Asset_0;
        local v24 = v21.price and {
            type = v6.PriceLineContentType.Price, 
            price = v21.price
        };
        if v13 and v21.price and v21.price == 0 then
            v24 = {
                type = v6.PriceLineContentType.Text, 
                text = v20.free
            };
        end;
        return v2.createElement(l_CatalogItemCard_0, {
            LayoutOrder = v22, 
            title = v21.name, 
            presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                url = l_getRbxthumbWithTypeSizeAndOptions_0(v21.id, v23, 150)
            }), 
            onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
                -- upvalues: v19 (ref), v21 (copy), v22 (copy)
                v19.openItemDetails(v21.id, v21.itemType, v22);
            end, 
            priceLineContent = if v13 then v24 else v21.price and {
                type = v6.PriceLineContentType.Price, 
                price = v21.price
            }, 
            AutomaticSize = Enum.AutomaticSize.Y
        }), "ItemCard";
    end, {
        v19.openItemDetails
    });
    return v2.createElement(v3, {
        layoutOrder = v19.layoutOrder, 
        items = v19.assets, 
        renderItem = v25, 
        getItemHeight = v18, 
        title = v20.store, 
        onActivateHeader = v19.navigateToCatalogSearch, 
        overrides = v14
    });
end;