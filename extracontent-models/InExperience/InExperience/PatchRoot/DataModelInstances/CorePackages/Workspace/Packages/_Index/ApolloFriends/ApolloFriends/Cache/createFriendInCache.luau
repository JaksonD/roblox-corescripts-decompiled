local l_Parent_0 = script:FindFirstAncestor("ApolloFriends").Parent;
local l_gql_0 = require(l_Parent_0.ApolloClient).gql;
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: createFriendInCache ]]
    -- upvalues: l_gql_0 (copy)
    return (v2.cache:writeFragment({
        data = {
            __typename = "Friend", 
            id = v3.userId, 
            targetUserId = v3.targetUserId, 
            hasVerifiedBadge = v3.hasVerifiedBadge or false, 
            displayName = ""
        }, 
        fragment = l_gql_0("\t\t\tfragment NewFriend on Friend {\n\t\t\t\tid\n\t\t\t\ttargetUserId\n\t\t\t\thasVerifiedBadge\n\t\t\t\tdisplayName\n\t\t\t}\n\t\t")
    }));
end;