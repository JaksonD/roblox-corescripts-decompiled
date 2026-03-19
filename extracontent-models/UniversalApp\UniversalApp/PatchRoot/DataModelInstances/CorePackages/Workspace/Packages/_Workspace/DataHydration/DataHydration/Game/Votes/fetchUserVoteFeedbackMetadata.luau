local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local _ = require(l_Parent_0.Http);
local v3 = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder);
return function(v4) --[[ Line: 13 ]] --[[ Name: fetchUserVoteFeedbackMetadata ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v5 = v3.buildUserVoteFeedbackMetadataUrl(v4);
    return v1.config({
        requestFunction = function(v6, v7, v8) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
            -- upvalues: v1 (ref)
            return v1.requestFunctions.HttpRbxApi(v6, v7, v8);
        end
    })(v5, "GET");
end;