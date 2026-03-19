local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local l_getPartialPageModalMiddleContentWidth_0 = require(l_Parent_2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local v6 = require(l_Parent_0.SubscriptionPurchaseFlowState);
local v7 = require(l_Parent_1.Generic.Animator);
local v8 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v9 = require(l_Parent_1.Subscription.SubscriptionPurchasePrompt);
local v10 = require(l_Parent_1.Flags.getEnableDisableSubPurchase);
local v11 = require(l_Parent_1.Utility.formatSubscriptionPurchaseEventData);
local v12 = v4.Component:extend(script.Name);
local l_Generic_0 = l_Parent_1.Generic;
local v14 = require(l_Generic_0.PurchaseFlowType);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
v12.init = function(v16) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    v16.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
end;
v12.didUpdate = function(v17, v18, _) --[[ Line: 85 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v17.props;
    if v18.purchaseState ~= l_props_0.purchaseState then
        v17:reportPurchaseEvent("ViewShown");
    end;
end;
v12.reportUserInput = function(v21, v22) --[[ Line: 93 ]] --[[ Name: reportUserInput ]]
    v21:reportPurchaseEvent("UserInput", v22);
end;
v12.reportPurchaseEvent = function(v23, v24, v25) --[[ Line: 97 ]] --[[ Name: reportPurchaseEvent ]]
    -- upvalues: v11 (copy), v6 (copy)
    local l_props_1 = v23.props;
    if not l_props_1.onAnalyticEvent then
        return;
    else
        local v27 = v11(v23.state.analyticId, v24, v6.toRawValue(l_props_1.purchaseState), v25, l_props_1.subscriptionProviderId, l_props_1.subscriptionId, l_props_1.name, l_props_1.description, l_props_1.period, l_props_1.priceTier, l_props_1.displayPrice);
        l_props_1.onAnalyticEvent("SubscriptionPurchase", v27);
        return;
    end;
end;
v12.render = function(v28) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (copy), v4 (copy), v7 (copy), v6 (copy), v9 (copy), v10 (copy), v8 (copy), v14 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    local l_props_2 = v28.props;
    local l_purchaseState_0 = l_props_2.purchaseState;
    local v31 = l_getPartialPageModalMiddleContentWidth_0(l_props_2.screenSize.X);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        SubscriptionPurchasePromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.PurchaseModal, 
            shouldAnimate = true, 
            animateDown = v31 == 492, 
            renderChildren = function() --[[ Line: 135 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), v9 (ref), l_props_2 (copy), v10 (ref), v28 (copy)
                return v4.createElement(v9, {
                    name = l_props_2.name, 
                    subscriptionProviderName = l_props_2.subscriptionProviderName, 
                    displayPrice = l_props_2.displayPrice, 
                    period = l_props_2.period, 
                    disclaimerText = l_props_2.disclaimerText, 
                    description = l_props_2.description, 
                    itemIcon = l_props_2.itemIcon, 
                    disablePurchase = if not not v10() or l_props_2.shouldUseNewModalDesign then l_props_2.disablePurchase else nil, 
                    disablePurchaseText = if not not v10() or l_props_2.shouldUseNewModalDesign then l_props_2.disablePurchaseText else nil, 
                    shouldUseNewModalDesign = l_props_2.shouldUseNewModalDesign, 
                    isRobuxSubscription = l_props_2.isRobuxSubscription, 
                    creatorName = l_props_2.creatorName, 
                    creatorVerified = l_props_2.creatorVerified, 
                    primaryPaymentMethod = l_props_2.primaryPaymentMethod, 
                    secondaryPaymentMethod = l_props_2.secondaryPaymentMethod, 
                    isTestingMode = l_props_2.isTestingMode, 
                    screenSize = l_props_2.screenSize, 
                    purchaseSubscriptionActivated = function(v32) --[[ Line: 161 ]] --[[ Name: purchaseSubscriptionActivated ]]
                        -- upvalues: v28 (ref), l_props_2 (ref)
                        v28:reportUserInput("Subscribe");
                        l_props_2.purchaseSubscription(v32);
                        if l_props_2.isTestingMode then
                            l_props_2.flowComplete();
                        end;
                    end, 
                    cancelPurchaseActivated = function() --[[ Line: 168 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v28 (ref), l_props_2 (ref)
                        v28:reportUserInput("Cancel");
                        l_props_2.cancelPurchase();
                    end, 
                    onReport = if l_props_2.shouldUseNewModalDesign then l_props_2.onReport else nil, 
                    onShare = if l_props_2.shouldUseNewModalDesign then l_props_2.onShare else nil
                });
            end
        }), 
        PurchaseErrorPromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.Error, 
            shouldAnimate = true, 
            renderChildren = function() --[[ Line: 180 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), v8 (ref), l_props_2 (copy), v14 (ref), v28 (copy)
                return v4.createElement(v8, {
                    screenSize = l_props_2.screenSize, 
                    errorType = l_props_2.errorType, 
                    economicRestrictionError = l_props_2.economicRestrictionError, 
                    flowType = v14.Subscription, 
                    doneControllerIcon = l_props_2.acceptControllerIcon, 
                    doneActivated = function() --[[ Line: 189 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v28 (ref), l_props_2 (ref)
                        v28:reportUserInput("Done");
                        l_props_2.flowComplete();
                    end
                });
            end
        }), 
        PurchaseVPCPromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.PurchaseVPCModal, 
            shouldAnimate = true, 
            renderChildren = function() --[[ Line: 199 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), l_VerifiedParentalConsentDialog_0 (ref), l_props_2 (copy), v28 (copy)
                return v4.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = l_props_2.screenSize, 
                    isActionable = l_props_2.openSettingsPage ~= nil, 
                    modalType = l_props_2.purchaseVPCType, 
                    onAction = l_props_2.openSettingsPage and function() --[[ Line: 204 ]]
                        -- upvalues: v28 (ref), l_props_2 (ref)
                        v28:reportUserInput("Confirm");
                        l_props_2.openSettingsPage();
                        l_props_2.flowComplete();
                    end, 
                    onDismiss = function() --[[ Line: 209 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v28 (ref), l_props_2 (ref)
                        v28:reportUserInput("Cancel");
                        l_props_2.cancelPurchase();
                    end
                });
            end
        })
    });
end;
return v12;