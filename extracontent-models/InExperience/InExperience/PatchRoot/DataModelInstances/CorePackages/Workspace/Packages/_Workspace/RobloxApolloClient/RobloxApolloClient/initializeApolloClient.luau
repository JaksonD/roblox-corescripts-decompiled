local l_Parent_0 = script:FindFirstAncestor("RobloxApolloClient").Parent;
local v1 = require(l_Parent_0.ApolloClient);
local v2 = require(l_Parent_0.ApolloLocalState);
local l_GraphQLServer_0 = require(l_Parent_0.GraphQLServer).GraphQLServer;
local l_ApolloClient_0 = v1.ApolloClient;
local l_HttpLink_0 = v1.HttpLink;
local l_InMemoryCache_0 = v1.InMemoryCache;
local l_typePolicies_0 = v2.typePolicies;
initalizeApolloClient = function(v8) --[[ Line: 14 ]] --[[ Name: initalizeApolloClient ]]
    -- upvalues: l_GraphQLServer_0 (copy), l_HttpLink_0 (copy), l_InMemoryCache_0 (copy), l_typePolicies_0 (copy), l_ApolloClient_0 (copy)
    local v9 = l_GraphQLServer_0.new(v8);
    local v12 = l_HttpLink_0.new({
        uri = "/api", 
        fetch = function(_, v11) --[[ Line: 18 ]] --[[ Name: fetch ]]
            -- upvalues: v9 (copy)
            return v9:fetchLocal(v11);
        end
    });
    local v13 = l_InMemoryCache_0.new({
        typePolicies = l_typePolicies_0
    });
    return (l_ApolloClient_0.new({
        link = v12, 
        cache = v13
    }));
end;
return initalizeApolloClient;