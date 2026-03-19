local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.ApplyNavigateIntoAvatarExperience);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.CompleteExternalNavigation);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.EquippedDeepLinkCatalogItem);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesSupport_0 = v10.FFlagAXDurablesSupport;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v10.FFlagAXHandleTaxonomyIdsDeepLinks;
local v13 = {
    screen = l_AvatarScreen_0.None, 
    params = nil, 
    requestId = 0, 
    completedRequestId = 0
};
return v3.createReducer(v13, {
    [v5.name] = function(v14, v15) --[[ Line: 35 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            screen = v15.screen, 
            params = v15.params, 
            requestId = v14.requestId + 1
        });
    end, 
    [v6.name] = function(v16, v17) --[[ Line: 43 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            completedRequestId = v17.requestId
        });
    end, 
    [v7.name] = function(v18, _) --[[ Line: 48 ]]
        -- upvalues: v2 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
        return v2.Dictionary.join(v18, {
            params = v2.Dictionary.join(v18.params or {}, {
                creatorName = v2.None, 
                minPrice = v2.None, 
                maxPrice = v2.None, 
                salesTypeFilter = v2.None, 
                includeNotForSale = v2.None, 
                sortType = v2.None, 
                sortAggregation = v2.None, 
                category = v2.None, 
                subcategory = v2.None, 
                taxonomy = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v2.None else nil, 
                keyword = v2.None, 
                topics = v2.None, 
                wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v2.None else nil
            })
        });
    end, 
    [v8.name] = function(v20, v21) --[[ Line: 77 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v20, {
            params = v2.Dictionary.join(v20.params or {}, {
                itemId = v21.itemId, 
                itemType = v21.itemType, 
                wasItemEquipped = v21.wasItemEquipped or false, 
                fetchItemFailed = v21.fetchItemFailed or false
            })
        });
    end, 
    [v9.name] = function(v22, _) --[[ Line: 87 ]]
        -- upvalues: v2 (copy), l_AvatarScreen_0 (copy)
        return v2.Dictionary.join(v22, {
            params = v2.Dictionary.join(v22.params or {}, {
                category = v2.None, 
                subcategory = v2.None, 
                opaquePage = l_AvatarScreen_0.AvatarEditor
            })
        });
    end
});