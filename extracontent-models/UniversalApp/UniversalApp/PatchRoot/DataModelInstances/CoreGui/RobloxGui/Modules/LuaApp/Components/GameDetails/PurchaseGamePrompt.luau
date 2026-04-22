local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Functional_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Functional;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v8 = require(l_CorePackages_0.Workspace.Packages.ToastRodux);
local l_ToastType_0 = v8.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v8.Actions.SetCurrentToastMessage;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.Constants);
local v16 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v17 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v18 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v19 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v20 = require(l_Modules_0.LuaApp.Enum.PurchaseErrors);
local v21 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v22 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchaseGameRobuxShortfall);
local v23 = require(l_Modules_0.LuaApp.Thunks.PurchaseProduct);
local v24 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v27 = v1.PureComponent:extend("PurchaseGamePrompt");
v27.defaultProps = {
    expectedCurrency = v15.Currency.Robux
};
v27.init = function(v28) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v20 (copy), v25 (copy), l_ToastType_0 (copy)
    v28.onPurchaseFailedWithRobuxShortfall = function(v29) --[[ Line: 42 ]]
        -- upvalues: v28 (copy)
        local l_gameName_0 = v28.props.gameName;
        local l_shortfallPrice_0 = v29.shortfallPrice;
        local l_appTheme_0 = v28.props.appTheme;
        local l_currentPage_0 = v28.props.currentPage;
        v28.props.openPurchaseGameRobuxShortfallPrompt(l_gameName_0, l_shortfallPrice_0, l_appTheme_0, {
            l_currentPage_0
        });
    end;
    v28.onPurchaseFailedWhenOwned = function(v34) --[[ Line: 52 ]]
        -- upvalues: v28 (copy)
        v28.props.fetchPlayabilityAndProductInfo(v28.props.networking, v28.props.universeId);
        v28.props.setPurchaseErrorToast(v34);
        v28.props.closePrompt();
    end;
    v28.customPurchaseErrorHandler = function(v35) --[[ Line: 64 ]]
        -- upvalues: v17 (ref), v20 (ref), v28 (copy)
        local v36 = false;
        local v37 = v17(v35);
        if v37 == v20.NotEnoughRobux then
            v28.onPurchaseFailedWithRobuxShortfall(v35);
            v36 = true;
        end;
        if v37 == v20.AlreadyOwn then
            v28.onPurchaseFailedWhenOwned(v35);
            v36 = true;
        end;
        return v36;
    end;
    v28.purchaseGame = function() --[[ Line: 80 ]]
        -- upvalues: v28 (copy), v25 (ref), l_ToastType_0 (ref)
        local l_networking_0 = v28.props.networking;
        local l_productId_0 = v28.props.productId;
        local v40 = {
            expectedCurreny = v28.props.expectedCurrency, 
            expectedPrice = v28.props.price, 
            expectedSellerId = v28.props.sellerId
        };
        v28.props.purchaseGame(l_networking_0, l_productId_0, v40, v28.customPurchaseErrorHandler):andThen(function() --[[ Line: 99 ]]
            -- upvalues: v28 (ref), l_networking_0 (copy), v25 (ref), l_ToastType_0 (ref)
            v28.props.fetchPlayabilityAndProductInfo(l_networking_0, v28.props.universeId);
            if v25() then
                local v41 = {
                    "Feature.Toast.Message.PurchaseMessage.SuccessV3", 
                    {
                        gameName = v28.props.gameName, 
                        price = v28.props.price
                    }
                };
                v28.props.setCurrentToastMessage(l_ToastType_0.PurchaseMessage, "Feature.Toast.Heading.PurchaseMessage.Success", v41, false);
            else
                local l_localization_0 = v28.props.localization;
                local v43 = l_localization_0:Format("Feature.Toast.Heading.PurchaseMessage.Success");
                local v44 = l_localization_0:Format("Feature.Toast.Message.PurchaseMessage.SuccessV3", {
                    gameName = v28.props.gameName, 
                    price = v28.props.price
                });
                v28.props.setCurrentToastMessage(l_ToastType_0.PurchaseMessage, v43, v44, true);
            end;
            v28.props.closePrompt();
        end);
    end;
end;
v27.didMount = function(v45) --[[ Line: 127 ]] --[[ Name: didMount ]]
    -- upvalues: l_Functional_0 (copy)
    local l_pageFilter_0 = v45.props.pageFilter;
    local l_currentPage_1 = v45.props.currentPage;
    local l_closePrompt_0 = v45.props.closePrompt;
    if l_pageFilter_0 and not l_Functional_0.Find(l_pageFilter_0, l_currentPage_1) then
        l_closePrompt_0();
    end;
end;
v27.render = function(v49) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v1 (copy), v18 (copy), v21 (copy), v25 (copy), l_withLocalization_0 (copy)
    local l_appTheme_1 = v49.props.appTheme;
    local l_containerWidth_0 = v49.props.containerWidth;
    local l_purchaseStatus_0 = v49.props.purchaseStatus;
    local l_closePrompt_1 = v49.props.closePrompt;
    local l_localization_1 = v49.props.localization;
    local l_gameName_1 = v49.props.gameName;
    local l_price_0 = v49.props.price;
    local v57 = l_purchaseStatus_0 == l_RetrievalStatus_0.Fetching;
    local function v59(v58) --[[ Line: 147 ]]
        -- upvalues: v1 (ref), v18 (ref), l_appTheme_1 (copy), v21 (ref), l_containerWidth_0 (copy), v49 (copy), v57 (copy), l_closePrompt_1 (copy)
        return v1.createElement(v18.Provider, {
            value = l_appTheme_1
        }, {
            AlertWindow = v1.createElement(v21, {
                containerWidth = l_containerWidth_0, 
                titleText = v58.titleText, 
                titleFont = l_appTheme_1.GameDetails.Text.BoldFont, 
                messageText = v58.messageText, 
                messageFont = l_appTheme_1.GameDetails.Text.Font, 
                buttonFont = l_appTheme_1.GameDetails.Text.Font, 
                confirmButtonText = v58.confirmButtonText, 
                onConfirm = v49.purchaseGame, 
                isConfirming = v57, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_1
            })
        });
    end;
    if v25() then
        return l_withLocalization_0({
            titleText = "Feature.GameDetails.Heading.PurchaseGame", 
            messageText = {
                "Feature.GameDetails.Message.PurchaseGameV2"; 
                gameName = l_gameName_1, 
                X = l_price_0
            }, 
            confirmButtonText = "Feature.GameDetails.Action.Unlock"
        })(v59);
    else
        return v59({
            titleText = l_localization_1:Format("Feature.GameDetails.Heading.PurchaseGame"), 
            messageText = l_localization_1:Format("Feature.GameDetails.Message.PurchaseGameV2", {
                gameName = l_gameName_1, 
                X = l_price_0
            }), 
            confirmButtonText = l_localization_1:Format("Feature.GameDetails.Action.Unlock")
        });
    end;
end;
v27 = v19((v2.connect(function(v60, v61) --[[ Line: 187 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v23 (copy)
    local v62 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v60) else v60.Navigation.history[#v60.Navigation.history];
    return {
        purchaseStatus = v23.GetPostingStatus(v60, v61.productId), 
        currentPage = v62[#v62].name
    };
end, function(v63) --[[ Line: 195 ]]
    -- upvalues: l_SetCurrentToastMessage_0 (copy), v22 (copy), v23 (copy), l_CloseCentralOverlay_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v24 (copy)
    return {
        setCurrentToastMessage = function(v64, v65, v66, v67) --[[ Line: 197 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v63 (copy), l_SetCurrentToastMessage_0 (ref)
            return v63(l_SetCurrentToastMessage_0({
                toastType = v64, 
                toastMessage = v65, 
                toastSubMessage = v66, 
                isLocalized = v67
            }));
        end, 
        openPurchaseGameRobuxShortfallPrompt = function(v68, v69, v70, v71) --[[ Line: 205 ]] --[[ Name: openPurchaseGameRobuxShortfallPrompt ]]
            -- upvalues: v63 (copy), v22 (ref)
            return v63(v22(v68, v69, v70, v71));
        end, 
        purchaseGame = function(v72, v73, v74, v75) --[[ Line: 210 ]] --[[ Name: purchaseGame ]]
            -- upvalues: v63 (copy), v23 (ref)
            return v63(v23.Post(v72, v73, v74, v75));
        end, 
        closePrompt = function() --[[ Line: 213 ]] --[[ Name: closePrompt ]]
            -- upvalues: v63 (copy), l_CloseCentralOverlay_0 (ref)
            return v63(l_CloseCentralOverlay_0());
        end, 
        fetchPlayabilityAndProductInfo = function(v76, v77) --[[ Line: 216 ]] --[[ Name: fetchPlayabilityAndProductInfo ]]
            -- upvalues: v63 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref)
            return v63(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v76, v77));
        end, 
        setPurchaseErrorToast = function(v78) --[[ Line: 219 ]] --[[ Name: setPurchaseErrorToast ]]
            -- upvalues: v63 (copy), v24 (ref)
            return v63(v24(v78));
        end
    };
end)(v27)));
return (l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    localization = v16
})(v27));