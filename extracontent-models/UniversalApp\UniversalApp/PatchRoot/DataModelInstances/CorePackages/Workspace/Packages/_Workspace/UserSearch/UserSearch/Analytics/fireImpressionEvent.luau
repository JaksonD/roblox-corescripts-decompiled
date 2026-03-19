local v0 = require(script.Parent.EventNames);
local v1 = require(script.Parent.getTileRowInSort);
return function(v2, v3) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_impressions_0 = v2.impressions;
    local l_entries_0 = v2.entries;
    local l_startRowNumber_0 = v2.startRowNumber;
    local l_itemsPerRow_0 = v2.itemsPerRow;
    if not l_entries_0 then
        return;
    else
        local v8 = {};
        local v9 = {};
        local v10 = {};
        local v11 = {};
        for v12 = 1, #l_impressions_0 do
            local v13 = l_impressions_0[v12];
            local v14 = l_entries_0[v13];
            if v14 then
                table.insert(v8, v13);
                table.insert(v9, v14.id);
                table.insert(v10, v14.name);
                table.insert(v11, (v1(v13, l_startRowNumber_0, l_itemsPerRow_0)));
            end;
        end;
        v3(v0.PlayerTileImpressions, {
            tilePos = v8, 
            playerId = v9, 
            playerName = v10, 
            rowInSort = v11
        });
        return;
    end;
end;