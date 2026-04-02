local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.LogoutAllLoggedInUsersRequest);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.GetLoggedInUsersMetadataRequest);
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
local v6 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v7 = require(l_script_FirstAncestor_0.Utils.recordSignOut);
local v8 = game:DefineFastFlag("RecordSignOutOnLogoutAll", false);
local function v15(v9, v10) --[[ Line: 13 ]] --[[ Name: recordSignOutOnLogoutAll ]]
    -- upvalues: v4 (copy), v7 (copy)
    local v11, v12 = v4(v9, v10):await();
    if v11 and v12 and v12.responseBody and v12.responseBody.logged_in_users_metadata then
        for _, v14 in ipairs(v12.responseBody.logged_in_users_metadata) do
            pcall(function() --[[ Line: 17 ]]
                -- upvalues: v7 (ref), v14 (copy)
                v7(v14, true);
            end);
        end;
    end;
end;
return function(v16, _) --[[ Line: 24 ]]
    -- upvalues: l_FFlagEnableLuaAccountSwitch_0 (copy), v2 (copy), v6 (copy), v8 (copy), v15 (copy), v3 (copy)
    if not l_FFlagEnableLuaAccountSwitch_0 then
        return v2.resolve();
    else
        local v18 = v6.getAccountBlob();
        if v8 then
            pcall(v15, v16, v18);
        end;
        v6.setAccountBlob("");
        v6.flush();
        return v3(v16, v18):andThen(function(v19) --[[ Line: 37 ]]
            -- upvalues: v2 (ref)
            return v2.resolve(v19.responseBody);
        end):catch(function(v20) --[[ Line: 39 ]]
            -- upvalues: v2 (ref)
            if v20.data then
                return v2.reject(v20.data.errorCode);
            elseif not v20.StatusCode then
                return v2.reject();
            else
                return v2.reject({
                    v20.StatusCode
                });
            end;
        end);
    end;
end;