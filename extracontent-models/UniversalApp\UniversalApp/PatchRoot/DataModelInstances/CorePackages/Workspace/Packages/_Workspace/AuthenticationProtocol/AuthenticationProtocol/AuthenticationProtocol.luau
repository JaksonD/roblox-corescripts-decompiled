local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.t);
local _ = require(script.Parent.AuthenticationProtocolTypes);
local v5 = {
    MSDK = "MSDK"
};
local v6 = {
    PC = "Win32", 
    Mac = "MacOS", 
    Android = "Android", 
    IOS = "iOS"
};
local v7 = {
    WECHAT = "WeChat", 
    QQ = "QQ", 
    NONE = "None"
};
local v8 = {
    eFlag_Succ = 0, 
    eFlag_QQ_UserCancel = 1001, 
    eFlag_QQ_LoginFail = 1002, 
    eFlag_QQ_NetworkErr = 1003, 
    eFlag_QQ_NotInstall = 1004, 
    eFlag_QQ_NotSupportApi = 1005, 
    eFlag_WX_NotInstall = 2000, 
    eFlag_WX_NotSupportApi = 2001, 
    eFlag_WX_UserCancel = 2002, 
    eFlag_WX_LoginFail = 2004, 
    eFlag_Need_Realname_Auth = 3005, 
    eFlag_Need_MSDK_Realname_Auth = 3006, 
    eFlag_Local_Invalid = -2
};
local v9 = {
    [v8.eFlag_Succ] = "", 
    [v8.eFlag_WX_NotInstall] = "Authentication.Login.WeChat.NotInstalled", 
    [v8.eFlag_WX_NotSupportApi] = "Authentication.Login.Label.WeChatVersionNotSupported", 
    [v8.eFlag_WX_UserCancel] = "Authentication.Login.Label.WeChatUserCancel", 
    [v8.eFlag_WX_LoginFail] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain", 
    [v8.eFlag_QQ_UserCancel] = "Authentication.Login.Label.QQUserCancel", 
    [v8.eFlag_QQ_LoginFail] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"
};
local v10 = {
    [v5.MSDK] = v9
};
local v11 = {
    [v5.MSDK] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"
};
local v12 = v3.valueOf(v5);
local v13 = v3.valueOf(v6);
local v14 = v3.valueOf(v7);
local v15 = {
    AuthProviders = v5, 
    AuthMethods = v7, 
    AUTH_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Authentication", "authRequest"), 
        validateParams = v3.strictInterface({
            authProvider = v12, 
            authMethod = v14
        })
    }, 
    AUTH_RESPONSE_DESCRIPTORS = {
        [v5.MSDK] = {
            mid = l_MessageBus_0.getMessageId("Authentication", "MSDKAuthResponse"), 
            validateParams = v3.strictInterface({
                platform = v13, 
                status = v3.number, 
                tokenAuthBody = v3.optional(v3.strictInterface({
                    openId = v3.string, 
                    accessToken = v3.string, 
                    refreshToken = v3.string, 
                    accessTokenExpiry = v3.number, 
                    refreshTokenExpiry = v3.number, 
                    channelId = v3.number
                }))
            })
        }
    }
};
v15.__index = v15;
v15.new = function() --[[ Line: 130 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v15 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v15));
end;
v15.requestAuth = function(v16, v17, v18) --[[ Line: 144 ]] --[[ Name: requestAuth ]]
    -- upvalues: v1 (copy), v10 (copy), v11 (copy), l_MessageBus_0 (copy)
    local v24 = v1.new(function(v19, _) --[[ Line: 145 ]]
        -- upvalues: v16 (copy), v17 (copy), v10 (ref), v11 (ref)
        local v21 = v16.AUTH_RESPONSE_DESCRIPTORS[v17];
        v16.subscriber:subscribe(v21, function(v22) --[[ Line: 148 ]]
            -- upvalues: v16 (ref), v21 (copy), v17 (ref), v10 (ref), v11 (ref), v19 (copy)
            v16.subscriber:unsubscribe(v21);
            local v23 = nil;
            if v17 == v16.AuthProviders.MSDK then
                v23 = {
                    statusCode = v22.status, 
                    tokenAuthBody = v22.tokenAuthBody, 
                    errMessageKey = v10[v17][v22.status] or v11[v17]
                };
            end;
            v19(v23);
        end);
    end);
    l_MessageBus_0.publish(v16.AUTH_REQUEST_DESCRIPTOR, {
        authProvider = v17, 
        authMethod = v18
    });
    return v24;
end;
v15.listenWebAuthResponset = function(v25, v26) --[[ Line: 177 ]] --[[ Name: listenWebAuthResponset ]]
    -- upvalues: v1 (copy), v10 (copy), v11 (copy)
    return (v1.new(function(v27, _) --[[ Line: 178 ]]
        -- upvalues: v25 (copy), v26 (copy), v10 (ref), v11 (ref)
        local v29 = v25.AUTH_RESPONSE_DESCRIPTORS[v26];
        v25.subscriber:subscribe(v29, function(v30) --[[ Line: 181 ]]
            -- upvalues: v25 (ref), v29 (copy), v26 (ref), v10 (ref), v11 (ref), v27 (copy)
            v25.subscriber:unsubscribe(v29);
            local v31 = nil;
            if v26 == v25.AuthProviders.MSDK then
                v31 = {
                    statusCode = v30.status, 
                    tokenAuthBody = v30.tokenAuthBody, 
                    errMessageKey = v10[v26][v30.status] or v11[v26]
                };
            end;
            v27(v31);
        end);
    end));
end;
v15.default = v15.new();
return v15;