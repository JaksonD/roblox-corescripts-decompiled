local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_getApolloContext_0 = require(script.Parent.ApolloContext).getApolloContext;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.core.ApolloClient);
ApolloConsumer = function(v6) --[[ Line: 21 ]] --[[ Name: ApolloConsumer ]]
    -- upvalues: l_getApolloContext_0 (copy), v2 (copy), l_invariant_0 (copy)
    local v7 = l_getApolloContext_0();
    return v2.createElement(v7.Consumer, nil, function(v8) --[[ Line: 23 ]]
        -- upvalues: l_invariant_0 (ref), v6 (copy)
        l_invariant_0(v8 and v8.client, "Could not find \"client\" in the context of ApolloConsumer. Wrap the root component in an <ApolloProvider>.");
        return v6.children(v8.client);
    end);
end;
return {
    ApolloConsumer = ApolloConsumer
};