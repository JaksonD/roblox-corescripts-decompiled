local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.roduxFriendsTypes);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_Object_0 (copy)
    local l_keyPath_0 = v5.keyPath;
    return function(v7) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), l_keyPath_0 (copy), l_Object_0 (ref)
        return function(v8) --[[ Line: 12 ]]
            -- upvalues: v2 (ref), v7 (copy), l_keyPath_0 (ref), l_Object_0 (ref)
            local v9 = v2(v7, string.format("%s.recommendations.bySource.%s", l_keyPath_0, v8 or "")) or {};
            return l_Object_0.keys(v9);
        end;
    end;
end;