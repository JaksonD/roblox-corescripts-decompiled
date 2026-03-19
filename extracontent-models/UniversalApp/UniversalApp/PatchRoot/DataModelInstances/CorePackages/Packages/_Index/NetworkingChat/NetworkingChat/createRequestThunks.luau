local _ = require(script.Parent.networkingChatTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createAddToConversation);
local v3 = require(l_networkRequests_0.createRemoveFromConversation);
local v4 = require(l_networkRequests_0.createRenameGroupConversation);
local v5 = require(l_networkRequests_0.createStartGroupConversation);
local v6 = require(l_networkRequests_0.createStartOneToOneConversation);
local v7 = require(l_networkRequests_0.createSetConversationUniverse);
local v8 = require(l_networkRequests_0.createResetConversationUniverse);
local v9 = require(l_networkRequests_0.createSendMessage);
local v10 = require(l_networkRequests_0.createSendGameLinkMessage);
local v11 = require(l_networkRequests_0.createUpdateUserTypingStatus);
local v12 = require(l_networkRequests_0.createMarkAsRead);
local v13 = require(l_networkRequests_0.createMarkAsSeen);
local v14 = require(l_networkRequests_0.createGetMessages);
local v15 = require(l_networkRequests_0.createGetUserConversations);
local v16 = require(l_networkRequests_0.createGetConversations);
local v17 = require(l_networkRequests_0.createGetLatestMessages);
local v18 = require(l_networkRequests_0.createGetUnreadConversationCount);
local v19 = require(l_networkRequests_0.createGetUnreadMessages);
local v20 = require(l_networkRequests_0.createGetChatSettings);
local v21 = require(l_networkRequests_0.createGetRolloutSettings);
local v22 = require(l_networkRequests_0.createGetMetadata);
return function(v23) --[[ Line: 26 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy)
    return {
        AddToConversation = v2(v23), 
        RemoveFromConversation = v3(v23), 
        RenameGroupConversation = v4(v23), 
        StartGroupConversation = v5(v23), 
        StartOneToOneConversation = v6(v23), 
        SetConversationUniverse = v7(v23), 
        ResetConversationUniverse = v8(v23), 
        SendMessage = v9(v23), 
        SendGameLinkMessage = v10(v23), 
        UpdateUserTypingStatus = v11(v23), 
        MarkAsRead = v12(v23), 
        MarkAsSeen = v13(v23), 
        GetMessages = v14(v23), 
        GetUserConversations = v15(v23), 
        GetConversations = v16(v23), 
        GetLatestMessages = v17(v23), 
        GetUnreadConversationCount = v18(v23), 
        GetUnreadMessages = v19(v23), 
        GetChatSettings = v20(v23), 
        GetRolloutSettings = v21(v23), 
        GetMetadata = v22(v23)
    };
end;