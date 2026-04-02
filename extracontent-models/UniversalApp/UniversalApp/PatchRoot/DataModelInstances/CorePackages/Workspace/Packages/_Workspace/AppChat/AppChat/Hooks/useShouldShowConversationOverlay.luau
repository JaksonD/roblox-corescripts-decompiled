local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ConversationOverlay_0 = require(l_Parent_0.AppChatNetworking).Constants.ConversationOverlay;
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local v7 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = true, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = l_FFlagAppChatEnableDoubleOptIn_0, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = l_FFlagAppChatEnableDoubleOptIn_0
};
return function(v8) --[[ Line: 20 ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), v7 (copy), l_ConversationOverlay_0 (copy), v3 (copy)
    local v10 = l_useSelector_0(function(v9) --[[ Line: 21 ]]
        -- upvalues: v4 (ref), v8 (copy)
        return v4(v9, (("ChatAppReducer.Modals.conversationOverlays.%*.modal_variant"):format(v8))) or "";
    end);
    local v11 = v7[v10];
    if not v11 and v10 ~= l_ConversationOverlay_0.None and v10 ~= "" then
        v3:warning((("Unsupported ConversationOverlay modal variant: %* for conversationId: %*"):format(v10, v8)));
    end;
    return not not v11;
end;