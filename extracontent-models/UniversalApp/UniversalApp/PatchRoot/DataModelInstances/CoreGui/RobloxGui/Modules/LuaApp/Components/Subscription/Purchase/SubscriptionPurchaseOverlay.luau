local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription);
local v13 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v14 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v16 = require(l_CorePackages_0.Packages.UrlBuilder);
local l_UrlBuilder_0 = v16.UrlBuilder;
local l_UrlBase_0 = v16.UrlBase;
local v19 = require(l_CorePackages_0.Packages.HttpRequest);
local v20 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_SubscriptionPurchaseFlow_0 = v20.PurchaseFlow.SubscriptionPurchaseFlow;
local l_SubscriptionPurchaseFlowState_0 = v20.PurchaseFlow.SubscriptionPurchaseFlowState;
local l_PurchaseErrorType_0 = v20.PurchaseFlow.PurchaseErrorType;
local v24 = require(l_Modules_0.LuaApp.Components.BuyRobux.Enum.VPCModalType);
local v25 = require(l_Modules_0.LuaApp.Enum.NativePurchaseProductTypeEnum);
local v26 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v27 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local v28 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local v29 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v30 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVpcForInAppSubscriptionPurchase);
local l_isErrorReasonPrefixWithEconomicRestrictions_0 = v20.Utility.isErrorReasonPrefixWithEconomicRestrictions;
local l_parseErrorReasonToEconomicRestriction_0 = v20.Utility.parseErrorReasonToEconomicRestriction;
local function v36(v35) --[[ Line: 68 ]] --[[ Name: parseSubscriptionError ]]
    -- upvalues: l_PurchaseErrorType_0 (copy)
    if v35 == "UserHasSpendLimitSet" then
        return l_PurchaseErrorType_0.SubscriptionExceededUserSpendLimit;
    elseif v35 == "UnsupportedLocale" then
        return l_PurchaseErrorType_0.SubscriptionUnsupportedLocale;
    elseif v35 == "RestrictedUser" then
        return l_PurchaseErrorType_0.RestrictedUser;
    elseif v35 == "PurchasePlatformNotSupported" then
        return l_PurchaseErrorType_0.SubscriptionPurchasePlatformNotSupported;
    elseif v35 == "InvalidSaleLocation" then
        return l_PurchaseErrorType_0.SubscriptionInvalidSaleLocation;
    elseif v35 == "UserAlreadySubscribed" then
        return l_PurchaseErrorType_0.AlreadySubscribed;
    elseif v35 == "ProductNotForSale" then
        return l_PurchaseErrorType_0.SubscriptionNotForSale;
    elseif v35 == "VpcRequired" then
        return l_PurchaseErrorType_0.VpcRequired;
    elseif v35 == "ExceedParentalSpendLimit" then
        return l_PurchaseErrorType_0.ExceedParentalSpendLimit;
    elseif v35 == "EconomicRestriction" then
        return l_PurchaseErrorType_0.EconomicRestriction;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
local function _() --[[ Line: 94 ]] --[[ Name: isSettingsSupportedForPlatform ]]
    -- upvalues: v30 (copy), v29 (copy)
    local v37 = v30();
    local v38 = true;
    if v37 ~= v29.Google then
        v38 = true;
        if v37 ~= v29.Apple then
            v38 = true;
            if v37 ~= v29.UWP then
                v38 = v37 == v29.Amazon;
            end;
        end;
    end;
    return v38;
end;
local function _() --[[ Line: 103 ]] --[[ Name: useClearPurchaseResultsOnUnmount ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v28 (copy)
    local v40 = l_useDispatch_0();
    v3.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v40 (copy), v28 (ref)
        return function() --[[ Line: 106 ]]
            -- upvalues: v40 (ref), v28 (ref)
            v40(v28());
        end;
    end, {});
end;
SubscriptionPurchaseOverlay = function(v42) --[[ Line: 112 ]] --[[ Name: SubscriptionPurchaseOverlay ]]
    -- upvalues: v3 (copy), l_SubscriptionPurchaseFlowState_0 (copy), l_PurchaseErrorType_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), v10 (copy), v11 (copy), l_useSelector_0 (copy), v26 (copy), v28 (copy), v12 (copy), v13 (copy), v14 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_HttpService_0 (copy), v19 (copy), l_default_0 (copy), l_isErrorReasonPrefixWithEconomicRestrictions_0 (copy), l_parseErrorReasonToEconomicRestriction_0 (copy), v36 (copy), v27 (copy), v25 (copy), v32 (copy), l_SubscriptionPurchaseFlow_0 (copy), v24 (copy), v30 (copy), v29 (copy)
    local l_endPurchase_0 = v42.endPurchase;
    local v44, v45 = v3.useState(l_SubscriptionPurchaseFlowState_0.PurchaseModal);
    local v46, v47 = v3.useState(l_PurchaseErrorType_0.None);
    local v48, v49 = v3.useState({});
    local v50 = l_useDispatch_0();
    local v51 = l_useLocalization_0({
        subscribed = "Feature.Subscription.Text.Subscribed", 
        perMonth = "Feature.Subscription.Text.PerMonth", 
        disclaimerText = "Feature.Subscription.Text.DisclaimerTextMonthly", 
        reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted", 
        somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    local v52 = l_useScreenSize_0();
    local v53 = l_useLocalUserId_0();
    local v54 = v10(v11);
    local l_subscriptionTargetKey_0 = v42.subscriptionPurchaseProductInfo.subscriptionTargetKey;
    local v57 = l_useSelector_0(function(v56) --[[ Line: 132 ]]
        return v56.NativePurchase;
    end);
    v3.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: v57 (copy), v26 (ref), v45 (copy), l_SubscriptionPurchaseFlowState_0 (ref), v42 (copy), v47 (copy), l_PurchaseErrorType_0 (ref)
        if v57 == nil or v57.purchaseStatus == nil then
            return;
        else
            local l_purchaseStatus_0 = v57.purchaseStatus;
            if l_purchaseStatus_0 == v26.Pending then
                v45(l_SubscriptionPurchaseFlowState_0.None);
                return;
            elseif l_purchaseStatus_0 == v26.Success then
                v42.onPurchaseSuccess();
                return;
            else
                if l_purchaseStatus_0 == v26.Failed then
                    v45(l_SubscriptionPurchaseFlowState_0.Error);
                    v47(l_PurchaseErrorType_0.Unknown);
                end;
                return;
            end;
        end;
    end, {
        v57, 
        v42.onPurchaseSuccess
    });
    local v59 = l_useDispatch_0();
    local l_v59_0 = v59 --[[ copy: 15 -> 25 ]];
    v3.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: l_v59_0 (copy), v28 (ref)
        return function() --[[ Line: 106 ]]
            -- upvalues: l_v59_0 (ref), v28 (ref)
            l_v59_0(v28());
        end;
    end, {});
    v59 = v3.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v12 (ref), v54 (copy), l_subscriptionTargetKey_0 (copy), v53 (copy), v50 (copy), v13 (ref), v51 (copy), v14 (ref)
        v12(v54, l_subscriptionTargetKey_0, v53):andThen(function() --[[ Line: 154 ]]
            -- upvalues: v50 (ref), v13 (ref), v51 (ref), v14 (ref)
            v50(v13({
                toastMessage = v51.reportSubscriptionSubmitted, 
                isLocalized = true, 
                toastType = v14.SuccessConfirmation
            }));
        end, function() --[[ Line: 160 ]]
            -- upvalues: v50 (ref), v13 (ref), v51 (ref), v14 (ref)
            v50(v13({
                toastMessage = v51.somethingIsWrong, 
                isLocalized = true, 
                toastType = v14.NetworkingError
            }));
        end);
    end, {
        v54, 
        l_subscriptionTargetKey_0, 
        v53, 
        v50, 
        v51
    });
    local l_subscriptionProviderId_0 = v42.subscriptionPurchaseProductInfo.subscriptionProviderId;
    local v69 = v3.useCallback(function() --[[ Line: 171 ]]
        -- upvalues: l_subscriptionProviderId_0 (copy), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), l_HttpService_0 (ref), v19 (ref), l_default_0 (ref), v50 (copy), v13 (ref), v51 (copy), v14 (ref)
        if not l_subscriptionProviderId_0 then
            return;
        else
            local v62 = l_UrlBuilder_0.new({
                base = l_UrlBase_0.APIS, 
                path = "sharelinks/v1/get-or-create-link"
            })();
            local v63 = l_HttpService_0:JSONEncode({
                universeId = tostring(l_subscriptionProviderId_0)
            });
            local v64 = l_HttpService_0:JSONEncode({
                linkType = "ExperienceDetails", 
                data = v63
            });
            v19.config({
                requestFunction = v19.requestFunctions.RequestInternal
            })(v62, "POST", {
                postBody = v64
            }):andThen(function(v65) --[[ Line: 192 ]]
                -- upvalues: l_UrlBuilder_0 (ref), l_default_0 (ref)
                local v66 = v65.responseBody or v65.result;
                if v66 and v66.linkId then
                    local v67 = tostring(DateTime.now().UnixTimestampMillis);
                    local v68 = l_UrlBuilder_0.sharelinks.shortUrl({
                        linkId = v66.linkId, 
                        type = "ExperienceDetails", 
                        stamp = v67
                    });
                    if l_default_0 then
                        l_default_0:shareUrl({
                            url = v68, 
                            context = "SubscriptionPurchaseShare"
                        });
                    end;
                end;
            end):catch(function() --[[ Line: 209 ]]
                -- upvalues: v50 (ref), v13 (ref), v51 (ref), v14 (ref)
                v50(v13({
                    toastMessage = v51.somethingIsWrong, 
                    isLocalized = true, 
                    toastType = v14.NetworkingError
                }));
            end);
            return;
        end;
    end, {
        l_subscriptionProviderId_0, 
        v50, 
        v51
    });
    local function v77() --[[ Line: 218 ]] --[[ Name: purchaseSubscription ]]
        -- upvalues: v42 (copy), l_subscriptionTargetKey_0 (copy), l_HttpService_0 (ref), l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), v47 (copy), l_PurchaseErrorType_0 (ref), v45 (copy), l_SubscriptionPurchaseFlowState_0 (ref), v49 (copy), l_parseErrorReasonToEconomicRestriction_0 (ref), v36 (ref), v50 (copy), v27 (ref), v26 (ref), v25 (ref), v32 (ref)
        if v42.isRobuxSubscription then
            v42.promptSubscriptionPurchase(l_subscriptionTargetKey_0, v42.subscriptionPurchaseProductInfo.priceInRobux):andThen(function() --[[ Line: 222 ]]
                -- upvalues: v42 (ref)
                v42.onPurchaseSuccess();
            end):catch(function(v70) --[[ Line: 225 ]]
                -- upvalues: l_HttpService_0 (ref), l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), v47 (ref), l_PurchaseErrorType_0 (ref), v45 (ref), l_SubscriptionPurchaseFlowState_0 (ref), v49 (ref), l_parseErrorReasonToEconomicRestriction_0 (ref), v36 (ref)
                local v71 = nil;
                if type(v70) == "string" then
                    v71 = v70;
                elseif type(v70) == "table" and v70.Body then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 230 ]]
                        -- upvalues: l_HttpService_0 (ref), v70 (copy)
                        return l_HttpService_0:JSONDecode(v70.Body);
                    end);
                    if l_status_0 and l_result_0 and l_result_0.errors and l_result_0.errors[1] then
                        v71 = l_result_0.errors[1].code or l_result_0.errors[1].message;
                    end;
                end;
                if v71 and l_isErrorReasonPrefixWithEconomicRestrictions_0(v71) then
                    v47(l_PurchaseErrorType_0.EconomicRestriction);
                    v45(l_SubscriptionPurchaseFlowState_0.Error);
                    v49(l_parseErrorReasonToEconomicRestriction_0(v71));
                    return;
                else
                    local v74 = v36(v71);
                    v47(v74);
                    v45(l_SubscriptionPurchaseFlowState_0.Error);
                    return;
                end;
            end);
            return;
        else
            v50(v27(l_subscriptionTargetKey_0, v26.Pending, v25.Subscription));
            v42.promptSubscriptionPurchase(l_subscriptionTargetKey_0):catch(function(v75) --[[ Line: 261 ]]
                -- upvalues: l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), v47 (ref), l_PurchaseErrorType_0 (ref), v45 (ref), l_SubscriptionPurchaseFlowState_0 (ref), v49 (ref), l_parseErrorReasonToEconomicRestriction_0 (ref), v36 (ref), v32 (ref)
                if l_isErrorReasonPrefixWithEconomicRestrictions_0(v75) then
                    v47(l_PurchaseErrorType_0.EconomicRestriction);
                    v45(l_SubscriptionPurchaseFlowState_0.Error);
                    v49(l_parseErrorReasonToEconomicRestriction_0(v75));
                    return;
                else
                    local v76 = v36(v75);
                    v47(v76);
                    v45(if v32() and v76 == l_PurchaseErrorType_0.VpcRequired then l_SubscriptionPurchaseFlowState_0.PurchaseVPCModal else l_SubscriptionPurchaseFlowState_0.Error);
                    return;
                end;
            end);
            return;
        end;
    end;
    local l_createElement_0 = v3.createElement;
    local l_l_SubscriptionPurchaseFlow_0_0 = l_SubscriptionPurchaseFlow_0;
    local v80 = {
        screenSize = v52, 
        purchaseState = v44, 
        errorType = v46, 
        economicRestrictionError = v48, 
        purchaseVPCType = if v44 == l_SubscriptionPurchaseFlowState_0.PurchaseVPCModal then v24.toRawValue(v24.EnablePurchase) else v24.toRawValue(v24.None), 
        shouldUseNewModalDesign = v42.shouldUseNewModalDesign, 
        isRobuxSubscription = v42.isRobuxSubscription, 
        creatorName = v42.creatorName, 
        creatorVerified = v42.creatorVerified, 
        subscriptionId = l_subscriptionTargetKey_0, 
        name = v42.subscriptionPurchaseProductInfo.name, 
        subscriptionProviderId = v42.subscriptionPurchaseProductInfo.subscriptionProviderId, 
        subscriptionProviderName = v42.subscriptionPurchaseProductInfo.subscriptionProviderName, 
        priceTier = v42.subscriptionPurchaseProductInfo.priceTier, 
        displayPrice = v42.subscriptionPurchaseProductInfo.displayPrice, 
        period = v51.perMonth, 
        description = v42.subscriptionPurchaseProductInfo.description, 
        disclaimerText = v51.disclaimerText, 
        itemIcon = v42.thumbnailString, 
        disablePurchase = v42.isSubscribed, 
        disablePurchaseText = if v42.isSubscribed then v51.subscribed else nil, 
        purchaseSubscription = v77, 
        cancelPurchase = l_endPurchase_0, 
        flowComplete = l_endPurchase_0
    };
    local v81 = v30();
    local v82 = true;
    if v81 ~= v29.Google then
        v82 = true;
        if v81 ~= v29.Apple then
            v82 = true;
            if v81 ~= v29.UWP then
                v82 = v81 == v29.Amazon;
            end;
        end;
    end;
    v80.openSettingsPage = if v82 then v42.openSettingsPage else nil;
    v80.onReport = if v42.shouldUseNewModalDesign then v59 else nil;
    v80.onShare = if v42.shouldUseNewModalDesign then v69 else nil;
    v80.onAnalyticEvent = function(v83, v84) --[[ Line: 313 ]] --[[ Name: onAnalyticEvent ]]
        -- upvalues: v42 (copy)
        v42.onAnalyticEvent("EDPSubscriptionPurchase", v83, v84);
    end;
    v80.eventPrefix = "EDP";
    return l_createElement_0(l_l_SubscriptionPurchaseFlow_0_0, v80);
end;
return SubscriptionPurchaseOverlay;