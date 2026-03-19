local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v19 = l_memoize_0(function(v9, v10) --[[ Line: 31 ]]
    -- upvalues: v3 (copy)
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    for _, v15 in v9 do
        if v15.selectedInTryOnManager then
            local l_itemRecency_0 = v15.itemRecency;
            if v15.itemType == v3.ItemType.Asset then
                if v15.itemSubType == v10 and (v11 == nil or v11 < l_itemRecency_0) then
                    v11 = l_itemRecency_0;
                    v12 = v15.itemId;
                    v13 = nil;
                end;
            elseif v15.bundleInfo then
                for v17, v18 in v15.bundleInfo do
                    if v18.assetType == v10 and (v11 == nil or v11 < l_itemRecency_0) then
                        v11 = l_itemRecency_0;
                        v12 = v17;
                        v13 = v15.bundleInfo;
                    end;
                end;
            end;
        end;
    end;
    return v12, v13, v11;
end);
return function(v20, v21) --[[ Line: 75 ]]
    -- upvalues: v19 (copy)
    local l_TryOnItems_0 = v20.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return v19(l_TryOnItems_0, v21);
end;