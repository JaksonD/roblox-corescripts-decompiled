local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local function _() --[[ Line: 7 ]] --[[ Name: getListCredentialsUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/ListCredentials", l_Url_0.AUTH_URL);
end;
local function _(v5) --[[ Line: 17 ]] --[[ Name: listCredentials ]]
    -- upvalues: l_Url_0 (copy), v1 (copy)
    return v5(string.format("%sv1/passkey/ListCredentials", l_Url_0.AUTH_URL), "POST"):andThen(function(v6) --[[ Line: 18 ]]
        -- upvalues: v1 (ref)
        return v1.resolve(v6[1]);
    end);
end;
return function(v8) --[[ Line: 29 ]] --[[ Name: hasPasskey ]]
    -- upvalues: l_Url_0 (copy), v1 (copy), l_Logger_0 (copy)
    return v8(string.format("%sv1/passkey/ListCredentials", l_Url_0.AUTH_URL), "POST"):andThen(function(v9) --[[ Line: 18 ]]
        -- upvalues: v1 (ref)
        return v1.resolve(v9[1]);
    end):andThen(function(v10) --[[ Line: 31 ]]
        -- upvalues: l_Logger_0 (ref)
        if v10 and v10.credentials then
            l_Logger_0:info("User has {} existing passkey credentials.", #v10.credentials);
            return #v10.credentials > 0;
        else
            l_Logger_0:info("User does NOT have existing passkey credentials.");
            return false;
        end;
    end):catch(function(v11) --[[ Line: 40 ]]
        -- upvalues: l_Logger_0 (ref)
        l_Logger_0:debug("Error checking if user has passkey: {}", v11);
        return true;
    end);
end;