local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v2.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local _ = function(v11, _, v13, v14, _) --[[ Line: 26 ]] --[[ Name: _separateSortedAssets ]]
    if v11[v13.typeId] and v11[v13.typeId][v13.id] then
        v14[v13.id] = {
            assetTypeId = v13.typeId, 
            order = v13.order
        };
    end;
end;
local function v30(v17, v18, v19, v20, _, _, _) --[[ Line: 35 ]]
    -- upvalues: v5 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v6 (copy)
    local v24 = {};
    local v25 = nil;
    local v26 = {};
    local v27 = {};
    if v18 ~= v5.ItemType.Bundle and v19 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v19] then
        local _, v29 = v6.getTableAndOrderAfterEquippingIntoSort(v20, {
            id = v17, 
            typeId = v19
        });
        v25 = v29;
    end;
    return {
        overrideOrder = v25, 
        bundleInfoMapping = v24, 
        equippedAssetsToSetOrder = v26, 
        itemIdToOrderMap = v27
    };
end;
return function(v31, v32, v33, v34, v35) --[[ Line: 112 ]]
    -- upvalues: v4 (copy), v30 (copy)
    local l_EquippedAssets_0 = v31.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AssetInfos_0 = v31.AvatarExperience.Common.AssetInfos;
    local v38 = v4.getBundleInfoFromState(v31, v32);
    return (v30(v32, v33, v34, v35, l_EquippedAssets_0, l_AssetInfos_0, v38));
end;