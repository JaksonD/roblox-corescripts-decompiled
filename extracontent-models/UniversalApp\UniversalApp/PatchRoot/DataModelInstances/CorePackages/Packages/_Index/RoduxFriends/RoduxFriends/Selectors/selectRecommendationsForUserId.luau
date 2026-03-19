local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(script.Parent.filterByKeys);
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_keyPath_0 = v4.keyPath;
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: v1 (ref), l_keyPath_0 (copy), v3 (ref)
        return function(v7, v8) --[[ Line: 13 ]]
            -- upvalues: v1 (ref), v6 (copy), l_keyPath_0 (ref), v3 (ref)
            local v9 = v1(v6, string.format("%s.recommendations.byUserId.%s", l_keyPath_0, v7 or "")) or {};
            if v8 then
                return (v3(v8, v9));
            else
                return v9;
            end;
        end;
    end;
end;