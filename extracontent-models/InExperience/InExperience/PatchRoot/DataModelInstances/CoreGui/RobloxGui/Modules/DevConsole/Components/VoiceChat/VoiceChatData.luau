local v0 = require(script.Parent.Parent.Parent.Signal);
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v3 = {};
    setmetatable(v3, v2);
    v3._statsUpdated = v0.new();
    v3._statsData = {};
    v3._isRunning = false;
    return v3;
end;
v2.Signal = function(v4) --[[ Line: 19 ]] --[[ Name: Signal ]]
    return v4._statsUpdated;
end;
v2.getCurrentData = function(v5) --[[ Line: 23 ]] --[[ Name: getCurrentData ]]
    return v5._statsData;
end;
v2.isRunning = function(v6) --[[ Line: 27 ]] --[[ Name: isRunning ]]
    return v6._isRunning;
end;
v2.start = function(v7) --[[ Line: 31 ]] --[[ Name: start ]]
    -- upvalues: l_VoiceChatService_0 (copy)
    if l_VoiceChatService_0 and not v7._statsListenerConnection then
        v7._statsListenerConnection = l_VoiceChatService_0.VoiceChatStatsCollected:Connect(function() --[[ Line: 33 ]]
            -- upvalues: v7 (copy), l_VoiceChatService_0 (ref)
            v7._statsData = l_VoiceChatService_0:lastVoiceChatStats();
            v7._statsUpdated:Fire(v7._statsData);
        end);
        v7._isRunning = true;
    end;
end;
v2.stop = function(v8) --[[ Line: 41 ]] --[[ Name: stop ]]
    v8._isRunning = false;
    if v8._statsListenerConnection then
        v8._statsListenerConnection:Disconnect();
    end;
end;
return v2;