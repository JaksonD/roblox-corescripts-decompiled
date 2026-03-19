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
local l_FFlagAXDurablesSupport_0 = v16.FFlagAXDurablesSupport;
local v19 = game:DefineFastFlag("MoveLimitedBadgeToTopLeft", false);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXMISEnableMultiShopping_0 = v16.FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesSupport_0 = v16.FFlagAXInventoryDurablesSupport;
local v23 = {
    Text = "text", 
    Icon = "icon", 
    Badge = "badge", 
    Placeholder = "placeholder"
};
local v24 = {
    [v14.Moderated] = "icons/actions/info_small", 
    [v14.PendingModeration] = "icons/status/pending_small", 
    [v14.Durable] = "icons/status/pending_small", 
    [v14.Info] = "icons/actions/info_small", 
    [v14.Unavailable] = "icons/status/warning_small", 
    [v14.Error] = "icons/status/error_large"
};
local v25 = {
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
local v26 = {
    [v13.DynamicHead] = "icons/menu/clothing/dynamicHead"
};
return (v1.forwardRef(function(v27, v28) --[[ Line: 115 ]]
    -- upvalues: v26 (copy), v25 (copy), l_FFlagAXDurablesSupport_0 (copy), v23 (copy), v24 (copy), v1 (copy), v11 (copy), l_ItemCard_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_ItemCardHeader_0 (copy), v15 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v14 (copy), l_ItemCardHeaderCornersOverlay_0 (copy), l_ItemCardStatus_0 (copy), l_ItemCardBadge_0 (copy), l_ItemCardIcon_0 (copy), v19 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), l_ItemCardFooter_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    local v29 = v27.title or v27.creator or v27.priceLineContent;
    local v30 = if v27.itemInfo then v26[v27.itemInfo] else nil;
    local v31 = if v27.itemType then v25[v27.itemType] else nil;
    local v32 = nil;
    v32 = if l_FFlagAXDurablesSupport_0 then if v27.itemStatus and (not (v27.itemStatus.type ~= v23.Icon) or v27.itemStatus.type == v23.Badge) and v27.itemStatus.iconType then v24[v27.itemStatus.iconType] else nil else if v27.itemStatus and v27.itemStatus.type == v23.Icon and v27.itemStatus.iconType then v24[v27.itemStatus.iconType] else nil;
    local function v33() --[[ Line: 137 ]] --[[ Name: renderPresentationSlot ]]
        -- upvalues: v27 (copy), v23 (ref), v1 (ref), v11 (ref), v24 (ref)
        if v27.itemStatus and v27.itemStatus.type == v23.Placeholder then
            if not v27.itemStatus.iconType then
                return nil;
            else
                return v1.createElement(v11.View, {
                    tag = "size-full clip radius-medium row align-x-center align-y-center"
                }, {
                    icon = v1.createElement(v11.Image, {
                        Image = v24[v27.itemStatus.iconType], 
                        Size = UDim2.fromScale(0.33, 0.33)
                    })
                });
            end;
        else
            return v27.presentationSlot;
        end;
    end;
    return v1.createElement(l_ItemCard_0, {
        onActivated = v27.onActivated, 
        isDisabled = v27.isDisabled, 
        ref = v28, 
        Size = v27.Size, 
        AutomaticSize = v27.AutomaticSize, 
        LayoutOrder = v27.LayoutOrder, 
        tag = v27.tag, 
        Selectable = if l_FFlagAXMISEnableMultiShopping_0 then v27.Selectable else nil, 
        headerSlot = v1.createElement(l_ItemCardHeader_0, {
            aspectRatio = v27.headerAspectRatio, 
            overlaySlot = if v27.isSelected then v1.createElement(v15, if v27.onOverlayButtonActivated and v27.overlayButtonText then {
                onActivated = v27.onOverlayButtonActivated, 
                buttonText = v27.overlayButtonText, 
                badge = if l_FFlagAXDurablesSupport_0 and v32 and v27.itemStatus and v27.itemStatus.text then {
                    icon = v32, 
                    text = v27.itemStatus.text
                } else if l_FFlagAXInventoryDurablesSupport_0 and v27.expirationTime and (not v27.itemStatus or v27.itemStatus.iconType ~= v14.Moderated) then {
                    icon = "icons/status/pending_small", 
                    text = v27.expirationTime
                } else nil
            } else if l_FFlagAXInventoryDurablesSupport_0 and v32 then {
                itemStatusIcon = v32
            } else nil) else v1.createElement(l_ItemCardHeaderCornersOverlay_0, {
                topLeftSlot = if v27.itemStatus then if v27.itemStatus.type == v23.Text and v27.itemStatus.text then v1.createElement(l_ItemCardStatus_0, {
                    text = v27.itemStatus.text
                }) else if l_FFlagAXDurablesSupport_0 and v27.itemStatus.type == v23.Badge then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v32
                        }, 
                        {
                            type = "text", 
                            text = v27.itemStatus.text
                        }
                    }, 
                    displayBorder = true
                }) else if v32 then v1.createElement(l_ItemCardIcon_0, {
                    icon = v32
                }) else nil else if l_FFlagAXInventoryDurablesSupport_0 and v27.expirationTime then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = "icons/status/pending_small"
                        }, 
                        {
                            type = "text", 
                            text = v27.expirationTime
                        }
                    }, 
                    displayBorder = true
                }) else if v19 and v31 then v1.createElement(l_ItemCardBadge_0, {
                    content = v31
                }) else nil, 
                bottomLeftSlot = if not v19 and v31 then v1.createElement(l_ItemCardBadge_0, {
                    content = v31
                }) else nil, 
                bottomRightSlot = if v30 then v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v30
                        }
                    }
                }) else nil
            }), 
            backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 then v27.headerBackgroundLayers else nil, 
            Size = v27.headerSize
        }, v33()), 
        footerSlot = if v29 then v1.createElement(l_ItemCardFooter_0, {
            title = v27.title, 
            creatorName = if v27.creator then v27.creator.name else nil, 
            creatorHasVerifiedBadge = if v27.creator then v27.creator.verified else nil, 
            priceLineContent = v27.priceLineContent, 
            titleTextSize = if l_FFlagAXRootSlotBasedEditorFlag_0 then v27.titleTextSize else nil, 
            LayoutOrder = 2
        }) else nil
    });
end));