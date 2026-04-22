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
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v5.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v16 = game:DefineFastFlag("AXNoShimmerImpressions", false);
return function(v17) --[[ Line: 48 ]] --[[ Name: InventoryItemCard ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v16 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_InventoryItemType_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_CatalogItemCard_0 (copy), l_CatalogItemCardItemInfoEnum_0 (copy), v2 (copy), l_ItemCardThumbnail_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    local v18 = l_useLocalization_0({
        details = "Feature.Avatar.Label.DetailsButton"
    });
    local v19 = nil;
    v19 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v16 (ref), v17 (copy), l_addUnifiedEventLogging_0 (ref), v19 (ref), l_UnifiedEventLogEnums_0 (ref), l_InventoryItemType_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v16 and (not v17.itemId or not v17.assetType) then
            return;
        else
            l_addUnifiedEventLogging_0(v19, {
                action = if v17.isSelected then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemId = v17.itemId, 
                itemType = if v17.inventoryItemType == l_InventoryItemType_0.Asset then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
                gridPositionRow = if v17.gridInformation then v17.gridInformation.row else nil, 
                gridPositionColumn = if v17.gridInformation then v17.gridInformation.column else nil, 
                assetType = v17.assetType
            }, {
                hasDeferredActions = not l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 or nil, 
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
            return;
        end;
    end, {
        v17.isSelected, 
        v17.gridInformation, 
        if v16 then v17.itemId else nil, 
        if v16 then v17.assetType else nil, 
        if v16 then v17.inventoryItemType else nil
    });
    local v20 = v17.inventoryItemType == l_InventoryItemType_0.Asset and "Asset" or v17.inventoryItemType == l_InventoryItemType_0.Outfit and "Outfit" or nil;
    local v21 = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v20, v17.itemId);
    if v17.moderationStatus then
        v21 = v21 .. "&filters=" .. (v17.updateCounter or 0);
    end;
    return v1.createElement(l_CatalogItemCard_0, {
        Size = UDim2.fromScale(1, 1), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        isSelected = v17.isSelected, 
        title = if not v17.hideName then v17.itemName else nil, 
        itemInfo = if v17.showDynamicHeadIcon then l_CatalogItemCardItemInfoEnum_0.DynamicHead else nil, 
        onActivated = v17.onActivated, 
        overlayButtonText = v18.details, 
        onOverlayButtonActivated = v17.onDetailsButtonActivated, 
        ref = v19, 
        presentationSlot = v1.createElement(v2.View, {
            tag = ("size-full clip radius-medium %*"):format(v17.impressionsTag), 
            ref = v17.thumbnailRef
        }, {
            Thumbnail = v20 and v1.createElement(l_ItemCardThumbnail_0, {
                url = v21
            })
        }), 
        itemStatus = v17.itemStatus, 
        expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v17.expirationTime else nil
    });
end;