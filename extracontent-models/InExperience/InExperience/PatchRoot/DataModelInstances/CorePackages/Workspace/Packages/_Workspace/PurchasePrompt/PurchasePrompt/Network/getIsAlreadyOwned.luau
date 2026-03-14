local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Enums.PurchaseError);
local v3 = require(l_Parent_0.Promise);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
return function(v5, v6, v7, v8) --[[ Line: 11 ]] --[[ Name: getIsAlreadyOwned ]]
    -- upvalues: l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), v3 (copy), l_Players_0 (copy), v2 (copy)
    if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 and v8 then
        return v3.resolve(false);
    else
        return v5.getPlayerOwns(l_Players_0.LocalPlayer, v6, v7):catch(function(_) --[[ Line: 15 ]]
            -- upvalues: v3 (ref), v2 (ref)
            return v3.reject(v2.UnknownFailure);
        end);
    end;
end;