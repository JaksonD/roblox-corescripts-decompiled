local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountSwitching");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Thunks.GetLoggedInUsersMetadata);
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
local l_AppStorageUtilities_0 = require(l_Parent_0.AuthCommon).Utils.AppStorageUtilities;
return function(v6, v7) --[[ Line: 8 ]]
    -- upvalues: l_FFlagEnableLuaAccountSwitch_0 (copy), v2 (copy), l_AppStorageUtilities_0 (copy), v3 (copy)
    if not l_FFlagEnableLuaAccountSwitch_0 then
        return v2.resolve();
    else
        local v8 = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or "";
        return v3(v6, v8, not v7):andThen(function(v9) --[[ Line: 14 ]]
            -- upvalues: l_FFlagEnableLuaAccountSwitch_0 (ref), l_AppStorageUtilities_0 (ref), v2 (ref)
            if l_FFlagEnableLuaAccountSwitch_0 then
                l_AppStorageUtilities_0.setAccountBlob(v9.responseBody.encrypted_users_data_blob);
                l_AppStorageUtilities_0.flush();
            end;
            return v2.resolve(v9.responseBody);
        end):catch(function(v10) --[[ Line: 20 ]]
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