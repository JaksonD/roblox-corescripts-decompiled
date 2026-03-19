local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local v4 = require(l_script_FirstAncestor_0.graphql.utils.formatUserProfileFields);
local _ = require(script.Parent.Parent.generatedTypes);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfileBetterErrors);
return {
    UserProfile = {
        id = function(v7) --[[ Line: 16 ]] --[[ Name: id ]]
            return (tostring(v7.userId));
        end, 
        displayName = function() --[[ Line: 19 ]] --[[ Name: displayName ]]
            -- upvalues: l_GraphQLError_0 (copy)
            return l_GraphQLError_0.new("The displayName field is not available on the UserProfile implementation of User, please use the names field instead");
        end
    }, 
    Query = {
        userProfiles = function(_, v9, v10, v11) --[[ Line: 26 ]] --[[ Name: userProfiles ]]
            -- upvalues: v4 (copy), v6 (copy)
            local v12 = v4(v11, v10.collectSubFieldsImpl);
            return v10.dataLoaders.userProfiles:getLoader(v10.fetchImpl, v12):loadMany(v9.userIds):andThen(function(v13) --[[ Line: 31 ]]
                return v13 or {};
            end):catch(function(v14) --[[ Line: 34 ]]
                -- upvalues: v6 (ref)
                if v6 then
                    return v14;
                else
                    return {};
                end;
            end);
        end
    }
};