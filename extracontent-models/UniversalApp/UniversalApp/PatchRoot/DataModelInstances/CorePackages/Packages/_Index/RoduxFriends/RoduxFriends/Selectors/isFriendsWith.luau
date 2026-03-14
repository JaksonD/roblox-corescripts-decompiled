local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script:FindFirstAncestor("RoduxFriends").Parent;
local v2 = require(l_Parent_1.llama);
local v3 = require(l_Parent_0.getDeepValue);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_keyPath_0 = v4.keyPath;
    return function(v6, v7, v8) --[[ Line: 10 ]]
        -- upvalues: v3 (ref), l_keyPath_0 (copy), v2 (ref)
        local v9 = v3(v6, l_keyPath_0 .. ".byUserId");
        if v9[v7] ~= nil and v2.List.find(v9[v7], v8) then
            return true;
        else
            return false;
        end;
    end;
end;