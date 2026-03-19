local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local _ = require(l_Parent_0.ApolloClient);
return function(v2) --[[ Line: 7 ]]
    local l_client_0 = v2.client;
    local l_query_0 = v2.query;
    local l_userId_0 = v2.userId;
    local l_names_0 = v2.names;
    local v7 = "";
    v7 = if l_names_0.alias ~= "" then l_names_0.alias else if l_names_0.contactName ~= "" then l_names_0.contactName else if l_names_0.displayName ~= "" then l_names_0.displayName else l_names_0.username;
    l_client_0:writeQuery({
        variables = {
            userIds = {
                l_userId_0
            }
        }, 
        query = l_query_0, 
        data = {
            userProfiles = {
                {
                    __typename = "UserProfile", 
                    id = l_userId_0, 
                    names = {
                        __typename = "Names", 
                        combinedName = v7, 
                        alias = l_names_0.alias, 
                        contactName = l_names_0.contactName, 
                        displayName = l_names_0.displayName, 
                        username = l_names_0.username
                    }
                }
            }
        }
    });
end;