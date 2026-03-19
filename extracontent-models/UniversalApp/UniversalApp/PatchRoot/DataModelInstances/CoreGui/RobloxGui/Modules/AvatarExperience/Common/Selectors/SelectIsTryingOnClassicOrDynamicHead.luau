local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v15 = l_memoize_0(function(v6, v7, v8) --[[ Line: 26 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v9 = false;
    local v10 = false;
    for v11, v12 in v8 do
        if v12.itemType == v2.ItemType.Asset and v12.itemSubType == v2.AssetTypeIdStrings.Head then
            v9 = true;
        elseif v12.itemType == v2.ItemType.Bundle then
            if v12.itemSubType == v2.BundleTypeIdStrings.DynamicHead then
                v10 = true;
            elseif v12.itemSubType == v2.BundleTypeIdStrings.BodyParts then
                local v13 = v3.getBundleInfo(v6, v11);
                local v14 = v3.getOutfitInfoFromBundleIdNoState(v13, v7);
                if not (v12.receivedBundleInfo and v14 ~= nil) then
                    return v9, v10, false;
                elseif not if v14 then v14.containsDynamicHead else false then
                    v9 = true;
                else
                    v10 = true;
                end;
            end;
        end;
    end;
    return v9, v10, true;
end);
return function(v16) --[[ Line: 59 ]]
    -- upvalues: v15 (copy)
    local l_BundleInfos_0 = v16.AvatarExperience.Common.BundleInfos;
    local l_OutfitInfos_0 = v16.AvatarExperience.AvatarEditor.OutfitInfos;
    local l_TryOnItems_0 = v16.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return v15(l_BundleInfos_0, l_OutfitInfos_0, l_TryOnItems_0);
end;