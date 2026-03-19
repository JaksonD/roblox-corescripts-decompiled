local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.llama);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v4 = require(l_Parent_0.getDeepValue);
local function v7(v5, v6) --[[ Line: 10 ]]
    return v5.rank < v6.rank;
end;
return function(v8) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v2 (copy), v7 (copy)
    local l_keyPath_0 = v8.keyPath;
    return function(v10, v11) --[[ Line: 20 ]]
        -- upvalues: v4 (ref), l_keyPath_0 (copy), v2 (ref), v7 (ref)
        local v12 = v4(v10, string.format("%s.recommendations.byUserId.%s", l_keyPath_0, v11)) or {};
        return v2.List.sort(v2.Dictionary.values(v12), v7);
    end;
end;