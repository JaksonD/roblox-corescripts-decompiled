local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePromptLite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagUnifiedPurchaseFlowShouldCacheExperimentResult);
local v6 = require(l_script_FirstAncestor_0.Flags.GetFFlagDevSubsEligibleForUnifiedPurchaseFlow);
local function v10(v7) --[[ Line: 21 ]] --[[ Name: APIGetRobloxSubscriptionMetadata ]]
    -- upvalues: v4 (copy), l_Url_0 (copy)
    if v7 == nil then
        return v4.reject();
    else
        return v7(string.format("%sroblox-subscriptions/v1/metadata", l_Url_0.APIS_URL), "GET"):andThen(function(v8) --[[ Line: 28 ]]
            -- upvalues: v4 (ref)
            return v4.resolve(v8.responseBody);
        end, function(v9) --[[ Line: 30 ]]
            -- upvalues: v4 (ref)
            return v4.reject(v9);
        end);
    end;
end;
local function _() --[[ Line: 35 ]] --[[ Name: getUnifiedPurchaseFlowIsUserEligibleFromStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    return l_AppStorageService_0:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true";
end;
local function _() --[[ Line: 40 ]] --[[ Name: getUnifiedPurchaseFlowExpirationTimeSecondsUTCFromStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    return tonumber((l_AppStorageService_0:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1;
end;
local function _(v13, v14) --[[ Line: 45 ]] --[[ Name: persistUnifiedPurchaseFlowMetadata ]]
    -- upvalues: l_AppStorageService_0 (copy)
    if v13 then
        l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "true");
    else
        l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "false");
    end;
    l_AppStorageService_0:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(v14)));
    l_AppStorageService_0:Flush();
end;
return function(v16, v17) --[[ Line: 57 ]] --[[ Name: getIsUserEligibleForUnifiedPurchaseFlow ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy), l_AppStorageService_0 (copy), v10 (copy)
    if v17 == "DeveloperSubscription" then
        local v18 = v6();
        return v4.resolve(v18);
    else
        local v19 = os.time(os.date("!*t"));
        if v5 then
            local v20 = tonumber((l_AppStorageService_0:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1;
            if v20 ~= -1 and v19 < v20 then
                local v21 = l_AppStorageService_0:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true";
                return v4.resolve(v21);
            end;
        end;
        return v10(v16):andThen(function(v22) --[[ Line: 75 ]]
            -- upvalues: v5 (ref), v19 (copy), l_AppStorageService_0 (ref), v4 (ref)
            local l_unifiedPurchaseFlowMetadata_0 = v22.unifiedPurchaseFlowMetadata;
            local l_isUserEligibleForUnifiedPurchaseFlow_0 = l_unifiedPurchaseFlowMetadata_0.isUserEligibleForUnifiedPurchaseFlow;
            local v25 = l_unifiedPurchaseFlowMetadata_0.expiresInSeconds or 0;
            if v5 then
                local v26 = v19 + v25;
                if l_isUserEligibleForUnifiedPurchaseFlow_0 then
                    l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "true");
                else
                    l_AppStorageService_0:SetItem("UnifiedPurchaseFlowIsUserEligible", "false");
                end;
                l_AppStorageService_0:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(v26)));
                l_AppStorageService_0:Flush();
            end;
            return v4.resolve(l_isUserEligibleForUnifiedPurchaseFlow_0);
        end):catch(function(_) --[[ Line: 86 ]]
            -- upvalues: v4 (ref)
            return v4.resolve(false);
        end);
    end;
end;