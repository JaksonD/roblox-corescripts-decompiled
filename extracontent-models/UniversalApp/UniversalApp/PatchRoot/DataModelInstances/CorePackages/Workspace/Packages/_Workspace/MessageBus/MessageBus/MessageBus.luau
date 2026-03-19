local l_MessageBusService_0 = game:GetService("MessageBusService");
local _ = require(script.Parent.MessageBusTypes);
local v2 = game:DefineFastFlag("DisableMessageBusUnSubscribeError", false);
local v3 = game:DefineFastFlag("EnableMessageBusUnSubscribeErrorTelemetry", false);
local v4 = {};
v4.__index = v4;
v4.publish = function(v5, v6) --[[ Line: 41 ]] --[[ Name: publish ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v5.validateParams(v6));
    l_MessageBusService_0:Publish(v5.mid, v6);
end;
v4.publishProtocolMethodRequest = function(v7, v8, v9) --[[ Line: 46 ]] --[[ Name: publishProtocolMethodRequest ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v7.validateParams(v8));
    l_MessageBusService_0:PublishProtocolMethodRequest(v7.protocolName, v7.methodName, v8, v9);
end;
v4.publishProtocolMethodResponse = function(v10, v11, v12, v13) --[[ Line: 55 ]] --[[ Name: publishProtocolMethodResponse ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v10.validateParams(v11));
    l_MessageBusService_0:PublishProtocolMethodResponse(v10.protocolName, v10.methodName, v11, v12, v13);
end;
v4.getLast = function(v14) --[[ Line: 71 ]] --[[ Name: getLast ]]
    -- upvalues: l_MessageBusService_0 (copy)
    local l_l_MessageBusService_0_Last_0 = l_MessageBusService_0:GetLast(v14.mid);
    if l_l_MessageBusService_0_Last_0 == nil then
        return nil;
    else
        assert(v14.validateParams(l_l_MessageBusService_0_Last_0));
        return l_l_MessageBusService_0_Last_0;
    end;
end;
v4.getMessageId = function(v16, v17) --[[ Line: 80 ]] --[[ Name: getMessageId ]]
    -- upvalues: l_MessageBusService_0 (copy)
    return l_MessageBusService_0:GetMessageId(v16, v17);
end;
v4.getProtocolMethodRequestMessageId = function(v18, v19) --[[ Line: 84 ]] --[[ Name: getProtocolMethodRequestMessageId ]]
    -- upvalues: l_MessageBusService_0 (copy)
    return l_MessageBusService_0:GetProtocolMethodRequestMessageId(v18, v19);
end;
v4.getProtocolMethodResponseMessageId = function(v20, v21) --[[ Line: 88 ]] --[[ Name: getProtocolMethodResponseMessageId ]]
    -- upvalues: l_MessageBusService_0 (copy)
    return l_MessageBusService_0:GetProtocolMethodResponseMessageId(v20, v21);
end;
v4.call = function(v22, v23) --[[ Line: 92 ]] --[[ Name: call ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v22.validateParams(v23));
    return l_MessageBusService_0:Call(v22.fid, v23);
end;
local v24 = {};
v24.__index = v24;
v24.new = function() --[[ Line: 100 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy)
    return (setmetatable({
        connections = {}
    }, v24));
end;
v24.getSubscriptionCount = function(v25) --[[ Line: 107 ]] --[[ Name: getSubscriptionCount ]]
    local v26 = 0;
    for _ in pairs(v25.connections) do
        v26 = v26 + 1;
    end;
    return v26;
end;
v24.subscribe = function(v28, v29, v30, v31, v32) --[[ Line: 115 ]] --[[ Name: subscribe ]]
    -- upvalues: l_MessageBusService_0 (copy)
    local v33 = true;
    if v31 ~= nil then
        v33 = v31;
    end;
    local v34 = false;
    if v32 ~= nil then
        v34 = v32;
    end;
    local l_mid_0 = v29.mid;
    if v28.connections[l_mid_0] ~= nil then
        v28:unsubscribe(v29);
    end;
    local v36 = l_MessageBusService_0:Subscribe(l_mid_0, v30, v34, v33);
    v28.connections[l_mid_0] = v36;
end;
v24.subscribeProtocolMethodRequest = function(v37, v38, v39, v40, v41) --[[ Line: 128 ]] --[[ Name: subscribeProtocolMethodRequest ]]
    -- upvalues: v4 (copy), l_MessageBusService_0 (copy)
    local v42 = true;
    if v40 ~= nil then
        v42 = v40;
    end;
    local v43 = false;
    if v41 ~= nil then
        v43 = v41;
    end;
    local l_protocolName_0 = v38.protocolName;
    local l_methodName_0 = v38.methodName;
    local v46 = v4.getProtocolMethodRequestMessageId(l_protocolName_0, l_methodName_0);
    if v37.connections[v46] ~= nil then
        v37:unsubscribeWithMsgId(v46);
    end;
    local v47 = l_MessageBusService_0:SubscribeToProtocolMethodRequest(l_protocolName_0, l_methodName_0, v39, v43, v42);
    v37.connections[v46] = v47;
end;
v24.subscribeProtocolMethodResponse = function(v48, v49, v50, v51, v52) --[[ Line: 148 ]] --[[ Name: subscribeProtocolMethodResponse ]]
    -- upvalues: v4 (copy), l_MessageBusService_0 (copy)
    local v53 = true;
    if v51 ~= nil then
        v53 = v51;
    end;
    local v54 = false;
    if v52 ~= nil then
        v54 = v52;
    end;
    local l_protocolName_1 = v49.protocolName;
    local l_methodName_1 = v49.methodName;
    local v57 = v4.getProtocolMethodResponseMessageId(l_protocolName_1, l_methodName_1);
    if v48.connections[v57] ~= nil then
        v48:unsubscribeWithMsgId(v57);
    end;
    local v58 = l_MessageBusService_0:SubscribeToProtocolMethodResponse(l_protocolName_1, l_methodName_1, v50, v54, v53);
    v48.connections[v57] = v58;
end;
v24.unsubscribeToProtocolMethodRequest = function(v59, v60) --[[ Line: 168 ]] --[[ Name: unsubscribeToProtocolMethodRequest ]]
    -- upvalues: l_MessageBusService_0 (copy)
    v59:unsubscribeWithMsgId(l_MessageBusService_0:GetProtocolMethodRequestMessageId(v60.protocolName, v60.methodName));
end;
v24.unsubscribeToProtocolMethodResponse = function(v61, v62) --[[ Line: 172 ]] --[[ Name: unsubscribeToProtocolMethodResponse ]]
    -- upvalues: l_MessageBusService_0 (copy)
    v61:unsubscribeWithMsgId(l_MessageBusService_0:GetProtocolMethodResponseMessageId(v62.protocolName, v62.methodName));
end;
v24.unsubscribe = function(v63, v64) --[[ Line: 176 ]] --[[ Name: unsubscribe ]]
    v63:unsubscribeWithMsgId(v64.mid);
end;
v24.unsubscribeWithMsgId = function(v65, v66) --[[ Line: 180 ]] --[[ Name: unsubscribeWithMsgId ]]
    -- upvalues: v2 (copy), v3 (copy), l_MessageBusService_0 (copy)
    local v67 = v65.connections[v66];
    if v67 == nil then
        if v2 then
            if v3 then
                local v68 = {
                    err = "unsubscribing from a message id not subscribed to: " .. v66
                };
                local v69 = {
                    eventType = "RobloxTelemetry", 
                    config = {
                        eventName = "MessageBusErrorEvent", 
                        backends = {
                            "Points"
                        }, 
                        throttlingPercentage = 10000, 
                        lastUpdated = {
                            24, 
                            11, 
                            20
                        }, 
                        description = "Report MessageBus errors to Points\"", 
                        links = ""
                    }, 
                    data = {
                        standardizedFields = nil, 
                        customFields = v68, 
                        eventContext = nil
                    }
                };
                l_MessageBusService_0:Call("Telemetry.logEventFromLua", v69);
            end;
            return;
        else
            error("unsubscribing from a message id not subscribed to: " .. v66);
        end;
    end;
    v65.connections[v66] = nil;
    v67:Disconnect();
end;
v24.unsubscribeFromAllMessages = function(v70) --[[ Line: 223 ]] --[[ Name: unsubscribeFromAllMessages ]]
    for v71, v72 in pairs(v70.connections) do
        v70.connections[v71] = nil;
        v72:Disconnect();
    end;
end;
v4.Subscriber = v24;
return v4;