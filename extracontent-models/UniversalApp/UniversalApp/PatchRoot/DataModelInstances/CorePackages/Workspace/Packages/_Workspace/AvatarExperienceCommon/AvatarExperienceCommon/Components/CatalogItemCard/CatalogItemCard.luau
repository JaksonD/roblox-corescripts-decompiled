local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_ItemCardComponents_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents;
local l_ItemCardFooter_0 = l_ItemCardComponents_0.ItemCardFooter;
local l_ItemCardHeader_0 = l_ItemCardComponents_0.ItemCardHeader;
local l_ItemCard_0 = l_ItemCardComponents_0.ItemCard;
local l_ItemCardBadge_0 = l_ItemCardComponents_0.ItemCardBadge;
local l_ItemCardStatus_0 = l_ItemCardComponents_0.ItemCardStatus;
local l_ItemCardHeaderCornersOverlay_0 = l_ItemCardComponents_0.ItemCardHeaderCornersOverlay;
local _ = l_ItemCardComponents_0.ItemCardPriceLine;
local l_ItemCardIcon_0 = l_ItemCardComponents_0.ItemCardIcon;
local v11 = require(l_Parent_0.Foundation);
local v12 = require(script.Parent.Enums.CatalogItemCardItemTypeEnum);
local v13 = require(script.Parent.Enums.CatalogItemCardItemInfoEnum);
local v14 = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum);
local v15 = require(script.Parent.CatalogItemCardSelectedOverlay);
local v16 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXLookAndFeelBackgrounds_0 = v16.FFlagAXLookAndFeelBackgrounds;
local v18 = game:DefineFastFlag("MoveLimitedBadgeToTopLeft", false);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXMISEnableMultiShopping_0 = v16.FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesSupport_0 = v16.FFlagAXInventoryDurablesSupport;
local v22 = {
    Text = "text", 
    Icon = "icon", 
    Badge = "badge", 
    Placeholder = "placeholder"
};
local v23 = {
    [v14.Moderated] = "icons/actions/info_small", 
    [v14.PendingModeration] = "icons/status/pending_small", 
    [v14.Durable] = "icons/status/pending_small", 
    [v14.Info] = "icons/actions/info_small", 
    [v14.Unavailable] = "icons/status/warning_small", 
    [v14.Error] = "icons/status/error_large"
};
local v24 = {
    [v12.Limited] = {
        {
            type = "icon", 
            icon = "icons/status/item/limited"
        }
    }, 
    [v12.Collectible] = {
        {
            type = "icon", 
            icon = "icons/status/item/limited"
        }, 
        {
            type = "text", 
            text = "#"
        }
    }
};
local v25 = {
    [v13.DynamicHead] = "icons/menu/clothing/dynamicHead"
};
return (v1.forwardRef(function(v26, v27) --[[ Line: 114 ]]
    -- upvalues: v25 (copy), v24 (copy), v22 (copy), v23 (copy), v1 (copy), v11 (copy), l_ItemCard_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_ItemCardHeader_0 (copy), v15 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v14 (copy), l_ItemCardHeaderCornersOverlay_0 (copy), l_ItemCardStatus_0 (copy), l_ItemCardBadge_0 (copy), l_ItemCardIcon_0 (copy), v18 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), l_ItemCardFooter_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    local v28 = v26.title or v26.creator or v26.priceLineContent;
    local v29 = if v26.itemInfo then v25[v26.itemInfo] else nil;
    local v30 = if v26.itemType then v24[v26.itemType] else nil;
    local v31 = if v26.itemStatus and (not (v26.itemStatus.type ~= v22.Icon) or v26.itemStatus.type == v22.Badge) and v26.itemStatus.iconType then v23[v26.itemStatus.iconType] else nil;
    local function v32() --[[ Line: 127 ]] --[[ Name: renderPresentationSlot ]]
        -- upvalues: v26 (copy), v22 (ref), v1 (ref), v11 (ref), v23 (ref)
        if v26.itemStatus and v26.itemStatus.type == v22.Placeholder then
            if not v26.itemStatus.iconType then
                return nil;
            else
                return v1.createElement(v11.View, {
                    tag = "size-full clip radius-medium row align-x-center align-y-center"
                }, {
                    icon = v1.createElement(v11.Image, {
                        Image = v23[v26.itemStatus.iconType], 
                        Size = UDim2.fromScale(0.33, 0.33)
                    })
                });
            end;
        else
            return v26.presentationSlot;
        end;
    end;
    return v1.createElement(l_ItemCard_0, {
        onActivated = v26.onActivated, 
        isDisabled = v26.isDisabled, 
        ref = v27, 
        Size = v26.Size, 
        AutomaticSize = v26.AutomaticSize, 
        LayoutOrder = v26.LayoutOrder, 
        tag = v26.tag, 
        Selectable = if l_FFlagAXMISEnableMultiShopping_0 then v26.Selectable else nil, 
        headerSlot = v1.createElement(l_ItemCardHeader_0, {
            aspectRatio = v26.headerAspectRatio, 
            overlaySlot = if v26.isSelected then v1.createElement(v15, if v26.onOverlayButtonActivated and v26.overlayButtonText then {
                onActivated = v26.onOverlayButtonActivated, 
                buttonText = v26.overlayButtonText, 
                badge = if v31 and v26.itemStatus and v26.itemStatus.text then {
                    icon = v31, 
                    text = v26.itemStatus.text
                } else if l_FFlagAXInventoryDurablesSupport_0 and v26.expirationTime and (not v26.itemStatus or v26.itemStatus.iconType ~= v14.Moderated) then {
                    icon = "icons/status/pending_small", 
                    text = v26.expirationTime
                } else nil
            } else if l_FFlagAXInventoryDurablesSupport_0 and v31 then {
                itemStatusIcon = v31
            } else nil) else v1.createElement(l_ItemCardHeaderCornersOverlay_0, {
                topLeftSlot = if v26.itemStatus then if v26.itemStatus.type == v22.Text and v26.itemStatus.text then v1.createElement(l_ItemCardStatus_0, {
                    text = v26.itemStatus.text
                }) else if v26.itemStatus.type == v22.Badge then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v31
                        }, 
                        {
                            type = "text", 
                            text = v26.itemStatus.text
                        }
                    }, 
                    displayBorder = true
                }) else if v31 then v1.createElement(l_ItemCardIcon_0, {
                    icon = v31
                }) else nil else if l_FFlagAXInventoryDurablesSupport_0 and v26.expirationTime then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = "icons/status/pending_small"
                        }, 
                        {
                            type = "text", 
                            text = v26.expirationTime
                        }
                    }, 
                    displayBorder = true
                }) else if v18 and v30 then v1.createElement(l_ItemCardBadge_0, {
                    content = v30
                }) else nil, 
                bottomLeftSlot = if not v18 and v30 then v1.createElement(l_ItemCardBadge_0, {
                    content = v30
                }) else nil, 
                bottomRightSlot = if v29 then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v29
                        }
                    }
                }) else nil
            }), 
            backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 then v26.headerBackgroundLayers else nil, 
            Size = v26.headerSize
        }, v32()), 
        footerSlot = if v28 then v1.createElement(l_ItemCardFooter_0, {
            title = v26.title, 
            creatorName = if v26.creator then v26.creator.name else nil, 
            creatorHasVerifiedBadge = if v26.creator then v26.creator.verified else nil, 
            priceLineContent = v26.priceLineContent, 
            titleTextSize = if l_FFlagAXRootSlotBasedEditorFlag_0 then v26.titleTextSize else nil, 
            LayoutOrder = 2
        }) else nil
    });
end));