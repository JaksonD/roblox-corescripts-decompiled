local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Actions.ErrorOccurred);
local v3 = require(l_Parent_0.Actions.SubscriptionPurchaseInfoReceived);
local v4 = require(l_Parent_0.Enums.PromptState);
local v5 = require(l_Parent_0.Enums.PurchaseError);
local v6 = require(l_Parent_0.Thunk);
return function(v7) --[[ Line: 13 ]] --[[ Name: resolveSubscriptionPromptState ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy), v5 (copy), v1 (copy), v4 (copy)
    return v6.new(script.Name, nil, function(v8, _) --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v7 (copy), v2 (ref), v5 (ref), v1 (ref), v4 (ref)
        v8:dispatch(v3(v7));
        if v7.CanPurchase == false then
            return v8:dispatch(v2(v5.AlreadySubscribed));
        else
            return v8:dispatch(v1(v4.PromptSubscriptionPurchase));
        end;
    end);
end;