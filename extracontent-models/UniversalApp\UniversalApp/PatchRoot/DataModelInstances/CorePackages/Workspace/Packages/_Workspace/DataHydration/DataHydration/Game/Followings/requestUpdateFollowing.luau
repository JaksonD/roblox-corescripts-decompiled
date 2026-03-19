local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.HttpRequest);
local v4 = require(l_Parent_0.Promise);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v6 = require(script.Parent.FollowingsUrlBuilder);
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: requestUpdateFollowing ]]
    -- upvalues: l_getLocalPlayerUserId_0 (copy), v4 (copy), v6 (copy), v3 (copy), l_HttpService_0 (copy)
    local v9 = l_getLocalPlayerUserId_0();
    if not v9 or v9 <= 0 then
        return v4.reject({
            ClientError = "Missing or invalid local player ID", 
            message = "Cannot update following status: missing or invalid local player ID"
        });
    else
        local v10 = v6.buildFollowingUpdateUrl(tostring(v9), v7);
        return v3.config({
            requestFunction = function(v11, v12, v13) --[[ Line: 25 ]] --[[ Name: requestFunction ]]
                -- upvalues: v3 (ref)
                return v3.requestFunctions.RequestInternal(v11, v12, v13);
            end
        })(v10, v8 and "POST" or "DELETE", {
            postBody = if v8 then l_HttpService_0:JSONEncode({}) else nil
        });
    end;
end;