local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local l_httpRequest_0 = require(l_Parent_0.LuaSocialLibrariesDeps).httpRequest;
local v2 = game:DefineFastInt("UserSearchHttpRetryCount", 3);
local v3 = game:DefineFastFlag("MigrateUserSearchHttpRequestToRequestInternal", false);
return (l_httpRequest_0.config({
    requestFunction = function(v4, v5, v6) --[[ Line: 10 ]] --[[ Name: requestFunction ]]
        -- upvalues: v3 (copy), l_httpRequest_0 (copy)
        if v3 then
            return l_httpRequest_0.requestFunctions.RequestInternal(v4, v5, v6);
        else
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v4, v5, v6);
        end;
    end, 
    maxRetryCount = v2
}));