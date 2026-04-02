local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v4 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v5 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v6 = require(l_script_FirstAncestor_0.Thunks.retryAfterUpsell);
local v7 = require(l_script_FirstAncestor_0.connectToStore);
local v8 = require(l_script_FirstAncestor_0.Enums.Counter);
local v9 = require(l_script_FirstAncestor_0.Thunks.sendCounter);
local v10 = require(l_script_FirstAncestor_0.Thunks.handleNativePurchaseFailureOrCancel);
local v11 = require(script.Parent.ExternalEventConnection);
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
return (v7(nil, function(v13) --[[ Line: 51 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v10 (copy), v4 (copy), v5 (copy), v9 (copy), v8 (copy)
    return {
        nativePurchaseFinished = function(_, _, v16) --[[ Line: 53 ]] --[[ Name: nativePurchaseFinished ]]
            -- upvalues: v13 (copy), v6 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v10 (ref), v4 (ref), v5 (ref), v9 (ref), v8 (ref)
            if v16 then
                v13(v6());
                return;
            elseif l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then
                v13(v10());
                return;
            else
                v13(v4(v5.InvalidFundsUnknown));
                v13(v9(v8.UpsellFailedNativePurchase));
                return;
            end;
        end, 
        nativePurchaseFinishedWithLocalPlayer = function(_, v18) --[[ Line: 65 ]] --[[ Name: nativePurchaseFinishedWithLocalPlayer ]]
            -- upvalues: v13 (copy), v6 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v10 (ref), v4 (ref), v5 (ref), v9 (ref), v8 (ref)
            if v18 then
                v13(v6());
                return;
            elseif l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then
                v13(v10());
                return;
            else
                v13(v4(v5.InvalidFundsUnknown));
                v13(v9(v8.UpsellFailedNativePurchase));
                return;
            end;
        end
    };
end)(function(v19) --[[ Line: 28 ]] --[[ Name: NativePurchaseFinishedConnector ]]
    -- upvalues: l_Roact_0 (copy), v11 (copy), l_MarketplaceService_0 (copy)
    local l_nativePurchaseFinished_0 = v19.nativePurchaseFinished;
    local l_nativePurchaseFinishedWithLocalPlayer_0 = v19.nativePurchaseFinishedWithLocalPlayer;
    if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
        return l_Roact_0.createFragment({
            NativePurchase = l_Roact_0.createElement(v11, {
                event = l_MarketplaceService_0.NativePurchaseFinished, 
                callback = l_nativePurchaseFinished_0
            }), 
            NativePurchaseWithLocalPlayer = l_Roact_0.createElement(v11, {
                event = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer, 
                callback = l_nativePurchaseFinishedWithLocalPlayer_0
            })
        });
    else
        return l_Roact_0.createElement(v11, {
            event = l_MarketplaceService_0.NativePurchaseFinished, 
            callback = l_nativePurchaseFinished_0
        });
    end;
end));