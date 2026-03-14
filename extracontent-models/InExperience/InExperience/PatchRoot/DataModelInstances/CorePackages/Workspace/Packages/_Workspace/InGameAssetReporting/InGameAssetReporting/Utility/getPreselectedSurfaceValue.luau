local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
getPreselectedSurfaceValue = function(v2) --[[ Line: 14 ]] --[[ Name: getPreselectedSurfaceValue ]]
    if v2 == nil then
        return nil;
    else
        local l_extractedAssets_0 = v2.extractedAssets;
        if #v2.extractedPlayers > 0 then
            return "avatar";
        elseif #l_extractedAssets_0.Image > 0 or #l_extractedAssets_0.Mesh > 0 or #l_extractedAssets_0.Model > 0 or #l_extractedAssets_0.Package > 0 or #l_extractedAssets_0.Video > 0 then
            return "item";
        elseif #l_extractedAssets_0.Text > 0 then
            return "text";
        else
            return nil;
        end;
    end;
end;
return getPreselectedSurfaceValue;