local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Thunk);
local v3 = require(l_script_FirstAncestor_0.Services.Network);
local v4 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v5 = require(l_script_FirstAncestor_0.Services.Analytics);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v7 = require(l_script_FirstAncestor_0.Enums.PaymentPlatform);
local v8 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v9 = require(l_script_FirstAncestor_0.Thunks.launchPremiumUpsell);
local v10 = require(l_script_FirstAncestor_0.Network.checkUserPurchaseSettings);
local v11 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local v12 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v13 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v14 = require(l_Parent_0.IAPExperience);
local v15 = require(l_script_FirstAncestor_0.Actions.SetEconomicRestrictionError);
local l_EconomicRestrictionsViolationType_0 = v14.Enums.EconomicRestrictionsViolationType;
local l_CheckUserPurchaseSettingsFailureReason_0 = v14.Enums.CheckUserPurchaseSettingsFailureReason;
local l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 = v14.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType;
local v19 = {
    v5, 
    v3, 
    v4
};
local function v26(v20, v21, v22) --[[ Line: 35 ]] --[[ Name: handleCheckUserSettingsResult ]]
    -- upvalues: v12 (copy), v13 (copy), l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (copy), l_EconomicRestrictionsViolationType_0 (copy), v9 (copy), l_CheckUserPurchaseSettingsFailureReason_0 (copy), v8 (copy), v6 (copy), v15 (copy)
    if v20 == nil then
        return v21:dispatch(v12(v13.UnknownFailure));
    else
        local v23 = l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0(v20.failureReason);
        local v24 = false;
        if v23 ~= l_EconomicRestrictionsViolationType_0.None then
            v24 = v20.expirationTimeInMinutes ~= nil;
        end;
        local v25 = true;
        if v20.isEligible ~= nil then
            v25 = v20.failureReason == nil;
        end;
        if v25 and not v24 then
            return v21:dispatch(v12(v13.UnknownFailure));
        elseif v20.isEligible == true then
            return v21:dispatch(v9());
        elseif v20.failureReason == l_CheckUserPurchaseSettingsFailureReason_0.PurchaseNotEnabled then
            v22.signalUserSettingEligibilityModal(l_CheckUserPurchaseSettingsFailureReason_0.PurchaseNotEnabled);
            return v21:dispatch(v8(v6.EnablePurchaseVPCModal));
        elseif v20.failureReason == l_CheckUserPurchaseSettingsFailureReason_0.SpendLimitExceeded then
            return v21:dispatch(v9());
        elseif v24 then
            v22.signalEconomicRestrictionError(v23, v20.expirationTimeInMinutes);
            v21:dispatch(v15(v23, v20.expirationTimeInMinutes));
            return v21:dispatch(v12(v13.EconomicRestriction));
        else
            return v21:dispatch(v12(v13.UnknownFailure));
        end;
    end;
end;
return function() --[[ Line: 72 ]] --[[ Name: initiatePremiumPrecheck ]]
    -- upvalues: v2 (copy), v19 (copy), v3 (copy), v5 (copy), v4 (copy), v9 (copy), v11 (copy), v7 (copy), v10 (copy), v26 (copy), v12 (copy), v13 (copy)
    return v2.new(script.Name, v19, function(v27, v28) --[[ Line: 73 ]]
        -- upvalues: v3 (ref), v5 (ref), v4 (ref), v9 (ref), v11 (ref), v7 (ref), v10 (ref), v26 (ref), v12 (ref), v13 (ref)
        local v29 = v28[v3];
        local v30 = v28[v5];
        local v31 = v28[v4];
        if v31.isStudio() then
            return v27:dispatch(v9());
        elseif v11(v31.getPlatform()) == v7.Web then
            return v27:dispatch(v9());
        else
            return v10(v29):andThen(function(v32) --[[ Line: 90 ]]
                -- upvalues: v26 (ref), v27 (copy), v30 (copy)
                return v26(v32, v27, v30);
            end):catch(function(_) --[[ Line: 93 ]]
                -- upvalues: v27 (copy), v12 (ref), v13 (ref)
                return v27:dispatch(v12(v13.UnknownFailure));
            end);
        end;
    end);
end;