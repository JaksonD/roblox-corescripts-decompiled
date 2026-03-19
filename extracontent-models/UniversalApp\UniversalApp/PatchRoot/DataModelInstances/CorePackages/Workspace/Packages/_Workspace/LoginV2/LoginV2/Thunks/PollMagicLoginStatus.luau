local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CrossDeviceLogin_0 = require(l_Parent_0.AuthCommon).Thunks.CrossDeviceLogin;
local l_LoginByCode_0 = require(l_Parent_0.AuthCommon).Thunks.LoginByCode;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_PollMagicLoginStatusType_0 = require(l_script_FirstAncestor_0.Enums).PollMagicLoginStatusType;
local function v7(v8) --[[ Line: 25 ]] --[[ Name: pollLoginStatus ]]
    -- upvalues: l_CrossDeviceLogin_0 (copy), l_PollMagicLoginStatusType_0 (copy), l_LoginByCode_0 (copy), l_CloseCentralOverlay_0 (copy), l_Logger_0 (copy), v7 (copy)
    local l_networking_0 = v8.networking;
    local l_deviceCode_0 = v8.deviceCode;
    local l_privateKey_0 = v8.privateKey;
    local l_isMounted_0 = v8.isMounted;
    local l_launchApp_0 = v8.launchApp;
    local l_onError_0 = v8.onError;
    local l_retriesLeft_0 = v8.retriesLeft;
    local l_store_0 = v8.store;
    return l_CrossDeviceLogin_0.GetLoginStatus(l_networking_0, l_deviceCode_0, l_privateKey_0)():andThen(function(v17) --[[ Line: 35 ]]
        -- upvalues: l_isMounted_0 (copy), l_PollMagicLoginStatusType_0 (ref), l_LoginByCode_0 (ref), l_networking_0 (copy), l_deviceCode_0 (copy), l_privateKey_0 (copy), l_store_0 (copy), l_CloseCentralOverlay_0 (ref), l_launchApp_0 (copy), l_Logger_0 (ref), l_onError_0 (copy), l_retriesLeft_0 (copy), v7 (ref)
        if l_isMounted_0.current then
            if v17.Status == l_PollMagicLoginStatusType_0.VALIDATED then
                return l_LoginByCode_0(l_networking_0, l_deviceCode_0, l_privateKey_0, nil, nil, nil, nil)():andThen(function(_) --[[ Line: 38 ]]
                    -- upvalues: l_isMounted_0 (ref), l_store_0 (ref), l_CloseCentralOverlay_0 (ref), l_launchApp_0 (ref)
                    if l_isMounted_0.current then
                        l_store_0:dispatch(l_CloseCentralOverlay_0());
                        if l_launchApp_0 then
                            l_launchApp_0();
                        end;
                    end;
                end, function(v19) --[[ Line: 45 ]]
                    -- upvalues: l_isMounted_0 (ref), l_Logger_0 (ref), l_onError_0 (ref)
                    if l_isMounted_0.current then
                        l_Logger_0:warning("Login failed:" .. v19);
                        l_onError_0();
                    end;
                end);
            elseif v17.Status == l_PollMagicLoginStatusType_0.EXPIRED or v17.Status == l_PollMagicLoginStatusType_0.CANCELLED then
                if l_isMounted_0.current then
                    l_onError_0();
                    return;
                end;
            else
                spawn(function() --[[ Line: 60 ]]
                    -- upvalues: l_isMounted_0 (ref), l_retriesLeft_0 (ref), l_networking_0 (ref), l_deviceCode_0 (ref), l_privateKey_0 (ref), l_launchApp_0 (ref), l_onError_0 (ref), l_store_0 (ref), v7 (ref)
                    wait(2);
                    if l_isMounted_0.current and l_retriesLeft_0 > 0 then
                        local v20 = {
                            networking = l_networking_0, 
                            deviceCode = l_deviceCode_0, 
                            privateKey = l_privateKey_0, 
                            isMounted = l_isMounted_0, 
                            launchApp = l_launchApp_0, 
                            onError = l_onError_0, 
                            retriesLeft = l_retriesLeft_0 - 1, 
                            store = l_store_0
                        };
                        v7(v20);
                        return;
                    else
                        if l_isMounted_0.current then
                            l_onError_0();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end, function(v21) --[[ Line: 80 ]]
        -- upvalues: l_isMounted_0 (copy), l_PollMagicLoginStatusType_0 (ref), l_onError_0 (copy), l_retriesLeft_0 (copy), l_networking_0 (copy), l_deviceCode_0 (copy), l_privateKey_0 (copy), l_launchApp_0 (copy), l_store_0 (copy), v7 (ref)
        if l_isMounted_0.current then
            if v21.Body == l_PollMagicLoginStatusType_0.CODE_INVALID then
                l_onError_0();
                return;
            else
                spawn(function() --[[ Line: 85 ]]
                    -- upvalues: l_isMounted_0 (ref), l_retriesLeft_0 (ref), l_networking_0 (ref), l_deviceCode_0 (ref), l_privateKey_0 (ref), l_launchApp_0 (ref), l_onError_0 (ref), l_store_0 (ref), v7 (ref)
                    wait(2);
                    if l_isMounted_0.current and l_retriesLeft_0 > 0 then
                        local v22 = {
                            networking = l_networking_0, 
                            deviceCode = l_deviceCode_0, 
                            privateKey = l_privateKey_0, 
                            isMounted = l_isMounted_0, 
                            launchApp = l_launchApp_0, 
                            onError = l_onError_0, 
                            retriesLeft = l_retriesLeft_0 - 1, 
                            store = l_store_0
                        };
                        v7(v22);
                        return;
                    else
                        if l_isMounted_0.current then
                            l_onError_0();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end);
end;
return function(v23, v24, v25, v26, v27, v28) --[[ Line: 108 ]]
    -- upvalues: v7 (copy)
    return function(v29) --[[ Line: 116 ]]
        -- upvalues: v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v7 (ref)
        local v30 = {
            networking = v23, 
            deviceCode = v24, 
            privateKey = v25, 
            isMounted = v26, 
            launchApp = v27, 
            onError = v28, 
            retriesLeft = 50, 
            store = v29
        };
        return v7(v30);
    end;
end;