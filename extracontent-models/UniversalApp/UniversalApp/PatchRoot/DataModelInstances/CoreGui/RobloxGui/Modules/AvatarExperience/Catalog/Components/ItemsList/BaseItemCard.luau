local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_CatalogItemCard_0 = v8.Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_UnifiedEventLogEnums_0 = v10.UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = v10.addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = v10.UnifiedEventLogConstants;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXThumbTypeNilCheck_0 = v9.FFlagAXThumbTypeNilCheck;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_ItemTile_0 = v6.Tile.ItemTile;
local v25 = v3.PureComponent:extend("BaseItemCard");
v25.validateProps = v7.strictInterface({
    itemId = v7.optional(v7.string), 
    itemType = v7.optional(v7.string), 
    gridInformation = v7.optional(v7.table), 
    onActivated = v7.callback, 
    hideItemTitle = v7.optional(v7.boolean), 
    itemData = v7.optional(v7.table)
});
v25.render = function(v26) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v14 (copy), l_FFlagAXThumbTypeNilCheck_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), l_CatalogItemCard_0 (copy), l_ItemCardThumbnail_0 (copy), l_ItemTile_0 (copy)
    local l_itemData_0 = v26.props.itemData;
    local l_itemId_0 = v26.props.itemId;
    local l_itemType_0 = v26.props.itemType;
    v26.textButtonRef = v3.createRef();
    local v30 = nil;
    if v26.props.hideItemTitle then
        v30 = 0;
    end;
    local v31 = nil;
    local v32 = nil;
    if l_itemType_0 and l_itemId_0 then
        local v33 = v14.GetRbxThumbType(l_itemType_0);
        v31 = if l_FFlagAXThumbTypeNilCheck_0 and v33 then l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v33, 150) else l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v33, 150);
    end;
    if l_itemData_0 then
        v32 = l_itemData_0.name;
    end;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        return v4.createElement(l_CatalogItemCard_0, {
            ref = v26.textButtonRef, 
            onActivated = v26.props.onActivated, 
            presentationSlot = if v31 then v4.createElement(l_ItemCardThumbnail_0, {
                url = v31
            }) else nil, 
            title = v32, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        });
    else
        return v3.createElement(l_ItemTile_0, {
            footer = v26.props.footer, 
            onActivated = v26.props.onActivated, 
            name = v32, 
            thumbnail = v31, 
            titleTextLineCount = v30, 
            textButtonRef = v26.textButtonRef
        });
    end;
end;
v25.addUnifiedEventLogging = function(v34) --[[ Line: 106 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local l_itemData_1 = v34.props.itemData;
    l_addUnifiedEventLogging_0(v34.textButtonRef, {
        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
        itemId = v34.props.itemId, 
        itemType = if v34.props.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
        assetType = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_itemData_1 then l_itemData_1.assetType else nil, 
        bundleType = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_itemData_1 then l_itemData_1.bundleType else nil, 
        price = if l_itemData_1 and l_itemData_1.priceInRobux then l_itemData_1.priceInRobux else nil, 
        gridPositionRow = if v34.props.gridInformation then v34.props.gridInformation.row else nil, 
        gridPositionColumn = if v34.props.gridInformation then v34.props.gridInformation.column else nil
    }, {
        hasDeferredActions = true, 
        isSelected = not l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and nil, 
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
if not l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    v25.didMount = function(v36) --[[ Line: 128 ]] --[[ Name: didMount ]]
        v36:addUnifiedEventLogging();
    end;
end;
if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    v25.didUpdate = function(v37, v38) --[[ Line: 134 ]] --[[ Name: didUpdate ]]
        if v38.itemId ~= v37.props.itemId or v38.itemType ~= v37.props.itemType then
            v37:addUnifiedEventLogging();
        end;
    end;
end;
return (v5.connect(function(v39, v40) --[[ Line: 141 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v13 (copy)
    return {
        itemData = v13(v39.AvatarExperience.Common, v40.itemId, v40.itemType)
    };
end)(v25));