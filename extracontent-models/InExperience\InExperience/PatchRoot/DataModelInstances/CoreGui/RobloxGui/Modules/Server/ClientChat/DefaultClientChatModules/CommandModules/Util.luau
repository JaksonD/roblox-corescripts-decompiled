local l_Parent_0 = script.Parent.Parent;
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.SendSystemMessageToSelf = function(_, v5, v6, v7) --[[ Line: 31 ]] --[[ Name: SendSystemMessageToSelf ]]
    -- upvalues: l_ChatConstants_0 (copy)
    v6:AddMessageToChannel({
        ID = -1, 
        FromSpeaker = nil, 
        SpeakerUserId = 0, 
        OriginalChannel = v6.Name, 
        IsFiltered = true, 
        MessageLength = string.len(v5), 
        MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v5)), 
        Message = v5, 
        MessageType = l_ChatConstants_0.MessageTypeSystem, 
        Time = os.time(), 
        ExtraData = v7
    });
end;
v2.new = function() --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v8 = setmetatable({}, v3);
    v8.COMMAND_MODULES_VERSION = 1;
    v8.KEY_COMMAND_PROCESSOR_TYPE = "ProcessorType";
    v8.KEY_PROCESSOR_FUNCTION = "ProcessorFunction";
    v8.IN_PROGRESS_MESSAGE_PROCESSOR = 0;
    v8.COMPLETED_MESSAGE_PROCESSOR = 1;
    return v8;
end;
return v2.new();