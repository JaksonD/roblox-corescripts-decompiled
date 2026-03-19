local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Roact);
local l_getPartialPageModalMiddleContentWidth_0 = require(l_Parent_2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local v7 = require(l_Parent_0.PremiumUpsellFlowState);
local v8 = require(l_Parent_1.Generic.Animator);
local v9 = require(l_Parent_1.Generic.Constants);
local v10 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v11 = require(l_Parent_1.PremiumUpsell.PremiumUpsellPrompt);
local v12 = require(l_Parent_1.Utility.getModalShownEventData);
local v13 = require(l_Parent_1.Utility.getUserInputEventData);
local v14 = require(l_Parent_1.Flags.getEnableCentralOverlayForUpsellPrompt);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v16 = game:DefineFastFlag("CompleteFlowInStudioAccept", false);
local v17 = v5.Component:extend(script.Name);
v17.init = function(v18) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    v18.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    v18.closeModal = function() --[[ Line: 69 ]]
        -- upvalues: v18 (copy)
        local l_props_0 = v18.props;
        v18:reportUserInput("Cancel");
        l_props_0.cancelPurchase();
        v18:closeCentralOverlay();
        v18:UnbindActions();
    end;
end;
v17.didUpdate = function(v20, v21, _) --[[ Line: 79 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v20.props;
    if v21.purchaseState ~= l_props_1.purchaseState then
        v20:reportModalShown();
        v20:dispatchCentralOverlayAndRenderModal(l_props_1);
    end;
end;
v17.UnbindActions = function(v24) --[[ Line: 88 ]] --[[ Name: UnbindActions ]]
    -- upvalues: v14 (copy), l_ContextActionService_0 (copy), v9 (copy)
    if v14() and v24.props.dispatchCentralOverlay then
        l_ContextActionService_0:UnbindAction(v9.CLOSE_MODAL_ACTION);
    end;
end;
v17.BindCancelAction = function(v25) --[[ Line: 94 ]] --[[ Name: BindCancelAction ]]
    -- upvalues: v14 (copy), l_ContextActionService_0 (copy), v9 (copy)
    if v14() and v25.props.dispatchCentralOverlay then
        l_ContextActionService_0:BindAction(v9.CLOSE_MODAL_ACTION, v25.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
end;
v17.closeCentralOverlay = function(v26) --[[ Line: 110 ]] --[[ Name: closeCentralOverlay ]]
    -- upvalues: v14 (copy)
    local l_props_2 = v26.props;
    if v14() and l_props_2.dispatchCentralOverlay then
        l_props_2.dispatchCentralOverlay();
    end;
end;
v17.constructPremiumUpsellPromptAnimatorObj = function(v28) --[[ Line: 118 ]] --[[ Name: constructPremiumUpsellPromptAnimatorObj ]]
    -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (copy), v7 (copy), v5 (copy), v11 (copy), v16 (copy)
    local l_props_3 = v28.props;
    local v30 = l_getPartialPageModalMiddleContentWidth_0(l_props_3.screenSize.X);
    return {
        shouldShow = l_props_3.purchaseState == v7.PurchaseModal, 
        shouldAnimate = true, 
        animateDown = v30 == 492, 
        renderChildren = function() --[[ Line: 127 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v11 (ref), l_props_3 (copy), v28 (copy), v16 (ref)
            return v5.createElement(v11, {
                screenSize = l_props_3.screenSize, 
                isCatalog = l_props_3.isCatalog, 
                currencySymbol = l_props_3.currencySymbol, 
                robuxPrice = l_props_3.robuxPrice, 
                robuxAmount = l_props_3.robuxAmount, 
                acceptControllerIcon = l_props_3.acceptControllerIcon, 
                purchasePremiumActivated = function() --[[ Line: 139 ]] --[[ Name: purchasePremiumActivated ]]
                    -- upvalues: v28 (ref), l_props_3 (ref), v16 (ref)
                    v28:reportUserInput("Subscribe");
                    l_props_3.purchasePremium();
                    if v16 and game:GetService("RunService"):IsStudio() then
                        l_props_3.flowComplete();
                    end;
                    v28:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function() --[[ Line: 147 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v28 (ref), l_props_3 (ref)
                    v28:reportUserInput("Cancel");
                    l_props_3.cancelPurchase();
                    v28:closeCentralOverlay();
                end
            });
        end
    };
end;
v17.constructPurchaseErrorPromptAnimatorObj = function(v31) --[[ Line: 157 ]] --[[ Name: constructPurchaseErrorPromptAnimatorObj ]]
    -- upvalues: v7 (copy), v5 (copy), v10 (copy)
    local l_props_4 = v31.props;
    return {
        shouldShow = l_props_4.purchaseState == v7.Error, 
        shouldAnimate = true, 
        renderChildren = function() --[[ Line: 163 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v10 (ref), l_props_4 (copy), v31 (copy)
            return v5.createElement(v10, {
                screenSize = l_props_4.screenSize, 
                errorType = l_props_4.errorType, 
                economicRestrictionError = l_props_4.economicRestrictionError, 
                doneControllerIcon = l_props_4.acceptControllerIcon, 
                doneActivated = function() --[[ Line: 172 ]] --[[ Name: doneActivated ]]
                    -- upvalues: v31 (ref), l_props_4 (ref)
                    v31:reportUserInput("Done");
                    l_props_4.flowComplete();
                    v31:closeCentralOverlay();
                end
            });
        end
    };
end;
v17.constructPurchaseVPCPromptAnimatorObj = function(v33) --[[ Line: 182 ]] --[[ Name: constructPurchaseVPCPromptAnimatorObj ]]
    -- upvalues: v7 (copy), v5 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    local l_props_5 = v33.props;
    v33:BindCancelAction();
    return {
        shouldShow = l_props_5.purchaseState == v7.PurchaseVPCModal, 
        shouldAnimate = true, 
        renderChildren = function() --[[ Line: 190 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), l_VerifiedParentalConsentDialog_0 (ref), l_props_5 (copy), v33 (copy)
            return v5.createElement(l_VerifiedParentalConsentDialog_0, {
                screenSize = l_props_5.screenSize, 
                isActionable = false, 
                modalType = l_props_5.purchaseVPCType, 
                onDismiss = function() --[[ Line: 195 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v33 (ref), l_props_5 (ref)
                    v33:reportUserInput("Cancel");
                    l_props_5.cancelPurchase();
                    v33:closeCentralOverlay();
                end
            });
        end
    };
end;
v17.dispatchCentralOverlayAndRenderModal = function(v35, v36) --[[ Line: 205 ]] --[[ Name: dispatchCentralOverlayAndRenderModal ]]
    -- upvalues: v14 (copy), v7 (copy), v9 (copy)
    if not v14() or not v36.dispatchCentralOverlay then
        return;
    else
        local l_purchaseState_0 = v36.purchaseState;
        if l_purchaseState_0 == v7.PurchaseModal then
            v36.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v35:constructPremiumUpsellPromptAnimatorObj());
        end;
        if l_purchaseState_0 == v7.Error then
            v36.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v35:constructPurchaseErrorPromptAnimatorObj());
        end;
        if l_purchaseState_0 == v7.PurchaseVPCModal then
            v36.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v35:constructPurchaseVPCPromptAnimatorObj());
        end;
        return;
    end;
end;
v17.reportModalShown = function(v38) --[[ Line: 236 ]] --[[ Name: reportModalShown ]]
    -- upvalues: v12 (copy), v7 (copy), l_HttpService_0 (copy)
    local l_props_6 = v38.props;
    local l_state_0 = v38.state;
    if not v38.props.onAnalyticEvent then
        return;
    else
        local v41 = v12(l_state_0.analyticId, l_props_6.eventPrefix, "PremiumUpsell", v7.toRawValue(l_props_6.purchaseState), l_HttpService_0:JSONEncode({
            universe_id = tostring(game.GameId)
        }));
        l_props_6.onAnalyticEvent("UserPurchaseFlow", v41);
        return;
    end;
end;
v17.reportUserInput = function(v42, v43) --[[ Line: 257 ]] --[[ Name: reportUserInput ]]
    -- upvalues: v13 (copy), v7 (copy), l_HttpService_0 (copy)
    local l_props_7 = v42.props;
    local l_state_1 = v42.state;
    if not v42.props.onAnalyticEvent then
        return;
    else
        local v46 = v13(l_state_1.analyticId, l_props_7.eventPrefix, "PremiumUpsell", v7.toRawValue(l_props_7.purchaseState), v43, l_HttpService_0:JSONEncode({
            universe_id = tostring(game.GameId)
        }));
        l_props_7.onAnalyticEvent("UserPurchaseFlow", v46);
        return;
    end;
end;
v17.getChildrenElements = function(v47) --[[ Line: 280 ]] --[[ Name: getChildrenElements ]]
    -- upvalues: v5 (copy), v8 (copy)
    return {
        PremiumUpsellPromptAnimator = v5.createElement(v8, v47:constructPremiumUpsellPromptAnimatorObj()), 
        PurchaseErrorPromptAnimator = v5.createElement(v8, v47:constructPurchaseErrorPromptAnimatorObj()), 
        PurchaseVPCPromptAnimator = v5.createElement(v8, v47:constructPurchaseVPCPromptAnimatorObj())
    };
end;
v17.render = function(v48) --[[ Line: 288 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v5 (copy)
    local l_props_8 = v48.props;
    local v50 = {};
    if not v14() or not l_props_8.dispatchCentralOverlay then
        v50 = v48:getChildrenElements();
    end;
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v50);
end;
return v17;