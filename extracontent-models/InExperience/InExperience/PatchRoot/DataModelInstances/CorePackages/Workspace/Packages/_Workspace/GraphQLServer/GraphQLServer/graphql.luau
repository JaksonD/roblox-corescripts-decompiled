local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_mergeTypeDefs_0 = require(l_Parent_0.GraphqlToolsMerge).mergeTypeDefs;
local v2 = require(l_Parent_0.GraphQL);
local v3 = require(script.resolvers);
local v4 = require(script.generatedTypes);
local v5 = require(script.luaTypeDefs);
local v6 = require(script.dataLoaders);
local v7 = require(script.mocks);
return {
    typeDefs = "", 
    generateTypeDefs = function() --[[ Line: 35 ]] --[[ Name: generateTypeDefs ]]
        -- upvalues: l_mergeTypeDefs_0 (copy), v5 (copy), v2 (copy)
        local v8 = l_mergeTypeDefs_0(v5);
        return (v2.print(v8));
    end, 
    resolvers = v3, 
    generatedTypes = v4, 
    dataLoaders = v6, 
    mocks = v7
};