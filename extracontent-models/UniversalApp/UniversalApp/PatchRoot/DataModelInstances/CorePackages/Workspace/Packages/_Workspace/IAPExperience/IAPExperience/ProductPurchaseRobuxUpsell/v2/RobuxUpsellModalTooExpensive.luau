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
local v16 = require(script.Parent.RobuxUpsellModalFooter);
local v17 = require(l_Parent_0.Utility.formatNumber);
local v18 = require(l_Parent_0.Utility.logger);
local v19 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_TooExpensiveUpsellShownCounter_0 = require(l_Parent_0.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUpsellShownCounter;
local function v27(v22) --[[ Line: 58 ]] --[[ Name: MiddleContent ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), l_LocalizationService_0 (copy), v2 (copy), l_View_0 (copy), v14 (copy), l_Text_0 (copy)
    local v23 = l_useLocalization_0({
        DontHaveEnough = "IAPExperience.InsufficientRobux.Text.BuyRobux"
    });
    local v24 = v22.product.itemRobuxCost - v22.balanceAmount;
    local v25 = utf8.char(57346) .. " " .. v17(l_LocalizationService_0.RobloxLocaleId, v24);
    local v26 = v23.DontHaveEnough:gsub("{robux}", v25);
    return v2.createElement(l_View_0, {
        tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
    }, {
        ProductDetails = v2.createElement(v14, {
            layoutOrder = 1, 
            isPortrait = v22.isPortrait, 
            model = v22.product.model, 
            itemIcon = v22.product.itemIcon, 
            itemName = v22.product.itemName, 
            itemRobuxCost = v22.product.itemRobuxCost
        }), 
        BuyRobuxDetails = v2.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v26, 
            padding = {
                bottom = UDim.new(0, -12)
            }, 
            tag = "auto-xy text-label-medium content-emphasis text-align-x-center size-full-0"
        })
    });
end;
local function v30(v28) --[[ Line: 93 ]] --[[ Name: ButtonStackInfo ]]
    -- upvalues: l_useLocalization_0 (copy), l_ButtonType_0 (copy)
    local v29 = l_useLocalization_0({
        RobuxStoreButton = "IAPExperience.InsufficientRobux.Action.RobuxStore", 
        ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel"
    });
    return {
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = if v28.isQuest then {
            {
                props = {
                    onActivated = v28.buttons.cancelPurchaseActivated, 
                    text = v29.ButtonCancel, 
                    inputIcon = v28.buttons.cancelControllerIcon
                }
            }
        } else {
            {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                props = {
                    onActivated = v28.buttons.buyItemActivated, 
                    text = v29.RobuxStoreButton, 
                    inputIcon = v28.buttons.buyItemControllerIcon
                }
            }
        }
    };
end;
local function v32(v31) --[[ Line: 130 ]] --[[ Name: RobuxUpsellModalTooExpensive ]]
    -- upvalues: v2 (copy), v18 (copy), v19 (copy), l_default_0 (copy), l_TooExpensiveUpsellShownCounter_0 (copy), l_InteractiveAlert_0 (copy), v15 (copy), v27 (copy), v30 (copy), v16 (copy)
    v2.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v18 (ref), v31 (copy), v19 (ref), l_default_0 (ref), l_TooExpensiveUpsellShownCounter_0 (ref)
        v18.debug({
            message = "Too Expensive Upsell Modal Shown", 
            screenHeight = v31.screenSize.Y, 
            screenWidth = v31.screenSize.X, 
            portrait = v31.screenSize.X < v31.screenSize.Y, 
            appContext = v19()
        });
        l_default_0:logRobloxTelemetryCounter(l_TooExpensiveUpsellShownCounter_0, 1, {
            screenHeight = v31.screenSize.Y, 
            screenWidth = v31.screenSize.X, 
            portrait = v31.screenSize.X < v31.screenSize.Y, 
            appContext = v19()
        });
    end, {});
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v31.screenSize, 
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        title = "", 
        titleContent = function() --[[ Line: 151 ]] --[[ Name: titleContent ]]
            -- upvalues: v2 (ref), v15 (ref), v31 (copy)
            return v2.createElement(v15, {
                balanceAmount = v31.balanceAmount, 
                cancelPurchaseActivated = v31.buttons.cancelPurchaseActivated
            });
        end, 
        middleContent = function() --[[ Line: 157 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v27 (ref), v31 (copy)
            return v2.createElement(v27, {
                product = v31.product, 
                balanceAmount = v31.balanceAmount, 
                isQuest = v31.isQuest, 
                isPortrait = v31.screenSize.X < v31.screenSize.Y
            });
        end, 
        buttonStackInfo = v30({
            buttons = v31.buttons, 
            isQuest = v31.isQuest
        }), 
        footerContent = function() --[[ Line: 169 ]] --[[ Name: footerContent ]]
            -- upvalues: v2 (ref), v16 (ref)
            return v2.createElement(v16);
        end
    });
end;
return function(v33) --[[ Line: 175 ]] --[[ Name: RobuxUpsellModalTooExpensiveContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v32 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        RobuxUpsellModalTooExpensive = v2.createElement(v32, v33)
    });
end;