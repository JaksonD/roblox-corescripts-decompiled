local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v2 = require(l_Parent_0.GraphQL);
local v3 = require(l_Parent_0.Promise);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local _ = require(l_Parent_0.DataLoader);
local v7 = require(script.Parent.Response);
local v8 = require(script.Parent.graphql);
local l_typeDefs_0 = v8.typeDefs;
local l_resolvers_0 = v8.resolvers;
local l_dataLoaders_0 = v8.dataLoaders;
local v12 = require(script.Parent.schemaUtils.buildTypeResolver);
local v13 = require(script.Parent.schemaUtils.buildRootValue);
local v14 = require(script.Parent.schemaUtils.buildFieldResolver);
local v15 = require(script.Parent.schemaUtils.addMockResolvers);
local l_getFFlagUserProfilesDataLoaderEnabled_0 = require(l_Parent_0.SharedFlags).getFFlagUserProfilesDataLoaderEnabled;
local v17 = {};
v17.__index = v17;
v17.new = function(v18) --[[ Line: 71 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_typeDefs_0 (copy), l_resolvers_0 (copy), v15 (copy), v13 (copy), v12 (copy), v14 (copy), l_fetch_0 (copy), l_getFFlagUserProfilesDataLoaderEnabled_0 (copy), l_Object_0 (copy), l_dataLoaders_0 (copy), v17 (copy)
    local v19 = {
        port = if v18.port then v18.port else 4000
    };
    local v20 = false;
    local v21 = nil;
    if not v18.typeDefs then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 78 ]]
            return require(script.Parent.compiled_schema);
        end);
        v20 = l_status_0;
        v21 = l_result_0;
    end;
    if v20 and v21 then
        v19.schema = v2.buildASTSchema(v21, {
            assumeValid = true, 
            assumeValidSDL = true
        });
    else
        local v24 = if v18.typeDefs then v18.typeDefs else l_typeDefs_0;
        v19.schema = v2.buildSchema(v24);
    end;
    local v25 = if v18.resolvers then v18.resolvers else l_resolvers_0;
    if type(v18.mockResolvers) == "table" then
        v25 = v15(v25, v18.mockResolvers);
    end;
    v19.rootValue = v13(v25);
    v19.typeResolver = v12(v25);
    v19.fieldResolver = v14(v25);
    v19.fetchImpl = if v18.fetchImpl then v18.fetchImpl else l_fetch_0;
    if l_getFFlagUserProfilesDataLoaderEnabled_0() then
        v19.clientLoaders = l_Object_0.assign({}, {
            userProfiles = l_dataLoaders_0.userProfilesDataLoader.new()
        }, v18.dataLoaderInitializers or {});
    end;
    setmetatable(v19, v17);
    return v19;
end;
v17.fetchLocal = function(v26, v27) --[[ Line: 115 ]] --[[ Name: fetchLocal ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy), v2 (copy), l_getFFlagUserProfilesDataLoaderEnabled_0 (copy), l_Object_0 (copy), v7 (copy)
    local v28 = if v27 then l_HttpService_0:JSONDecode(v27.body) else {};
    local v29 = {};
    return v3.new(function(v30, _) --[[ Line: 119 ]]
        -- upvalues: v2 (ref), v26 (copy), v28 (copy), l_getFFlagUserProfilesDataLoaderEnabled_0 (ref), l_Object_0 (ref), v29 (copy), v7 (ref)
        v2.graphql({
            schema = v26.schema, 
            source = v28.query or v28.mutation, 
            rootValue = v26.rootValue, 
            contextValue = {
                fetchImpl = v26.fetchImpl, 
                dataLoaders = if l_getFFlagUserProfilesDataLoaderEnabled_0() then l_Object_0.assign({}, v29, v26.clientLoaders) else v29
            }, 
            typeResolver = v26.typeResolver, 
            fieldResolver = v26.fieldResolver, 
            variableValues = v28.variables
        }):andThen(function(v32) --[[ Line: 133 ]]
            -- upvalues: v30 (copy), v7 (ref)
            v30(v7.new(v32));
        end);
    end);
end;
return v17;