local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_AuthenticationProtocol_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol;
local v4 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginErrMessageKey);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.Luobu.Thunks.RequestAuthMetaData);
local v9 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginInProgress);
return function(v10, v11, v12, v13) --[[ Line: 13 ]]
    -- upvalues: l_AuthenticationProtocol_0 (copy), v8 (copy), v9 (copy), v5 (copy), v7 (copy), v2 (copy), v6 (copy), v4 (copy)
    return function(v14) --[[ Line: 14 ]]
        -- upvalues: l_AuthenticationProtocol_0 (ref), v13 (copy), v8 (ref), v12 (copy), v10 (copy), v11 (copy), v9 (ref), v5 (ref), v7 (ref), v2 (ref), v6 (ref), v4 (ref)
        local l_default_0 = l_AuthenticationProtocol_0.default;
        local v16 = nil;
        local v17 = nil;
        if v13.useMSDKWebAuthentication() then
            local v18, v19 = v14:dispatch(v8(v12, v10, v11)):await();
            if not v18 then
                v14:dispatch(v9(false));
                return;
            else
                v14:dispatch(v5({
                    name = v7.GenericWebPage, 
                    detail = v19.loginPage, 
                    extraProps = {
                        titleKey = "Authentication.Login.QrCodeLoginTitle", 
                        onClose = function() --[[ Line: 30 ]] --[[ Name: onClose ]]
                            -- upvalues: v14 (copy), v9 (ref)
                            v14:dispatch(v9(false));
                        end
                    }
                }));
                local v20, v21 = l_default_0:listenWebAuthResponset(l_AuthenticationProtocol_0.AuthProviders.MSDK):await();
                v16 = v20;
                v17 = v21;
            end;
        else
            local v22, v23 = l_default_0:requestAuth(l_AuthenticationProtocol_0.AuthProviders.MSDK, v11):await();
            v16 = v22;
            v17 = v23;
        end;
        if v16 then
            if v17.statusCode == 0 then
                return v2.resolve(v17.tokenAuthBody);
            else
                v10.Diag:reportCounter("RequestMSDKLoginReturnErrorCode_" .. v17.statusCode, 1);
            end;
        end;
        if v13.useMSDKWebAuthentication() then
            v14:dispatch(v6());
        end;
        v14:dispatch(v4(v17.errMessageKey));
        v10.Diag:reportCounter("RequestMSDKLoginAuthenticationProtocolFailure", 1);
        return v2.reject();
    end;
end;