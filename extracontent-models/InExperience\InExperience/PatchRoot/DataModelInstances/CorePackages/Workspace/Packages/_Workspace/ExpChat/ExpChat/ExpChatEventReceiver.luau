local l_Chat_0 = game:GetService("Chat");
local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v2 = require(l_Parent_0.React);
local l_SocialUpsellEventReceiver_0 = require(l_Parent_0.SocialUpsell).SocialUpsellEventReceiver;
return function() --[[ Line: 10 ]] --[[ Name: ExpChatEventReceiver ]]
    -- upvalues: v2 (copy), l_Chat_0 (copy), l_SocialUpsellEventReceiver_0 (copy)
    local v4 = v2.useCallback(function() --[[ Line: 11 ]]
        -- upvalues: l_Chat_0 (ref)
        if game:GetEngineFeature("ChatReconcileAccess") then
            l_Chat_0:ReconcileCommunicationAccess();
        end;
    end, {});
    return v2.createElement(l_SocialUpsellEventReceiver_0, {
        onAgeVerifiedChange = v4
    });
end;