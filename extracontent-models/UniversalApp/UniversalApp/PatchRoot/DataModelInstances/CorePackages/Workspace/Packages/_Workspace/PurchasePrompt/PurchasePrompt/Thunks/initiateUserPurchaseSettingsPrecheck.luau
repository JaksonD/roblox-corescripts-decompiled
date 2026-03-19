local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.UpsellFlow);
local v3 = require(l_script_FirstAncestor_0.Services.Network);
local v4 = require(l_script_FirstAncestor_0.Network.checkUserPurchaseSettings);
local v5 = require(l_script_FirstAncestor_0.NativeUpsell.getUpsellFlow);
local v6 = require(l_script_FirstAncestor_0.Services.Analytics);
local v7 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v8 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v9 = require(l_script_FirstAncestor_0.Actions.SetEconomicRestrictionError);
local v10 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v11 = require(l_script_FirstAncestor_0.Thunk);
local v12 = require(l_script_FirstAncestor_0.Thunks.initiatePurchasePrecheck);
local v13 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v14 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v15 = require(l_Parent_0.IAPExperience);
local l_CheckUserPurchaseSettingsFailureReason_0 = v15.Enums.CheckUserPurchaseSettingsFailureReason;
local l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 = v15.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType;
local l_EconomicRestrictionsViolationType_0 = v15.Enums.EconomicRestrictionsViolationType;
local v19 = {
    v6, 
    v3, 
    v7
};
local function _(v20) --[[ Line: 32 ]] --[[ Name: validateResult ]]
    -- upvalues: l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (copy), l_EconomicRestrictionsViolationType_0 (copy)
    if v20 == nil then
        return false;
    else
        local v21 = true;
        if v20.isEligible ~= nil then
            v21 = v20.failureReason == nil;
        end;
        local v22 = l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0(v20.failureReason);
        local v23 = false;
        if v22 ~= l_EconomicRestrictionsViolationType_0.None then
            v23 = v20.expirationTimeInMinutes ~= nil;
        end;
        if v21 and not v23 then
            return false;
        else
            return true;
        end;
    end;
end;
return function() --[[ Line: 55 ]] --[[ Name: initiateUserPurchaseSettingsPrecheck ]]
    -- upvalues: v11 (copy), v19 (copy), v3 (copy), v6 (copy), v7 (copy), v12 (copy), v5 (copy), v2 (copy), v4 (copy), l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (copy), l_EconomicRestrictionsViolationType_0 (copy), v8 (copy), v10 (copy), l_CheckUserPurchaseSettingsFailureReason_0 (copy), v13 (copy), v14 (copy), v9 (copy)
    return v11.new(script.Name, v19, function(v25, v26) --[[ Line: 56 ]]
        -- upvalues: v3 (ref), v6 (ref), v7 (ref), v12 (ref), v5 (ref), v2 (ref), v4 (ref), l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (ref), l_EconomicRestrictionsViolationType_0 (ref), v8 (ref), v10 (ref), l_CheckUserPurchaseSettingsFailureReason_0 (ref), v13 (ref), v14 (ref), v9 (ref)
        local v27 = v26[v3];
        local v28 = v26[v6];
        local v29 = v26[v7];
        if v29.isStudio() then
            return v25:dispatch(v12());
        elseif v5(v29.getPlatform()) == v2.Web then
            return v25:dispatch(v12());
        else
            return v4(v27):andThen(function(v30) --[[ Line: 75 ]]
                -- upvalues: l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (ref), l_EconomicRestrictionsViolationType_0 (ref), v25 (copy), v8 (ref), v10 (ref), v12 (ref), l_CheckUserPurchaseSettingsFailureReason_0 (ref), v28 (copy), v13 (ref), v14 (ref), v9 (ref)
                local v31;
                if v30 == nil then
                    v31 = false;
                else
                    local v32 = true;
                    if v30.isEligible ~= nil then
                        v32 = v30.failureReason == nil;
                    end;
                    local v33 = l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0(v30.failureReason);
                    local v34 = false;
                    if v33 ~= l_EconomicRestrictionsViolationType_0.None then
                        v34 = v30.expirationTimeInMinutes ~= nil;
                    end;
                    v31 = not v32 or v34 and true or false;
                end;
                if v31 == false then
                    return v25:dispatch(v8(v10.UnknownFailure));
                elseif v30.isEligible == true then
                    return v25:dispatch(v12());
                else
                    v31 = l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0(v30.failureReason);
                    local v35 = v31 ~= l_EconomicRestrictionsViolationType_0.None;
                    if v30.failureReason == l_CheckUserPurchaseSettingsFailureReason_0.PurchaseNotEnabled then
                        v28.signalUserSettingEligibilityModal("PurchaseNotEnabled");
                        return v25:dispatch(v13(v14.EnablePurchaseVPCModal));
                    elseif v30.failureReason == l_CheckUserPurchaseSettingsFailureReason_0.SpendLimitExceeded then
                        return v25:dispatch(v12());
                    elseif v35 and v30.expirationTimeInMinutes ~= nil then
                        v28.signalEconomicRestrictionError(v31, v30.expirationTimeInMinutes);
                        v25:dispatch(v9(v31, v30.expirationTimeInMinutes));
                        return v25:dispatch(v8(v10.EconomicRestriction));
                    else
                        return v25:dispatch(v8(v10.UnknownFailure));
                    end;
                end;
            end):catch(function(_) --[[ Line: 116 ]]
                -- upvalues: v25 (copy), v8 (ref), v10 (ref)
                return v25:dispatch(v8(v10.UnknownFailure));
            end);
        end;
    end);
end;