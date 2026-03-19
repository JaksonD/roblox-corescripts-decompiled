local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Requests_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests;
local l_DEPRECATED_ChatSendMessage_0 = l_Requests_0.DEPRECATED_ChatSendMessage;
local l_DEPRECATED_ChatStartOneToOneConversation_0 = l_Requests_0.DEPRECATED_ChatStartOneToOneConversation;
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_DEPRECATED_ChatSendGameLinkMessage_0 = l_Requests_0.DEPRECATED_ChatSendGameLinkMessage;
return function(v7, v8, v9) --[[ Line: 17 ]]
    -- upvalues: l_Players_0 (copy), v5 (copy), l_DEPRECATED_ChatStartOneToOneConversation_0 (copy), l_DEPRECATED_ChatSendMessage_0 (copy), l_DEPRECATED_ChatSendGameLinkMessage_0 (copy)
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    local v11 = nil;
    v11 = v5:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", {
        PLACENAME = v9.name
    });
    return function(_) --[[ Line: 26 ]]
        -- upvalues: l_DEPRECATED_ChatStartOneToOneConversation_0 (ref), v7 (copy), v8 (copy), l_UserId_0 (copy), l_DEPRECATED_ChatSendMessage_0 (ref), v11 (ref), v9 (copy), l_DEPRECATED_ChatSendGameLinkMessage_0 (ref)
        return l_DEPRECATED_ChatStartOneToOneConversation_0(v7, v8, l_UserId_0):andThen(function(v13) --[[ Line: 27 ]]
            -- upvalues: l_DEPRECATED_ChatSendMessage_0 (ref), v7 (ref), v11 (ref), v8 (ref), v9 (ref), l_DEPRECATED_ChatSendGameLinkMessage_0 (ref)
            local l_conversation_0 = v13.responseBody.conversation;
            return l_DEPRECATED_ChatSendMessage_0(v7, l_conversation_0.id, v11, nil, true, v8):andThen(function() --[[ Line: 30 ]]
                -- upvalues: l_conversation_0 (copy), v9 (ref), l_DEPRECATED_ChatSendGameLinkMessage_0 (ref), v7 (ref), v8 (ref)
                local function v16(v15) --[[ Line: 31 ]] --[[ Name: handleResult ]]
                    -- upvalues: l_conversation_0 (ref), v9 (ref)
                    return {
                        resultType = v15.responseBody.resultType, 
                        conversationId = l_conversation_0.id, 
                        placeId = v9.universeRootPlaceId
                    };
                end;
                return l_DEPRECATED_ChatSendGameLinkMessage_0(v7, l_conversation_0.id, v9.universeId, nil, true, v8, v9.universeRootPlaceId):andThen(v16);
            end);
        end);
    end;
end;