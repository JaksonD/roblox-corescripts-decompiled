local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v3) --[[ Line: 7 ]] --[[ Name: selectDefaultTryOnBodyColors ]]
    -- upvalues: v1 (copy)
    local l_OutfitTryOn_0 = v3.AvatarExperience.AvatarScene.OutfitTryOn;
    local l_OutfitInfos_0 = v3.AvatarExperience.AvatarEditor.OutfitInfos;
    local l_OutfitIdMap_0 = l_OutfitTryOn_0.OutfitIdMap;
    for _, v8 in l_OutfitTryOn_0.TryOnItems do
        if l_OutfitIdMap_0 and v8.itemType == "Bundle" and v1.BundleTypeIdStringToNameForBackend[v8.itemSubType] == "Body" and v8.receivedBundleInfo then
            local v9 = l_OutfitIdMap_0[v8.itemId];
            local v10 = if v9 then l_OutfitInfos_0[v9] else nil;
            if v10 then
                return v10.bodyColor3s;
            else
                return nil;
            end;
        end;
    end;
    return nil;
end;