local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return {
    blockUser = function(v2, v3) --[[ Line: 8 ]]
        -- upvalues: l_Url_0 (copy)
        return v2(("%*user-blocking-api/v1/users/%*/block-user"):format(l_Url_0.APIS_URL, v3), "POST");
    end, 
    unblockUser = function(v4, v5) --[[ Line: 13 ]]
        -- upvalues: l_Url_0 (copy)
        return v4(("%*user-blocking-api/v1/users/%*/unblock-user"):format(l_Url_0.APIS_URL, v5), "POST");
    end, 
    isBlockedUser = function(v6, v7) --[[ Line: 18 ]]
        -- upvalues: l_Url_0 (copy)
        return v6(("%*user-blocking-api/v1/users/%*/is-blocked"):format(l_Url_0.APIS_URL, v7), "GET");
    end
};