local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v4 = require(l_Parent_0.React);
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_Parent_0.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v8 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v8.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local v11 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v12 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v13 = require(l_script_FirstAncestor_0.Thunks.launchPremiumUpsell);
local v14 = require(l_script_FirstAncestor_0.Thunks.sendEvent);
local v15 = require(l_script_FirstAncestor_0.connectToStore);
local v16 = require(l_script_FirstAncestor_0.Thunks.initiatePremiumPrecheck);
local v17 = require(l_script_FirstAncestor_0.Components.Connection.ExternalEventConnection);
local v18 = require(script.Parent.PremiumUpsellOverlay);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local v20 = l_Roact_0.Component:extend(script.Name);
v20.init = function(v21) --[[ Line: 33 ]] --[[ Name: init ]]
    v21.state = {
        screenSize = Vector2.new(0, 0)
    };
    v21.changeScreenSize = function(v22) --[[ Line: 38 ]]
        -- upvalues: v21 (copy)
        if v21.state.screenSize ~= v22.AbsoluteSize then
            v21:setState({
                screenSize = v22.AbsoluteSize
            });
        end;
    end;
    v21.savedSelectedCoreObject = nil;
    v21.endPurchase = function() --[[ Line: 46 ]]
        -- upvalues: v21 (copy)
        v21:restoreSelectedObject();
        v21.props.completeRequest();
    end;
end;
v20.saveSelectedObject = function(v23) --[[ Line: 52 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy)
    v23.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
end;
v20.restoreSelectedObject = function(v24) --[[ Line: 57 ]] --[[ Name: restoreSelectedObject ]]
    -- upvalues: l_CoreGui_0 (copy), l_GuiService_0 (copy)
    if v24.savedSelectedCoreObject == nil or v24.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0) then
        l_GuiService_0.SelectedCoreObject = v24.savedSelectedCoreObject;
    end;
end;
v20.createElement = function(v25) --[[ Line: 64 ]] --[[ Name: createElement ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), v18 (copy), v17 (copy), l_GuiService_0 (copy)
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    if l_props_0.requestType ~= v11.Premium then
        return nil;
    else
        v25:saveSelectedObject();
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [l_Roact_0.Change.AbsoluteSize] = v25.changeScreenSize, 
            BackgroundTransparency = 1
        }, {
            Prompt = l_Roact_0.createElement(v18, {
                screenSize = l_state_0.screenSize, 
                promptState = l_props_0.promptState, 
                purchaseError = l_props_0.purchaseError, 
                economicRestrictionError = l_props_0.economicRestrictionError, 
                currencySymbol = l_props_0.premiumProductInfo.currencySymbol, 
                robuxPrice = l_props_0.premiumProductInfo.price, 
                robuxAmount = l_props_0.premiumProductInfo.robuxAmount, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                promptPremiumPurchase = l_props_0.promptPremiumPurchase, 
                dispatchPremiumPrecheck = l_props_0.dispatchPremiumPrecheck, 
                endPurchase = v25.endPurchase, 
                onAnalyticEvent = l_props_0.onAnalyticEvent
            }), 
            ModalFix = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }), 
            OnCoreGuiMenuOpened = l_Roact_0.createElement(v17, {
                event = l_GuiService_0.MenuOpened, 
                callback = function() --[[ Line: 106 ]] --[[ Name: callback ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.completeRequest();
                end
            })
        });
    end;
end;
v20.render = function(v28) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_Roact_0 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if v19() then
        return l_Roact_0.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                PremiumUpsellContainer = v28:createElement()
            })
        });
    else
        return v28:createElement();
    end;
end;
return (v15(function(v29) --[[ Line: 129 ]]
    return {
        requestType = v29.promptRequest.requestType, 
        promptState = v29.promptState, 
        purchaseError = v29.purchaseError, 
        economicRestrictionError = v29.economicRestrictionError, 
        premiumProductInfo = v29.premiumProductInfo, 
        isGamepadEnabled = v29.gamepadEnabled
    };
end, function(v30) --[[ Line: 141 ]]
    -- upvalues: v13 (copy), v12 (copy), v14 (copy), v16 (copy)
    return {
        promptPremiumPurchase = function() --[[ Line: 143 ]] --[[ Name: promptPremiumPurchase ]]
            -- upvalues: v30 (copy), v13 (ref)
            return v30(v13());
        end, 
        completeRequest = function() --[[ Line: 146 ]] --[[ Name: completeRequest ]]
            -- upvalues: v30 (copy), v12 (ref)
            return v30(v12());
        end, 
        onAnalyticEvent = function(v31, v32) --[[ Line: 149 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v30 (copy), v14 (ref)
            return v30(v14(v31, v32));
        end, 
        dispatchPremiumPrecheck = function() --[[ Line: 152 ]] --[[ Name: dispatchPremiumPrecheck ]]
            -- upvalues: v30 (copy), v16 (ref)
            return v30(v16());
        end
    };
end)(v20));