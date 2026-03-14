local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
return (require(l_Parent_0.ApolloClient).gql(require(script.Parent.schema.UserProfilesPlatformProfileIdsByUserIds)));