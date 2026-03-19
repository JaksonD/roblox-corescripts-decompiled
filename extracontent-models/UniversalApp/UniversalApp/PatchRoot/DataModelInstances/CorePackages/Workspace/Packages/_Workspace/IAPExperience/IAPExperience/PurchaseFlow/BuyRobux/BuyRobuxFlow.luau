local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_0.BuyRobuxFlowState);
local v6 = require(l_Parent_1.Generic.Constants);
local v7 = require(l_Parent_1.Generic.LoadingOverlay);
local v8 = require(l_Parent_1.Generic.LoadingOverlayState);
local v9 = require(l_Parent_1.BuyRobux.BuyRobuxPage);
local v10 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v11 = require(l_Parent_1.Generic.U13ConfirmPrompt);
local v12 = require(l_Parent_1.Utility.getModalShownEventData);
local v13 = require(l_Parent_1.Utility.getUserInputEventData);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v15 = v4.Component:extend(script.Name);
v15.init = function(v16) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    v16.state = {
        analyticId = if v16.props.analyticId then v16.props.analyticId else l_HttpService_0:GenerateGUID(false)
    };
end;
v15.didUpdate = function(v17, v18, _) --[[ Line: 68 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v17.props;
    if v18.purchaseState ~= l_props_0.purchaseState then
        v17:reportModalShown();
        v17:dispatchAndRenderModal(l_props_0);
    end;
end;
v15.dispatchAndRenderModal = function(v21, v22) --[[ Line: 78 ]] --[[ Name: dispatchAndRenderModal ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), v10 (copy), v11 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    if v22.purchaseState == v5.Error then
        v22.dispatchCentralOverlay(v6.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
            shouldAnimate = v22.shouldAnimate, 
            shouldShow = v22.purchaseState == v5.Error, 
            renderChildren = function() --[[ Line: 83 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), v10 (ref), v22 (copy), v21 (copy)
                return v4.createElement(v10, {
                    screenSize = v22.screenSize, 
                    errorType = v22.errorType, 
                    economicRestrictionError = v22.economicRestrictionError, 
                    doneControllerIcon = v22.acceptControllerIcon, 
                    doneActivated = function() --[[ Line: 92 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v21 (ref), v22 (ref)
                        v21:reportUserInput("Done");
                        v22.flowComplete();
                        v22.dispatchCentralOverlay();
                    end
                });
            end
        });
        return;
    elseif v22.purchaseState == v5.PurchaseWarning then
        v22.dispatchCentralOverlay(v6.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
            shouldAnimate = v22.shouldAnimate, 
            shouldShow = v22.purchaseState == v5.PurchaseWarning, 
            renderChildren = function() --[[ Line: 107 ]] --[[ Name: renderChildren ]]
                -- upvalues: v4 (ref), v11 (ref), v22 (copy), v21 (copy)
                return v4.createElement(v11, {
                    screenSize = v22.screenSize, 
                    modalType = v22.u13ConfirmType, 
                    doneActivated = function() --[[ Line: 113 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v21 (ref), v22 (ref)
                        v21:reportUserInput("Confirm");
                        v22.acceptPurchaseWarning();
                        v22.dispatchCentralOverlay();
                    end, 
                    cancelActivated = function() --[[ Line: 118 ]] --[[ Name: cancelActivated ]]
                        -- upvalues: v21 (ref), v22 (ref)
                        v21:reportUserInput("Cancel");
                        v22.cancelPurchase();
                        v22.dispatchCentralOverlay();
                    end
                });
            end
        });
        return;
    else
        if v22.purchaseState == v5.PurchaseVPC then
            v22.dispatchCentralOverlay(v6.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
                shouldAnimate = v22.shouldAnimate, 
                shouldShow = v22.purchaseState == v5.PurchaseVPC, 
                renderChildren = function() --[[ Line: 133 ]] --[[ Name: renderChildren ]]
                    -- upvalues: v4 (ref), l_VerifiedParentalConsentDialog_0 (ref), v22 (copy), v21 (copy)
                    return v4.createElement(l_VerifiedParentalConsentDialog_0, {
                        screenSize = v22.screenSize, 
                        isActionable = false, 
                        modalType = v22.purchaseVPCType, 
                        onDismiss = function() --[[ Line: 138 ]] --[[ Name: onDismiss ]]
                            -- upvalues: v21 (ref), v22 (ref)
                            v21:reportUserInput("Close");
                            v22.flowComplete();
                            v22.dispatchCentralOverlay();
                        end
                    });
                end
            });
        end;
        return;
    end;
end;
v15.reportModalShown = function(v23) --[[ Line: 149 ]] --[[ Name: reportModalShown ]]
    -- upvalues: v12 (copy), v5 (copy)
    local l_props_1 = v23.props;
    local l_state_0 = v23.state;
    if not v23.props.onAnalyticEvent then
        return;
    else
        local v26 = v12(l_state_0.analyticId, "", "BuyRobux", v5.toRawValue(l_props_1.purchaseState));
        l_props_1.onAnalyticEvent("UserPurchaseFlow", v26);
        return;
    end;
end;
v15.reportUserInput = function(v27, v28) --[[ Line: 163 ]] --[[ Name: reportUserInput ]]
    -- upvalues: v13 (copy), v5 (copy)
    local l_props_2 = v27.props;
    local l_state_1 = v27.state;
    if not v27.props.onAnalyticEvent then
        return;
    else
        local v31 = v13(l_state_1.analyticId, "", "BuyRobux", v5.toRawValue(l_props_2.purchaseState), v28);
        l_props_2.onAnalyticEvent("UserPurchaseFlow", v31);
        return;
    end;
end;
v15.purchaseStateToOverlayState = function(_, v33) --[[ Line: 182 ]] --[[ Name: purchaseStateToOverlayState ]]
    -- upvalues: v5 (copy), v8 (copy)
    if v33 == v5.Loading then
        return v8.Loading;
    elseif v33 == v5.RobuxPurchasePending then
        return v8.PurchasingRobux;
    elseif v33 == v5.RobuxGrantPending then
        return v8.WaitingForRobux;
    elseif v33 == v5.PurchaseWarning then
        return v8.None;
    elseif v33 == v5.None then
        return v8.None;
    else
        return nil;
    end;
end;
v15.render = function(v34) --[[ Line: 198 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v9 (copy), v5 (copy), v7 (copy)
    local l_props_3 = v34.props;
    local l_state_2 = v34.state;
    local l_purchaseState_0 = l_props_3.purchaseState;
    local v38 = v34:purchaseStateToOverlayState(l_props_3.purchaseState);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        BuyRobuxFrame = v4.createElement(v9, {
            showCloseButton = l_props_3.showCloseButton, 
            showBackground = l_props_3.showBackground, 
            isConsoleSize = l_props_3.isConsoleSize, 
            robuxBalance = l_props_3.robuxBalance, 
            robuxPackages = l_props_3.robuxPackages, 
            robuxPackageActivated = function(v39) --[[ Line: 217 ]] --[[ Name: robuxPackageActivated ]]
                -- upvalues: v34 (copy), l_props_3 (copy)
                v34:reportUserInput("Confirm");
                l_props_3.purchaseRobux(v39);
            end, 
            onPageClose = l_props_3.onPageClose, 
            hasNativePurchaseSucceeded = l_purchaseState_0 == v5.Succeed, 
            shouldAnimate = l_props_3.shouldAnimate, 
            analyticId = l_state_2.analyticId, 
            onAnalyticEvent = l_props_3.onAnalyticEvent
        }), 
        LoadingOverlay = v4.createElement(v7, {
            shouldAnimate = false, 
            showOverlay = v38 ~= nil, 
            loadingState = v38
        })
    });
end;
return v15;