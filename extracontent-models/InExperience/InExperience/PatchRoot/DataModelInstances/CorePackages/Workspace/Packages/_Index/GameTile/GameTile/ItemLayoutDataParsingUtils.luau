local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
return {
    getWideImageAssetId = function(v2) --[[ Line: 9 ]] --[[ Name: getWideImageAssetId ]]
        if v2 and v2.primaryMediaAsset and v2.primaryMediaAsset.wideImageAssetId and v2.primaryMediaAsset.wideImageAssetId ~= "" then
            return v2.primaryMediaAsset.wideImageAssetId;
        else
            return nil;
        end;
    end
};