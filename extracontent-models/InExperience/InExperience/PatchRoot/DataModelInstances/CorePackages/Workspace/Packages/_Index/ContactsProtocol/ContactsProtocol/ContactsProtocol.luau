local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local _ = require(script.Parent.ContactsProtocolTypes);
local v5 = v3.strictInterface({
    firstName = v3.optional(v3.string), 
    lastName = v3.optional(v3.string), 
    phoneNumbers = v3.optional(v3.table)
});
local v6 = {
    GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "getContacts", 
        validateParams = v3.table
    }, 
    GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "getContacts", 
        validateParams = v5
    }, 
    SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "SupportsContacts", 
        validateParams = v3.table
    }, 
    SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "SupportsContacts", 
        validateParams = v3.table
    }
};
v6.__index = v6;
v6.new = function() --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v6 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v6));
end;
v6.getContacts = function(v7) --[[ Line: 68 ]] --[[ Name: getContacts ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy)
    local v12 = v2.new(function(v8, _) --[[ Line: 69 ]]
        -- upvalues: v7 (copy)
        local l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v7.GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v7.subscriber:subscribeProtocolMethodResponse(l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v11) --[[ Line: 71 ]]
            -- upvalues: v7 (ref), l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v8 (copy)
            v7.subscriber:unsubscribeToProtocolMethodResponse(l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v8(v11);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v7.GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        includeVariable = false
    }, {});
    return v12;
end;
v6.supportsContacts = function(v13) --[[ Line: 96 ]] --[[ Name: supportsContacts ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy)
    local v18 = v2.new(function(v14, _) --[[ Line: 97 ]]
        -- upvalues: v13 (copy)
        local l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v13.SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v13.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v17) --[[ Line: 99 ]]
            -- upvalues: v13 (ref), l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v14 (copy)
            v13.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v14(v17.support);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v13.SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        includeStatus = false
    }, {});
    return v18;
end;
v6.default = v6.new();
return v6;