local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function(v2) --[[ Line: 4 ]] --[[ Name: selectDefaultTryOnBodyColors ]]
    -- upvalues: v1 (copy)
    local l_OutfitTryOn_0 = v2.AvatarExperience.AvatarScene.OutfitTryOn;
    local l_OutfitInfos_0 = v2.AvatarExperience.AvatarEditor.OutfitInfos;
    local l_OutfitIdMap_0 = l_OutfitTryOn_0.OutfitIdMap;
    for _, v7 in l_OutfitTryOn_0.TryOnItems do
        if l_OutfitIdMap_0 and v7.itemType == "Bundle" and v7.itemSubType == v1.BODY_BUNDLE_TYPE_ID and v7.receivedBundleInfo then
            local v8 = l_OutfitIdMap_0[v7.itemId];
            local v9 = if v8 then l_OutfitInfos_0[v8] else nil;
            if v9 then
                return v9.bodyColor3s;
            else
                return nil;
            end;
        end;
    end;
    return nil;
end;