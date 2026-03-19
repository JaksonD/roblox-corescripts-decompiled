local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(script.Parent.Parent.types.types);
local l_useBaseQuery_0 = require(script.Parent.utils.useBaseQuery).useBaseQuery;
local _ = require(l_Parent_0.core);
v0.useQuery = function(v8, v9) --[[ Line: 27 ]] --[[ Name: useQuery ]]
    -- upvalues: l_useBaseQuery_0 (copy)
    return l_useBaseQuery_0(v8, v9, false);
end;
return v0;