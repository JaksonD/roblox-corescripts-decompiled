local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local _ = require(l_Parent_0.language.ast);
local _ = require(l_Parent_0.execution.execute);
local _ = require(l_Parent_0.type.schema);
local _ = require(l_Parent_0.type.definition);
return {
    subscribe = function(_) --[[ Line: 35 ]] --[[ Name: subscribe ]]
        error("graphql-lua does not currently implement subscriptions");
    end, 
    createSourceEventStream = function(_, _, _, _, _, _, _) --[[ Line: 39 ]] --[[ Name: createSourceEventStream ]]
        error("graphql-lua does not currently implement subscriptions");
    end
};