local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
return {
    query = require(l_Parent_0.ApolloClient).gql(require(script.Parent.ProfilesInsights)), 
    createPageId = function(v1) --[[ Line: 12 ]]
        return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. v1;
    end
};