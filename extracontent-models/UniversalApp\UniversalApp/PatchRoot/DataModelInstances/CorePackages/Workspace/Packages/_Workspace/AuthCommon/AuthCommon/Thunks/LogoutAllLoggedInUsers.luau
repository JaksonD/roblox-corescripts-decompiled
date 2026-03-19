local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.LogoutAllLoggedInUsersRequest);
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
local v5 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
return function(v6, _) --[[ Line: 9 ]]
    -- upvalues: l_FFlagEnableLuaAccountSwitch_0 (copy), v2 (copy), v5 (copy), v3 (copy)
    if not l_FFlagEnableLuaAccountSwitch_0 then
        return v2.resolve();
    else
        local v8 = v5.getAccountBlob();
        v5.setAccountBlob("");
        v5.flush();
        return v3(v6, v8):andThen(function(v9) --[[ Line: 17 ]]
            -- upvalues: v2 (ref)
            return v2.resolve(v9.responseBody);
        end):catch(function(v10) --[[ Line: 19 ]]
            -- upvalues: v2 (ref)
            if v10.data then
                return v2.reject(v10.data.errorCode);
            elseif not v10.StatusCode then
                return v2.reject();
            else
                return v2.reject({
                    v10.StatusCode
                });
            end;
        end);
    end;
end;