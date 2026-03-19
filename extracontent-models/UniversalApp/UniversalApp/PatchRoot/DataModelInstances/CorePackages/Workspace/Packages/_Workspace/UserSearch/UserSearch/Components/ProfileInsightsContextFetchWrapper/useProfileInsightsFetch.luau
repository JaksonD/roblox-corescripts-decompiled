local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useQuery_0 = require(l_Parent_0.ApolloClient).useQuery;
local v3 = require(l_script_FirstAncestor_0.Apollo.ProfilesInsightsQuery);
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
return function(v5, v6, v7) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), l_useQuery_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy)
    local v8 = v3.createPageId(v6);
    return (l_useQuery_0(v3.query, {
        errorPolicy = "all", 
        skip = not v5 or #v5 == 0, 
        variables = {
            userIds = v5, 
            pageId = v8, 
            rankingStrategy = if l_FFlagPlayerSearchEnableOnlineFrequents_0 then v7 else nil
        }
    }));
end;