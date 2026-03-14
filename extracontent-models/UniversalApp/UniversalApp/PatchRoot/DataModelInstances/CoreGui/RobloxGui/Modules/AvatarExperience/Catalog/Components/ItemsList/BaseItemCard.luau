local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_CatalogItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v10 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_ItemTile_0 = v6.Tile.ItemTile;
local v19 = v3.PureComponent:extend("BaseItemCard");
v19.validateProps = v7.strictInterface({
    itemId = v7.optional(v7.string), 
    itemType = v7.optional(v7.string), 
    gridInformation = v7.optional(v7.table), 
    onActivated = v7.callback, 
    hideItemTitle = v7.optional(v7.boolean), 
    itemData = v7.optional(v7.table)
});
v19.render = function(v20) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v11 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), l_CatalogItemCard_0 (copy), l_ItemCardThumbnail_0 (copy), l_ItemTile_0 (copy)
    local l_itemData_0 = v20.props.itemData;
    local l_itemId_0 = v20.props.itemId;
    local l_itemType_0 = v20.props.itemType;
    v20.textButtonRef = v3.createRef();
    local v24 = nil;
    if v20.props.hideItemTitle then
        v24 = 0;
    end;
    local v25 = nil;
    local v26 = nil;
    if l_itemType_0 and l_itemId_0 then
        local v27 = v11.GetRbxThumbType(l_itemType_0);
        v25 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v27, 150);
    end;
    if l_itemData_0 then
        v26 = l_itemData_0.name;
    end;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        return v4.createElement(l_CatalogItemCard_0, {
            ref = v20.textButtonRef, 
            onActivated = v20.props.onActivated, 
            presentationSlot = if v25 then v4.createElement(l_ItemCardThumbnail_0, {
                url = v25
            }) else nil, 
            title = v26, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        });
    else
        return v3.createElement(l_ItemTile_0, {
            footer = v20.props.footer, 
            onActivated = v20.props.onActivated, 
            name = v26, 
            thumbnail = v25, 
            titleTextLineCount = v24, 
            textButtonRef = v20.textButtonRef
        });
    end;
end;
v19.addUnifiedEventLogging = function(v28) --[[ Line: 97 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local l_itemData_1 = v28.props.itemData;
    l_addUnifiedEventLogging_0(v28.textButtonRef, {
        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
        itemId = v28.props.itemId, 
        itemType = if v28.props.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
        price = if l_itemData_1 and l_itemData_1.priceInRobux then l_itemData_1.priceInRobux else nil, 
        gridPositionRow = if v28.props.gridInformation then v28.props.gridInformation.row else nil, 
        gridPositionColumn = if v28.props.gridInformation then v28.props.gridInformation.column else nil
    }, {
        hasDeferredActions = true, 
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
v19.didMount = function(v30) --[[ Line: 115 ]] --[[ Name: didMount ]]
    v30:addUnifiedEventLogging();
end;
return (v5.connect(function(v31, v32) --[[ Line: 119 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v10 (copy)
    return {
        itemData = v10(v31.AvatarExperience.Common, v32.itemId, v32.itemType)
    };
end)(v19));