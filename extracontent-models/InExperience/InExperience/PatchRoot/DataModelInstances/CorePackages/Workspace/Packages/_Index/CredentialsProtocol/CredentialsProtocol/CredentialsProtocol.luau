local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local _ = require(script.Parent.CredentialsProtocolTypes);
local v6 = {
    FIDO2 = "FIDO2", 
    password = "password", 
    all = "all", 
    iosKeychainPassword = "iosKeychainPassword", 
    keystore = "keystore"
};
local v7 = v3.strictInterface({
    keyType = v3.optional(v3.string), 
    publicKey = v3.interface({
        challenge = v3.string, 
        timeout = v3.optional(v3.number), 
        rpId = v3.optional(v3.string), 
        allowCredentials = v3.optional(v3.table), 
        userVerification = v3.optional(v3.string), 
        attestation = v3.optional(v3.string), 
        extensions = v3.optional(v3.table)
    }), 
    deviceBoundOnly = v3.optional(v3.boolean)
});
local v8 = {
    [v6.FIDO2] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v7
    }), 
    [v6.all] = v3.strictInterface({
        FIDO2 = v3.optional(v7), 
        password = v3.optional(v3.strictInterface({
            username = v3.optional(v3.string)
        }))
    }), 
    [v6.iosKeychainPassword] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.interface({
            server = v3.optional(v3.string)
        })
    }), 
    [v6.keystore] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.interface({
            server = v3.optional(v3.string), 
            key = v3.optional(v3.string)
        })
    })
};
local v9 = v3.strictInterface({
    id = v3.optional(v3.string), 
    rawId = v3.optional(v3.string), 
    type = v3.optional(v3.string), 
    response = v3.interface({
        authenticatorData = v3.string, 
        clientDataJSON = v3.string, 
        signature = v3.string, 
        userHandle = v3.optional(v3.string)
    }), 
    errorCode = v3.optional(v3.string), 
    errorMsg = v3.optional(v3.string)
});
local v10 = {
    [v6.FIDO2] = v9, 
    [v6.all] = v3.strictInterface({
        credentialType = v3.string, 
        response = v3.union(v9, v3.strictInterface({
            username = v3.optional(v3.string), 
            password = v3.optional(v3.string), 
            errorCode = v3.optional(v3.string), 
            errorMsg = v3.optional(v3.string)
        }))
    }), 
    [v6.iosKeychainPassword] = v3.array(v3.strictInterface({
        experimentGroup = v3.optional(v3.string), 
        username = v3.optional(v3.string), 
        userId = v3.optional(v3.string), 
        password = v3.optional(v3.string), 
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    })), 
    [v6.keystore] = v3.array(v3.strictInterface({
        experimentGroup = v3.optional(v3.string), 
        username = v3.optional(v3.string), 
        userId = v3.optional(v3.string), 
        password = v3.optional(v3.string), 
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    }))
};
local v11 = {
    [v6.FIDO2] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.interface({
            keyType = v3.optional(v3.string), 
            isSilentPasskeyUpgrade = v3.optional(v3.boolean), 
            publicKey = v3.interface({
                rp = v3.interface({
                    name = v3.string, 
                    id = v3.string
                }), 
                user = v3.interface({
                    name = v3.string, 
                    displayName = v3.string, 
                    id = v3.string
                }), 
                challenge = v3.string, 
                pubKeyCredParams = v3.optional(v3.table), 
                timeout = v3.optional(v3.number), 
                excludeCredentials = v3.optional(v3.table), 
                authenticationSelection = v3.optional(v3.table), 
                attestation = v3.optional(v3.string), 
                extensions = v3.optional(v3.table)
            })
        })
    }), 
    [v6.password] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.strictInterface({
            username = v3.string, 
            password = v3.string
        })
    }), 
    [v6.iosKeychainPassword] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.strictInterface({
            server = v3.string, 
            username = v3.string, 
            userId = v3.string, 
            password = v3.string, 
            experimentGroup = v3.optional(v3.string)
        })
    }), 
    [v6.keystore] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.strictInterface({
            server = v3.string, 
            key = v3.optional(v3.string), 
            username = v3.string, 
            userId = v3.string, 
            password = v3.string, 
            experimentGroup = v3.optional(v3.string)
        })
    })
};
local v12 = {
    [v6.FIDO2] = v3.strictInterface({
        id = v3.optional(v3.string), 
        rawId = v3.optional(v3.string), 
        type = v3.optional(v3.string), 
        response = v3.interface({
            clientDataJSON = v3.string, 
            attestationObject = v3.string
        }), 
        authenticatorAttachment = v3.optional(v3.string), 
        clientExtensionResults = v3.optional(v3.table), 
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    }), 
    [v6.password] = v3.strictInterface({
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    }), 
    [v6.iosKeychainPassword] = v3.strictInterface({
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    }), 
    [v6.keystore] = v3.strictInterface({
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    })
};
local v13 = {
    CredentialsTypes = v6, 
    GET_CREDENTIALS_REQUEST_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsRequest"), 
            validateParams = v8[v6.FIDO2]
        }, 
        [v6.all] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsRequest"), 
            validateParams = v8[v6.all]
        }, 
        [v6.iosKeychainPassword] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsRequest"), 
            validateParams = v8[v6.iosKeychainPassword]
        }, 
        [v6.keystore] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsRequest"), 
            validateParams = v8[v6.keystore]
        }
    }, 
    GET_CREDENTIALS_RESPONSE_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsResponse"), 
            validateParams = v10[v6.FIDO2]
        }, 
        [v6.all] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsResponse"), 
            validateParams = v10[v6.all]
        }, 
        [v6.iosKeychainPassword] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsResponse"), 
            validateParams = v10[v6.iosKeychainPassword]
        }, 
        [v6.keystore] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsResponse"), 
            validateParams = v10[v6.keystore]
        }
    }, 
    DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR = {
        [v6.iosKeychainPassword] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "deleteIosKeychainCredentialsRequest"), 
            validateParams = v3.strictInterface({
                credentialType = v3.string, 
                parameters = v3.strictInterface({
                    server = v3.string
                })
            })
        }
    }, 
    DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR = {
        [v6.keystore] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "deleteKeystoreCredentialsRequest"), 
            validateParams = v3.strictInterface({
                credentialType = v3.string, 
                parameters = v3.strictInterface({
                    server = v3.string, 
                    key = v3.optional(v3.string)
                })
            })
        }
    }, 
    DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR = {
        [v6.iosKeychainPassword] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "deleteIosKeychainCredentialsResponse"), 
            validateParams = v3.strictInterface({
                credentialType = v3.string, 
                response = v3.array(v3.strictInterface({
                    errorCode = v3.optional(v3.string), 
                    errorMsg = v3.optional(v3.string)
                }))
            })
        }
    }, 
    DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR = {
        [v6.keystore] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "deleteKeystoreCredentialsResponse"), 
            validateParams = v3.strictInterface({
                credentialType = v3.string, 
                response = v3.array(v3.strictInterface({
                    errorCode = v3.optional(v3.string), 
                    errorMsg = v3.optional(v3.string)
                }))
            })
        }
    }, 
    REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsRequest"), 
            validateParams = v11[v6.FIDO2]
        }, 
        [v6.password] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsRequest"), 
            validateParams = v11[v6.password]
        }, 
        [v6.iosKeychainPassword] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsRequest"), 
            validateParams = v11[v6.iosKeychainPassword]
        }, 
        [v6.keystore] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsRequest"), 
            validateParams = v11[v6.keystore]
        }
    }, 
    REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsResponse"), 
            validateParams = v12[v6.FIDO2]
        }, 
        [v6.password] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsResponse"), 
            validateParams = v12[v6.password]
        }, 
        [v6.iosKeychainPassword] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsResponse"), 
            validateParams = v12[v6.iosKeychainPassword]
        }, 
        [v6.keystore] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsResponse"), 
            validateParams = v12[v6.keystore]
        }
    }, 
    IS_AVAILABLE_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Credentials", "isAvailableRequest"), 
        validateParams = v3.strictInterface({
            credentialType = v3.optional(v3.valueOf(v6))
        })
    }, 
    IS_AVAILABLE_RESPONSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Credentials", "isAvailableResponse"), 
        validateParams = v3.strictInterface({
            isAvailable = v3.optional(v3.boolean), 
            supportsDeviceBoundOnly = v3.optional(v3.boolean), 
            FIDO2 = v3.optional(v3.strictInterface({
                isAvailable = v3.boolean, 
                supportsDeviceBoundOnly = v3.boolean, 
                supportsSilentPasskeyUpgrade = v3.optional(v3.boolean)
            })), 
            password = v3.optional(v3.strictInterface({
                isAvailable = v3.boolean
            })), 
            iosKeychainPassword = v3.optional(v3.strictInterface({
                isAvailable = v3.boolean
            })), 
            keystore = v3.optional(v3.strictInterface({
                isAvailable = v3.boolean
            }))
        })
    }
};
v13.__index = v13;
v13.new = function() --[[ Line: 406 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v13 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new(), 
        getCredentialsRequestInFlight = false, 
        registerCredentialsRequestInFlight = false, 
        deleteIosKeychainCredentialsRequestInFlight = false, 
        deleteKeystoreCredentialsRequestInFlight = false
    }, v13));
end;
v13.getCredentials = function(v14, v15, v16, v17) --[[ Line: 420 ]] --[[ Name: getCredentials ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), v6 (copy), l_MessageBus_0 (copy)
    if not v14.getCredentialsRequestInFlight then
        local v22 = v4.race({
            v4.new(function(v18, _) --[[ Line: 424 ]]
                -- upvalues: v14 (copy), v15 (copy), l_HttpService_0 (ref)
                v14.subscriber:subscribe(v14.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[v15], function(v20) --[[ Line: 425 ]]
                    -- upvalues: v14 (ref), v15 (ref), l_HttpService_0 (ref), v18 (copy)
                    v14.subscriber:unsubscribe(v14.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[v15]);
                    v14.getCredentialsRequestInFlight = false;
                    local v21 = l_HttpService_0:JSONEncode(v20);
                    v18(v21);
                end);
            end), 
            v4.delay(v17):andThen(function() --[[ Line: 432 ]]
                -- upvalues: v14 (copy), v15 (copy)
                v14.subscriber:unsubscribe(v14.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[v15]);
                v14.getCredentialsRequestInFlight = false;
            end)
        });
        v14.getCredentialsRequestInFlight = true;
        if v15 == v6.all then
            l_MessageBus_0.publish(v14.GET_CREDENTIALS_REQUEST_DESCRIPTOR[v15], l_HttpService_0:JSONDecode(v16));
            return v22;
        else
            l_MessageBus_0.publish(v14.GET_CREDENTIALS_REQUEST_DESCRIPTOR[v15], {
                credentialType = v15, 
                parameters = l_HttpService_0:JSONDecode(v16)
            });
            return v22;
        end;
    else
        return v4.reject();
    end;
end;
v13.registerCredentials = function(v23, v24, v25, v26) --[[ Line: 458 ]] --[[ Name: registerCredentials ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_MessageBus_0 (copy)
    if not v23.registerCredentialsRequestInFlight then
        local v31 = v4.race({
            v4.new(function(v27, _) --[[ Line: 466 ]]
                -- upvalues: v23 (copy), v24 (copy), l_HttpService_0 (ref)
                v23.subscriber:subscribe(v23.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[v24], function(v29) --[[ Line: 469 ]]
                    -- upvalues: v23 (ref), v24 (ref), l_HttpService_0 (ref), v27 (copy)
                    v23.subscriber:unsubscribe(v23.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[v24]);
                    v23.registerCredentialsRequestInFlight = false;
                    local v30 = l_HttpService_0:JSONEncode(v29);
                    v27(v30);
                end);
            end), 
            v4.delay(v26):andThen(function() --[[ Line: 477 ]]
                -- upvalues: v23 (copy), v24 (copy)
                v23.subscriber:unsubscribe(v23.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[v24]);
                v23.registerCredentialsRequestInFlight = false;
            end)
        });
        v23.registerCredentialsRequestInFlight = true;
        l_MessageBus_0.publish(v23.REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR[v24], {
            credentialType = v24, 
            parameters = l_HttpService_0:JSONDecode(v25)
        });
        return v31;
    else
        return v4.reject();
    end;
end;
v13.deleteAllCredentialsFromiOSKeychain = function(v32, v33, v34, v35) --[[ Line: 494 ]] --[[ Name: deleteAllCredentialsFromiOSKeychain ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_MessageBus_0 (copy)
    if not v32.deleteIosKeychainCredentialsRequestInFlight then
        local v40 = v4.race({
            v4.new(function(v36, _) --[[ Line: 502 ]]
                -- upvalues: v32 (copy), v33 (copy), l_HttpService_0 (ref)
                v32.subscriber:subscribe(v32.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[v33], function(v38) --[[ Line: 505 ]]
                    -- upvalues: v32 (ref), v33 (ref), l_HttpService_0 (ref), v36 (copy)
                    v32.subscriber:unsubscribe(v32.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[v33]);
                    v32.deleteIosKeychainCredentialsRequestInFlight = false;
                    local v39 = l_HttpService_0:JSONEncode(v38);
                    v36(v39);
                end);
            end), 
            v4.delay(v35):andThen(function() --[[ Line: 513 ]]
                -- upvalues: v32 (copy), v33 (copy)
                v32.subscriber:unsubscribe(v32.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[v33]);
                v32.deleteIosKeychainCredentialsRequestInFlight = false;
            end)
        });
        v32.deleteIosKeychainCredentialsRequestInFlight = true;
        l_MessageBus_0.publish(v32.DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR[v33], {
            credentialType = v33, 
            parameters = l_HttpService_0:JSONDecode(v34)
        });
        return v40;
    else
        return v4.reject();
    end;
end;
v13.deleteAllCredentialsFromKeystore = function(v41, v42, v43, v44) --[[ Line: 532 ]] --[[ Name: deleteAllCredentialsFromKeystore ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_MessageBus_0 (copy)
    if not v41.deleteKeystoreCredentialsRequestInFlight then
        local v49 = v4.race({
            v4.new(function(v45, _) --[[ Line: 540 ]]
                -- upvalues: v41 (copy), v42 (copy), l_HttpService_0 (ref)
                v41.subscriber:subscribe(v41.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[v42], function(v47) --[[ Line: 543 ]]
                    -- upvalues: v41 (ref), v42 (ref), l_HttpService_0 (ref), v45 (copy)
                    v41.subscriber:unsubscribe(v41.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[v42]);
                    v41.deleteKeystoreCredentialsRequestInFlight = false;
                    local v48 = l_HttpService_0:JSONEncode(v47);
                    v45(v48);
                end);
            end), 
            v4.delay(v44):andThen(function() --[[ Line: 551 ]]
                -- upvalues: v41 (copy), v42 (copy)
                v41.subscriber:unsubscribe(v41.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[v42]);
                v41.deleteKeystoreCredentialsRequestInFlight = false;
            end)
        });
        v41.deleteKeystoreCredentialsRequestInFlight = true;
        l_MessageBus_0.publish(v41.DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR[v42], {
            credentialType = v42, 
            parameters = l_HttpService_0:JSONDecode(v43)
        });
        return v49;
    else
        return v4.reject();
    end;
end;
v13.isAvailable = function(v50, v51, v52) --[[ Line: 572 ]] --[[ Name: isAvailable ]]
    -- upvalues: v4 (copy), l_MessageBus_0 (copy)
    local v56 = v4.race({
        v4.new(function(v53, _) --[[ Line: 577 ]]
            -- upvalues: v50 (copy)
            v50.subscriber:subscribe(v50.IS_AVAILABLE_RESPONSE_DESCRIPTOR, function(v55) --[[ Line: 578 ]]
                -- upvalues: v50 (ref), v53 (copy)
                v50.subscriber:unsubscribe(v50.IS_AVAILABLE_RESPONSE_DESCRIPTOR);
                v53(v55);
            end);
        end), 
        v4.delay(v52):andThen(function() --[[ Line: 583 ]]
            -- upvalues: v50 (copy), v4 (ref)
            v50.subscriber:unsubscribe(v50.IS_AVAILABLE_RESPONSE_DESCRIPTOR);
            return v4.resolve({
                isAvailable = nil, 
                supportsDeviceBoundOnly = nil
            });
        end)
    });
    l_MessageBus_0.publish(v50.IS_AVAILABLE_REQUEST_DESCRIPTOR, {
        credentialType = v51
    });
    return v56;
end;
v13.default = v13.new();
return v13;