local l_Parent_0 = script.Parent.Parent;
local l_Symbol_0 = require(l_Parent_0.LuauPolyfill).Symbol;
return {
    isAsyncIterable = function(v2) --[[ Line: 12 ]] --[[ Name: isAsyncIterable ]]
        -- upvalues: l_Symbol_0 (copy)
        local l_asyncIterator_0 = l_Symbol_0.asyncIterator;
        local v4 = false;
        if typeof(v2) == "table" then
            v4 = false;
            if v2 ~= nil then
                v4 = l_asyncIterator_0 and v2[l_asyncIterator_0] and typeof(v2[l_asyncIterator_0]) == "function";
            end;
        end;
        return v4;
    end
};