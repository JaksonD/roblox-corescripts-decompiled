local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_ItemCardComponents_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents;
local l_ItemCardHeader_0 = l_ItemCardComponents_0.ItemCardHeader;
local l_ItemCardBadge_0 = l_ItemCardComponents_0.ItemCardBadge;
local l_ItemCardStatus_0 = l_ItemCardComponents_0.ItemCardStatus;
local l_ItemCardHeaderCornersOverlay_0 = l_ItemCardComponents_0.ItemCardHeaderCornersOverlay;
local l_ItemCardIcon_0 = l_ItemCardComponents_0.ItemCardIcon;
local v9 = require(script.Parent.CatalogRowItemCardFooter);
local v10 = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum);
local v11 = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum);
local v12 = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum);
local v13 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXDurablesForMIS_0 = v13.FFlagAXDurablesForMIS;
local l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 = v13.FFlagAXEnableTimedOptionsForCatalogRowCard;
local _ = require(l_Parent_0.AvatarExperienceTimedOptions);
local v17 = {
    DYNAMIC_HEAD = "icons/menu/clothing/dynamicHead", 
    LIMITED = "icons/status/item/limited", 
    MODERATED = "icons/actions/info_small", 
    PENDING_MODERATION = "icons/status/pending_small", 
    UNAVAILABLE = "icons/status/warning_small", 
    DURABLE = "icons/status/pending_small"
};
local v18 = {
    [v12.Moderated] = v17.MODERATED, 
    [v12.PendingModeration] = v17.PENDING_MODERATION, 
    [v12.Unavailable] = v17.UNAVAILABLE, 
    [v12.Durable] = v17.DURABLE
};
local v19 = {
    [v10.Limited] = {
        {
            type = "icon", 
            icon = v17.LIMITED
        }
    }, 
    [v10.Collectible] = {
        {
            type = "icon", 
            icon = v17.LIMITED
        }, 
        {
            type = "text", 
            text = "#"
        }
    }
};
local v20 = {
    [v11.DynamicHead] = v17.DYNAMIC_HEAD
};
return (v1.forwardRef(function(v21, v22) --[[ Line: 115 ]]
    -- upvalues: l_useTokens_0 (copy), v20 (copy), v19 (copy), v18 (copy), v1 (copy), l_ItemCardHeader_0 (copy), l_ItemCardHeaderCornersOverlay_0 (copy), l_ItemCardBadge_0 (copy), l_ItemCardStatus_0 (copy), l_ItemCardIcon_0 (copy), v9 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 (copy)
    local v23 = l_useTokens_0();
    local v24 = if v21.itemInfo then v20[v21.itemInfo] else nil;
    local v25 = if v21.itemType then v19[v21.itemType] else nil;
    local v26 = if v21.itemStatus and v21.itemStatus.type == "icon" then v18[v21.itemStatus.iconType] else nil;
    return v1.createElement("TextButton", {
        Text = "", 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v1.Event.Activated] = if v21.isDisabled then nil else v21.onActivated, 
        ref = v22, 
        AutomaticSize = v21.AutomaticSize, 
        LayoutOrder = v21.LayoutOrder, 
        SelectionGroup = true, 
        ClipsDescendants = false, 
        [v1.Tag] = v21.tag
    }, {
        HorizontalLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v23.Gap.Medium)
        }), 
        Header = v1.createElement(l_ItemCardHeader_0, {
            LayoutOrder = 1, 
            aspectRatio = v21.headerAspectRatio, 
            Size = v21.headerSize, 
            overlaySlot = v1.createElement(l_ItemCardHeaderCornersOverlay_0, {
                topLeftSlot = if v21.itemStatus and v21.itemStatus.type == "badge" then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v18[v21.itemStatus.iconType]
                        }, 
                        {
                            type = "text", 
                            text = v21.itemStatus.text
                        }
                    }
                }) else if v21.itemStatus then if v21.itemStatus.type == "text" then v1.createElement(l_ItemCardStatus_0, {
                    text = v21.itemStatus.text
                }) else if v26 then v1.createElement(l_ItemCardIcon_0, {
                    icon = v26
                }) else nil else nil, 
                bottomLeftSlot = if v25 then v1.createElement(l_ItemCardBadge_0, {
                    content = v25
                }) else nil, 
                bottomRightSlot = if v24 then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v24
                        }
                    }
                }) else nil
            })
        }, v21.presentationSlot), 
        Footer = v1.createElement(v9, {
            title = v21.title, 
            creatorName = if v21.creator then v21.creator.name else nil, 
            bundlePartsText = v21.bundlePartsText, 
            itemSubType = v21.itemSubType, 
            creatorHasVerifiedBadge = if v21.creator then v21.creator.verified else nil, 
            priceLineContent = v21.priceLineContent, 
            expirationTime = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.expirationTime else nil, 
            isOwned = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.isOwned else nil, 
            timedOptions = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.timedOptions else nil, 
            onTimedOptionPriceChanged = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.onTimedOptionPriceChanged else nil, 
            selectedTimedOptionPrice = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.selectedTimedOptionPrice else nil, 
            setSelectedTimedOptionPrice = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.setSelectedTimedOptionPrice else nil, 
            selectedTimedOptionIndexInReducer = if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v21.selectedTimedOptionIndexInReducer else nil, 
            LayoutOrder = 2, 
            Size = v21.footerSize, 
            AutomaticSize = if v21.footerAutomaticSize then v21.footerAutomaticSize else Enum.AutomaticSize.Y
        })
    });
end));