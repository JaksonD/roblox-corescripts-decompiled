local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_WeakMap_0 = require(l_Parent_0.LuauPolyfill).WeakMap;
local v2 = require(l_Parent_0.React);
local _ = require(script.Parent.Parent.Parent.core);
local v4 = l_WeakMap_0.new();
return {
    getApolloContext = function() --[[ Line: 33 ]] --[[ Name: getApolloContext ]]
        -- upvalues: v4 (ref), v2 (copy)
        local v5 = v4:get(v2.createContext);
        if v5 == nil then
            v5 = v2.createContext({});
            v5.displayName = "ApolloContext";
            v4:set(v2.createContext, v5);
        end;
        return v5;
    end, 
    resetApolloContext = function() --[[ Line: 45 ]] --[[ Name: resetApolloContext ]]
        -- upvalues: v4 (ref), l_WeakMap_0 (copy)
        v4 = l_WeakMap_0.new();
    end
};