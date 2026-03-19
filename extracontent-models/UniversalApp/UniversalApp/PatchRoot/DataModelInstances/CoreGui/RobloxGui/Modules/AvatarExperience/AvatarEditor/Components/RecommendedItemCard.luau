local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogItemCardFooterBackendDriven;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v14 = v3.PureComponent:extend("RecommendedItemCard");
v14.didUpdate = function(v15, v16) --[[ Line: 25 ]] --[[ Name: didUpdate ]]
    -- upvalues: v11 (copy)
    local l_getRecommendedItems_0 = v15.props.getRecommendedItems;
    local l_clearTryOns_0 = v15.props.clearTryOns;
    if v16.purchasingStatus == v11.Fetching and v15.props.purchasingStatus == v11.Done then
        l_getRecommendedItems_0();
        l_clearTryOns_0();
    end;
end;
v14.render = function(v19) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy), v7 (copy), v6 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy)
    local l_itemId_0 = v19.props.itemId;
    local l_itemType_0 = v19.props.itemType;
    local l_index_0 = v19.props.index;
    local l_itemDetailsPeekViewRefs_0 = v19.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v19.props.resultsListRef;
    return v3.createElement(v9, {
        itemId = l_itemId_0, 
        itemType = l_itemType_0, 
        index = l_index_0, 
        analyticsItemCountPerPage = v7.NumRecommendedItems, 
        analyticsContext = v6.AnalyticsContext.AvatarEditorRecommendedItem, 
        itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
        resultsListRef = l_resultsListRef_0, 
        isTitleVisible = l_FFlagAXCatalogItemCardFooterBackendDriven_0 and true or nil, 
        isPriceVisible = l_FFlagAXCatalogItemCardFooterBackendDriven_0 and true or nil, 
        gridInformation = v19.props.gridInformation
    });
end;
return v4.connect(function(v25, v26) --[[ Line: 59 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v8 (copy), l_PerformFetch_0 (copy), v6 (copy)
    local v27 = nil;
    local v28 = v8(v25.AvatarExperience.Common, v26.itemId, v26.itemType);
    v27 = v28 and v28.product and tostring(v28.product.id) or "";
    local v29 = nil;
    if v27 then
        v29 = l_PerformFetch_0.GetStatus(v25, v6.PurchaseProductKey .. v27);
    end;
    return {
        purchasingStatus = v29
    };
end, function(v30) --[[ Line: 74 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy)
    return {
        clearTryOns = function() --[[ Line: 76 ]] --[[ Name: clearTryOns ]]
            -- upvalues: v30 (copy), v12 (ref)
            v30(v12());
        end
    };
end)(v14);