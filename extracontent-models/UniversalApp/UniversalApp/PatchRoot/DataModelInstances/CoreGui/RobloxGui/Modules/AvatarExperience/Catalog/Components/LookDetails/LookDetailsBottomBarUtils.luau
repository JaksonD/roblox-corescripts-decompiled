local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v15 = {
    getItemInfo = function(v9, v10, v11, v12) --[[ Line: 19 ]]
        -- upvalues: v4 (copy)
        if not v11 or not v12 then
            return nil;
        else
            local v13 = v11[v12];
            if not v13 then
                return nil;
            elseif v10 == v4.ItemType.Asset then
                return v13.lookAssetInfos[v9];
            elseif v10 == v4.ItemType.Bundle then
                local l_lookBundleInfos_0 = v13.lookBundleInfos;
                if l_lookBundleInfos_0 then
                    return l_lookBundleInfos_0[v9];
                else
                    return nil;
                end;
            else
                return nil;
            end;
        end;
    end
};
v15.getOwnedTryOnItems = function(v16, v17, v18) --[[ Line: 48 ]]
    -- upvalues: v15 (copy)
    local v19 = {};
    for v20, v21 in v16 do
        if v21.selectedInTryOnManager then
            local v22 = v15.getItemInfo(v21.itemId, v21.itemType, v17, v18);
            if v22 and v22.quantityOwned > 0 then
                v19[v20] = v21;
            end;
        end;
    end;
    return v19;
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    v15.getOwnedItemsInLook = function(v23, v24, v25) --[[ Line: 72 ]]
        -- upvalues: v15 (copy)
        local v26 = {};
        for v27, v28 in v23 do
            local v29 = if v28.itemType then v15.getItemInfo(v28.id, v28.itemType, v24, v25) else nil;
            if v29 and v29.quantityOwned > 0 then
                v26[v27] = v28;
            end;
        end;
        return v26;
    end;
end;
return v15;