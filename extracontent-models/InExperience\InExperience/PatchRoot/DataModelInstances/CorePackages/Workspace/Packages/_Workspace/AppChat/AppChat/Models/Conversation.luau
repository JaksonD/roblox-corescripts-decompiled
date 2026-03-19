local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GenerateStringId_0 = require(l_Parent_0.AppCommonLib).GenerateStringId;
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v6 = require(l_Parent_0.AppChatNetworking);
local l_Players_0 = game:GetService("Players");
local function v9(v8) --[[ Line: 13 ]] --[[ Name: getMessageId ]]
    return v8.id;
end;
local function v12(v10, v11) --[[ Line: 17 ]] --[[ Name: messageSortPredicate ]]
    return v10.sent:GetUnixTimestamp() < v11.sent:GetUnixTimestamp();
end;
local function v15(v13, v14) --[[ Line: 24 ]] --[[ Name: sendingMessageSortPredicate ]]
    return v13.order < v14.order;
end;
local v16 = {
    Type = {
        MULTI_USER_CONVERSATION = "MultiUserConversation", 
        ONE_TO_ONE_CONVERSATION = "OneToOneConversation"
    }, 
    OsaAcknowledgementStatus = v6.Constants.OsaAcknowledgementStatusResponse
};
v16.IdForFakeOneOnOne = function(v17) --[[ Line: 37 ]] --[[ Name: IdForFakeOneOnOne ]]
    -- upvalues: v16 (copy)
    local l_ONE_TO_ONE_CONVERSATION_0 = v16.Type.ONE_TO_ONE_CONVERSATION;
    table.sort(v17);
    for _, v20 in ipairs(v17) do
        l_ONE_TO_ONE_CONVERSATION_0 = l_ONE_TO_ONE_CONVERSATION_0 .. "-" .. tostring(v20);
    end;
    return l_ONE_TO_ONE_CONVERSATION_0;
end;
v16.new = function() --[[ Line: 49 ]] --[[ Name: new ]]
    return {};
end;
v16.fromUser = function(v21) --[[ Line: 55 ]] --[[ Name: fromUser ]]
    -- upvalues: v16 (copy), l_OrderedMap_0 (copy), v9 (copy), v12 (copy), v15 (copy), l_GenerateStringId_0 (copy), l_Players_0 (copy), v4 (copy)
    local v22 = v16.new();
    v22.messages = l_OrderedMap_0.new(v9, v12);
    v22.sendingMessages = l_OrderedMap_0.new(v9, v15);
    v22.clientId = l_GenerateStringId_0();
    v22.initiator = nil;
    v22.hasUnreadMessages = false;
    v22.conversationType = v16.Type.ONE_TO_ONE_CONVERSATION;
    v22.participants = {
        tostring(l_Players_0.LocalPlayer.UserId), 
        v21.id
    };
    v22.usersTyping = {};
    v22.isUserLeaving = false;
    v22.fetchingOlderMessages = false;
    v22.fetchedOldestMessage = false;
    v22.serverState = v4.ServerState.NONE;
    v22.id = v16.IdForFakeOneOnOne(v22.participants);
    v22.lastUpdated = nil;
    v22.isDefaultTitle = true;
    v22.title = v21.displayName or v21.name;
    return v22;
end;
v16.empty = function(v23) --[[ Line: 81 ]] --[[ Name: empty ]]
    -- upvalues: v16 (copy), l_OrderedMap_0 (copy), v9 (copy), v12 (copy), v15 (copy), v4 (copy), l_DateTime_0 (copy)
    local v24 = v16.new();
    v24.id = "-1";
    v24.messages = l_OrderedMap_0.new(v9, v12);
    v24.sendingMessages = l_OrderedMap_0.new(v9, v15);
    v24.title = "";
    v24.initiator = "0";
    v24.hasUnreadMessages = false;
    v24.conversationType = v16.Type.MULTI_USER_CONVERSATION;
    v24.participants = {};
    v24.usersTyping = {};
    v24.isUserLeaving = false;
    v24.fetchingOlderMessages = false;
    v24.serverState = v4.ServerState.NONE;
    v24.pinnedGame = {};
    v24.lastUpdated = l_DateTime_0.now();
    v24.isDefaultTitle = true;
    v24.osaAcknowledgementStatus = v16.OsaAcknowledgementStatus.NotApplicable;
    if v23 ~= nil then
        for v25, v26 in pairs(v23) do
            v24[v25] = v26;
        end;
    end;
    return v24;
end;
v16.fromWeb = function(v27, v28) --[[ Line: 114 ]] --[[ Name: fromWeb ]]
    -- upvalues: v16 (copy), l_OrderedMap_0 (copy), v9 (copy), v12 (copy), v15 (copy), l_GenerateStringId_0 (copy), v4 (copy), l_DateTime_0 (copy)
    local v29 = v16.new();
    v29.messages = l_OrderedMap_0.new(v9, v12);
    v29.sendingMessages = l_OrderedMap_0.new(v9, v15);
    v29.id = tostring(v27.id);
    v29.clientId = v28 or l_GenerateStringId_0();
    v29.title = v27.title;
    v29.initiator = tostring(v27.initiator.targetId);
    v29.hasUnreadMessages = v27.hasUnreadMessages;
    v29.conversationType = v27.conversationType;
    v29.participants = {};
    v29.usersTyping = {};
    v29.isUserLeaving = false;
    v29.fetchingOlderMessages = false;
    v29.serverState = v4.ServerState.CREATED;
    v29.pinnedGame = {};
    if v27.conversationUniverse ~= nil then
        v29.pinnedGame.universeId = tostring(v27.conversationUniverse.universeId);
        v29.pinnedGame.rootPlaceId = tostring(v27.conversationUniverse.rootPlaceId);
    end;
    v29.lastUpdated = l_DateTime_0.fromIsoDate(v27.lastUpdated);
    v29.titleForViewer = v27.conversationTitle.titleForViewer;
    v29.isDefaultTitle = v27.conversationTitle.isDefaultTitle;
    for _, v31 in ipairs(v27.participants) do
        table.insert(v29.participants, (tostring(v31.targetId)));
    end;
    return v29;
end;
return v16;