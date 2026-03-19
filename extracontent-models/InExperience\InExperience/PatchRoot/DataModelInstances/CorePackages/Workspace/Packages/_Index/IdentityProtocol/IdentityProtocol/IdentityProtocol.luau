local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaIdentityProtocol);
local l_GetFFlagLuaIdentityGetSMSOTP_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaIdentityGetSMSOTP;
local l_GetFFlagLuaIdentityGetPhoneNumber_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaIdentityGetPhoneNumber;
local l_GetFFlagLuaIdentityVerifySNA_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaIdentityVerifySNA;
local _ = require(script.Parent.IdentityProtocolTypes);
local v9 = v3.strictInterface({
    result = v3.optional(v3.string)
});
local v10 = {
    GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "getPhoneNumber", 
        validateParams = v3.table
    }, 
    GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "getPhoneNumber", 
        validateParams = v9
    }, 
    SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "supportsGetPhoneNumber", 
        validateParams = v3.table
    }, 
    SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "supportsGetPhoneNumber", 
        validateParams = v3.table
    }, 
    GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "getSMSOTP", 
        validateParams = v3.table
    }, 
    GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "getSMSOTP", 
        validateParams = v9
    }, 
    SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "supportsGetSMSOTP", 
        validateParams = v3.table
    }, 
    SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "supportsGetSMSOTP", 
        validateParams = v3.table
    }, 
    SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "supportsVerifySNA", 
        validateParams = v3.table
    }, 
    SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "supportsVerifySNA", 
        validateParams = v3.table
    }, 
    VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "verifySNA", 
        validateParams = v3.table
    }, 
    VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "IdentityProtocol", 
        methodName = "verifySNA", 
        validateParams = v3.table
    }
};
v10.__index = v10;
v10.new = function() --[[ Line: 101 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v10 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v10));
end;
v10.supportsVerifySNA = function(v11) --[[ Line: 113 ]] --[[ Name: supportsVerifySNA ]]
    -- upvalues: v4 (copy), l_GetFFlagLuaIdentityVerifySNA_0 (copy), v2 (copy), l_MessageBus_0 (copy)
    if not v4() or not l_GetFFlagLuaIdentityVerifySNA_0() then
        return v2.resolve(false);
    else
        local v16 = v2.new(function(v12, _) --[[ Line: 118 ]]
            -- upvalues: v11 (copy)
            local l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0 = v11.SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR;
            v11.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0, function(v15) --[[ Line: 120 ]]
                -- upvalues: v11 (ref), l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v12 (copy)
                v11.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0);
                v12(v15.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v11.SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, {}, {});
        return v16;
    end;
end;
v10.verifySNA = function(v17, v18) --[[ Line: 142 ]] --[[ Name: verifySNA ]]
    -- upvalues: v4 (copy), l_GetFFlagLuaIdentityVerifySNA_0 (copy), v2 (copy), l_MessageBus_0 (copy)
    if not v4() or not l_GetFFlagLuaIdentityVerifySNA_0() then
        return v2.resolve(false);
    else
        local v23 = v2.new(function(v19, _) --[[ Line: 147 ]]
            -- upvalues: v17 (copy)
            local l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0 = v17.VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR;
            v17.subscriber:subscribeProtocolMethodResponse(l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0, function(v22) --[[ Line: 149 ]]
                -- upvalues: v17 (ref), l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v19 (copy)
                v17.subscriber:unsubscribeToProtocolMethodResponse(l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0);
                v19(v22.result);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v17.VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, v18, {});
        return v23;
    end;
end;
v10.getPhoneNumber = function(v24) --[[ Line: 168 ]] --[[ Name: getPhoneNumber ]]
    -- upvalues: v4 (copy), l_GetFFlagLuaIdentityGetPhoneNumber_0 (copy), v2 (copy), l_MessageBus_0 (copy)
    if not v4() or not l_GetFFlagLuaIdentityGetPhoneNumber_0() then
        return v2.resolve();
    else
        local v29 = v2.new(function(v25, _) --[[ Line: 172 ]]
            -- upvalues: v24 (copy)
            local l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0 = v24.GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR;
            v24.subscriber:subscribeProtocolMethodResponse(l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0, function(v28) --[[ Line: 174 ]]
                -- upvalues: v24 (ref), l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v25 (copy)
                v24.subscriber:unsubscribeToProtocolMethodResponse(l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0);
                v25(v28.result);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v24.GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v29;
    end;
end;
v10.supportsGetPhoneNumber = function(v30) --[[ Line: 197 ]] --[[ Name: supportsGetPhoneNumber ]]
    -- upvalues: v4 (copy), l_GetFFlagLuaIdentityGetPhoneNumber_0 (copy), v2 (copy), l_MessageBus_0 (copy)
    if not v4() or not l_GetFFlagLuaIdentityGetPhoneNumber_0() then
        return v2.resolve();
    else
        local v35 = v2.new(function(v31, _) --[[ Line: 202 ]]
            -- upvalues: v30 (copy)
            local l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0 = v30.SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR;
            v30.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0, function(v34) --[[ Line: 204 ]]
                -- upvalues: v30 (ref), l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v31 (copy)
                v30.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0);
                v31(v34.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v30.SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v35;
    end;
end;
v10.getSMSOTP = function(v36) --[[ Line: 227 ]] --[[ Name: getSMSOTP ]]
    -- upvalues: v4 (copy), l_GetFFlagLuaIdentityGetSMSOTP_0 (copy), v2 (copy), l_MessageBus_0 (copy)
    if not v4() or not l_GetFFlagLuaIdentityGetSMSOTP_0() then
        return v2.resolve();
    else
        local v41 = v2.new(function(v37, _) --[[ Line: 231 ]]
            -- upvalues: v36 (copy)
            local l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0 = v36.GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR;
            v36.subscriber:subscribeProtocolMethodResponse(l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0, function(v40) --[[ Line: 233 ]]
                -- upvalues: v36 (ref), l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v37 (copy)
                v36.subscriber:unsubscribeToProtocolMethodResponse(l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0);
                v37(v40.result);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v36.GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v41;
    end;
end;
v10.supportsGetSMSOTP = function(v42) --[[ Line: 256 ]] --[[ Name: supportsGetSMSOTP ]]
    -- upvalues: v4 (copy), l_GetFFlagLuaIdentityGetSMSOTP_0 (copy), v2 (copy), l_MessageBus_0 (copy)
    if not v4() or not l_GetFFlagLuaIdentityGetSMSOTP_0() then
        return v2.resolve();
    else
        local v47 = v2.new(function(v43, _) --[[ Line: 261 ]]
            -- upvalues: v42 (copy)
            local l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0 = v42.SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR;
            v42.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0, function(v46) --[[ Line: 263 ]]
                -- upvalues: v42 (ref), l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v43 (copy)
                v42.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0);
                v43(v46.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v42.SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v47;
    end;
end;
v10.default = v10.new();
return v10;