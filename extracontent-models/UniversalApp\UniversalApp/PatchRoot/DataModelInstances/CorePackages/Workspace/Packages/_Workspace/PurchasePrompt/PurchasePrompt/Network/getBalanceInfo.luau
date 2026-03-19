local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
local l_FFlagAddPurchaseOptionForProvidingBalance_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance;
return function(v4, v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: l_FFlagAddPurchaseOptionForProvidingBalance_0 (copy), v2 (copy), v1 (copy)
    if l_FFlagAddPurchaseOptionForProvidingBalance_0 and v8 ~= nil then
        return v2.resolve({
            robux = v8, 
            hasFailed = false
        });
    else
        return v4.getBalanceInfo():andThen(function(v9) --[[ Line: 22 ]]
            -- upvalues: v5 (copy), v6 (copy), v2 (ref)
            if v5.isStudio() and not v6 then
                v9.robux = 2147483647;
            end;
            v9.hasFailed = false;
            return v2.resolve(v9);
        end):catch(function(_) --[[ Line: 33 ]]
            -- upvalues: v7 (copy), v2 (ref), v1 (ref)
            if v7 then
                return v2.resolve({
                    robux = 0, 
                    hasFailed = true
                });
            else
                return v2.reject(v1.UnknownFailure);
            end;
        end);
    end;
end;