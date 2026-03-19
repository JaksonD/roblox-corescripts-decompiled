local l_CorePackages_0 = game:GetService("CorePackages");
local l_GenerateStringId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GenerateStringId;
return {
    mock = function() --[[ Line: 27 ]] --[[ Name: mock ]]
        -- upvalues: l_GenerateStringId_0 (copy)
        return {
            userAssetId = tostring(l_GenerateStringId_0()), 
            userId = tostring(l_GenerateStringId_0()), 
            userName = "", 
            sellerHasVerifiedBadge = false, 
            serialNumber = tostring(l_GenerateStringId_0()), 
            priceInRobux = 0
        };
    end, 
    fromSellPageAndResellers = function(v2) --[[ Line: 40 ]] --[[ Name: fromSellPageAndResellers ]]
        local v3 = {
            userAssetId = tostring(v2.userAssetId)
        };
        if v2.seller then
            v3.userId = tostring(v2.seller.id);
            v3.userName = v2.seller.name;
            v3.sellerHasVerifiedBadge = v2.seller.hasVerifiedBadge;
        end;
        v3.serialNumber = v2.serialNumber and tostring(v2.serialNumber) or nil;
        v3.priceInRobux = v2.price;
        v3.isOnHold = v2.isOnHold;
        return v3;
    end, 
    fromPriceInRobux = function(v4, v5) --[[ Line: 56 ]] --[[ Name: fromPriceInRobux ]]
        return {
            userAssetId = tostring(v4), 
            priceInRobux = v5
        };
    end
};