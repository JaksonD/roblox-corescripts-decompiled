local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v5 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local _ = require(l_script_FirstAncestor_0.types);
local v7 = require(l_script_FirstAncestor_0.Actions.handleBackButtonAction);
local v8 = require(l_script_FirstAncestor_0.Actions.performRobloxSubscriptionPurchase);
local v9 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
local v10 = require(script.Parent.RobloxSubscriptionPriceRow);
local v11 = require(script.Parent.RobloxSubscriptionFeatureList);
local v12 = require(l_Parent_0.SignalsReact);
local v13 = require(l_script_FirstAncestor_0.Hooks.useNativePurchaseFinishedListener);
local v14 = require(l_script_FirstAncestor_0.Hooks.useMembershipChangedListener);
local v15 = require(l_script_FirstAncestor_0.Hooks.useSubscriptionPollingTimeoutGuard);
local v16 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v17 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v18 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local l_Sheet_0 = v3.Sheet;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_Enums_0 = v3.Enums;
local l_IconName_0 = l_Enums_0.IconName;
local l_DialogSize_0 = l_Enums_0.DialogSize;
local v26 = {
    [v4.SubscriptionPurchaseUIReady] = true, 
    [v4.SubscriptionPurchaseInProgress] = true, 
    [v4.SubscriptionStatusPolling] = true
};
local v27 = {
    [v4.SubscriptionPurchaseInProgress] = true, 
    [v4.SubscriptionStatusPolling] = true
};
local function _(v28) --[[ Line: 57 ]]
    -- upvalues: v4 (copy), v18 (copy), v17 (copy), v8 (copy)
    if v28 == v4.SubscriptionPurchaseUIReady then
        return function() --[[ Line: 59 ]]
            -- upvalues: v18 (ref), v17 (ref), v8 (ref)
            v18(v17.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
            v8();
        end;
    else
        return function() --[[ Line: 66 ]]

        end;
    end;
end;
return function() --[[ Line: 69 ]] --[[ Name: RobloxSubscriptionContainer ]]
    -- upvalues: v5 (copy), v12 (copy), v4 (copy), v18 (copy), v17 (copy), v8 (copy), v16 (copy), v13 (copy), v14 (copy), v15 (copy), v2 (copy), v26 (copy), v27 (copy), l_Sheet_0 (copy), v9 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_IconName_0 (copy), v7 (copy), v10 (copy), v11 (copy), v3 (copy)
    local v30 = v5.get();
    local v31 = v12.useSignalState(v30.getPromptState);
    local v32 = v31 == v4.SubscriptionPurchaseUIReady and function() --[[ Line: 59 ]]
        -- upvalues: v18 (ref), v17 (ref), v8 (ref)
        v18(v17.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
        v8();
    end or function() --[[ Line: 66 ]]

    end;
    local v33 = v12.useSignalState(v30.getPurchaseUIOptions);
    local v34 = v16({
        buttonText = "Feature.RobloxSubscription.Action.Subscribe", 
        title = "Feature.RobloxSubscription.Title.GetBlackbird"
    });
    v13();
    v14();
    v15();
    local v36 = v2.useCallback(function(v35) --[[ Line: 85 ]]
        -- upvalues: v18 (ref), v17 (ref)
        if v35 then
            v18(v17.RobloxSubscriptionUpsellModalShownCounter);
        end;
    end, {
        v33
    });
    local v37 = v26[v31] == true;
    local v38 = v27[v31] == true;
    return v37 and v2.createElement(l_Sheet_0.Root, {
        onClose = function() --[[ Line: 99 ]] --[[ Name: onClose ]]
            -- upvalues: v9 (ref)
            v9();
        end, 
        preferCenterSheet = true, 
        size = l_DialogSize_0.Medium
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            View = v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "auto-xy gap-small row"
            }, {
                BackButton = if v30.getPurchaseUIOptions().showBackButton then v2.createElement(l_Text_0, {
                    Text = ("%*"):format((l_getIconRichText_0(l_IconName_0.ChevronLargeLeft))), 
                    tag = "auto-xy text-heading-small content-emphasis text-align-x-center", 
                    RichText = true, 
                    onActivated = v7
                }) else nil, 
                Title = v2.createElement(l_Text_0, {
                    Text = ("%* %*"):format(l_getIconRichText_0(l_IconName_0.PaperAirplane), v33.title or v34.title), 
                    tag = "auto-xy text-heading-small content-emphasis text-align-x-center", 
                    RichText = true
                })
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            ContentContainer = v2.createElement(l_View_0, {
                tag = "col", 
                Size = UDim2.new(1, 0, 0, 125)
            }, {
                PriceRow = v2.createElement(v10, {
                    layoutOrder = 1
                }), 
                FeatureList = v2.createElement(v11, {
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
                    ref = v36, 
                    text = v34.buttonText, 
                    onActivated = v32, 
                    fillBehavior = v3.Enums.FillBehavior.Fill, 
                    variant = v3.Enums.ButtonVariant.Emphasis, 
                    isLoading = v38
                })
            })
        })
    }) or nil;
end;