local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(script.Parent.ChatConversationTelemetryEvents);
local v6 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v7 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v8 = require(l_script_FirstAncestor_0.Components.Cells.ConversationFacePile);
local v9 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v10 = require(l_script_FirstAncestor_0.Hooks.useGetUserFromId);
local v11 = require(l_script_FirstAncestor_0.Models.Conversation);
local v12 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationHeaderTCIndicator);
return function(v15) --[[ Line: 26 ]]
    -- upvalues: l_useTokens_0 (copy), v7 (copy), v6 (copy), v2 (copy), v5 (copy), v14 (copy), v9 (copy), l_useLocalUserId_0 (copy), v11 (copy), v12 (copy), v10 (copy), v3 (copy), v8 (copy)
    local v16 = l_useTokens_0();
    local v17 = v7(v6.Context);
    local v18 = v2.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v17 (copy), v5 (ref), v15 (copy)
        v17.emit(v5.ConversationInfoBtnClicked, {});
        v15.navigateToChatDetails();
    end, {
        v15.navigateToChatDetails, 
        v17
    });
    local v19 = nil;
    local v20 = nil;
    local l_titleText_0 = v15.titleText;
    if v14 then
        local v22 = v9(v15.conversationId);
        local v23 = l_useLocalUserId_0();
        local v24 = v22 and v22.conversationType == v11.Type.ONE_TO_ONE_CONVERSATION;
        local v25 = if v24 then v12(v22, v23)[1] else nil;
        local v26 = v10(v25);
        if v26 then
            l_titleText_0 = v22.title;
            v19 = ("@%*"):format(v26.name);
        end;
        v20 = v24 and true or false;
    end;
    return v2.createElement(v3.View, {
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        TitleContainer = v2.createElement(v3.View, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            cornerRadius = UDim.new(0, v16.Radius.Medium)
        }, {
            ConversationFacePile = v2.createElement(v8, {
                conversationId = v15.conversationId, 
                titleText = l_titleText_0, 
                titleStyle = v16.Typography.TitleLarge, 
                onActivated = v18, 
                subtitleText = v19, 
                trustedConnectionIndicatorEnabled = v20
            })
        })
    });
end;