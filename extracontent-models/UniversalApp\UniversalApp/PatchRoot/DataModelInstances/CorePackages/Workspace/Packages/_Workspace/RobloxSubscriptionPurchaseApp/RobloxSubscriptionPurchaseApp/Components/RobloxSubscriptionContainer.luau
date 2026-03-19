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
local v11 = require(l_Parent_0.SignalsReact);
local v12 = require(l_script_FirstAncestor_0.Hooks.useNativePurchaseFinishedListener);
local v13 = require(l_script_FirstAncestor_0.Hooks.useMembershipChangedListener);
local v14 = require(l_script_FirstAncestor_0.Hooks.useSubscriptionPollingTimeoutGuard);
local v15 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v16 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v17 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local l_Sheet_0 = v3.Sheet;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_Enums_0 = v3.Enums;
local l_IconName_0 = l_Enums_0.IconName;
local l_DialogSize_0 = l_Enums_0.DialogSize;
local v25 = {
    [v4.SubscriptionPurchaseUIReady] = true, 
    [v4.SubscriptionPurchaseInProgress] = true, 
    [v4.SubscriptionStatusPolling] = true
};
local v26 = {
    [v4.SubscriptionPurchaseInProgress] = true, 
    [v4.SubscriptionStatusPolling] = true
};
local function _(v27) --[[ Line: 54 ]]
    -- upvalues: v4 (copy), v17 (copy), v16 (copy), v6 (copy)
    if v27 == v4.SubscriptionPurchaseUIReady then
        return function() --[[ Line: 56 ]]
            -- upvalues: v17 (ref), v16 (ref), v6 (ref)
            v17(v16.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
            v6();
        end;
    else
        return function() --[[ Line: 63 ]]

        end;
    end;
end;
return function() --[[ Line: 66 ]] --[[ Name: RobloxSubscriptionContainer ]]
    -- upvalues: v5 (copy), v11 (copy), v4 (copy), v17 (copy), v16 (copy), v6 (copy), v15 (copy), v12 (copy), v13 (copy), v14 (copy), v2 (copy), v25 (copy), v26 (copy), l_Sheet_0 (copy), v7 (copy), l_DialogSize_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_IconName_0 (copy), l_View_0 (copy), v9 (copy), v10 (copy), v3 (copy)
    local v29 = v5.get();
    local v30 = v11.useSignalState(v29.getPromptState);
    local v31 = v30 == v4.SubscriptionPurchaseUIReady and function() --[[ Line: 56 ]]
        -- upvalues: v17 (ref), v16 (ref), v6 (ref)
        v17(v16.RobloxSubscriptionUpsellModalBuyButtonClickedCounter);
        v6();
    end or function() --[[ Line: 63 ]]

    end;
    local v32 = v11.useSignalState(v29.getPurchaseUIOptions);
    local v33 = v15({
        buttonText = "Feature.RobloxSubscription.Action.Subscribe", 
        title = "Feature.RobloxSubscription.Title.GetBlackbird"
    });
    v12();
    v13();
    v14();
    local v35 = v2.useCallback(function(v34) --[[ Line: 82 ]]
        -- upvalues: v17 (ref), v16 (ref)
        if v34 then
            v17(v16.RobloxSubscriptionUpsellModalShownCounter);
        end;
    end, {
        v32
    });
    local v36 = v25[v30] == true;
    local v37 = v26[v30] == true;
    return v36 and v2.createElement(l_Sheet_0.Root, {
        onClose = function() --[[ Line: 96 ]] --[[ Name: onClose ]]
            -- upvalues: v7 (ref)
            v7();
        end, 
        preferCenterSheet = true, 
        size = l_DialogSize_0.Medium
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            Title = v2.createElement(l_Text_0, {
                Text = ("%* %*"):format(l_getIconRichText_0(l_IconName_0.PaperAirplane), v32.title or v33.title), 
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
                    ref = v35, 
                    text = v33.buttonText, 
                    onActivated = v31, 
                    fillBehavior = v3.Enums.FillBehavior.Fill, 
                    variant = v3.Enums.ButtonVariant.Emphasis, 
                    isLoading = v37
                })
            })
        })
    }) or nil;
end;