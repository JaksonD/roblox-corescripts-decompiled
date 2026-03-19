local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.ApolloContext);
local v3 = require(script.ApolloConsumer);
local v4 = require(script.ApolloProvider);
return (l_Object_0.assign({}, v2, v3, v4));