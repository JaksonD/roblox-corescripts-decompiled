local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_GenerateStringId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GenerateStringId;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = game:DefineFastFlag("AXFixCollectibleItemInfoCreatorVerifiedBadge", false);
local l_FFlagAXMISEnableMultiShopping_0 = v2.FFlagAXMISEnableMultiShopping;
return {
    mock = function() --[[ Line: 63 ]] --[[ Name: mock ]]
        -- upvalues: l_GenerateStringId_0 (copy), v6 (copy), v5 (copy)
        return {
            collectibleItemId = l_GenerateStringId_0(), 
            collectibleProductId = l_GenerateStringId_0(), 
            name = "", 
            description = "", 
            creator = {
                id = l_GenerateStringId_0(), 
                name = "", 
                type = "", 
                targetId = "", 
                hasVerifiedBadge = not v6 and nil
            }, 
            price = 1, 
            lowestPrice = 0, 
            unitsAvailableForConsumption = 0, 
            offsaleDeadline = "", 
            assetStock = 0, 
            recentAveragePrice = 0, 
            saleLocationType = "ShopAndAllExperiences", 
            quantityLimitPerUser = 0, 
            resaleRestriction = v5.ResaleRestriction.None
        };
    end, 
    fromGetCollectibleItemData = function(v8) --[[ Line: 93 ]] --[[ Name: fromGetCollectibleItemData ]]
        -- upvalues: v6 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
        local v9 = {
            collectibleItemId = v8.collectibleItemId, 
            collectibleProductId = v8.collectibleProductId, 
            name = v8.name, 
            description = v8.description, 
            creator = {
                id = v8.creatorId, 
                name = v8.creatorName, 
                type = v8.creatorType, 
                targetId = v8.creatorTargetId, 
                hasVerifiedBadge = if v6 then v8.creatorHasVerifiedBadge else nil
            }, 
            price = v8.price, 
            lowestPrice = v8.lowestPrice, 
            unitsAvailableForConsumption = v8.unitsAvailableForConsumption, 
            offsaleDeadline = v8.offsaleDeadline, 
            assetStock = v8.assetStock, 
            saleLocationType = v8.saleLocationType, 
            quantityLimitPerUser = v8.quantityLimitPerUser, 
            experiences = v8.experiences, 
            resaleRestriction = v8.resaleRestriction
        };
        if l_FFlagAXMISEnableMultiShopping_0 then
            v9.lowestAvailableResaleProductId = v8.lowestAvailableResaleProductId;
            v9.lowestAvailableResaleItemInstanceId = v8.lowestAvailableResaleItemInstanceId;
        end;
        return v9;
    end, 
    fromGetResellers = function(v10) --[[ Line: 130 ]] --[[ Name: fromGetResellers ]]
        return {
            hasResellers = #v10 > 0
        };
    end, 
    fromGetResaleData = function(v11) --[[ Line: 137 ]] --[[ Name: fromGetResaleData ]]
        return {
            recentAveragePrice = v11.recentAveragePrice
        };
    end
};