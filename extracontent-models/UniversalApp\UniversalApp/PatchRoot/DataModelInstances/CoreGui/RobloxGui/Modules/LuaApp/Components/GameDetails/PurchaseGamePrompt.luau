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
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.Constants);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v16 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v17 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v18 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v19 = require(l_Modules_0.LuaApp.Enum.PurchaseErrors);
local v20 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v21 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchaseGameRobuxShortfall);
local v22 = require(l_Modules_0.LuaApp.Thunks.PurchaseProduct);
local v23 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v25 = v1.PureComponent:extend("PurchaseGamePrompt");
v25.defaultProps = {
    expectedCurrency = v14.Currency.Robux
};
v25.init = function(v26) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v19 (copy), v24 (copy), l_ToastType_0 (copy)
    v26.onPurchaseFailedWithRobuxShortfall = function(v27) --[[ Line: 40 ]]
        -- upvalues: v26 (copy)
        local l_gameName_0 = v26.props.gameName;
        local l_shortfallPrice_0 = v27.shortfallPrice;
        local l_appTheme_0 = v26.props.appTheme;
        local l_currentPage_0 = v26.props.currentPage;
        v26.props.openPurchaseGameRobuxShortfallPrompt(l_gameName_0, l_shortfallPrice_0, l_appTheme_0, {
            l_currentPage_0
        });
    end;
    v26.onPurchaseFailedWhenOwned = function(v32) --[[ Line: 50 ]]
        -- upvalues: v26 (copy)
        v26.props.fetchPlayabilityAndProductInfo(v26.props.networking, v26.props.universeId);
        v26.props.setPurchaseErrorToast(v32);
        v26.props.closePrompt();
    end;
    v26.customPurchaseErrorHandler = function(v33) --[[ Line: 62 ]]
        -- upvalues: v16 (ref), v19 (ref), v26 (copy)
        local v34 = false;
        local v35 = v16(v33);
        if v35 == v19.NotEnoughRobux then
            v26.onPurchaseFailedWithRobuxShortfall(v33);
            v34 = true;
        end;
        if v35 == v19.AlreadyOwn then
            v26.onPurchaseFailedWhenOwned(v33);
            v34 = true;
        end;
        return v34;
    end;
    v26.purchaseGame = function() --[[ Line: 78 ]]
        -- upvalues: v26 (copy), v24 (ref), l_ToastType_0 (ref)
        local l_networking_0 = v26.props.networking;
        local l_productId_0 = v26.props.productId;
        local v38 = {
            expectedCurreny = v26.props.expectedCurrency, 
            expectedPrice = v26.props.price, 
            expectedSellerId = v26.props.sellerId
        };
        v26.props.purchaseGame(l_networking_0, l_productId_0, v38, v26.customPurchaseErrorHandler):andThen(function() --[[ Line: 97 ]]
            -- upvalues: v26 (ref), l_networking_0 (copy), v24 (ref), l_ToastType_0 (ref)
            v26.props.fetchPlayabilityAndProductInfo(l_networking_0, v26.props.universeId);
            if v24() then
                local v39 = {
                    "Feature.Toast.Message.PurchaseMessage.SuccessV3", 
                    {
                        gameName = v26.props.gameName, 
                        price = v26.props.price
                    }
                };
                v26.props.setCurrentToastMessage(l_ToastType_0.PurchaseMessage, "Feature.Toast.Heading.PurchaseMessage.Success", v39, false);
            else
                local l_localization_0 = v26.props.localization;
                local v41 = l_localization_0:Format("Feature.Toast.Heading.PurchaseMessage.Success");
                local v42 = l_localization_0:Format("Feature.Toast.Message.PurchaseMessage.SuccessV3", {
                    gameName = v26.props.gameName, 
                    price = v26.props.price
                });
                v26.props.setCurrentToastMessage(l_ToastType_0.PurchaseMessage, v41, v42, true);
            end;
            v26.props.closePrompt();
        end);
    end;
end;
v25.didMount = function(v43) --[[ Line: 125 ]] --[[ Name: didMount ]]
    -- upvalues: l_Functional_0 (copy)
    local l_pageFilter_0 = v43.props.pageFilter;
    local l_currentPage_1 = v43.props.currentPage;
    local l_closePrompt_0 = v43.props.closePrompt;
    if l_pageFilter_0 and not l_Functional_0.Find(l_pageFilter_0, l_currentPage_1) then
        l_closePrompt_0();
    end;
end;
v25.render = function(v47) --[[ Line: 135 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v1 (copy), v17 (copy), v20 (copy), v24 (copy), l_withLocalization_0 (copy)
    local l_appTheme_1 = v47.props.appTheme;
    local l_containerWidth_0 = v47.props.containerWidth;
    local l_purchaseStatus_0 = v47.props.purchaseStatus;
    local l_closePrompt_1 = v47.props.closePrompt;
    local l_localization_1 = v47.props.localization;
    local l_gameName_1 = v47.props.gameName;
    local l_price_0 = v47.props.price;
    local v55 = l_purchaseStatus_0 == l_RetrievalStatus_0.Fetching;
    local function v57(v56) --[[ Line: 145 ]]
        -- upvalues: v1 (ref), v17 (ref), l_appTheme_1 (copy), v20 (ref), l_containerWidth_0 (copy), v47 (copy), v55 (copy), l_closePrompt_1 (copy)
        return v1.createElement(v17.Provider, {
            value = l_appTheme_1
        }, {
            AlertWindow = v1.createElement(v20, {
                containerWidth = l_containerWidth_0, 
                titleText = v56.titleText, 
                titleFont = l_appTheme_1.GameDetails.Text.BoldFont, 
                messageText = v56.messageText, 
                messageFont = l_appTheme_1.GameDetails.Text.Font, 
                buttonFont = l_appTheme_1.GameDetails.Text.Font, 
                confirmButtonText = v56.confirmButtonText, 
                onConfirm = v47.purchaseGame, 
                isConfirming = v55, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_1
            })
        });
    end;
    if v24() then
        return l_withLocalization_0({
            titleText = "Feature.GameDetails.Heading.PurchaseGame", 
            messageText = {
                "Feature.GameDetails.Message.PurchaseGameV2"; 
                gameName = l_gameName_1, 
                X = l_price_0
            }, 
            confirmButtonText = "Feature.GameDetails.Action.Unlock"
        })(v57);
    else
        return v57({
            titleText = l_localization_1:Format("Feature.GameDetails.Heading.PurchaseGame"), 
            messageText = l_localization_1:Format("Feature.GameDetails.Message.PurchaseGameV2", {
                gameName = l_gameName_1, 
                X = l_price_0
            }), 
            confirmButtonText = l_localization_1:Format("Feature.GameDetails.Action.Unlock")
        });
    end;
end;
v25 = v18((v2.connect(function(v58, v59) --[[ Line: 185 ]]
    -- upvalues: v22 (copy)
    local v60 = v58.Navigation.history[#v58.Navigation.history];
    return {
        purchaseStatus = v22.GetPostingStatus(v58, v59.productId), 
        currentPage = v60[#v60].name
    };
end, function(v61) --[[ Line: 191 ]]
    -- upvalues: l_SetCurrentToastMessage_0 (copy), v21 (copy), v22 (copy), l_CloseCentralOverlay_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v23 (copy)
    return {
        setCurrentToastMessage = function(v62, v63, v64, v65) --[[ Line: 193 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v61 (copy), l_SetCurrentToastMessage_0 (ref)
            return v61(l_SetCurrentToastMessage_0({
                toastType = v62, 
                toastMessage = v63, 
                toastSubMessage = v64, 
                isLocalized = v65
            }));
        end, 
        openPurchaseGameRobuxShortfallPrompt = function(v66, v67, v68, v69) --[[ Line: 201 ]] --[[ Name: openPurchaseGameRobuxShortfallPrompt ]]
            -- upvalues: v61 (copy), v21 (ref)
            return v61(v21(v66, v67, v68, v69));
        end, 
        purchaseGame = function(v70, v71, v72, v73) --[[ Line: 206 ]] --[[ Name: purchaseGame ]]
            -- upvalues: v61 (copy), v22 (ref)
            return v61(v22.Post(v70, v71, v72, v73));
        end, 
        closePrompt = function() --[[ Line: 209 ]] --[[ Name: closePrompt ]]
            -- upvalues: v61 (copy), l_CloseCentralOverlay_0 (ref)
            return v61(l_CloseCentralOverlay_0());
        end, 
        fetchPlayabilityAndProductInfo = function(v74, v75) --[[ Line: 212 ]] --[[ Name: fetchPlayabilityAndProductInfo ]]
            -- upvalues: v61 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref)
            return v61(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v74, v75));
        end, 
        setPurchaseErrorToast = function(v76) --[[ Line: 215 ]] --[[ Name: setPurchaseErrorToast ]]
            -- upvalues: v61 (copy), v23 (ref)
            return v61(v23(v76));
        end
    };
end)(v25)));
return (l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    localization = v15
})(v25));