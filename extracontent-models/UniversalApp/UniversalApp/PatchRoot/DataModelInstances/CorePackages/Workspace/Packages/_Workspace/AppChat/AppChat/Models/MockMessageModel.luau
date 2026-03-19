local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_GenerateStringId_0 = require(l_Parent_0.AppCommonLib).GenerateStringId;
local v3 = require(script.Parent.MessageModel);
local v8 = {
    mock = function(v4) --[[ Line: 11 ]] --[[ Name: mock ]]
        -- upvalues: v3 (copy), l_GenerateStringId_0 (copy), l_DateTime_0 (copy)
        local v5 = v3.new();
        v5.id = l_GenerateStringId_0();
        v5.senderTargetId = l_GenerateStringId_0();
        v5.conversationId = l_GenerateStringId_0();
        v5.senderType = v3.SenderTypes.User;
        v5.content = "MESSAGE CONTENT";
        v5.messageType = v3.MessageTypes.PlainText;
        v5.read = false;
        v5.sent = l_DateTime_0.now();
        v5.previousMessageId = nil;
        v5.filteredForReceivers = false;
        if v4 ~= nil then
            for v6, v7 in pairs(v4) do
                v5[v6] = v7;
            end;
        end;
        return v5;
    end
};
setmetatable(v8, {
    __index = v3
});
return v8;