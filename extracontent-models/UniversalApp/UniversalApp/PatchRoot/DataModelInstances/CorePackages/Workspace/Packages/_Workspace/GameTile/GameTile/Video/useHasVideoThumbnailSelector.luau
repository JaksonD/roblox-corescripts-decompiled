local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
return function(v5, v6) --[[ Line: 10 ]] --[[ Name: useHasVideoThumbnailSelector ]]
    -- upvalues: l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v4 (copy)
    local v8 = l_useSelector_0(function(v7) --[[ Line: 11 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), v5 (copy)
        return v7.Personalization[l_GameInfosReducer_0.key][v5];
    end);
    local v9 = v4(v8, v6);
    return (v9 and v9.primaryMediaAsset and v9.primaryMediaAsset.wideVideoAssetId) ~= nil;
end;