local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 15 ]] --[[ Name: createGameTileHiddenStore ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal({});
    return {
        setGameHidden = function(v4, v5) --[[ Line: 18 ]]
            -- upvalues: v2 (copy), v3 (copy)
            local v6 = table.clone(v2(false));
            v6[v4] = v5;
            v3(v6);
        end, 
        getHiddenGames = v2
    };
end;