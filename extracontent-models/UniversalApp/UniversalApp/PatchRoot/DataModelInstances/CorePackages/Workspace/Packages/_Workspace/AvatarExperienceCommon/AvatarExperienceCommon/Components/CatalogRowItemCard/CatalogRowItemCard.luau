local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_ItemCardComponents_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents;
local l_ItemCardHeader_0 = l_ItemCardComponents_0.ItemCardHeader;
local l_ItemCardBadge_0 = l_ItemCardComponents_0.ItemCardBadge;
local l_ItemCardStatus_0 = l_ItemCardComponents_0.ItemCardStatus;
local l_ItemCardHeaderCornersOverlay_0 = l_ItemCardComponents_0.ItemCardHeaderCornersOverlay;
local l_ItemCardIcon_0 = l_ItemCardComponents_0.ItemCardIcon;
local v10 = require(script.Parent.CatalogRowItemCardFooter);
local v11 = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum);
local v12 = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum);
local v13 = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum);
local l_FFlagAXDurablesForMIS_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
local v16 = {
    DYNAMIC_HEAD = "icons/menu/clothing/dynamicHead", 
    LIMITED = "icons/status/item/limited", 
    MODERATED = "icons/actions/info_small", 
    PENDING_MODERATION = "icons/status/pending_small", 
    UNAVAILABLE = "icons/status/warning_small", 
    DURABLE = "icons/menu/feed"
};
local v17 = {
    [v13.Moderated] = v16.MODERATED, 
    [v13.PendingModeration] = v16.PENDING_MODERATION, 
    [v13.Unavailable] = v16.UNAVAILABLE, 
    [v13.Durable] = v16.DURABLE
};
local v18 = {
    [v11.Limited] = {
        {
            type = "icon", 
            icon = v16.LIMITED
        }
    }, 
    [v11.Collectible] = {
        {
            type = "icon", 
            icon = v16.LIMITED
        }, 
        {
            type = "text", 
            text = "#"
        }
    }
};
local v19 = {
    [v12.DynamicHead] = v16.DYNAMIC_HEAD
};
return (v2.forwardRef(function(v20, v21) --[[ Line: 112 ]]
    -- upvalues: l_useTokens_0 (copy), v19 (copy), v18 (copy), v17 (copy), v2 (copy), l_ItemCardHeader_0 (copy), l_ItemCardHeaderCornersOverlay_0 (copy), l_ItemCardBadge_0 (copy), l_ItemCardStatus_0 (copy), l_ItemCardIcon_0 (copy), v10 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    local v22 = l_useTokens_0();
    local v23 = if v20.itemInfo then v19[v20.itemInfo] else nil;
    local v24 = if v20.itemType then v18[v20.itemType] else nil;
    local v25 = if v20.itemStatus and v20.itemStatus.type == "icon" then v17[v20.itemStatus.iconType] else nil;
    return v2.createElement("TextButton", {
        Text = "", 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Event.Activated] = if v20.isDisabled then nil else v20.onActivated, 
        ref = v21, 
        AutomaticSize = v20.AutomaticSize, 
        LayoutOrder = v20.LayoutOrder, 
        SelectionGroup = true, 
        ClipsDescendants = false, 
        [v2.Tag] = v20.tag
    }, {
        HorizontalLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v22.Gap.Medium)
        }), 
        Header = v2.createElement(l_ItemCardHeader_0, {
            LayoutOrder = 1, 
            aspectRatio = v20.headerAspectRatio, 
            Size = v20.headerSize, 
            overlaySlot = v2.createElement(l_ItemCardHeaderCornersOverlay_0, {
                topLeftSlot = if v20.itemStatus and v20.itemStatus.type == "badge" then v2.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v17[v20.itemStatus.iconType]
                        }, 
                        {
                            type = "text", 
                            text = v20.itemStatus.text
                        }
                    }
                }) else if v20.itemStatus then if v20.itemStatus.type == "text" then v2.createElement(l_ItemCardStatus_0, {
                    text = v20.itemStatus.text
                }) else if v25 then v2.createElement(l_ItemCardIcon_0, {
                    icon = v25
                }) else nil else nil, 
                bottomLeftSlot = if v24 then v2.createElement(l_ItemCardBadge_0, {
                    content = v24
                }) else nil, 
                bottomRightSlot = if v23 then v2.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v23
                        }
                    }
                }) else nil
            })
        }, v20.presentationSlot), 
        Footer = v2.createElement(v10, {
            title = v20.title, 
            creatorName = if v20.creator then v20.creator.name else nil, 
            bundlePartsText = v20.bundlePartsText, 
            itemSubType = v20.itemSubType, 
            creatorHasVerifiedBadge = if v20.creator then v20.creator.verified else nil, 
            priceLineContent = v20.priceLineContent, 
            timedOptions = if l_FFlagAXDurablesForMIS_0 then v20.timedOptions else nil, 
            onTimedOptionPriceChanged = if l_FFlagAXDurablesForMIS_0 then v20.onTimedOptionPriceChanged else nil, 
            selectedTimedOptionPrice = if l_FFlagAXDurablesForMIS_0 then v20.selectedTimedOptionPrice else nil, 
            setSelectedTimedOptionPrice = if l_FFlagAXDurablesForMIS_0 then v20.setSelectedTimedOptionPrice else nil, 
            LayoutOrder = 2, 
            Size = v20.footerSize, 
            AutomaticSize = if v20.footerAutomaticSize then v20.footerAutomaticSize else Enum.AutomaticSize.Y
        })
    });
end));