local v0 = nil;
local v1 = {};
local v2 = {};
local v3 = {
    TTI = "TTI", 
    Interval = "Interval"
};
local v4 = {
    ChatWindowMountTTI = "ChatWindowMountTTI", 
    ChatWindowTabSwitchTTI = "ChatWindowTabSwitchTTI", 
    MessageSendToWindowRenderInterval = "MessageSendToWindowRenderInterval", 
    MessageReceiveToWindowRenderInterval = "MessageReceiveToWindowRenderInterval"
};
local v21 = {
    [v4.ChatWindowMountTTI] = {
        type = v3.TTI, 
        baseName = "ChatWindowMountTTI", 
        canFinish = function(_) --[[ Line: 54 ]] --[[ Name: canFinish ]]
            return true;
        end, 
        onStart = function(_) --[[ Line: 57 ]] --[[ Name: onStart ]]

        end
    }, 
    [v4.ChatWindowTabSwitchTTI] = {
        type = v3.TTI, 
        baseName = "ChatWindowTabSwitchTTI", 
        canFinish = function(v7) --[[ Line: 62 ]] --[[ Name: canFinish ]]
            -- upvalues: v0 (ref)
            return (v7 and v7.tabId) == v0;
        end, 
        onStart = function(v8) --[[ Line: 66 ]] --[[ Name: onStart ]]
            -- upvalues: v0 (ref)
            v0 = if v8 then v8.tabId else nil;
        end
    }, 
    [v4.MessageSendToWindowRenderInterval] = {
        type = v3.Interval, 
        name = "MessageSendToWindowRenderInterval", 
        intervalMetrics = {
            "duration", 
            "averageFPS", 
            "longestFrameTime"
        }, 
        canStart = function(_) --[[ Line: 74 ]] --[[ Name: canStart ]]
            -- upvalues: v2 (ref)
            local v10 = v2.timestamp or 0;
            local v11 = true;
            if v2.id ~= nil then
                v11 = v10 + 5 < os.clock();
            end;
            return v11;
        end, 
        canFinish = function(v12) --[[ Line: 78 ]] --[[ Name: canFinish ]]
            -- upvalues: v2 (ref)
            return v12 and v12.messageId == v2.id;
        end, 
        onStart = function(v13) --[[ Line: 81 ]] --[[ Name: onStart ]]
            -- upvalues: v2 (ref)
            if v13 then
                v2 = {
                    id = v13.messageId, 
                    timestamp = os.clock()
                };
            end;
        end, 
        onFinish = function(_) --[[ Line: 89 ]] --[[ Name: onFinish ]]
            -- upvalues: v2 (ref)
            v2 = {};
        end
    }, 
    [v4.MessageReceiveToWindowRenderInterval] = {
        type = v3.Interval, 
        name = "MessageReceiveToWindowRenderInterval", 
        intervalMetrics = {
            "duration", 
            "averageFPS", 
            "longestFrameTime"
        }, 
        canStart = function(_) --[[ Line: 97 ]] --[[ Name: canStart ]]
            -- upvalues: v1 (ref)
            local v16 = v1.timestamp or 0;
            local v17 = true;
            if v1.id ~= nil then
                v17 = v16 + 5 < os.clock();
            end;
            return v17;
        end, 
        canFinish = function(v18) --[[ Line: 101 ]] --[[ Name: canFinish ]]
            -- upvalues: v1 (ref)
            return v18 and v18.messageId == v1.id;
        end, 
        onStart = function(v19) --[[ Line: 104 ]] --[[ Name: onStart ]]
            -- upvalues: v1 (ref)
            if v19 then
                v1 = {
                    id = v19.messageId, 
                    timestamp = os.clock()
                };
            end;
        end, 
        onFinish = function(_) --[[ Line: 112 ]] --[[ Name: onFinish ]]
            -- upvalues: v1 (ref)
            v1 = {};
        end
    }
};
return {
    EventTypes = v3, 
    Events = v4, 
    EventConfig = v21
};