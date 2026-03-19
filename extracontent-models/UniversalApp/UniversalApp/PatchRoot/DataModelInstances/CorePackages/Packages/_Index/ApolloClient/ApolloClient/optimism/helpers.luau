local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local _ = require(script.Parent.helpers_types);
return {
    hasOwnProperty = require(l_Parent_0.luaUtils.hasOwnProperty), 
    toArray = function(v4) --[[ Line: 23 ]] --[[ Name: toArray ]]
        if v4._array then
            return table.clone(v4._array);
        else
            local v5 = {};
            v4:forEach(function(v6) --[[ Line: 31 ]]
                -- upvalues: v5 (copy)
                table.insert(v5, v6);
            end);
            return v5;
        end;
    end, 
    maybeUnsubscribe = function(v7) --[[ Line: 41 ]] --[[ Name: maybeUnsubscribe ]]
        local l_unsubscribe_0 = v7.unsubscribe;
        if type(l_unsubscribe_0) == "function" then
            v7.unsubscribe = nil;
            l_unsubscribe_0();
        end;
    end
};