local l_Parent_0 = script:FindFirstAncestor("ApolloProfileInsights").Parent;
local v1 = require(l_Parent_0.ApolloClient);
local v2 = require(l_Parent_0.ApolloLocalState);
local l_useQuery_0 = v1.useQuery;
local l_queries_0 = v2.queries;
return function(v5) --[[ Line: 17 ]] --[[ Name: useProfileInsightsByUserIds ]]
    -- upvalues: l_useQuery_0 (copy), l_queries_0 (copy)
    return (l_useQuery_0(l_queries_0.profilesInsightsByUserIds, {
        errorPolicy = "all", 
        skip = not v5.userIds or v5.skip, 
        variables = {
            userIds = v5.userIds, 
            rankingStrategy = v5.rankingStrategy
        }, 
        fetchPolicy = v5.fetchPolicy
    }));
end;