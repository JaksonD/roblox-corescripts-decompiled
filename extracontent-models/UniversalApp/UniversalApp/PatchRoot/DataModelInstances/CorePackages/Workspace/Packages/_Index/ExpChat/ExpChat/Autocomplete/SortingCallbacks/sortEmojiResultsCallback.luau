local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v2 = require(l_Parent_0.EmojiList);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_List_0 (copy), v2 (copy)
    return l_List_0.sort(v3, function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v2 (ref)
        if v2[v4].popularity == v2[v5].popularity then
            return v4 < v5;
        else
            return v2[v4].popularity < v2[v5].popularity;
        end;
    end);
end;