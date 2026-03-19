local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_RobuxUpsellFlow_0 = v4.PurchaseFlow.RobuxUpsellFlow;
local l_RobuxUpsellFlowState_0 = v4.PurchaseFlow.RobuxUpsellFlowState;
local l_U13ConfirmType_0 = v4.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = v4.PurchaseFlow.PurchaseErrorType;
local v9 = require(l_Modules_0.LuaApp.Components.BuyRobux.Enum.VPCModalType);
local v10 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepSpendFrictionRequests);
local v11 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v12 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v13 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v14 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local v15 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v16 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v17 = require(script.Parent.Enum.RobuxUpsellCounter);
local v18 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v19 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local l_CheckUserPurchaseSettingsFailureReason_0 = v4.Enums.CheckUserPurchaseSettingsFailureReason;
local l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 = v4.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType;
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v26 = v2.PureComponent:extend(script.Name);
local l_PreparePaymentCheck_0 = v4.PreparePaymentCheck;
local l_GetEnableConsolePreparePaymentCheck_0 = v4.GetEnableConsolePreparePaymentCheck;
local l_UpsellSuggestionsAPIMaxPackages_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UpsellSuggestionsAPIMaxPackages;
local l_EconomicRestrictionsViolationType_0 = v4.Enums.EconomicRestrictionsViolationType;
v26.init = function(v31) --[[ Line: 117 ]] --[[ Name: init ]]
    -- upvalues: l_PurchaseErrorType_0 (copy), v16 (copy), l_U13ConfirmType_0 (copy), v9 (copy), v17 (copy), l_GetEnableConsolePreparePaymentCheck_0 (copy), l_PreparePaymentCheck_0 (copy), v3 (copy), v19 (copy), v18 (copy)
    v31.state = {
        errorType = l_PurchaseErrorType_0.None, 
        robuxSuggestions = nil, 
        robuxPackageSelection = nil, 
        virtualItemBadgeType = nil, 
        robuxProduct = nil, 
        robuxProductFetchingStatus = v16.NotStarted, 
        purchaseWarningType = l_U13ConfirmType_0.None, 
        purchaseWarningFetchingStatus = v16.NotStarted, 
        purchaseWarningPostStatus = v16.NotStarted, 
        purchaseVPCErrorType = v9.toRawValue(v9.None), 
        purchaseVPCErrorFetchingStatus = v16.NotStarted, 
        twoStepRequired = false, 
        itemPurchaseFetchingStatus = v16.NotStarted
    };
    v31.getSelectedRobuxProduct = function() --[[ Line: 138 ]]
        -- upvalues: v31 (copy)
        if v31.state.robuxSuggestions ~= nil and v31.state.robuxPackageSelection ~= nil then
            return v31.state.robuxSuggestions[v31.state.robuxPackageSelection];
        else
            return nil;
        end;
    end;
    v31.failFlow = function(v32, v33, v34) --[[ Line: 146 ]]
        -- upvalues: v31 (copy), v17 (ref), l_PurchaseErrorType_0 (ref)
        if v34 ~= nil then
            v31.sendCounter(v34);
        else
            v31.sendCounter(v17.UpsellFailed);
        end;
        local v35 = {};
        if v33 ~= nil then
            v35 = v33;
        end;
        if v32 ~= nil then
            v35.errorType = v32;
        else
            v35.errorType = l_PurchaseErrorType_0.Unknown;
        end;
        v31:setState(v35);
    end;
    v31.getRobuxUpsellProduct = function() --[[ Line: 166 ]]
        -- upvalues: v31 (copy), v16 (ref)
        task.spawn(function() --[[ Line: 169 ]]
            -- upvalues: v31 (ref), v16 (ref)
            v31:setState({
                robuxProductFetchingStatus = v16.Fetching
            });
            v31:dispatchFetchRobuxProduct():andThen(function() --[[ Line: 171 ]]
                -- upvalues: v31 (ref), v16 (ref)
                v31:setState({
                    robuxProductFetchingStatus = v16.Done
                });
            end, function() --[[ Line: 173 ]]
                -- upvalues: v31 (ref), v16 (ref)
                v31:setState({
                    robuxProductFetchingStatus = v16.Done
                });
            end);
        end);
    end;
    v31.attemptRobuxUpsell = function() --[[ Line: 179 ]]
        -- upvalues: l_GetEnableConsolePreparePaymentCheck_0 (ref), v31 (copy), l_PreparePaymentCheck_0 (ref), v16 (ref), v3 (ref)
        if l_GetEnableConsolePreparePaymentCheck_0() then
            local v36 = v31.getSelectedRobuxProduct();
            if not l_PreparePaymentCheck_0(v36.providerId) then
                v31.failFlow();
                return;
            end;
        end;
        v31:setState({
            purchaseVPCErrorFetchingStatus = v16.Fetching
        });
        v31:dispatchCheckUserPurchaseSettings():andThen(function(v37) --[[ Line: 188 ]]
            -- upvalues: v31 (ref), v16 (ref), v3 (ref)
            v31:setState({
                purchaseVPCErrorFetchingStatus = v16.Done
            });
            if not v37 then
                return v3.resolve();
            else
                v31:setState({
                    purchaseWarningFetchingStatus = v16.Fetching
                });
                v31:dispatchFetchPurchaseWarning():andThen(function(v38) --[[ Line: 196 ]]
                    -- upvalues: v31 (ref), v16 (ref)
                    v31:setState({
                        purchaseWarningFetchingStatus = v16.Done
                    });
                    if not v38 then
                        v31:promptRobuxPurchase();
                    end;
                end):catch(function() --[[ Line: 204 ]]
                    -- upvalues: v31 (ref), v16 (ref)
                    v31.failFlow(nil, {
                        purchaseWarningFetchingStatus = v16.Failed
                    });
                end);
                return;
            end;
        end);
    end;
    v31.acceptPurchaseWarning = function() --[[ Line: 210 ]]
        -- upvalues: v31 (copy), v16 (ref)
        v31:setState({
            purchaseWarningPostStatus = v16.Done
        });
        v31:dispatchPostAckPurchaseWarning();
        v31:promptRobuxPurchase();
    end;
    v31.attemptPurchaseItem = function() --[[ Line: 217 ]]
        -- upvalues: v31 (copy), v16 (ref), v17 (ref)
        v31:setState({
            itemPurchaseFetchingStatus = v16.Fetching
        });
        v31:purchaseItem():andThen(function(v39) --[[ Line: 219 ]]
            -- upvalues: v31 (ref), v16 (ref)
            if v39 then
                v31:setState({
                    itemPurchaseFetchingStatus = v16.Done
                });
            end;
        end, function() --[[ Line: 223 ]]
            -- upvalues: v31 (ref), v16 (ref), v17 (ref)
            v31.failFlow(nil, {
                itemPurchaseFetchingStatus = v16.Failed
            }, v17.UpsellFailedTwoStep);
        end);
    end;
    v31.showTwoStepRequiredPrompt = function() --[[ Line: 232 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            twoStepRequired = true
        });
    end;
    v31.openSecuritySettings = function() --[[ Line: 236 ]]
        -- upvalues: v31 (copy)
        v31.props.openSecuritySettings();
    end;
    v31.openBuyRobux = function() --[[ Line: 240 ]]
        -- upvalues: v31 (copy)
        v31.props.openBuyRobux();
    end;
    v31.cancelPurchase = function() --[[ Line: 244 ]]
        -- upvalues: v31 (copy), v17 (ref)
        v31.sendCounter(v17.UpsellCancelled);
        v31.props.endPurchase();
    end;
    v31.sendErrorEvent = function(v40) --[[ Line: 249 ]]
        -- upvalues: v31 (copy)
        v31.props.sendAnalyticEvent(v31.props.eventPrefix .. "RobuxUpsell", "RobuxUpsellError", v40);
    end;
    v31.sendAnalyticEvent = function(v41, v42) --[[ Line: 253 ]]
        -- upvalues: v31 (copy)
        v31.props.sendAnalyticEvent(v31.props.eventPrefix .. "RobuxUpsell", v41, v42);
    end;
    v31.sendCounter = function(v43) --[[ Line: 257 ]]
        -- upvalues: v17 (ref), v31 (copy)
        local v44 = v17.toRawValue(v43);
        v31.props.sendCounter(v44);
        local v45 = v31.getSelectedRobuxProduct();
        if v45 ~= nil and v45.robuxAmount ~= nil then
            v31.props.sendCounter(v44 .. tostring(v45.robuxAmount));
        end;
    end;
    v31.isSettingsSupportedForPlatform = function() --[[ Line: 266 ]]
        -- upvalues: v19 (ref), v18 (ref)
        local v46 = v19();
        local v47 = true;
        if v46 ~= v18.Google then
            v47 = true;
            if v46 ~= v18.Apple then
                v47 = true;
                if v46 ~= v18.UWP then
                    v47 = v46 == v18.Amazon;
                end;
            end;
        end;
        return v47;
    end;
end;
v26.dispatchFetchRobuxProduct = function(v48) --[[ Line: 276 ]] --[[ Name: dispatchFetchRobuxProduct ]]
    -- upvalues: v3 (copy)
    local v49, v50 = v48.props.fetchUpsellSuggestions();
    if v49 and v50 ~= nil then
        v48:setState({
            robuxSuggestions = v50.products, 
            robuxPackageSelection = 1, 
            virtualItemBadgeType = v50.virtualItemBadgeType
        });
        return v3.resolve();
    else
        return v3.reject();
    end;
end;
v26.dispatchFetchPurchaseWarning = function(v51) --[[ Line: 289 ]] --[[ Name: dispatchFetchPurchaseWarning ]]
    -- upvalues: v11 (copy), v17 (copy), l_U13ConfirmType_0 (copy), v3 (copy)
    local l_props_0 = v51.props;
    local v53 = v51.getSelectedRobuxProduct();
    if v53 ~= nil then
        return l_props_0.dispatchFetchIAPPurchaseWarning(v53.providerId, v53.productId):andThen(function(v54) --[[ Line: 297 ]]
            -- upvalues: v11 (ref), v51 (copy), v17 (ref), l_U13ConfirmType_0 (ref), v3 (ref)
            local v55 = true;
            if v54 == v11.ResponseType.U13PaymentModal then
                v51.sendCounter(v17.ShowU13PaymentModal);
                v51:setState({
                    purchaseWarningType = l_U13ConfirmType_0.U13PaymentModal
                });
            elseif v54 == v11.ResponseType.U13MonthlyThreshold1Modal then
                v51.sendCounter(v17.ShowU13MonthlyThreshold1Modal);
                v51:setState({
                    purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold1Modal
                });
            elseif v54 == v11.ResponseType.U13MonthlyThreshold2Modal then
                v51.sendCounter(v17.ShownU13MonthlyThreshold2Modal);
                v51:setState({
                    purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold2Modal
                });
            elseif v54 == v11.ResponseType.ParentalConsentWarningPaymentModal13To17 then
                v51.sendCounter(v17.ShownParentalConsentWarningPaymentModal13To17);
                v51:setState({
                    purchaseWarningType = l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17
                });
            else
                v55 = false;
            end;
            return v3.resolve(v55);
        end);
    else
        return;
    end;
end;
v26.dispatchPostAckPurchaseWarning = function(v56) --[[ Line: 319 ]] --[[ Name: dispatchPostAckPurchaseWarning ]]
    -- upvalues: v12 (copy), l_U13ConfirmType_0 (copy), v17 (copy)
    local l_props_1 = v56.props;
    local l_state_0 = v56.state;
    local l_None_0 = v12.UserActionType.None;
    if l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13PaymentModal then
        v56.sendCounter(v17.ConfirmU13PaymentModal);
        l_None_0 = v12.UserActionType.ConfirmedU13PaymentModal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold1Modal then
        v56.sendCounter(v17.ConfirmU13MonthlyThreshold1Modal);
        l_None_0 = v12.UserActionType.ConfirmedU13MonthlyThreshold1Modal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold2Modal then
        v56.sendCounter(v17.ConfirmU13MonthlyThreshold2Modal);
        l_None_0 = v12.UserActionType.ConfirmedU13MonthlyThreshold2Modal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17 then
        v56.sendCounter(v17.ConfirmParentalConsentWarningPaymentModal13To17);
        l_None_0 = v12.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17;
    end;
    return l_props_1.dispatchPostAckPurchaseWarning(l_None_0);
end;
v26.dispatchCheckUserPurchaseSettings = function(v60) --[[ Line: 342 ]] --[[ Name: dispatchCheckUserPurchaseSettings ]]
    -- upvalues: v19 (copy), v18 (copy), v3 (copy), l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (copy), l_EconomicRestrictionsViolationType_0 (copy), l_CheckUserPurchaseSettingsFailureReason_0 (copy), v17 (copy), v9 (copy), l_PurchaseErrorType_0 (copy), v16 (copy)
    local l_props_2 = v60.props;
    if v19() == v18.Web then
        return v3.resolve(true);
    else
        return l_props_2.dispatchCheckUserPurchaseSettings():andThen(function(v62) --[[ Line: 351 ]]
            -- upvalues: l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (ref), l_EconomicRestrictionsViolationType_0 (ref), v3 (ref), l_CheckUserPurchaseSettingsFailureReason_0 (ref), v60 (copy), v17 (ref), v9 (ref), l_PurchaseErrorType_0 (ref)
            if v62 == nil then
                error("Result from check-user-purchase-settings is nil");
            end;
            local v63 = l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0(v62.failureReason);
            local v64 = v63 ~= l_EconomicRestrictionsViolationType_0.None and v62.expirationTimeInMinutes ~= nil;
            local v65 = true;
            if v62.isEligible ~= nil then
                v65 = v62.failureReason == nil;
            end;
            if v65 and not v64 then
                error("Invalid response from check-user-purchase-settings");
            end;
            if v62.isEligible then
                return v3.resolve(true);
            elseif v62.failureReason == l_CheckUserPurchaseSettingsFailureReason_0.PurchaseNotEnabled then
                v60.sendCounter(v17.ShowPurchaseNotEnabledModal);
                v60:setState({
                    purchaseVPCErrorType = v9.toRawValue(v9.EnablePurchase)
                });
                return v3.resolve(false);
            elseif v64 then
                v60.sendCounter(v17.ShowEconomicRestrictionModal);
                v60:setState({
                    errorType = l_PurchaseErrorType_0.EconomicRestriction, 
                    economicRestrictionError = {
                        timeoutMinutes = v62.expirationTimeInMinutes, 
                        violationType = v63
                    }
                });
                return v3.resolve(false);
            else
                error("User is not eligible for purchases with unknown failure reason");
                return;
            end;
        end):catch(function(_) --[[ Line: 392 ]]
            -- upvalues: v60 (copy), v16 (ref), v3 (ref)
            v60.failFlow(nil, {
                purchaseWarningFetchingStatus = v16.Failed
            });
            return v3.resolve(false);
        end);
    end;
end;
v26.promptRobuxPurchase = function(v67) --[[ Line: 398 ]] --[[ Name: promptRobuxPurchase ]]
    local l_props_3 = v67.props;
    local v69 = v67.getSelectedRobuxProduct();
    if v69 ~= nil then
        if l_props_3.analyticId then
            l_props_3.promptRobux(v67.props.networking, v69.providerId, v69.productId, l_props_3.analyticId);
            return;
        else
            l_props_3.promptRobux(v67.props.networking, v69.providerId, v69.productId);
        end;
    end;
end;
v26.purchaseItem = function(v70) --[[ Line: 412 ]] --[[ Name: purchaseItem ]]
    -- upvalues: v17 (copy), v3 (copy)
    return v70.props.purchaseItem():andThen(function(v71) --[[ Line: 415 ]]
        -- upvalues: v70 (copy), v17 (ref), v3 (ref)
        local l_purchased_0 = v71.purchased;
        local l_is2SVEnabled_0 = v71.is2SVEnabled;
        local l_challengeToken_0 = v71.challengeToken;
        if l_purchased_0 then
            v70.sendCounter(v17.UpsellSuccess);
            return v3.resolve(true);
        elseif l_is2SVEnabled_0 == false then
            v70.sendCounter(v17.ShownEnableTwoStepAuth);
            v70.showTwoStepRequiredPrompt();
            return v3.resolve(true);
        elseif l_challengeToken_0 then
            v70.sendCounter(v17.ShownTwoStepAuth);
            v70:renderTwoStepChallenge(l_challengeToken_0);
            return v3.resolve(false);
        else
            v70.sendCounter(v17.FailedShowTwoStepAuth);
            return v3.reject();
        end;
    end, function() --[[ Line: 435 ]]
        -- upvalues: v70 (copy), v17 (ref), v3 (ref)
        v70.sendCounter(v17.FailedShowTwoStepAuthUnknown);
        return v3.reject();
    end);
end;
v26.renderTwoStepChallenge = function(v75, v76) --[[ Line: 441 ]] --[[ Name: renderTwoStepChallenge ]]
    -- upvalues: v22 (copy), v23 (copy), v13 (copy), v14 (copy), v17 (copy), v10 (copy)
    local l_props_4 = v75.props;
    local l_networking_0 = l_props_4.networking;
    local l_userId_0 = l_props_4.userId;
    if v22() then
        wait(v23());
    end;
    l_props_4.renderChallenge({
        challengeType = v13.TwoStepVerification, 
        challengeParameters = {
            actionType = v14.RobuxSpend, 
            challengeId = v76, 
            userId = l_userId_0, 
            onChallengeCompleted = function(v80) --[[ Line: 457 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v75 (copy), v17 (ref), v10 (ref), l_networking_0 (copy), v76 (copy)
                v75.sendCounter(v17.CompletedTwoStepAuth);
                local l_verificationToken_0 = v80.verificationToken;
                return v10.redeem(l_networking_0, tostring(v76), l_verificationToken_0):andThen(function(_) --[[ Line: 461 ]]
                    -- upvalues: v75 (ref)
                    v75.attemptPurchaseItem();
                end, function(_) --[[ Line: 463 ]]
                    -- upvalues: v75 (ref)
                    v75.failFlow();
                end);
            end, 
            onChallengeInvalidated = function(_) --[[ Line: 467 ]] --[[ Name: onChallengeInvalidated ]]
                -- upvalues: v75 (copy), v17 (ref)
                v75.sendCounter(v17.InvalidatedTwoStepAuth);
                v75.failFlow();
            end
        }, 
        onChallengeAbandoned = function() --[[ Line: 472 ]] --[[ Name: onChallengeAbandoned ]]
            -- upvalues: v75 (copy), v17 (ref)
            v75.sendCounter(v17.AbandonedTwoStepAuth);
            v75.failFlow();
        end, 
        onChallengeLoadFailed = function() --[[ Line: 476 ]] --[[ Name: onChallengeLoadFailed ]]
            -- upvalues: v75 (copy), v17 (ref)
            v75.sendCounter(v17.LoadFailedTwoStepAuth);
            v75.failFlow();
        end, 
        forceWebViewVisible = true
    }, false);
end;
v26.didMount = function(v85) --[[ Line: 486 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy), v17 (copy)
    if v85.state.robuxProductFetchingStatus == v16.NotStarted then
        v85.sendCounter(v17.UpsellShown);
        v85.getRobuxUpsellProduct();
    end;
end;
v26.didUpdate = function(v86, v87, v88) --[[ Line: 493 ]] --[[ Name: didUpdate ]]
    -- upvalues: v16 (copy), v17 (copy), v15 (copy)
    local l_state_1 = v86.state;
    local l_props_5 = v86.props;
    if v88.robuxProductFetchingStatus ~= l_state_1.robuxProductFetchingStatus and l_state_1.robuxProductFetchingStatus == v16.Done then
        if v86.getSelectedRobuxProduct() ~= nil then
            v86.sendCounter(v17.UpsellModalShown);
        else
            v86.sendCounter(v17.UpsellGenericModalShown);
        end;
    end;
    if l_props_5.iapPurchase ~= v87.iapPurchase then
        if l_props_5.iapPurchase.purchaseStatus == v15.Success and l_state_1.itemPurchaseFetchingStatus == v16.NotStarted then
            v86.attemptPurchaseItem();
        end;
        if v87.iapPurchase.purchaseStatus ~= l_props_5.iapPurchase.purchaseStatus and l_props_5.iapPurchase.purchaseStatus == v15.Failed then
            v86.sendCounter(v17.UpsellFailedNativePurchase);
        end;
    end;
end;
v26.getFlowState = function(v91) --[[ Line: 527 ]] --[[ Name: getFlowState ]]
    -- upvalues: v9 (copy), l_RobuxUpsellFlowState_0 (copy), l_PurchaseErrorType_0 (copy), v16 (copy), l_U13ConfirmType_0 (copy), v15 (copy)
    local l_state_2 = v91.state;
    local l_props_6 = v91.props;
    if l_state_2.purchaseVPCErrorType ~= nil and l_state_2.purchaseVPCErrorType ~= v9.toRawValue(v9.None) then
        return l_RobuxUpsellFlowState_0.PurchaseVPCModal;
    elseif l_state_2.errorType ~= l_PurchaseErrorType_0.None then
        return l_RobuxUpsellFlowState_0.Error;
    elseif l_state_2.robuxProductFetchingStatus ~= v16.Done then
        return l_RobuxUpsellFlowState_0.Loading;
    elseif l_state_2.purchaseWarningFetchingStatus == v16.NotStarted and l_state_2.purchaseVPCErrorFetchingStatus == v16.NotStarted then
        if v91.getSelectedRobuxProduct() ~= nil then
            return l_RobuxUpsellFlowState_0.PurchaseModal;
        else
            return l_RobuxUpsellFlowState_0.GenericPurchaseModal;
        end;
    elseif l_state_2.purchaseWarningFetchingStatus ~= v16.Done and l_state_2.purchaseVPCErrorFetchingStatus ~= v16.Done then
        return l_RobuxUpsellFlowState_0.Loading;
    elseif l_state_2.purchaseWarningType ~= l_U13ConfirmType_0.None and l_state_2.purchaseWarningPostStatus == v16.NotStarted then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_props_6.iapPurchase.nativeProductId == nil or l_props_6.iapPurchase.purchaseStatus == v15.Pending then
        return l_RobuxUpsellFlowState_0.RobuxPurchasePending;
    elseif l_props_6.iapPurchase.purchaseStatus == v15.Polling then
        return l_RobuxUpsellFlowState_0.RobuxGrantPending;
    elseif l_props_6.iapPurchase.purchaseStatus == v15.Failed then
        return l_RobuxUpsellFlowState_0.Error;
    elseif l_state_2.itemPurchaseFetchingStatus == v16.NotStarted or l_state_2.itemPurchaseFetchingStatus == v16.Fetching then
        return l_RobuxUpsellFlowState_0.ItemPurchasePending;
    elseif l_state_2.twoStepRequired then
        return l_RobuxUpsellFlowState_0.TwoStepRequired;
    elseif l_state_2.itemPurchaseFetchingStatus == v16.Done then
        return l_RobuxUpsellFlowState_0.Success;
    else
        return l_RobuxUpsellFlowState_0.Error;
    end;
end;
v26.getErrorType = function(v94) --[[ Line: 611 ]] --[[ Name: getErrorType ]]
    -- upvalues: v15 (copy), l_PurchaseErrorType_0 (copy)
    local l_state_3 = v94.state;
    local l_props_7 = v94.props;
    if l_props_7.iapPurchase and l_props_7.iapPurchase.purchaseStatus == v15.Failed then
        return l_PurchaseErrorType_0.FailedGrantUnknown;
    else
        return l_state_3.errorType;
    end;
end;
v26.render = function(v97) --[[ Line: 622 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_RobuxUpsellFlow_0 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy)
    local l_props_8 = v97.props;
    local l_state_4 = v97.state;
    local v100 = v97.getSelectedRobuxProduct();
    local v101 = v97:getFlowState();
    return v2.createElement(l_RobuxUpsellFlow_0, {
        screenSize = l_props_8.screenSize, 
        itemProductId = l_props_8.itemProductId, 
        itemIcon = l_props_8.itemIcon, 
        itemName = l_props_8.itemName, 
        itemRobuxCost = l_props_8.priceInRobux, 
        iapRobuxAmount = v100 and v100.robuxAmount or nil, 
        iapRobuxAmountBeforeBonus = if v100 then v100.robuxAmountBeforeBonus else nil, 
        iapCostStr = if v100 then v100.price else nil, 
        beforeRobuxBalance = l_props_8.beforeRobuxBalance, 
        useUpsellSuggestions = l_UpsellSuggestionsAPIMaxPackages_0 > 1, 
        upsellSuggestions = l_state_4.robuxSuggestions, 
        selectedUpsellIndex = l_state_4.robuxPackageSelection, 
        virtualItemBadgeType = l_state_4.virtualItemBadgeType, 
        onUpsellSuggestionsSelected = function(v102) --[[ Line: 647 ]] --[[ Name: onUpsellSuggestionsSelected ]]
            -- upvalues: v97 (copy)
            v97:setState({
                robuxPackageSelection = v102
            });
        end, 
        purchaseState = v101, 
        errorType = v97:getErrorType(), 
        economicRestrictionError = l_state_4.economicRestrictionError, 
        u13ConfirmType = l_state_4.purchaseWarningType, 
        purchaseVPCType = l_state_4.purchaseVPCErrorType, 
        acceptControllerIcon = nil, 
        cancelControllerIcon = nil, 
        purchaseRobux = v97.attemptRobuxUpsell, 
        acceptPurchaseWarning = v97.acceptPurchaseWarning, 
        cancelPurchase = v97.cancelPurchase, 
        openSecuritySettings = v97.openSecuritySettings, 
        openBuyRobux = v97.openBuyRobux, 
        showTermsOfUse = v97.props.openTermsOfUse, 
        equipItem = l_props_8.equipItem, 
        flowComplete = l_props_8.endPurchase, 
        openSettingsPage = if v97.isSettingsSupportedForPlatform() then l_props_8.openSettingsPage else nil, 
        onAnalyticEvent = v97.sendAnalyticEvent, 
        eventPrefix = l_props_8.eventPrefix, 
        analyticId = l_props_8.analyticId, 
        dispatchCentralOverlay = l_props_8.dispatchCentralOverlay, 
        isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
    });
end;
return v26;