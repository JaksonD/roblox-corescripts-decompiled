local l_Parent_0 = script:FindFirstAncestor("AccountSwitching").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.AuthCommon);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v4 = require(l_Parent_0.Promise);
local l_AppStorageUtilities_0 = v2.Utils.AppStorageUtilities;
local l_recordSignOut_0 = v2.Utils.recordSignOut;
local v7 = require(script.Parent.Paths);
return function(v8, v9) --[[ Line: 17 ]]
    -- upvalues: l_AppStorageUtilities_0 (copy), v4 (copy), l_UrlBuilder_0 (copy), v7 (copy), l_HttpService_0 (copy), l_recordSignOut_0 (copy)
    local v10 = l_AppStorageUtilities_0.getAccountBlob();
    if not v9.user_id or not v10 then
        return v4.reject("invalid payload");
    else
        local v11 = l_UrlBuilder_0.fromString(v7.DeleteAccount);
        local v12 = l_HttpService_0:JSONEncode({
            deleted_user_id = v9.user_id, 
            encrypted_users_data_blob = v10
        });
        return v8(v11(), "POST", {
            postBody = v12
        }):andThen(function(v13) --[[ Line: 28 ]]
            -- upvalues: l_AppStorageUtilities_0 (ref), l_recordSignOut_0 (ref), v9 (copy), v4 (ref)
            if v13 and v13.responseBody and v13.responseBody.encrypted_users_data_blob then
                l_AppStorageUtilities_0.setAccountBlob(v13.responseBody.encrypted_users_data_blob);
                l_AppStorageUtilities_0.flush();
                pcall(function() --[[ Line: 32 ]]
                    -- upvalues: l_recordSignOut_0 (ref), v9 (ref)
                    l_recordSignOut_0(v9);
                end);
                return v4.resolve(v13.responseBody);
            else
                return v4.reject();
            end;
        end):catch(function(v14) --[[ Line: 39 ]]
            -- upvalues: v4 (ref)
            if v14.data then
                return v4.reject(v14.data.errorCode);
            elseif not v14.StatusCode then
                return v4.reject();
            else
                return v4.reject({
                    v14.StatusCode
                });
            end;
        end);
    end;
end;