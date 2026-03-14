local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GenerateStringId_0 = require(l_Parent_0.AppCommonLib).GenerateStringId;
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v6 = require(script.Parent.Conversation);
local function v8(v7) --[[ Line: 11 ]] --[[ Name: getMessageId ]]
    return v7.id;
end;
local function v11(v9, v10) --[[ Line: 15 ]] --[[ Name: messageSortPredicate ]]
    return v9.sent:GetUnixTimestamp() < v10.sent:GetUnixTimestamp();
end;
local function v14(v12, v13) --[[ Line: 22 ]] --[[ Name: sendingMessageSortPredicate ]]
    return v12.order < v13.order;
end;
local v15 = {};
v15.__index = v15;
v15.mock = function(v16) --[[ Line: 29 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy), l_OrderedMap_0 (copy), v8 (copy), v11 (copy), v14 (copy), l_GenerateStringId_0 (copy), v4 (copy), l_DateTime_0 (copy)
    local v17 = v6.new();
    v17.messages = l_OrderedMap_0.new(v8, v11);
    v17.sendingMessages = l_OrderedMap_0.new(v8, v14);
    v17.id = l_GenerateStringId_0();
    v17.clientId = l_GenerateStringId_0();
    v17.title = "";
    v17.initiator = l_GenerateStringId_0();
    v17.hasUnreadMessages = false;
    v17.conversationType = v6.Type.MULTI_USER_CONVERSATION;
    v17.participants = {};
    v17.usersTyping = {};
    v17.isUserLeaving = false;
    v17.fetchingOlderMessages = false;
    v17.fetchedOldestMessage = false;
    v17.serverState = v4.ServerState.NONE;
    v17.pinnedGame = {};
    v17.pinnedGame.universeId = l_GenerateStringId_0();
    v17.pinnedGame.rootPlaceId = l_GenerateStringId_0();
    v17.lastUpdated = l_DateTime_0.now();
    v17.titleForViewer = "title";
    v17.isDefaultTitle = true;
    if v16 ~= nil then
        for v18, v19 in pairs(v16) do
            v17[v18] = v19;
        end;
    end;
    setmetatable(v17, {
        __index = v6
    });
    return v17;
end;
return v15;