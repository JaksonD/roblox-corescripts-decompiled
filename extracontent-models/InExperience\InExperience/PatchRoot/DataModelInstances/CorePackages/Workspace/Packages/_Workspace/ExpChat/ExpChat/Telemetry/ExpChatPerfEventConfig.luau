local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatScrollPerfTracking);
local v2 = nil;
local v3 = {};
local v4 = {};
local v5 = {
    TTI = "TTI", 
    Interval = "Interval"
};
local v6 = {
    ChatWindowMountTTI = "ChatWindowMountTTI", 
    ChatWindowTabSwitchTTI = "ChatWindowTabSwitchTTI", 
    MessageSendToWindowRenderInterval = "MessageSendToWindowRenderInterval", 
    MessageReceiveToWindowRenderInterval = "MessageReceiveToWindowRenderInterval", 
    ChatWindowScrollInterval = "ChatWindowScrollInterval"
};
local v23 = {
    [v6.ChatWindowMountTTI] = {
        type = v5.TTI, 
        baseName = "ChatWindowMountTTI", 
        canFinish = function(_) --[[ Line: 57 ]] --[[ Name: canFinish ]]
            return true;
        end, 
        onStart = function(_) --[[ Line: 60 ]] --[[ Name: onStart ]]

        end
    }, 
    [v6.ChatWindowTabSwitchTTI] = {
        type = v5.TTI, 
        baseName = "ChatWindowTabSwitchTTI", 
        canFinish = function(v9) --[[ Line: 65 ]] --[[ Name: canFinish ]]
            -- upvalues: v2 (ref)
            return (v9 and v9.tabId) == v2;
        end, 
        onStart = function(v10) --[[ Line: 69 ]] --[[ Name: onStart ]]
            -- upvalues: v2 (ref)
            v2 = if v10 then v10.tabId else nil;
        end
    }, 
    [v6.MessageSendToWindowRenderInterval] = {
        type = v5.Interval, 
        name = "MessageSendToWindowRenderInterval", 
        intervalMetrics = {
            "duration", 
            "averageFPS", 
            "longestFrameTime"
        }, 
        canStart = function(_) --[[ Line: 77 ]] --[[ Name: canStart ]]
            -- upvalues: v4 (ref)
            local v12 = v4.timestamp or 0;
            local v13 = true;
            if v4.id ~= nil then
                v13 = v12 + 5 < os.clock();
            end;
            return v13;
        end, 
        canFinish = function(v14) --[[ Line: 81 ]] --[[ Name: canFinish ]]
            -- upvalues: v4 (ref)
            return v14 and v14.messageId == v4.id;
        end, 
        onStart = function(v15) --[[ Line: 84 ]] --[[ Name: onStart ]]
            -- upvalues: v4 (ref)
            if v15 then
                v4 = {
                    id = v15.messageId, 
                    timestamp = os.clock()
                };
            end;
        end, 
        onFinish = function(_) --[[ Line: 92 ]] --[[ Name: onFinish ]]
            -- upvalues: v4 (ref)
            v4 = {};
        end
    }, 
    [v6.MessageReceiveToWindowRenderInterval] = {
        type = v5.Interval, 
        name = "MessageReceiveToWindowRenderInterval", 
        intervalMetrics = {
            "duration", 
            "averageFPS", 
            "longestFrameTime"
        }, 
        canStart = function(_) --[[ Line: 100 ]] --[[ Name: canStart ]]
            -- upvalues: v3 (ref)
            local v18 = v3.timestamp or 0;
            local v19 = true;
            if v3.id ~= nil then
                v19 = v18 + 5 < os.clock();
            end;
            return v19;
        end, 
        canFinish = function(v20) --[[ Line: 104 ]] --[[ Name: canFinish ]]
            -- upvalues: v3 (ref)
            return v20 and v20.messageId == v3.id;
        end, 
        onStart = function(v21) --[[ Line: 107 ]] --[[ Name: onStart ]]
            -- upvalues: v3 (ref)
            if v21 then
                v3 = {
                    id = v21.messageId, 
                    timestamp = os.clock()
                };
            end;
        end, 
        onFinish = function(_) --[[ Line: 115 ]] --[[ Name: onFinish ]]
            -- upvalues: v3 (ref)
            v3 = {};
        end
    }
};
if v1 then
    v23[v6.ChatWindowScrollInterval] = {
        type = v5.Interval, 
        name = "ChatWindowScrollInterval", 
        intervalMetrics = {
            "averageFPS", 
            "longestFrameTime"
        }, 
        canStart = function() --[[ Line: 126 ]] --[[ Name: canStart ]]
            return true;
        end, 
        canFinish = function() --[[ Line: 129 ]] --[[ Name: canFinish ]]
            return true;
        end, 
        onStart = function() --[[ Line: 132 ]] --[[ Name: onStart ]]

        end, 
        onFinish = function() --[[ Line: 133 ]] --[[ Name: onFinish ]]

        end
    };
end;
return {
    EventTypes = v5, 
    Events = v6, 
    EventConfig = v23
};