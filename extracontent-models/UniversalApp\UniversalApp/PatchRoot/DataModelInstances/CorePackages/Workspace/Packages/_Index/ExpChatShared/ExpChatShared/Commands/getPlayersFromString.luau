local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
return function(v2, v3) --[[ Line: 12 ]] --[[ Name: getPlayersFromCommand ]]
    -- upvalues: l_Dictionary_0 (copy)
    if not v3 then
        return {};
    else
        assert(v3, "will exist");
        v3 = string.lower(v3);
        if v3 and string.sub(v3, 1, 1) == "@" then
            local v4 = string.sub(v3, 2);
            local v5 = v2.byUsername[v4];
            if v5 then
                return {
                    l_Dictionary_0.join(v2.byUserId[v5], {
                        nameToDisplay = "@" .. v2.byUserId[v5].username
                    })
                };
            end;
        end;
        return l_Dictionary_0.map(v2.byDisplayName[v3] or {}, function(v6) --[[ Line: 28 ]]
            -- upvalues: l_Dictionary_0 (ref), v2 (copy)
            return l_Dictionary_0.join(v2.byUserId[v6], {
                nameToDisplay = v2.byUserId[v6].displayName
            });
        end);
    end;
end;