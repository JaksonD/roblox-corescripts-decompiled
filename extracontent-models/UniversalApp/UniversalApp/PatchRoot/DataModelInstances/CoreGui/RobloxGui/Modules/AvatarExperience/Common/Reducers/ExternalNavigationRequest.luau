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
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXHandleTaxonomyIdsDeepLinks;
local v11 = {
    screen = l_AvatarScreen_0.None, 
    params = nil, 
    requestId = 0, 
    completedRequestId = 0
};
return v3.createReducer(v11, {
    [v5.name] = function(v12, v13) --[[ Line: 34 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            screen = v13.screen, 
            params = v13.params, 
            requestId = v12.requestId + 1
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 42 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            completedRequestId = v15.requestId
        });
    end, 
    [v7.name] = function(v16, _) --[[ Line: 47 ]]
        -- upvalues: v2 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy)
        return v2.Dictionary.join(v16, {
            params = v2.Dictionary.join(v16.params or {}, {
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
                wearTimeFilter = v2.None
            })
        });
    end, 
    [v8.name] = function(v18, v19) --[[ Line: 76 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v18, {
            params = v2.Dictionary.join(v18.params or {}, {
                itemId = v19.itemId, 
                itemType = v19.itemType, 
                wasItemEquipped = v19.wasItemEquipped or false, 
                fetchItemFailed = v19.fetchItemFailed or false
            })
        });
    end, 
    [v9.name] = function(v20, _) --[[ Line: 86 ]]
        -- upvalues: v2 (copy), l_AvatarScreen_0 (copy)
        return v2.Dictionary.join(v20, {
            params = v2.Dictionary.join(v20.params or {}, {
                category = v2.None, 
                subcategory = v2.None, 
                opaquePage = l_AvatarScreen_0.AvatarEditor
            })
        });
    end
});