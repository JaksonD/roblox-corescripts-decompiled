local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Promise);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local l_FFlagUnifiedPurchaseFlowShouldCacheExperimentResult_0 = require(l_Parent_0.PurchasePromptLite).FFlagUnifiedPurchaseFlowShouldCacheExperimentResult;
local l_GetFFlagDevSubsEligibleForUnifiedPurchaseFlow_0 = require(l_Parent_0.PurchasePromptLite).GetFFlagDevSubsEligibleForUnifiedPurchaseFlow;
local l_FFlagShipUnifiedPurchaseInExperience_0 = require(l_Parent_0.SharedFlags).FFlagShipUnifiedPurchaseInExperience;
local function _() --[[ Line: 18 ]] --[[ Name: getUnifiedPurchaseFlowIsUserEligibleFromStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    return l_AppStorageService_0:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true";
end;
local function _() --[[ Line: 23 ]] --[[ Name: getUnifiedPurchaseFlowExpirationTimeSecondsUTCFromStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    return tonumber((l_AppStorageService_0:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1;
end;
local function _(v10, v11) --[[ Line: 28 ]] --[[ Name: persistUnifiedPurchaseFlowMetadata ]]
    -- upvalues: l_AppStorageService_0 (copy)
    if v10 then
        l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "true");
    else
        l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "false");
    end;
    l_AppStorageService_0:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(v11)));
    l_AppStorageService_0:Flush();
end;
return function(v13, v14) --[[ Line: 40 ]] --[[ Name: getUnifiedPurchaseFlowEligibility ]]
    -- upvalues: l_GetFFlagDevSubsEligibleForUnifiedPurchaseFlow_0 (copy), l_ProductTypeEnum_0 (copy), v3 (copy), l_FFlagShipUnifiedPurchaseInExperience_0 (copy), l_FFlagUnifiedPurchaseFlowShouldCacheExperimentResult_0 (copy), l_AppStorageService_0 (copy)
    if l_GetFFlagDevSubsEligibleForUnifiedPurchaseFlow_0() and v14 == l_ProductTypeEnum_0.DeveloperSubscription then
        return v3.resolve(true);
    elseif l_FFlagShipUnifiedPurchaseInExperience_0 then
        return v3.resolve(true);
    else
        local v15 = os.time(os.date("!*t"));
        if l_FFlagUnifiedPurchaseFlowShouldCacheExperimentResult_0 then
            local v16 = tonumber((l_AppStorageService_0:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1;
            if v16 ~= -1 and v15 < v16 then
                local v17 = l_AppStorageService_0:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true";
                return v3.resolve(v17);
            end;
        end;
        return v13.getUnifiedPurchaseFlowUserEligibility():andThen(function(v18) --[[ Line: 60 ]]
            -- upvalues: v3 (ref), l_FFlagUnifiedPurchaseFlowShouldCacheExperimentResult_0 (ref), v15 (copy), l_AppStorageService_0 (ref)
            if not v18 then
                return v3.reject(false);
            else
                local l_unifiedPurchaseFlowMetadata_0 = v18.unifiedPurchaseFlowMetadata;
                local l_isUserEligibleForUnifiedPurchaseFlow_0 = l_unifiedPurchaseFlowMetadata_0.isUserEligibleForUnifiedPurchaseFlow;
                local v21 = l_unifiedPurchaseFlowMetadata_0.expiresInSeconds or 0;
                if l_FFlagUnifiedPurchaseFlowShouldCacheExperimentResult_0 then
                    local v22 = v15 + v21;
                    if l_isUserEligibleForUnifiedPurchaseFlow_0 then
                        l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "true");
                    else
                        l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "false");
                    end;
                    l_AppStorageService_0:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(v22)));
                    l_AppStorageService_0:Flush();
                end;
                return v3.resolve(l_isUserEligibleForUnifiedPurchaseFlow_0);
            end;
        end, function(_) --[[ Line: 75 ]]
            -- upvalues: v3 (ref)
            return v3.resolve(false);
        end):catch(function(_) --[[ Line: 79 ]]
            -- upvalues: v3 (ref)
            return v3.resolve(false);
        end);
    end;
end;