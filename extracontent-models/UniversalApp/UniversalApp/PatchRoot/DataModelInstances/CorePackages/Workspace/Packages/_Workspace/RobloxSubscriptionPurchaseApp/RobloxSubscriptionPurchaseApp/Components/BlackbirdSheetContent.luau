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
local v17 = require(script.Parent.LegalDisclosure);
local v18 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v19 = require(l_script_FirstAncestor_0.Actions.performRobloxSubscriptionPurchase);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v21 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v22 = require(l_script_FirstAncestor_0.Utils.logSubscriptionPurchaseFlowEvent);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest);
local v24 = require(l_script_FirstAncestor_0.Utils.isRobloxSubscriptionProductFreeTrial);
local v25 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v26 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v27 = require(l_Parent_0.SignalsReact);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagSupportFreeTrial);
local v29 = {
    [v26.SubscriptionPurchaseInProgress] = true, 
    [v26.SubscriptionStatusPolling] = true
};
return function() --[[ Line: 53 ]] --[[ Name: useBlackbirdSheetSlots ]]
    -- upvalues: v18 (copy), v27 (copy), l_useLocalization_0 (copy), v24 (copy), v3 (copy), v23 (copy), v22 (copy), v21 (copy), v25 (copy), v19 (copy), v29 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_IconName_0 (copy), v4 (copy), v15 (copy), v16 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), v17 (copy), v28 (copy)
    local v30 = v18.get();
    local v31 = v27.useSignalState(v30.getPurchaseUIOptions);
    local v32 = v27.useSignalState(v30.getPromptState);
    local v33 = l_useLocalization_0({
        title = "Feature.RobloxSubscription.Title.GetBlackbird", 
        buttonText = "Feature.RobloxSubscription.Action.Subscribe", 
        getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree"
    });
    local v34 = v27.useSignalState(v30.getRobloxSubscriptionProduct);
    local v35 = v24(v34);
    local v37 = v3.useCallback(function(v36) --[[ Line: 67 ]]
        -- upvalues: v23 (ref), v22 (ref), v21 (ref), v25 (ref)
        if v36 then
            if v23 then
                v22("SubscriptionUpsellModalShown");
            end;
            v21(v25.RobloxSubscriptionUpsellModalShownCounter);
        end;
    end, {});
    local function v38() --[[ Line: 78 ]] --[[ Name: onSubscribe ]]
        -- upvalues: v23 (ref), v22 (ref), v21 (ref), v25 (ref), v19 (ref)
        if v23 then
            v22("SubscriptionUpsellSubscribeClicked");
        end;
        v21(v25.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
        v19();
    end;
    local v39 = v29[v32] == true;
    return {
        Header = v3.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            View = v3.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row gap-small auto-xy"
            }, {
                BackButton = if v31.showBackButton then v3.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = ("%*"):format((l_getIconRichText_0(l_IconName_0.ChevronLargeLeft))), 
                    tag = "gap-small auto-xy text-heading-small text-align-x-center content-emphasis", 
                    RichText = true, 
                    onActivated = v4
                }) else nil, 
                Title = v3.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = ("%* %*"):format(l_getIconRichText_0(l_IconName_0.RobloxPlus), v31.title or v33.title), 
                    tag = "auto-xy text-heading-small text-align-x-center content-emphasis", 
                    RichText = true
                })
            })
        }), 
        Content = v3.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            ContentContainer = v3.createElement(l_View_0, {
                tag = "col", 
                Size = UDim2.new(1, 0, 0, 140)
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
            ActionsContainer = v3.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap align-x-center gap-medium size-full-0 auto-xy"
            }, {
                SubscribeButton = v3.createElement(l_Button_0, {
                    LayoutOrder = 1, 
                    ref = v37, 
                    text = if v35 then v33.getFreeTrialText else v33.buttonText, 
                    onActivated = v38, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    isLoading = v39
                }), 
                LegalDisclosure = v3.createElement(v17, {
                    layoutOrder = 2, 
                    ctaText = if v35 then v33.getFreeTrialText else v33.buttonText, 
                    isFreeTrial = if v28 then v35 else nil
                })
            })
        })
    };
end;