local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger:new("SendGameLinkMessagePolicy");
local l_MessageModel_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Models.MessageModel;
local l_DEPRECATED_ChatSendGameLinkMessage_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests.DEPRECATED_ChatSendGameLinkMessage;
local l_SendChatMessagePolicy_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.SendPolicies.SendChatMessagePolicy;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v6 = require(l_CorePackages_0.Packages.HttpRequest);
local v10 = v6.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: requestFunction ]]
        -- upvalues: v1 (copy), v6 (copy)
        v1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
        return v6.requestFunctions.HttpRbxApi(v7, v8, v9);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("SendGameLinkMessagePolicyHttpRetryCount", 4) else nil
});
local v11 = setmetatable({}, l_SendChatMessagePolicy_0);
v11.__index = v11;
v11.new = function(v12, v13, v14, v15, v16, v17, v18) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: l_SendChatMessagePolicy_0 (copy)
    local v19 = l_SendChatMessagePolicy_0:new(v13);
    setmetatable(v19, v12);
    v19.universeId = v14;
    v19.decorators = v15;
    v19.isExperienceInvite = v16;
    v19.userId = v17;
    v19.placeId = v18;
    return v19;
end;
v11.sendMessage = function(v20, _) --[[ Line: 48 ]] --[[ Name: sendMessage ]]
    -- upvalues: l_DEPRECATED_ChatSendGameLinkMessage_0 (copy), v10 (copy)
    return l_DEPRECATED_ChatSendGameLinkMessage_0(v10, v20.conversationId, v20.universeId, v20.decorators, v20.isExperienceInvite or false, v20.userId or 0, v20.placeId or 0);
end;
v11.sendingMessagePayload = function(v22) --[[ Line: 60 ]] --[[ Name: sendingMessagePayload ]]
    -- upvalues: l_MessageModel_0 (copy)
    return {
        messageType = l_MessageModel_0.MessageTypes.Link, 
        link = {
            type = l_MessageModel_0.LinkTypes.Game, 
            game = {
                universeId = v22.universeId
            }
        }
    };
end;
return v11;