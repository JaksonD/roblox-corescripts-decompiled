local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ConversationOverlay_0 = require(l_Parent_0.AppChatNetworking).Constants.ConversationOverlay;
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
local v8 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = true, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = l_FFlagAppChatEnableDoubleOptIn_0, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = l_FFlagAppChatEnableDoubleOptIn_0, 
    [l_ConversationOverlay_0.NudgeToChatUpsell] = v7
};
return function(v9) --[[ Line: 22 ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), v8 (copy), l_ConversationOverlay_0 (copy), v3 (copy)
    local v11 = l_useSelector_0(function(v10) --[[ Line: 23 ]]
        -- upvalues: v4 (ref), v9 (copy)
        return v4(v10, (("ChatAppReducer.Modals.conversationOverlays.%*.modal_variant"):format(v9))) or "";
    end);
    local v12 = v8[v11];
    if not v12 and v11 ~= l_ConversationOverlay_0.None and v11 ~= "" then
        v3:warning((("Unsupported ConversationOverlay modal variant: %* for conversationId: %*"):format(v11, v9)));
    end;
    return not not v12;
end;