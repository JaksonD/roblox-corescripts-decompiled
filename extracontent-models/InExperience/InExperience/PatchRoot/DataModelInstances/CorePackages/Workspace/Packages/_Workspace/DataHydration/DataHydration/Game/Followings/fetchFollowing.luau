local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.HttpRequest);
local v3 = require(l_Parent_0.Promise);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v5 = require(script.Parent.FollowingsUrlBuilder);
return function(v6) --[[ Line: 12 ]] --[[ Name: fetchFollowing ]]
    -- upvalues: l_getLocalPlayerUserId_0 (copy), v3 (copy), v5 (copy), v2 (copy)
    local v7 = l_getLocalPlayerUserId_0();
    if not v7 or v7 <= 0 then
        return v3.reject({
            ClientError = "Missing or invalid local player ID", 
            message = "Cannot fetch following status: missing or invalid local player ID"
        });
    else
        local v8 = v5.buildFollowingStatusUrl(tostring(v7), v6);
        return v2.config({
            requestFunction = function(v9, v10, v11) --[[ Line: 24 ]] --[[ Name: requestFunction ]]
                -- upvalues: v2 (ref)
                return v2.requestFunctions.HttpRbxApi(v9, v10, v11);
            end
        })(v8, "GET");
    end;
end;