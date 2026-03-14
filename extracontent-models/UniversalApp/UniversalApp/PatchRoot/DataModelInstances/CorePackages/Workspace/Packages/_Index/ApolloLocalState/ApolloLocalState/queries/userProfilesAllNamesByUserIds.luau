local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local l_gql_0 = require(l_Parent_0.ApolloClient).gql;
local v2 = l_gql_0(require(script.Parent.schema.UserProfilesAllNamesByUserIdsNew));
local v3 = l_gql_0(require(script.Parent.schema.UserProfilesAllNamesByUserIds));
if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
    return v2;
else
    return v3;
end;