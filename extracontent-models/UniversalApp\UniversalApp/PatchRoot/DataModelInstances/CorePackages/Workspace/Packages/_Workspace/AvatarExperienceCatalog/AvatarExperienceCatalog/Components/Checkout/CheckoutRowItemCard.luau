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
local l_FFlagAXDurablesForMIS_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local l_ASSET_TYPE_LOCALIZED_0 = v10.ASSET_TYPE_LOCALIZED;
local l_BUNDLE_TYPE_LOCALIZED_0 = v10.BUNDLE_TYPE_LOCALIZED;
local v14 = {
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
local function _(v15, v16) --[[ Line: 38 ]] --[[ Name: hasAssetTypeLocalizedString ]]
    -- upvalues: l_ASSET_TYPE_LOCALIZED_0 (copy)
    local v17 = false;
    if v15 == Enum.AvatarItemType.Asset.Name then
        v17 = l_ASSET_TYPE_LOCALIZED_0[tostring(v16)] ~= nil;
    end;
    return v17;
end;
local function _(v19, v20) --[[ Line: 42 ]] --[[ Name: hasBundleTypeLocalizedString ]]
    -- upvalues: l_BUNDLE_TYPE_LOCALIZED_0 (copy)
    local v21 = false;
    if v19 == Enum.AvatarItemType.Bundle.Name then
        v21 = l_BUNDLE_TYPE_LOCALIZED_0[tostring(v20)] ~= nil;
    end;
    return v21;
end;
local function _(v23) --[[ Line: 46 ]] --[[ Name: getThumbnailType ]]
    if v23 == Enum.AvatarItemType.Bundle.Name then
        return "BundleThumbnail";
    else
        return "Asset";
    end;
end;
return v2.memo(function(v25) --[[ Line: 62 ]] --[[ Name: CheckoutRowItemCard ]]
    -- upvalues: v3 (copy), l_FFlagAXDurablesForMIS_0 (copy), v2 (copy), l_useLocalization_0 (copy), l_ASSET_TYPE_LOCALIZED_0 (copy), l_BUNDLE_TYPE_LOCALIZED_0 (copy), v14 (copy), v9 (copy), l_CatalogRowItemCard_0 (copy), l_ItemCardThumbnail_0 (copy)
    local v26 = v3.Hooks.useTokens();
    local v27 = v25.thumbnailSize or v26.Size.Size_2100;
    local v28 = nil;
    local v29 = nil;
    if l_FFlagAXDurablesForMIS_0 then
        local v33, v34 = v2.useState(function() --[[ Line: 70 ]]
            -- upvalues: v25 (copy)
            if v25.selectedTimedOptionIndexInReducer ~= nil then
                local v30 = v25.timedOptions and v25.timedOptions[v25.selectedTimedOptionIndexInReducer];
                if v30 then
                    return v30.price;
                end;
            end;
            if v25.timedOptions then
                for _, v32 in v25.timedOptions do
                    if v32.selected then
                        return v32.price;
                    end;
                end;
            end;
            return nil;
        end);
        v28 = v33;
        v29 = v34;
    end;
    local v35 = l_useLocalization_0(l_ASSET_TYPE_LOCALIZED_0);
    local v36 = l_useLocalization_0(l_BUNDLE_TYPE_LOCALIZED_0);
    local v37 = l_useLocalization_0(v14);
    local v38 = v25.itemType == Enum.AvatarItemType.Bundle.Name and "BundleThumbnail" or "Asset";
    local v42 = v2.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v25 (copy), l_ASSET_TYPE_LOCALIZED_0 (ref), v35 (copy), l_BUNDLE_TYPE_LOCALIZED_0 (ref), v36 (copy)
        local l_itemType_0 = v25.itemType;
        local l_itemSubType_0 = v25.itemSubType;
        local v41 = false;
        if l_itemType_0 == Enum.AvatarItemType.Asset.Name then
            v41 = l_ASSET_TYPE_LOCALIZED_0[tostring(l_itemSubType_0)] ~= nil;
        end;
        if v41 then
            return v35[tostring(l_itemSubType_0)];
        else
            v41 = false;
            if l_itemType_0 == Enum.AvatarItemType.Bundle.Name then
                v41 = l_BUNDLE_TYPE_LOCALIZED_0[tostring(l_itemSubType_0)] ~= nil;
            end;
            if v41 then
                return v36[tostring(l_itemSubType_0)];
            else
                return "";
            end;
        end;
    end, {
        v35, 
        v36, 
        v25.itemType, 
        v25.itemSubType
    });
    local v44 = v2.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: v25 (copy), v9 (ref), v26 (copy), v37 (copy), v14 (ref)
        local v43 = {};
        if v25.status == nil then
            table.insert(v43, {
                type = "price", 
                price = v25.priceInRobux
            });
            return v43;
        elseif v25.status == v9.PRICE_MISMATCH then
            if v25.priceMismatchMetadata then
                table.insert(v43, {
                    type = "price", 
                    price = v25.priceMismatchMetadata.oldPriceInRobux, 
                    strikethrough = true
                });
                table.insert(v43, {
                    type = "price", 
                    price = v25.priceInRobux, 
                    colorStyle = v26.Color.System.Warning
                });
                return v43;
            else
                table.insert(v43, {
                    type = "text", 
                    text = v37[tostring(v9.PRICE_MISMATCH)]
                });
                return v43;
            end;
        elseif v25.status == v9.ALREADY_OWNED then
            table.insert(v43, {
                type = "text", 
                text = v37[tostring(v9.ALREADY_OWNED)]
            });
            return v43;
        else
            table.insert(v43, {
                type = "text", 
                text = if v14[tostring(v25.status)] then v37[tostring(v25.status)] else v37.Unvailable, 
                colorStyle = v26.Color.System.Warning
            });
            return v43;
        end;
    end, {
        v25.priceInRobux, 
        v25.status, 
        v25.priceMismatchMetadata
    });
    return v2.createElement(v3.View, {
        tag = "auto-y row size-full-0 gap-small", 
        LayoutOrder = v25.LayoutOrder, 
        testId = ("CheckoutRowItemCard-%*"):format(v25.itemId)
    }, {
        RowItemCardContainer = v2.createElement(v3.View, {
            tag = "auto-xy fill", 
            LayoutOrder = 1
        }, {
            CatalogRowItemCard = v2.createElement(l_CatalogRowItemCard_0, {
                title = v25.name, 
                presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                    url = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v38, v25.itemId)
                }), 
                onActivated = v25.onActivated, 
                creator = {
                    name = v25.creatorName, 
                    verified = v25.creatorVerified
                }, 
                priceLineContent = v44, 
                itemType = v25.itemRestriction, 
                itemSubType = v42, 
                timedOptions = if l_FFlagAXDurablesForMIS_0 then v25.timedOptions else nil, 
                onTimedOptionPriceChanged = if l_FFlagAXDurablesForMIS_0 then v25.onTimedOptionPriceChanged else nil, 
                selectedTimedOptionPrice = if l_FFlagAXDurablesForMIS_0 then v28 else nil, 
                setSelectedTimedOptionPrice = if l_FFlagAXDurablesForMIS_0 then v29 else nil, 
                selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v25.selectedTimedOptionIndexInReducer else nil, 
                headerSize = UDim2.fromOffset(v27, v27), 
                footerSize = UDim2.fromScale(0, 1), 
                footerAutomaticSize = Enum.AutomaticSize.XY, 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        RightSlot = v2.createElement(v3.View, {
            tag = "auto-xy anchor-top-right self-center", 
            LayoutOrder = 2
        }, {
            RemoveButton = if v25.onRemove then v2.createElement(v3.IconButton, {
                icon = "x", 
                isCircular = true, 
                variant = v3.Enums.ButtonVariant.Standard, 
                onActivated = v25.onRemove
            }) else nil
        })
    });
end, v6.deepEqual);