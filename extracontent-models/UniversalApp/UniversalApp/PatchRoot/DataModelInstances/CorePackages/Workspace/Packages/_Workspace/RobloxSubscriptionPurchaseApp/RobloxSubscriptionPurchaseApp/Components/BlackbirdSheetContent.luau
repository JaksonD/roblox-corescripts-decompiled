local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Actions.handleBackButtonAction);
local l_View_0 = v2.View;
local l_Sheet_0 = v2.Sheet;
local l_Text_0 = v2.Text;
local l_Button_0 = v2.Button;
local l_getIconRichText_0 = v2.Utility.getIconRichText;
local l_Enums_0 = v2.Enums;
local l_IconName_0 = l_Enums_0.IconName;
local l_FillBehavior_0 = l_Enums_0.FillBehavior;
local l_ButtonVariant_0 = l_Enums_0.ButtonVariant;
local _ = require(l_script_FirstAncestor_0.types);
local v15 = require(script.Parent.RobloxSubscriptionPriceRow);
local v16 = require(script.Parent.RobloxSubscriptionFeatureList);
local v17 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v18 = require(l_script_FirstAncestor_0.Actions.performRobloxSubscriptionPurchase);
local v19 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v20 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v21 = require(l_script_FirstAncestor_0.Utils.isRobloxSubscriptionProductFreeTrial);
local v22 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v23 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v24 = require(l_Parent_0.SignalsReact);
local v25 = {
    [v23.SubscriptionPurchaseInProgress] = true, 
    [v23.SubscriptionStatusPolling] = true
};
return function() --[[ Line: 48 ]] --[[ Name: useBlackbirdSheetSlots ]]
    -- upvalues: v17 (copy), v24 (copy), v19 (copy), v21 (copy), v3 (copy), v20 (copy), v22 (copy), v18 (copy), v25 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_IconName_0 (copy), v4 (copy), v15 (copy), v16 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    local v26 = v17.get();
    local v27 = v24.useSignalState(v26.getPurchaseUIOptions);
    local v28 = v24.useSignalState(v26.getPromptState);
    local v29 = v19({
        title = "Feature.RobloxSubscription.Title.GetBlackbird", 
        buttonText = "Feature.RobloxSubscription.Action.Subscribe", 
        getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree"
    });
    local v30 = v24.useSignalState(v26.getRobloxSubscriptionProduct);
    local v31 = v21(v30);
    local v33 = v3.useCallback(function(v32) --[[ Line: 62 ]]
        -- upvalues: v20 (ref), v22 (ref)
        if v32 then
            v20(v22.RobloxSubscriptionUpsellModalShownCounter);
        end;
    end, {});
    local function v34() --[[ Line: 70 ]] --[[ Name: onSubscribe ]]
        -- upvalues: v20 (ref), v22 (ref), v18 (ref)
        v20(v22.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
        v18();
    end;
    local v35 = v25[v28] == true;
    return {
        Header = v3.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            View = v3.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "auto-xy gap-small row"
            }, {
                BackButton = if v27.showBackButton then v3.createElement(l_Text_0, {
                    Text = ("%*"):format((l_getIconRichText_0(l_IconName_0.ChevronLargeLeft))), 
                    tag = "auto-xy text-heading-small content-emphasis text-align-x-center", 
                    RichText = true, 
                    onActivated = v4
                }) else nil, 
                Title = v3.createElement(l_Text_0, {
                    Text = ("%* %*"):format(l_getIconRichText_0(l_IconName_0.PaperAirplane), v27.title or v29.title), 
                    tag = "auto-xy text-heading-small content-emphasis text-align-x-center", 
                    RichText = true
                })
            })
        }), 
        Content = v3.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            ContentContainer = v3.createElement(l_View_0, {
                tag = "col", 
                Size = UDim2.new(1, 0, 0, 125)
            }, {
                PriceRow = v3.createElement(v15, {
                    layoutOrder = 1
                }), 
                FeatureList = v3.createElement(v16, {
                    layoutOrder = 2
                })
            })
        }), 
        Actions = v3.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v3.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                v3.createElement(l_Button_0, {
                    LayoutOrder = 1, 
                    ref = v33, 
                    text = if v31 then v29.getFreeTrialText else v29.buttonText, 
                    onActivated = v34, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    isLoading = v35
                })
            })
        })
    };
end;