local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v6 = require(l_Parent_1.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v11 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v11.LocalizationProvider;
local l_useLocalization_0 = v11.Hooks.useLocalization;
local v14 = require(l_Parent_0.Generic.ProductDetails);
local v15 = require(script.Parent.RobuxUpsellModalTitle);
local v16 = require(l_Parent_0.Utility.formatNumber);
local v17 = require(l_Parent_0.Utility.logger);
local v18 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_TooExpensiveUpsellFallbackShownCounter_0 = require(l_Parent_0.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUpsellFallbackShownCounter;
local function v26(v21) --[[ Line: 56 ]] --[[ Name: MiddleContent ]]
    -- upvalues: l_useLocalization_0 (copy), v16 (copy), l_LocalizationService_0 (copy), v2 (copy), l_View_0 (copy), v14 (copy), l_Text_0 (copy)
    local v22 = l_useLocalization_0({
        YouNeed = "IAPExperience.InsufficientRobux.Text.YouNeed"
    });
    local v23 = v21.product.itemRobuxCost - v21.balanceAmount;
    local v24 = utf8.char(57346) .. v16(l_LocalizationService_0.RobloxLocaleId, v23);
    local v25 = v22.YouNeed:gsub("{robux}", v24);
    return v2.createElement(l_View_0, {
        tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
    }, {
        ProductDetails = v2.createElement(v14, {
            layoutOrder = 1, 
            isPortrait = v21.isPortrait, 
            model = v21.product.model, 
            itemIcon = v21.product.itemIcon, 
            itemName = v21.product.itemName, 
            itemRobuxCost = v21.product.itemRobuxCost
        }), 
        BuyRobuxDetails = v2.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v25, 
            padding = {
                bottom = UDim.new(0, -12)
            }, 
            tag = "auto-xy text-body-medium content-emphasis text-align-x-left size-full-0 text-wrap padding-x-small line-height-"
        })
    });
end;
local function v29(v27) --[[ Line: 95 ]] --[[ Name: RobuxUpsellModalTooExpensiveFallback ]]
    -- upvalues: v2 (copy), v17 (copy), v18 (copy), l_default_0 (copy), l_TooExpensiveUpsellFallbackShownCounter_0 (copy), l_useLocalization_0 (copy), l_InteractiveAlert_0 (copy), v15 (copy), v26 (copy), l_ButtonType_0 (copy)
    v2.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v17 (ref), v27 (copy), v18 (ref), l_default_0 (ref), l_TooExpensiveUpsellFallbackShownCounter_0 (ref)
        v17.debug({
            message = "Too Expensive Upsell Fallback Modal Shown", 
            screenHeight = v27.screenSize.Y, 
            screenWidth = v27.screenSize.X, 
            portrait = v27.screenSize.X < v27.screenSize.Y, 
            appContext = v18()
        });
        l_default_0:logRobloxTelemetryCounter(l_TooExpensiveUpsellFallbackShownCounter_0, 1, {
            screenHeight = v27.screenSize.Y, 
            screenWidth = v27.screenSize.X, 
            portrait = v27.screenSize.X < v27.screenSize.Y, 
            appContext = v18()
        });
    end, {});
    local v28 = l_useLocalization_0({
        OK = "IAPExperience.PurchaseError.Text.Ok"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v27.screenSize, 
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        title = "", 
        titleContent = function() --[[ Line: 119 ]] --[[ Name: titleContent ]]
            -- upvalues: v2 (ref), v15 (ref), v27 (copy)
            return v2.createElement(v15, {
                balanceAmount = v27.balanceAmount, 
                cancelPurchaseActivated = v27.doneActivated
            });
        end, 
        middleContent = function() --[[ Line: 125 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v26 (ref), v27 (copy)
            return v2.createElement(v26, {
                product = v27.product, 
                isQuest = v27.isQuest, 
                balanceAmount = v27.balanceAmount, 
                isPortrait = v27.screenSize.X < v27.screenSize.Y
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v27.doneActivated, 
                        text = v28.OK, 
                        inputIcon = v27.doneControllerIcon
                    }
                }
            }
        }
    });
end;
return function(v30) --[[ Line: 148 ]] --[[ Name: RobuxUpsellModalTooExpensiveFallbackContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v29 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        RobuxUpsellModalTooExpensiveFallback = v2.createElement(v29, v30)
    });
end;