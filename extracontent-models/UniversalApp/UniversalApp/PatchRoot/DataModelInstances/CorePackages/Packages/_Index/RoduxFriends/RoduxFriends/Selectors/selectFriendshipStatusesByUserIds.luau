local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(script.Parent.filterByKeys);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_keyPath_0 = v4.keyPath;
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), l_keyPath_0 (copy), v3 (ref)
        return function(v7) --[[ Line: 12 ]]
            -- upvalues: v1 (ref), v6 (copy), l_keyPath_0 (ref), v3 (ref)
            local v8 = v1(v6, string.format("%s.friendshipStatus", l_keyPath_0)) or {};
            if not v7 then
                return v8;
            else
                return v3(v7, v8);
            end;
        end;
    end;
end;