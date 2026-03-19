local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v7 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_BuyRobuxFlow_0 = v7.PurchaseFlow.BuyRobuxFlow;
local l_BuyRobuxFlowState_0 = v7.PurchaseFlow.BuyRobuxFlowState;
local l_U13ConfirmType_0 = v7.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = v7.PurchaseFlow.PurchaseErrorType;
local l_CheckUserPurchaseSettingsFailureReason_0 = v7.Enums.CheckUserPurchaseSettingsFailureReason;
local l_EconomicRestrictionsViolationType_0 = v7.Enums.EconomicRestrictionsViolationType;
local l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 = v7.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType;
local v15 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v16 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local _ = require(script.Parent.RobuxPackage);
local v18 = require(script.Parent.Enum.BuyRobuxCounter);
local v19 = require(script.Parent.Enum.VPCModalType);
local v20 = v3.PureComponent:extend(script.Name);
local v21 = l_GuiService_0:IsTenFootInterface();
local l_PreparePaymentCheck_0 = v7.PreparePaymentCheck;
local l_GetEnableConsolePreparePaymentCheck_0 = v7.GetEnableConsolePreparePaymentCheck;
v20.init = function(v24) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: l_U13ConfirmType_0 (copy), v16 (copy), v19 (copy), l_PurchaseErrorType_0 (copy), v18 (copy), l_GetEnableConsolePreparePaymentCheck_0 (copy), l_PreparePaymentCheck_0 (copy), v4 (copy)
    v24.selectedRobuxPackage = nil;
    v24.resetState = v24.props.resetState or {
        purchaseWarningType = l_U13ConfirmType_0.None, 
        purchaseWarningFetchingStatus = v16.NotStarted, 
        purchaseWarningPostStatus = v16.NotStarted, 
        purchaseVPCErrorType = v19.toRawValue(v19.None), 
        purchaseVPCErrorFetchingStatus = v16.NotStarted, 
        purchasePreCheckStatus = v16.NotStarted, 
        purchaseErrorType = l_PurchaseErrorType_0.FailedRobuxPurchase, 
        economicRestrictionError = nil
    };
    v24.state = {
        purchaseWarningType = v24.resetState.purchaseWarningType, 
        purchaseWarningFetchingStatus = v24.resetState.purchaseWarningFetchingStatus, 
        purchaseWarningPostStatus = v24.resetState.purchaseWarningPostStatus, 
        purchaseVPCErrorType = v24.resetState.purchaseVPCErrorType, 
        purchaseVPCErrorFetchingStatus = v24.resetState.purchaseVPCErrorFetchingStatus, 
        purchasePreCheckStatus = v24.resetState.purchasePreCheckStatus, 
        purchaseErrorType = v24.resetState.purchaseErrorType, 
        economicRestrictionError = v24.resetState.economicRestrictionError
    };
    v24.failFlow = function(_, v26) --[[ Line: 107 ]]
        -- upvalues: v24 (copy), v18 (ref)
        if v26 ~= nil then
            v24.sendCounter(v26);
            return;
        else
            v24.sendCounter(v18.PurchaseFailed);
            return;
        end;
    end;
    v24.purchaseRobux = function(v27) --[[ Line: 115 ]]
        -- upvalues: v24 (copy), l_GetEnableConsolePreparePaymentCheck_0 (ref), l_PreparePaymentCheck_0 (ref), v16 (ref), v4 (ref)
        v24:setState(v24.resetState);
        v24.props.endPurchase();
        if l_GetEnableConsolePreparePaymentCheck_0() and not l_PreparePaymentCheck_0(v27) then
            v24:setState({
                purchasePreCheckStatus = v16.Failed
            }, nil);
            return;
        else
            v24.selectedRobuxPackage = v27;
            v24:setState({
                purchaseVPCErrorFetchingStatus = v16.Fetching
            });
            v24:dispatchCheckUserPurchaseSettings():andThen(function(v28) --[[ Line: 129 ]]
                -- upvalues: v4 (ref), v24 (ref), v16 (ref)
                if not v28 then
                    return v4.resolve();
                else
                    v24:setState({
                        purchaseVPCErrorFetchingStatus = v16.Done
                    });
                    v24:setState({
                        purchaseWarningFetchingStatus = v16.Fetching
                    });
                    v24:dispatchFetchPurchaseWarning():andThen(function(v29) --[[ Line: 136 ]]
                        -- upvalues: v24 (ref), v16 (ref)
                        v24:setState({
                            purchaseWarningFetchingStatus = v16.Done
                        });
                        if not v29 then
                            v24:promptRobuxPurchase();
                        end;
                    end):catch(function() --[[ Line: 144 ]]
                        -- upvalues: v24 (ref), v16 (ref)
                        v24.failFlow({
                            purchaseWarningFetchingStatus = v16.Failed
                        }, nil);
                    end);
                    return;
                end;
            end);
            return;
        end;
    end;
    v24.acceptPurchaseWarning = function() --[[ Line: 150 ]]
        -- upvalues: v24 (copy), v16 (ref)
        v24:setState({
            purchaseWarningPostStatus = v16.Done
        });
        v24:dispatchPostAckPurchaseWarning();
        v24:promptRobuxPurchase();
    end;
    v24.cancelPurchase = function() --[[ Line: 157 ]]
        -- upvalues: v24 (copy), v18 (ref)
        v24.sendCounter(v18.PurchaseCanceled);
        v24.endPurchase();
    end;
    v24.endPurchase = function() --[[ Line: 162 ]]
        -- upvalues: v24 (copy)
        v24.selectedRobuxPackage = nil;
        v24:setState(v24.resetState);
        v24.props.endPurchase();
    end;
    v24.sendAnalyticEvent = function(v30, v31) --[[ Line: 168 ]]
        -- upvalues: v24 (copy)
        v24.props.sendAnalyticEvent(v24.props.eventPrefix .. "BuyRobux", v30, v31);
    end;
    v24.sendCounter = function(v32) --[[ Line: 172 ]]
        -- upvalues: v24 (copy), v18 (ref)
        v24.props.sendCounter(v18.toRawValue(v32));
    end;
    v24.getProductId = function(v33) --[[ Line: 176 ]]
        -- upvalues: v24 (copy)
        for _, v35 in v24.props.robuxPackages do
            if v33 == v35.packageId then
                return v35.productId;
            end;
        end;
        return nil;
    end;
end;
v20.dispatchFetchPurchaseWarning = function(v36) --[[ Line: 186 ]] --[[ Name: dispatchFetchPurchaseWarning ]]
    -- upvalues: v5 (copy), v18 (copy), l_U13ConfirmType_0 (copy), v4 (copy)
    return v36.props.dispatchFetchIAPPurchaseWarning(v36.selectedRobuxPackage, v36.getProductId(v36.selectedRobuxPackage)):andThen(function(v37) --[[ Line: 191 ]]
        -- upvalues: v5 (ref), v36 (copy), v18 (ref), l_U13ConfirmType_0 (ref), v4 (ref)
        local v38 = true;
        if v37 == v5.ResponseType.U13PaymentModal then
            v36.sendCounter(v18.ShowU13PaymentModal);
            v36:setState({
                purchaseWarningType = l_U13ConfirmType_0.U13PaymentModal
            });
        elseif v37 == v5.ResponseType.U13MonthlyThreshold1Modal then
            v36.sendCounter(v18.ShowU13MonthlyThreshold1Modal);
            v36:setState({
                purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold1Modal
            });
        elseif v37 == v5.ResponseType.U13MonthlyThreshold2Modal then
            v36.sendCounter(v18.ShownU13MonthlyThreshold2Modal);
            v36:setState({
                purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold2Modal
            });
        elseif v37 == v5.ResponseType.ParentalConsentWarningPaymentModal13To17 then
            v36.sendCounter(v18.ShownParentalConsentWarningPaymentModal13To17);
            v36:setState({
                purchaseWarningType = l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17
            });
        else
            v38 = false;
        end;
        return v4.resolve(v38);
    end);
end;
v20.dispatchCheckUserPurchaseSettings = function(v39) --[[ Line: 212 ]] --[[ Name: dispatchCheckUserPurchaseSettings ]]
    -- upvalues: l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (copy), l_EconomicRestrictionsViolationType_0 (copy), v4 (copy), l_CheckUserPurchaseSettingsFailureReason_0 (copy), v18 (copy), v19 (copy), l_PurchaseErrorType_0 (copy), v16 (copy)
    return v39.props.dispatchCheckUserPurchaseSettings():andThen(function(v40) --[[ Line: 217 ]]
        -- upvalues: l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0 (ref), l_EconomicRestrictionsViolationType_0 (ref), v4 (ref), l_CheckUserPurchaseSettingsFailureReason_0 (ref), v39 (copy), v18 (ref), v19 (ref), l_PurchaseErrorType_0 (ref)
        if v40 == nil then
            error("Result from check-user-purchase-settings is nil");
        end;
        local v41 = l_mapCheckUserPurchaseSettingsFailureReasonToViolationType_0(v40.failureReason);
        local v42 = true;
        if v40.isEligible ~= nil then
            v42 = v40.failureReason == nil;
        end;
        local v43 = v41 ~= l_EconomicRestrictionsViolationType_0.None and v40.expirationTimeInMinutes ~= nil;
        if v42 and not v43 then
            error("Invalid response from check-user-purchase-settings");
        end;
        if v40.isEligible then
            return v4.resolve(true);
        elseif v40.failureReason == l_CheckUserPurchaseSettingsFailureReason_0.PurchaseNotEnabled then
            v39.sendCounter(v18.ShowPurchaseNotEnabledModal);
            v39:setState({
                purchaseVPCErrorType = v19.toRawValue(v19.EnablePurchase)
            });
            return v4.resolve(false);
        elseif v43 then
            v39.sendCounter(v18.ShowEconomicRestrictionModal);
            v39:setState({
                purchaseErrorType = l_PurchaseErrorType_0.EconomicRestriction, 
                economicRestrictionError = {
                    timeoutMinutes = v40.expirationTimeInMinutes, 
                    violationType = v41
                }
            });
            return v4.resolve(false);
        else
            error("User is not eligible for purchases with unknown failure reason");
            return;
        end;
    end):catch(function(_) --[[ Line: 260 ]]
        -- upvalues: v39 (copy), v16 (ref), v4 (ref)
        v39:setState({
            purchaseVPCErrorFetchingStatus = v16.Failed
        });
        return v4.resolve(false);
    end);
end;
v20.dispatchPostAckPurchaseWarning = function(v45) --[[ Line: 266 ]] --[[ Name: dispatchPostAckPurchaseWarning ]]
    -- upvalues: v6 (copy), l_U13ConfirmType_0 (copy), v18 (copy)
    local l_props_0 = v45.props;
    local l_state_0 = v45.state;
    local l_None_0 = v6.UserActionType.None;
    if l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13PaymentModal then
        v45.sendCounter(v18.ConfirmU13PaymentModal);
        l_None_0 = v6.UserActionType.ConfirmedU13PaymentModal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold1Modal then
        v45.sendCounter(v18.ConfirmU13MonthlyThreshold1Modal);
        l_None_0 = v6.UserActionType.ConfirmedU13MonthlyThreshold1Modal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold2Modal then
        v45.sendCounter(v18.ConfirmU13MonthlyThreshold2Modal);
        l_None_0 = v6.UserActionType.ConfirmedU13MonthlyThreshold2Modal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17 then
        v45.sendCounter(v18.ConfirmParentalConsentWarningPaymentModal13To17);
        l_None_0 = v6.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17;
    end;
    return l_props_0.dispatchPostAckPurchaseWarning(l_None_0);
end;
v20.promptRobuxPurchase = function(v49) --[[ Line: 289 ]] --[[ Name: promptRobuxPurchase ]]
    v49.props.promptRobux(v49.props.networking, v49.selectedRobuxPackage, v49.getProductId(v49.selectedRobuxPackage));
end;
v20.getFlowState = function(v50) --[[ Line: 295 ]] --[[ Name: getFlowState ]]
    -- upvalues: v19 (copy), l_BuyRobuxFlowState_0 (copy), v16 (copy), l_PurchaseErrorType_0 (copy), l_U13ConfirmType_0 (copy), v15 (copy)
    local l_state_1 = v50.state;
    local l_props_1 = v50.props;
    if l_state_1.purchaseVPCErrorType ~= nil and l_state_1.purchaseVPCErrorType ~= v19.toRawValue(v19.None) then
        return l_BuyRobuxFlowState_0.PurchaseVPC;
    elseif l_state_1.purchaseVPCErrorFetchingStatus == v16.Failed then
        return l_BuyRobuxFlowState_0.Error;
    elseif l_state_1.purchaseErrorType == l_PurchaseErrorType_0.EconomicRestriction then
        return l_BuyRobuxFlowState_0.Error;
    elseif l_state_1.purchasePreCheckStatus == v16.Failed then
        return l_BuyRobuxFlowState_0.Error;
    elseif l_props_1.iapProductsFetchingStatus ~= v16.Done then
        return l_BuyRobuxFlowState_0.Loading;
    elseif l_props_1.nativeProductsFetchingStatus ~= v16.Done then
        return l_BuyRobuxFlowState_0.Loading;
    elseif l_state_1.purchaseWarningFetchingStatus == v16.NotStarted or l_state_1.purchaseVPCErrorFetchingStatus == v16.NotStarted then
        return l_BuyRobuxFlowState_0.BuyRobux;
    elseif l_state_1.purchaseWarningFetchingStatus ~= v16.Done and l_state_1.purchaseVPCErrorFetchingStatus ~= v16.Done then
        return l_BuyRobuxFlowState_0.Loading;
    elseif l_state_1.purchaseWarningType ~= l_U13ConfirmType_0.None and l_state_1.purchaseWarningPostStatus == v16.NotStarted then
        return l_BuyRobuxFlowState_0.PurchaseWarning;
    elseif l_props_1.iapPurchase.nativeProductId == nil or l_props_1.iapPurchase.purchaseStatus == v15.Pending then
        return l_BuyRobuxFlowState_0.RobuxPurchasePending;
    elseif l_props_1.iapPurchase.purchaseStatus == v15.Polling then
        return l_BuyRobuxFlowState_0.RobuxGrantPending;
    elseif l_props_1.iapPurchase.purchaseStatus == v15.Failed then
        return l_BuyRobuxFlowState_0.Error;
    elseif l_props_1.iapPurchase.purchaseStatus == v15.Success then
        return l_BuyRobuxFlowState_0.Succeed;
    else
        return l_BuyRobuxFlowState_0.BuyRobux;
    end;
end;
v20.render = function(v53) --[[ Line: 373 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_BuyRobuxFlow_0 (copy), v21 (copy)
    local l_props_2 = v53.props;
    local l_state_2 = v53.state;
    return v3.createElement(l_BuyRobuxFlow_0, {
        screenSize = l_props_2.screenSize, 
        isConsoleSize = v21, 
        showBackground = not v21, 
        showCloseButton = not v21, 
        shouldAnimate = true, 
        analyticId = l_props_2.analyticId, 
        robuxBalance = l_props_2.robuxBalance, 
        robuxPackages = l_props_2.robuxPackages, 
        purchaseState = v53:getFlowState(), 
        purchaseVPCType = l_state_2.purchaseVPCErrorType, 
        errorType = l_state_2.purchaseErrorType, 
        economicRestrictionError = l_state_2.economicRestrictionError, 
        u13ConfirmType = v53.state.purchaseWarningType, 
        purchaseRobux = v53.purchaseRobux, 
        acceptPurchaseWarning = v53.acceptPurchaseWarning, 
        cancelPurchase = v53.cancelPurchase, 
        flowComplete = v53.endPurchase, 
        onAnalyticEvent = v53.sendAnalyticEvent, 
        eventPrefix = l_props_2.eventPrefix, 
        onPageClose = l_props_2.onPageClose, 
        dispatchCentralOverlay = l_props_2.dispatchCentralOverlay
    });
end;
return v20;