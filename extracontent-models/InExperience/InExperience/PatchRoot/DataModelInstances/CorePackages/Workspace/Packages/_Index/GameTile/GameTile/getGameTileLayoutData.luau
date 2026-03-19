local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v2 = {};
return function(v3, v4) --[[ Line: 9 ]] --[[ Name: getGameTileLayoutData ]]
    -- upvalues: v2 (copy)
    if v3 and v3.layoutDataBySort and v4 and v4 ~= "" and v3.layoutDataBySort[v4] then
        return v3.layoutDataBySort[v4];
    elseif v3 and v3.defaultLayoutData then
        return v3.defaultLayoutData;
    else
        return v2;
    end;
end;