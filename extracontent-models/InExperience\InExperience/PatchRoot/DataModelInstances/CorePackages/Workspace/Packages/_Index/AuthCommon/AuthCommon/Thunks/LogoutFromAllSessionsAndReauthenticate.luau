local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.LogoutFromAllSessionsAndReauthenticateRequest);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3(v4):andThen(function(v5) --[[ Line: 12 ]]
        -- upvalues: v2 (ref)
        return v2.resolve(v5.responseBody);
    end):catch(function(v6) --[[ Line: 14 ]]
        -- upvalues: v2 (ref)
        if v6.data then
            return v2.reject(v6.data.errorCode);
        elseif not v6.StatusCode then
            return v2.reject();
        else
            return v2.reject({
                v6.StatusCode
            });
        end;
    end);
end;