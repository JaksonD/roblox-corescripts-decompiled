local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local _ = require(script.Parent.SMSProtocolTypes);
local v5 = v3.strictInterface({
    sent = v3.optional(v3.boolean)
});
local v6 = v3.strictInterface({
    address = v3.string, 
    message = v3.string
});
local v7 = {
    SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "sendSMS", 
        validateParams = v6
    }, 
    SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "sendSMS", 
        validateParams = v5
    }, 
    SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "supportsSMS", 
        validateParams = v3.table
    }, 
    SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "supportsSMS", 
        validateParams = v3.table
    }
};
v7.__index = v7;
v7.new = function() --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v7 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v7));
end;
v7.sendSMS = function(v8, v9) --[[ Line: 72 ]] --[[ Name: sendSMS ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy)
    local v14 = v2.new(function(v10, _) --[[ Line: 73 ]]
        -- upvalues: v8 (copy)
        local l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v8.SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v8.subscriber:subscribeProtocolMethodResponse(l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v13) --[[ Line: 75 ]]
            -- upvalues: v8 (ref), l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v10 (copy)
            v8.subscriber:unsubscribeToProtocolMethodResponse(l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v10(v13);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v8.SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, v9, {});
    return v14;
end;
v7.supportsSMS = function(v15) --[[ Line: 93 ]] --[[ Name: supportsSMS ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy)
    local v20 = v2.new(function(v16, _) --[[ Line: 94 ]]
        -- upvalues: v15 (copy)
        local l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v15.SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v15.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v19) --[[ Line: 96 ]]
            -- upvalues: v15 (ref), l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v16 (copy)
            v15.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v16(v19.support);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v15.SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        includeStatus = false
    }, {});
    return v20;
end;
v7.default = v7.new();
return v7;