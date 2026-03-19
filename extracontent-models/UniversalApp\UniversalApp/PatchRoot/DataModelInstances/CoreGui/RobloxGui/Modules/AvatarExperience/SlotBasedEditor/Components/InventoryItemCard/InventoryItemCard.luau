local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local l_CatalogItemCard_0 = v4.Components.CatalogItemCard.CatalogItemCard;
local l_CatalogItemCardItemInfoEnum_0 = v4.Components.CatalogItemCard.CatalogItemCardItemInfoEnum;
local l_ItemCardThumbnail_0 = v6.ItemCardComponents.ItemCardThumbnail;
local l_InventoryItemType_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemType;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXInventoryDurablesSupport_0 = v5.FFlagAXInventoryDurablesSupport;
return function(v15) --[[ Line: 46 ]] --[[ Name: InventoryItemCard ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_InventoryItemType_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_CatalogItemCard_0 (copy), l_CatalogItemCardItemInfoEnum_0 (copy), v2 (copy), l_ItemCardThumbnail_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    local v16 = l_useLocalization_0({
        details = "Feature.Avatar.Label.DetailsButton"
    });
    local v17 = nil;
    v17 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_addUnifiedEventLogging_0 (ref), v17 (ref), v15 (copy), l_UnifiedEventLogEnums_0 (ref), l_InventoryItemType_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        l_addUnifiedEventLogging_0(v17, {
            action = if v15.isSelected then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
            itemId = v15.itemId, 
            itemType = if v15.inventoryItemType == l_InventoryItemType_0.Asset then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
            gridPositionRow = if v15.gridInformation then v15.gridInformation.row else nil, 
            gridPositionColumn = if v15.gridInformation then v15.gridInformation.column else nil, 
            assetType = v15.assetType
        }, {
            hasDeferredActions = true, 
            sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
        });
    end, {
        v15.isSelected, 
        v15.gridInformation
    });
    local v18 = v15.inventoryItemType == l_InventoryItemType_0.Asset and "Asset" or v15.inventoryItemType == l_InventoryItemType_0.Outfit and "Outfit" or nil;
    local v19 = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v18, v15.itemId);
    if v15.moderationStatus then
        v19 = v19 .. "&filters=" .. (v15.updateCounter or 0);
    end;
    return v1.createElement(l_CatalogItemCard_0, {
        Size = UDim2.fromScale(1, 1), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        isSelected = v15.isSelected, 
        title = if not v15.hideName then v15.itemName else nil, 
        itemInfo = if v15.showDynamicHeadIcon then l_CatalogItemCardItemInfoEnum_0.DynamicHead else nil, 
        onActivated = v15.onActivated, 
        overlayButtonText = v16.details, 
        onOverlayButtonActivated = v15.onDetailsButtonActivated, 
        ref = v17, 
        presentationSlot = v1.createElement(v2.View, {
            tag = ("size-full clip radius-medium %*"):format(v15.impressionsTag), 
            ref = v15.thumbnailRef
        }, {
            Thumbnail = v18 and v1.createElement(l_ItemCardThumbnail_0, {
                url = v19
            })
        }), 
        itemStatus = v15.itemStatus, 
        expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v15.expirationTime else nil
    });
end;