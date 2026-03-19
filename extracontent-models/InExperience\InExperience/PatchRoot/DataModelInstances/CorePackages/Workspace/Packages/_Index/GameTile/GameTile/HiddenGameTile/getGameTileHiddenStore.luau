local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.HiddenGameTile.createGameTileHiddenStore);
local v2 = {};
return function(v3) --[[ Line: 8 ]] --[[ Name: getGameTileHiddenStore ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2[v3];
    if v4 == nil then
        v2[v3] = v1();
        v4 = v2[v3];
    end;
    return v4;
end;