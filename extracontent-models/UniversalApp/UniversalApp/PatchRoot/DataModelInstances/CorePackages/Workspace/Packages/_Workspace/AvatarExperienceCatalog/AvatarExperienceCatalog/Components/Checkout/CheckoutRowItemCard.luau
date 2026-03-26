local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_CatalogRowItemCard_0 = require(l_Parent_0.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard;
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v6 = require(l_Parent_0.tutils);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
local v9 = require(l_script_FirstAncestor_0.Enums.PurchaseItemsErrorStatusMap);
local v10 = require(l_script_FirstAncestor_0.Constants);
local v11 = require(script.Parent.useCheckoutRowItemCardViewModel);
local l_FFlagAXDurablesForMIS_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local l_ASSET_TYPE_LOCALIZED_0 = v10.ASSET_TYPE_LOCALIZED;
local l_BUNDLE_TYPE_LOCALIZED_0 = v10.BUNDLE_TYPE_LOCALIZED;
local v15 = {
    [tostring(v9.SOLD_OUT)] = "Feature.Catalog.Label.Checkout.SoldOut", 
    [tostring(v9.ALREADY_OWNED)] = "Feature.Catalog.Label.Owned", 
    [tostring(v9.EXPERIENCE_LINK)] = "Feature.Catalog.Label.Checkout.InExperienceOnly", 
    [tostring(v9.QUANTITY_LIMIT_EXCEEDED)] = "Feature.Catalog.Label.Checkout.LimitReached", 
    [tostring(v9.NOT_AVAILABLE_FOR_PURCHASER)] = "Feature.Catalog.Label.Checkout.Unavailable", 
    [tostring(v9.NOT_FOR_SALE)] = "Feature.Catalog.Label.Checkout.OffSale", 
    [tostring(v9.PURCHASER_IS_SELLER)] = "Feature.Catalog.Label.Checkout.Unavailable", 
    [tostring(v9.PURCHASE_PLACE_INVALID)] = "Feature.Catalog.Label.Checkout.InExperienceOnly", 
    [tostring(v9.PRICE_MISMATCH)] = "Feature.Catalog.Label.Checkout.PriceChanged", 
    Unvailable = "Feature.Catalog.Label.Checkout.Unavailable"
};
local function _(v16, v17) --[[ Line: 40 ]] --[[ Name: hasAssetTypeLocalizedString ]]
    -- upvalues: l_ASSET_TYPE_LOCALIZED_0 (copy)
    local v18 = false;
    if v16 == Enum.AvatarItemType.Asset.Name then
        v18 = l_ASSET_TYPE_LOCALIZED_0[tostring(v17)] ~= nil;
    end;
    return v18;
end;
local function _(v20, v21) --[[ Line: 44 ]] --[[ Name: hasBundleTypeLocalizedString ]]
    -- upvalues: l_BUNDLE_TYPE_LOCALIZED_0 (copy)
    local v22 = false;
    if v20 == Enum.AvatarItemType.Bundle.Name then
        v22 = l_BUNDLE_TYPE_LOCALIZED_0[tostring(v21)] ~= nil;
    end;
    return v22;
end;
local function _(v24) --[[ Line: 48 ]] --[[ Name: getThumbnailType ]]
    if v24 == Enum.AvatarItemType.Bundle.Name then
        return "BundleThumbnail";
    else
        return "Asset";
    end;
end;
return v2.memo(function(v26) --[[ Line: 64 ]] --[[ Name: CheckoutRowItemCard ]]
    -- upvalues: v3 (copy), l_FFlagAXDurablesForMIS_0 (copy), v11 (copy), l_useLocalization_0 (copy), l_ASSET_TYPE_LOCALIZED_0 (copy), l_BUNDLE_TYPE_LOCALIZED_0 (copy), v15 (copy), v2 (copy), v9 (copy), l_CatalogRowItemCard_0 (copy), l_ItemCardThumbnail_0 (copy)
    local v27 = v3.Hooks.useTokens();
    local v28 = v26.thumbnailSize or v27.Size.Size_2100;
    local v29 = nil;
    local v30 = nil;
    if l_FFlagAXDurablesForMIS_0 then
        local v31 = v11(v26);
        v29 = v31.selectedTimedOptionPrice;
        v30 = v31.setSelectedTimedOptionPrice;
    end;
    local v32 = l_useLocalization_0(l_ASSET_TYPE_LOCALIZED_0);
    local v33 = l_useLocalization_0(l_BUNDLE_TYPE_LOCALIZED_0);
    local v34 = l_useLocalization_0(v15);
    local v35 = v26.itemType == Enum.AvatarItemType.Bundle.Name and "BundleThumbnail" or "Asset";
    local v39 = v2.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v26 (copy), l_ASSET_TYPE_LOCALIZED_0 (ref), v32 (copy), l_BUNDLE_TYPE_LOCALIZED_0 (ref), v33 (copy)
        local l_itemType_0 = v26.itemType;
        local l_itemSubType_0 = v26.itemSubType;
        local v38 = false;
        if l_itemType_0 == Enum.AvatarItemType.Asset.Name then
            v38 = l_ASSET_TYPE_LOCALIZED_0[tostring(l_itemSubType_0)] ~= nil;
        end;
        if v38 then
            return v32[tostring(l_itemSubType_0)];
        else
            v38 = false;
            if l_itemType_0 == Enum.AvatarItemType.Bundle.Name then
                v38 = l_BUNDLE_TYPE_LOCALIZED_0[tostring(l_itemSubType_0)] ~= nil;
            end;
            if v38 then
                return v33[tostring(l_itemSubType_0)];
            else
                return "";
            end;
        end;
    end, {
        v32, 
        v33, 
        v26.itemType, 
        v26.itemSubType
    });
    local v41 = v2.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v26 (copy), v9 (ref), v27 (copy), v34 (copy), v15 (ref)
        local v40 = {};
        if v26.status == nil then
            table.insert(v40, {
                type = "price", 
                price = v26.priceInRobux
            });
            return v40;
        elseif v26.status == v9.PRICE_MISMATCH then
            if v26.priceMismatchMetadata then
                table.insert(v40, {
                    type = "price", 
                    price = v26.priceMismatchMetadata.oldPriceInRobux, 
                    strikethrough = true
                });
                table.insert(v40, {
                    type = "price", 
                    price = v26.priceInRobux, 
                    colorStyle = v27.Color.System.Warning
                });
                return v40;
            else
                table.insert(v40, {
                    type = "text", 
                    text = v34[tostring(v9.PRICE_MISMATCH)]
                });
                return v40;
            end;
        elseif v26.status == v9.ALREADY_OWNED then
            table.insert(v40, {
                type = "text", 
                text = v34[tostring(v9.ALREADY_OWNED)]
            });
            return v40;
        else
            table.insert(v40, {
                type = "text", 
                text = if v15[tostring(v26.status)] then v34[tostring(v26.status)] else v34.Unvailable, 
                colorStyle = v27.Color.System.Warning
            });
            return v40;
        end;
    end, {
        v26.priceInRobux, 
        v26.status, 
        v26.priceMismatchMetadata
    });
    return v2.createElement(v3.View, {
        tag = "auto-y row size-full-0 gap-small", 
        LayoutOrder = v26.LayoutOrder, 
        testId = ("CheckoutRowItemCard-%*"):format(v26.itemId)
    }, {
        RowItemCardContainer = v2.createElement(v3.View, {
            tag = "auto-xy fill", 
            LayoutOrder = 1
        }, {
            CatalogRowItemCard = v2.createElement(l_CatalogRowItemCard_0, {
                title = v26.name, 
                presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                    url = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v35, v26.itemId)
                }), 
                onActivated = v26.onActivated, 
                creator = {
                    name = v26.creatorName, 
                    verified = v26.creatorVerified
                }, 
                priceLineContent = v41, 
                itemType = v26.itemRestriction, 
                itemSubType = v39, 
                timedOptions = if l_FFlagAXDurablesForMIS_0 then v26.timedOptions else nil, 
                onTimedOptionPriceChanged = if l_FFlagAXDurablesForMIS_0 then v26.onTimedOptionPriceChanged else nil, 
                selectedTimedOptionPrice = if l_FFlagAXDurablesForMIS_0 then v29 else nil, 
                setSelectedTimedOptionPrice = if l_FFlagAXDurablesForMIS_0 then v30 else nil, 
                selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v26.selectedTimedOptionIndexInReducer else nil, 
                headerSize = UDim2.fromOffset(v28, v28), 
                footerSize = UDim2.fromScale(0, 1), 
                footerAutomaticSize = Enum.AutomaticSize.XY, 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        RightSlot = v2.createElement(v3.View, {
            tag = "auto-xy anchor-top-right self-center", 
            LayoutOrder = 2
        }, {
            RemoveButton = if v26.onRemove then v2.createElement(v3.IconButton, {
                icon = "x", 
                isCircular = true, 
                variant = v3.Enums.ButtonVariant.Standard, 
                onActivated = v26.onRemove
            }) else nil
        })
    });
end, v6.deepEqual);