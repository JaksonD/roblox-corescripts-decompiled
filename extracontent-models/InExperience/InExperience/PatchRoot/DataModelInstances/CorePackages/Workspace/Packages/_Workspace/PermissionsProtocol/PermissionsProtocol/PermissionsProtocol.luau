local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaPermissionContactAccess);
local l_GetFFlagLuaEnableShowUpsellMethod_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaEnableShowUpsellMethod;
local v6 = game:DefineFastFlag("ScopedSubscribersForPermissionsProtocol", false);
local _ = require(script.Parent.PermissionsProtocolTypes);
game:DefineFastFlag("DebugRomarkAudioPermissionsBypass", false);
local v8 = {
    CAMERA_ACCESS = "CAMERA_ACCESS", 
    MICROPHONE_ACCESS = "MICROPHONE_ACCESS", 
    LOCAL_NETWORK = "LOCAL_NETWORK", 
    CONTACTS_ACCESS = "CONTACTS_ACCESS", 
    WRITE_MEDIA_STORAGE = "WRITE_MEDIA_STORAGE", 
    POST_NOTIFICATIONS = "POST_NOTIFICATIONS"
};
local v9 = {
    AUTHORIZED = "AUTHORIZED", 
    DENIED = "DENIED", 
    RESTRICTED = "RESTRICTED", 
    UNSUPPORTED = "UNSUPPORTED"
};
local v10 = {
    SHOW = "SHOW", 
    HIDE = "HIDE", 
    UNSUPPORTED = "UNSUPPORTED"
};
local v11 = v3.array(v3.valueOf(v8));
local v12 = v3.valueOf(v9);
local v13 = v3.valueOf(v10);
local v14 = {
    Permissions = v8, 
    Status = v9, 
    UpsellStatus = v10, 
    PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "PermissionsRequest", 
        validateParams = v3.strictInterface({
            permissions = v11
        })
    }, 
    PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "PermissionsRequest", 
        validateParams = v3.strictInterface({
            status = v12, 
            missingPermissions = v11
        })
    }, 
    HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "HasPermissions", 
        validateParams = v3.strictInterface({
            permissions = v11
        })
    }, 
    HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "HasPermissions", 
        validateParams = v3.strictInterface({
            status = v12, 
            missingPermissions = v11
        })
    }, 
    SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "SupportsPermissions", 
        validateParams = v3.strictInterface({
            includeStatus = v3.literal(false)
        })
    }, 
    SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "SupportsPermissions", 
        validateParams = v3.strictInterface({
            permissions = v11
        })
    }, 
    SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "ShouldShowPermissionUpsell", 
        validateParams = v3.strictInterface({
            permissions = v11
        })
    }, 
    SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "ShouldShowPermissionUpsell", 
        validateParams = v3.strictInterface({
            hiddenUpsellPermissions = v11, 
            upsellStatus = v13
        })
    }, 
    SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "ShouldShowRequestPermissionRationale", 
        validateParams = v3.strictInterface({
            permissions = v11
        })
    }, 
    SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "ShouldShowRequestPermissionRationale", 
        validateParams = v3.strictInterface({
            hiddenUpsellPermissions = v11, 
            upsellStatus = v13
        })
    }
};
v14.__index = v14;
local function v19(v15) --[[ Line: 146 ]] --[[ Name: getPermissionRequestTelemetryData ]]
    -- upvalues: v14 (copy), v4 (copy)
    local v16 = {};
    for _, v18 in pairs(v15) do
        if v18 == v14.Permissions.CAMERA_ACCESS then
            v16.camera_access_requested = "";
        end;
        if v18 == v14.Permissions.MICROPHONE_ACCESS then
            v16.microphone_access_requested = "";
        end;
        if v18 == v14.Permissions.LOCAL_NETWORK then
            v16.local_network_requested = "";
        end;
        if v18 == v14.Permissions.CONTACTS_ACCESS and v4() then
            v16.contacts_access_requested = "";
        end;
    end;
    return v16;
end;
local function v29(v20, v21, v22, v23, v24) --[[ Line: 165 ]] --[[ Name: createSequencedProtocolMethodCall ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy)
    assert(v22.validateParams(v23));
    local v28 = (v20[v21] or v2.resolve()):finally(function() --[[ Line: 176 ]]
        -- upvalues: l_MessageBus_0 (ref), v22 (copy), v23 (copy), v24 (copy), v2 (ref), v21 (copy)
        l_MessageBus_0.publishProtocolMethodRequest(v22, v23, v24);
        return v2.new(function(v25) --[[ Line: 178 ]]
            -- upvalues: l_MessageBus_0 (ref), v21 (ref)
            local v26 = l_MessageBus_0.Subscriber.new();
            v26:subscribeProtocolMethodResponse(v21, function(v27) --[[ Line: 180 ]]
                -- upvalues: v26 (copy), v21 (ref), v25 (copy)
                v26:unsubscribeToProtocolMethodResponse(v21);
                v25(v27);
            end);
        end);
    end);
    v20[v21] = v28;
    return v28;
end;
v14.new = function() --[[ Line: 191 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), l_MessageBus_0 (copy), v14 (copy)
    return (setmetatable({
        activeCalls = if v6 then {} else nil, 
        subscriber = if v6 then nil else l_MessageBus_0.Subscriber.new()
    }, v14));
end;
v14.hasPermissions = function(v30, v31) --[[ Line: 209 ]] --[[ Name: hasPermissions ]]
    -- upvalues: v6 (copy), v29 (copy), v19 (copy), v2 (copy), l_MessageBus_0 (copy)
    if v6 then
        local l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v30.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        local l_HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0 = v30.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR;
        return (v29(v30.activeCalls, l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, l_HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0, {
            permissions = v31
        }, (v19(v31))));
    else
        local v38 = v2.new(function(v34, _) --[[ Line: 218 ]]
            -- upvalues: v30 (copy)
            local l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 = v30.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v30.subscriber:subscribeProtocolMethodResponse(l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1, function(v37) --[[ Line: 220 ]]
                -- upvalues: v30 (ref), l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 (copy), v34 (copy)
                v30.subscriber:unsubscribeToProtocolMethodResponse(l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1);
                v34(v37);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v30.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v31
        }, (v19(v31)));
        return v38;
    end;
end;
v14.requestPermissions = function(v39, v40) --[[ Line: 240 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v14 (copy), v2 (copy), v6 (copy), v29 (copy), v19 (copy), l_MessageBus_0 (copy)
    if game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
        local v41 = {
            missingPermissions = {}, 
            status = v14.Status.AUTHORIZED
        };
        return v2.resolve(v41);
    elseif v6 then
        local l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v39.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        local l_PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0 = v39.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR;
        return (v29(v39.activeCalls, l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, l_PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0, {
            permissions = v40
        }, (v19(v40))));
    else
        local v48 = v2.new(function(v44, _) --[[ Line: 257 ]]
            -- upvalues: v39 (copy)
            local l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 = v39.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v39.subscriber:subscribeProtocolMethodResponse(l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1, function(v47) --[[ Line: 259 ]]
                -- upvalues: v39 (ref), l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 (copy), v44 (copy)
                v39.subscriber:unsubscribeToProtocolMethodResponse(l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1);
                v44(v47);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v39.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v40
        }, (v19(v40)));
        return v48;
    end;
end;
v14.getSupportedPermissionsList = function(v49) --[[ Line: 277 ]] --[[ Name: getSupportedPermissionsList ]]
    -- upvalues: v6 (copy), v29 (copy), v2 (copy), l_MessageBus_0 (copy)
    if v6 then
        local l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v49.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        local l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0 = v49.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR;
        return (v29(v49.activeCalls, l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0, {
            includeStatus = false
        }, {}));
    else
        local v56 = v2.new(function(v52, _) --[[ Line: 286 ]]
            -- upvalues: v49 (copy)
            local l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 = v49.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v49.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1, function(v55) --[[ Line: 288 ]]
                -- upvalues: v49 (ref), l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 (copy), v52 (copy)
                v49.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1);
                v52(v55);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v49.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v56;
    end;
end;
v14.supportsPermissions = function(v57, v58) --[[ Line: 307 ]] --[[ Name: supportsPermissions ]]
    -- upvalues: v11 (copy), v2 (copy)
    assert(v11(v58));
    return (v57:getSupportedPermissionsList():andThen(function(v59) --[[ Line: 310 ]]
        -- upvalues: v58 (copy), v2 (ref)
        local v60 = v59 and v59.permissions;
        if v60 then
            for _, v62 in pairs(v58) do
                local v63 = false;
                for _, v65 in pairs(v60) do
                    if v62 == v65 then
                        v63 = true;
                        break;
                    end;
                end;
                if not v63 then
                    return v2.resolve(false);
                end;
            end;
            return v2.resolve(true);
        else
            return v2.reject();
        end;
    end));
end;
v14.checkOrRequestPermissions = function(v66, v67) --[[ Line: 349 ]] --[[ Name: checkOrRequestPermissions ]]
    -- upvalues: v11 (copy), v2 (copy), v14 (copy)
    assert(v11(v67));
    return v66:supportsPermissions(v67):andThen(function(v68) --[[ Line: 352 ]]
        -- upvalues: v2 (ref), v14 (ref), v66 (copy), v67 (copy)
        if not v68 then
            return v2.resolve(v14.Status.UNSUPPORTED);
        else
            return (v66:hasPermissions(v67):andThen(function(v69) --[[ Line: 359 ]]
                -- upvalues: v14 (ref), v2 (ref), v66 (ref), v67 (ref)
                if v69.status == v14.Status.AUTHORIZED then
                    return v2.resolve(v69.status);
                else
                    return v66:requestPermissions(v67):andThen(function(v70) --[[ Line: 365 ]]
                        -- upvalues: v2 (ref)
                        return v2.resolve(v70.status);
                    end);
                end;
            end));
        end;
    end, function(_) --[[ Line: 371 ]]
        -- upvalues: v2 (ref), v14 (ref)
        return v2.resolve(v14.Status.UNSUPPORTED);
    end);
end;
v14.shouldShowUpsell = function(v72, v73) --[[ Line: 386 ]] --[[ Name: shouldShowUpsell ]]
    -- upvalues: l_GetFFlagLuaEnableShowUpsellMethod_0 (copy), v2 (copy), v6 (copy), v29 (copy), v19 (copy), l_MessageBus_0 (copy)
    if not l_GetFFlagLuaEnableShowUpsellMethod_0() then
        return v2.resolve({});
    elseif v6 then
        local l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v72.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        local l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0 = v72.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR;
        return (v29(v72.activeCalls, l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0, {
            permissions = v73
        }, (v19(v73))));
    else
        local v80 = v2.new(function(v76, _) --[[ Line: 399 ]]
            -- upvalues: v72 (copy)
            local l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 = v72.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v72.subscriber:subscribeProtocolMethodResponse(l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1, function(v79) --[[ Line: 401 ]]
                -- upvalues: v72 (ref), l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 (copy), v76 (copy)
                v72.subscriber:unsubscribeToProtocolMethodResponse(l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1);
                v76(v79);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v72.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v73
        }, (v19(v73)));
        return v80;
    end;
end;
v14.shouldShowRationale = function(v81, v82) --[[ Line: 422 ]] --[[ Name: shouldShowRationale ]]
    -- upvalues: v6 (copy), v29 (copy), v19 (copy), v2 (copy), l_MessageBus_0 (copy)
    if v6 then
        local l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v81.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        local l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0 = v81.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR;
        return (v29(v81.activeCalls, l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR_0, {
            permissions = v82
        }, (v19(v82))));
    else
        local v89 = v2.new(function(v85, _) --[[ Line: 431 ]]
            -- upvalues: v81 (copy)
            local l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 = v81.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v81.subscriber:subscribeProtocolMethodResponse(l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1, function(v88) --[[ Line: 433 ]]
                -- upvalues: v81 (ref), l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1 (copy), v85 (copy)
                v81.subscriber:unsubscribeToProtocolMethodResponse(l_SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_1);
                v85(v88);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v81.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v82
        }, (v19(v82)));
        return v89;
    end;
end;
v14.default = v14.new();
return v14;