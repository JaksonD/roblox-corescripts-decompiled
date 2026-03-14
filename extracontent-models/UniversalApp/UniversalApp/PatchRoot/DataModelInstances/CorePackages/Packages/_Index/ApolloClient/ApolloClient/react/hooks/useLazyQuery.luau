local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(l_Parent_0.react.types.types);
local l_useBaseQuery_0 = require(script.Parent.utils.useBaseQuery).useBaseQuery;
local _ = require(l_Parent_0.core);
return {
    useLazyQuery = function(v7, v8) --[[ Line: 26 ]] --[[ Name: useLazyQuery ]]
        -- upvalues: l_useBaseQuery_0 (copy)
        return l_useBaseQuery_0(v7, v8, true);
    end
};