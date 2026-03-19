local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v5 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v6 = require(l_script_FirstAncestor_0.Actions.performRobloxSubscriptionPurchase);
local v7 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
local _ = require(l_script_FirstAncestor_0.types);
local v9 = require(script.Parent.RobloxSubscriptionPriceRow);
local v10 = require(script.Parent.RobloxSubscriptionFeatureList);
local v11 = require(l_script_FirstAncestor_0.Hooks.useNativePurchaseFinishedListener);
local v12 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v13 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v14 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local l_Sheet_0 = v3.Sheet;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_Enums_0 = v3.Enums;
local l_IconName_0 = l_Enums_0.IconName;
local l_DialogSize_0 = l_Enums_0.DialogSize;
local function _(v22) --[[ Line: 38 ]]
    -- upvalues: v4 (copy), v14 (copy), v13 (copy), v6 (copy)
    if v22 == v4.SubscriptionPurchaseUIReady then
        return function() --[[ Line: 40 ]]
            -- upvalues: v14 (ref), v13 (ref), v6 (ref)
            v14(v13.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
            v6();
        end;
    else
        return function() --[[ Line: 47 ]]

        end;
    end;
end;
return function() --[[ Line: 50 ]] --[[ Name: RobloxSubscriptionContainer ]]
    -- upvalues: v5 (copy), v4 (copy), v14 (copy), v13 (copy), v6 (copy), v12 (copy), v11 (copy), v2 (copy), l_Sheet_0 (copy), v7 (copy), l_DialogSize_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_IconName_0 (copy), l_View_0 (copy), v9 (copy), v10 (copy), v3 (copy)
    local v24 = v5.get();
    local v25 = v24.getPromptState(false) == v4.SubscriptionPurchaseUIReady and function() --[[ Line: 40 ]]
        -- upvalues: v14 (ref), v13 (ref), v6 (ref)
        v14(v13.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
        v6();
    end or function() --[[ Line: 47 ]]

    end;
    local v26 = v24.getPurchaseUIOptions(false);
    local v27 = v12({
        buttonText = "Feature.RobloxSubscription.Action.Subscribe", 
        title = "Feature.RobloxSubscription.Title.GetBlackbird"
    });
    v11();
    local v29 = v2.useCallback(function(v28) --[[ Line: 63 ]]
        -- upvalues: v14 (ref), v13 (ref)
        if v28 then
            v14(v13.RobloxSubscriptionUpsellModalShownCounter);
        end;
    end, {
        v26
    });
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v7, 
        preferCenterSheet = true, 
        size = l_DialogSize_0.Medium
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            Title = v2.createElement(l_Text_0, {
                Text = ("%* %*"):format(l_getIconRichText_0(l_IconName_0.PaperAirplane), v26.title or v27.title), 
                tag = "auto-xy text-heading-small content-emphasis text-align-x-center", 
                RichText = true
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            ContentContainer = v2.createElement(l_View_0, {
                tag = "col", 
                Size = UDim2.new(1, 0, 0, 125)
            }, {
                PriceRow = v2.createElement(v9, {
                    layoutOrder = 1
                }), 
                FeatureList = v2.createElement(v10, {
                    layoutOrder = 2
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                v2.createElement(v3.Button, {
                    LayoutOrder = 1, 
                    ref = v29, 
                    text = v27.buttonText, 
                    onActivated = v25, 
                    fillBehavior = v3.Enums.FillBehavior.Fill, 
                    variant = v3.Enums.ButtonVariant.Emphasis
                })
            })
        })
    });
end;