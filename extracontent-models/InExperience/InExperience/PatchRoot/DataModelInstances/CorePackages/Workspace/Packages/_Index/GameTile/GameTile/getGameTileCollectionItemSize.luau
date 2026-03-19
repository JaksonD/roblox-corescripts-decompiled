local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_GameTileLayoutType_0 = require(l_script_FirstAncestor_0.GameTileTypes).GameTileLayoutType;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
return function(v4) --[[ Line: 12 ]] --[[ Name: getGameTileCollectionItemSize ]]
    -- upvalues: l_GameTileLayoutType_0 (copy), l_CollectionItemSize_0 (copy)
    if v4 == l_GameTileLayoutType_0.Narrow then
        return l_CollectionItemSize_0.Small;
    elseif v4 == l_GameTileLayoutType_0.Wide then
        return l_CollectionItemSize_0.Medium;
    elseif v4 == l_GameTileLayoutType_0.Event then
        return l_CollectionItemSize_0.Large;
    else
        return l_CollectionItemSize_0.Small;
    end;
end;