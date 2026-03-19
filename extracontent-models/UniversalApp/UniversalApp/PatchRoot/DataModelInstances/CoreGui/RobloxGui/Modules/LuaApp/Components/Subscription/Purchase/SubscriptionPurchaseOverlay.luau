local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v9 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_SubscriptionPurchaseFlow_0 = v9.PurchaseFlow.SubscriptionPurchaseFlow;
local l_SubscriptionPurchaseFlowState_0 = v9.PurchaseFlow.SubscriptionPurchaseFlowState;
local l_PurchaseErrorType_0 = v9.PurchaseFlow.PurchaseErrorType;
local v13 = require(l_Modules_0.LuaApp.Components.BuyRobux.Enum.VPCModalType);
local v14 = require(l_Modules_0.LuaApp.Enum.NativePurchaseProductTypeEnum);
local v15 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v16 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local v17 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local v18 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v19 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVpcForInAppSubscriptionPurchase);
local l_isErrorReasonPrefixWithEconomicRestrictions_0 = v9.Utility.isErrorReasonPrefixWithEconomicRestrictions;
local l_parseErrorReasonToEconomicRestriction_0 = v9.Utility.parseErrorReasonToEconomicRestriction;
local function v25(v24) --[[ Line: 55 ]] --[[ Name: parseSubscriptionError ]]
    -- upvalues: l_PurchaseErrorType_0 (copy)
    if v24 == "UserHasSpendLimitSet" then
        return l_PurchaseErrorType_0.SubscriptionExceededUserSpendLimit;
    elseif v24 == "UnsupportedLocale" then
        return l_PurchaseErrorType_0.SubscriptionUnsupportedLocale;
    elseif v24 == "RestrictedUser" then
        return l_PurchaseErrorType_0.RestrictedUser;
    elseif v24 == "PurchasePlatformNotSupported" then
        return l_PurchaseErrorType_0.SubscriptionPurchasePlatformNotSupported;
    elseif v24 == "InvalidSaleLocation" then
        return l_PurchaseErrorType_0.SubscriptionInvalidSaleLocation;
    elseif v24 == "UserAlreadySubscribed" then
        return l_PurchaseErrorType_0.AlreadySubscribed;
    elseif v24 == "ProductNotForSale" then
        return l_PurchaseErrorType_0.SubscriptionNotForSale;
    elseif v24 == "VpcRequired" then
        return l_PurchaseErrorType_0.VpcRequired;
    elseif v24 == "ExceedParentalSpendLimit" then
        return l_PurchaseErrorType_0.ExceedParentalSpendLimit;
    elseif v24 == "EconomicRestriction" then
        return l_PurchaseErrorType_0.EconomicRestriction;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
local function _() --[[ Line: 81 ]] --[[ Name: isSettingsSupportedForPlatform ]]
    -- upvalues: v19 (copy), v18 (copy)
    local v26 = v19();
    local v27 = true;
    if v26 ~= v18.Google then
        v27 = true;
        if v26 ~= v18.Apple then
            v27 = true;
            if v26 ~= v18.UWP then
                v27 = v26 == v18.Amazon;
            end;
        end;
    end;
    return v27;
end;
local function _() --[[ Line: 90 ]] --[[ Name: useClearPurchaseResultsOnUnmount ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v17 (copy)
    local v29 = l_useDispatch_0();
    v3.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v29 (copy), v17 (ref)
        return function() --[[ Line: 93 ]]
            -- upvalues: v29 (ref), v17 (ref)
            v29(v17());
        end;
    end, {});
end;
SubscriptionPurchaseOverlay = function(v31) --[[ Line: 99 ]] --[[ Name: SubscriptionPurchaseOverlay ]]
    -- upvalues: v3 (copy), l_SubscriptionPurchaseFlowState_0 (copy), l_PurchaseErrorType_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useScreenSize_0 (copy), l_useSelector_0 (copy), v15 (copy), v17 (copy), l_HttpService_0 (copy), l_isErrorReasonPrefixWithEconomicRestrictions_0 (copy), l_parseErrorReasonToEconomicRestriction_0 (copy), v25 (copy), v16 (copy), v14 (copy), v21 (copy), l_SubscriptionPurchaseFlow_0 (copy), v13 (copy), v19 (copy), v18 (copy)
    local l_endPurchase_0 = v31.endPurchase;
    local v33, v34 = v3.useState(l_SubscriptionPurchaseFlowState_0.PurchaseModal);
    local v35, v36 = v3.useState(l_PurchaseErrorType_0.None);
    local v37, v38 = v3.useState({});
    local v39 = l_useDispatch_0();
    local v40 = l_useLocalization_0({
        subscribed = "Feature.Subscription.Text.Subscribed", 
        perMonth = "Feature.Subscription.Text.PerMonth", 
        disclaimerText = "Feature.Subscription.Text.DisclaimerTextMonthly"
    });
    local v41 = l_useScreenSize_0();
    local l_subscriptionTargetKey_0 = v31.subscriptionPurchaseProductInfo.subscriptionTargetKey;
    local v44 = l_useSelector_0(function(v43) --[[ Line: 115 ]]
        return v43.NativePurchase;
    end);
    v3.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: v44 (copy), v15 (ref), v34 (copy), l_SubscriptionPurchaseFlowState_0 (ref), v31 (copy), v36 (copy), l_PurchaseErrorType_0 (ref)
        if v44 == nil or v44.purchaseStatus == nil then
            return;
        else
            local l_purchaseStatus_0 = v44.purchaseStatus;
            if l_purchaseStatus_0 == v15.Pending then
                v34(l_SubscriptionPurchaseFlowState_0.None);
                return;
            elseif l_purchaseStatus_0 == v15.Success then
                v31.onPurchaseSuccess();
                return;
            else
                if l_purchaseStatus_0 == v15.Failed then
                    v34(l_SubscriptionPurchaseFlowState_0.Error);
                    v36(l_PurchaseErrorType_0.Unknown);
                end;
                return;
            end;
        end;
    end, {
        v44, 
        v31.onPurchaseSuccess
    });
    local v46 = l_useDispatch_0();
    local l_v46_0 = v46 --[[ copy: 13 -> 20 ]];
    v3.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: l_v46_0 (copy), v17 (ref)
        return function() --[[ Line: 93 ]]
            -- upvalues: l_v46_0 (ref), v17 (ref)
            l_v46_0(v17());
        end;
    end, {});
    v46 = function() --[[ Line: 136 ]] --[[ Name: purchaseSubscription ]]
        -- upvalues: v31 (copy), l_subscriptionTargetKey_0 (copy), l_HttpService_0 (ref), l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), v36 (copy), l_PurchaseErrorType_0 (ref), v34 (copy), l_SubscriptionPurchaseFlowState_0 (ref), v38 (copy), l_parseErrorReasonToEconomicRestriction_0 (ref), v25 (ref), v39 (copy), v16 (ref), v15 (ref), v14 (ref), v21 (ref)
        if v31.isRobuxSubscription then
            v31.promptSubscriptionPurchase(l_subscriptionTargetKey_0, v31.subscriptionPurchaseProductInfo.priceInRobux):andThen(function() --[[ Line: 140 ]]
                -- upvalues: v31 (ref)
                v31.onPurchaseSuccess();
            end):catch(function(v48) --[[ Line: 143 ]]
                -- upvalues: l_HttpService_0 (ref), l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), v36 (ref), l_PurchaseErrorType_0 (ref), v34 (ref), l_SubscriptionPurchaseFlowState_0 (ref), v38 (ref), l_parseErrorReasonToEconomicRestriction_0 (ref), v25 (ref)
                local v49 = nil;
                if type(v48) == "string" then
                    v49 = v48;
                elseif type(v48) == "table" and v48.Body then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 148 ]]
                        -- upvalues: l_HttpService_0 (ref), v48 (copy)
                        return l_HttpService_0:JSONDecode(v48.Body);
                    end);
                    if l_status_0 and l_result_0 and l_result_0.errors and l_result_0.errors[1] then
                        v49 = l_result_0.errors[1].code or l_result_0.errors[1].message;
                    end;
                end;
                if v49 and l_isErrorReasonPrefixWithEconomicRestrictions_0(v49) then
                    v36(l_PurchaseErrorType_0.EconomicRestriction);
                    v34(l_SubscriptionPurchaseFlowState_0.Error);
                    v38(l_parseErrorReasonToEconomicRestriction_0(v49));
                    return;
                else
                    local v52 = v25(v49);
                    v36(v52);
                    v34(l_SubscriptionPurchaseFlowState_0.Error);
                    return;
                end;
            end);
            return;
        else
            v39(v16(l_subscriptionTargetKey_0, v15.Pending, v14.Subscription));
            v31.promptSubscriptionPurchase(l_subscriptionTargetKey_0):catch(function(v53) --[[ Line: 179 ]]
                -- upvalues: l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), v36 (ref), l_PurchaseErrorType_0 (ref), v34 (ref), l_SubscriptionPurchaseFlowState_0 (ref), v38 (ref), l_parseErrorReasonToEconomicRestriction_0 (ref), v25 (ref), v21 (ref)
                if l_isErrorReasonPrefixWithEconomicRestrictions_0(v53) then
                    v36(l_PurchaseErrorType_0.EconomicRestriction);
                    v34(l_SubscriptionPurchaseFlowState_0.Error);
                    v38(l_parseErrorReasonToEconomicRestriction_0(v53));
                    return;
                else
                    local v54 = v25(v53);
                    v36(v54);
                    v34(if v21() and v54 == l_PurchaseErrorType_0.VpcRequired then l_SubscriptionPurchaseFlowState_0.PurchaseVPCModal else l_SubscriptionPurchaseFlowState_0.Error);
                    return;
                end;
            end);
            return;
        end;
    end;
    local l_createElement_0 = v3.createElement;
    local l_l_SubscriptionPurchaseFlow_0_0 = l_SubscriptionPurchaseFlow_0;
    local v57 = {
        screenSize = v41, 
        purchaseState = v33, 
        errorType = v35, 
        economicRestrictionError = v37, 
        purchaseVPCType = if v33 == l_SubscriptionPurchaseFlowState_0.PurchaseVPCModal then v13.toRawValue(v13.EnablePurchase) else v13.toRawValue(v13.None), 
        shouldUseNewModalDesign = v31.shouldUseNewModalDesign, 
        isRobuxSubscription = v31.isRobuxSubscription, 
        creatorName = v31.creatorName, 
        creatorVerified = v31.creatorVerified, 
        subscriptionId = l_subscriptionTargetKey_0, 
        name = v31.subscriptionPurchaseProductInfo.name, 
        subscriptionProviderId = v31.subscriptionPurchaseProductInfo.subscriptionProviderId, 
        subscriptionProviderName = v31.subscriptionPurchaseProductInfo.subscriptionProviderName, 
        priceTier = v31.subscriptionPurchaseProductInfo.priceTier, 
        displayPrice = v31.subscriptionPurchaseProductInfo.displayPrice, 
        period = v40.perMonth, 
        description = v31.subscriptionPurchaseProductInfo.description, 
        disclaimerText = v40.disclaimerText, 
        itemIcon = v31.thumbnailString, 
        disablePurchase = v31.isSubscribed, 
        disablePurchaseText = if v31.isSubscribed then v40.subscribed else nil, 
        purchaseSubscription = v46, 
        cancelPurchase = l_endPurchase_0, 
        flowComplete = l_endPurchase_0
    };
    local v58 = v19();
    local v59 = true;
    if v58 ~= v18.Google then
        v59 = true;
        if v58 ~= v18.Apple then
            v59 = true;
            if v58 ~= v18.UWP then
                v59 = v58 == v18.Amazon;
            end;
        end;
    end;
    v57.openSettingsPage = if v59 then v31.openSettingsPage else nil;
    v57.onAnalyticEvent = function(v60, v61) --[[ Line: 229 ]] --[[ Name: onAnalyticEvent ]]
        -- upvalues: v31 (copy)
        v31.onAnalyticEvent("EDPSubscriptionPurchase", v60, v61);
    end;
    v57.eventPrefix = "EDP";
    return l_createElement_0(l_l_SubscriptionPurchaseFlow_0_0, v57);
end;
return SubscriptionPurchaseOverlay;