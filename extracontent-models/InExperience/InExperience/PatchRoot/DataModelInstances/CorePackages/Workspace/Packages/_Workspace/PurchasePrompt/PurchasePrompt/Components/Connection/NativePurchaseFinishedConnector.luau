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
local v10 = require(script.Parent.ExternalEventConnection);
return (v7(nil, function(v11) --[[ Line: 48 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy), v9 (copy), v8 (copy)
    return {
        nativePurchaseFinished = function(_, _, v14) --[[ Line: 50 ]] --[[ Name: nativePurchaseFinished ]]
            -- upvalues: v11 (copy), v6 (ref), v4 (ref), v5 (ref), v9 (ref), v8 (ref)
            if v14 then
                v11(v6());
                return;
            else
                v11(v4(v5.InvalidFundsUnknown));
                v11(v9(v8.UpsellFailedNativePurchase));
                return;
            end;
        end, 
        nativePurchaseFinishedWithLocalPlayer = function(_, v16) --[[ Line: 58 ]] --[[ Name: nativePurchaseFinishedWithLocalPlayer ]]
            -- upvalues: v11 (copy), v6 (ref), v4 (ref), v5 (ref), v9 (ref), v8 (ref)
            if v16 then
                v11(v6());
                return;
            else
                v11(v4(v5.InvalidFundsUnknown));
                v11(v9(v8.UpsellFailedNativePurchase));
                return;
            end;
        end
    };
end)(function(v17) --[[ Line: 25 ]] --[[ Name: NativePurchaseFinishedConnector ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy), l_MarketplaceService_0 (copy)
    local l_nativePurchaseFinished_0 = v17.nativePurchaseFinished;
    local l_nativePurchaseFinishedWithLocalPlayer_0 = v17.nativePurchaseFinishedWithLocalPlayer;
    if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
        return l_Roact_0.createFragment({
            NativePurchase = l_Roact_0.createElement(v10, {
                event = l_MarketplaceService_0.NativePurchaseFinished, 
                callback = l_nativePurchaseFinished_0
            }), 
            NativePurchaseWithLocalPlayer = l_Roact_0.createElement(v10, {
                event = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer, 
                callback = l_nativePurchaseFinishedWithLocalPlayer_0
            })
        });
    else
        return l_Roact_0.createElement(v10, {
            event = l_MarketplaceService_0.NativePurchaseFinished, 
            callback = l_nativePurchaseFinished_0
        });
    end;
end));