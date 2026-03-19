local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Style);
local v3 = require(l_Parent_0.CollectionViews);
local v4 = require(l_script_FirstAncestor_0.GameCollectionLayoutCalculators);
local l_CollectionItemSize_0 = v3.CollectionViewTypes.CollectionItemSize;
local l_useCollectionLayoutParams_0 = v3.useCollectionLayoutParams;
local l_GameTileLayoutType_0 = require(l_Parent_0.GameTile).GameTileTypes.GameTileLayoutType;
local v8 = {
    [l_GameTileLayoutType_0.Event] = l_CollectionItemSize_0.Large, 
    [l_GameTileLayoutType_0.Wide] = l_CollectionItemSize_0.Medium, 
    [l_GameTileLayoutType_0.Narrow] = l_CollectionItemSize_0.Small
};
return function(v9, v10, v11, v12, v13) --[[ Line: 29 ]] --[[ Name: useGameCollectionLayoutParams ]]
    -- upvalues: v8 (copy), l_CollectionItemSize_0 (copy), l_useCollectionLayoutParams_0 (copy), v4 (copy)
    local v14 = v8[v9] or l_CollectionItemSize_0.Small;
    return l_useCollectionLayoutParams_0(v14, v10, v11, v12, v4, v13);
end;