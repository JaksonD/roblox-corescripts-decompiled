local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local v1 = require(l_Parent_0.AuthCommon);
local l_RegisterPasskey_0 = v1.Thunks.RegisterPasskey;
local l_PasskeyConstants_0 = v1.Common.PasskeyConstants;
local v4 = require(l_Parent_0.Promise);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
return function(v6) --[[ Line: 17 ]] --[[ Name: handlePasskeyRegistration ]]
    -- upvalues: l_Logger_0 (copy), l_RegisterPasskey_0 (copy), v4 (copy), l_PasskeyConstants_0 (copy)
    l_Logger_0:info("Invoking RegisterPasskey");
    return l_RegisterPasskey_0(v6, "passkeyUpsell"):andThen(function() --[[ Line: 19 ]]
        -- upvalues: l_Logger_0 (ref), v4 (ref)
        l_Logger_0:info("Passkey Upsell Registration completed.");
        return v4.resolve(true);
    end, function(v7) --[[ Line: 23 ]]
        -- upvalues: l_Logger_0 (ref), l_PasskeyConstants_0 (ref), v4 (ref)
        l_Logger_0:debug("User encountered unknown error during passkey upsell registration: ", v7);
        if v7 and v7.name == l_PasskeyConstants_0.USER_OS_DIALOG_ERROR_NAME then
            return v4.resolve(false);
        else
            return v4.reject();
        end;
    end);
end;