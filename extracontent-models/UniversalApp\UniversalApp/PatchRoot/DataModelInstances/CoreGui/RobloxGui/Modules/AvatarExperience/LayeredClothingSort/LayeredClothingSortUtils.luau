local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getTryOnItemReducerKey_0 = v3.Utils.getTryOnItemReducerKey;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v3.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_FFlagFixLayeredSorting_0 = v2.FFlagFixLayeredSorting;
local l_FFlagAXCustomizeMakeupSupport_0 = v2.FFlagAXCustomizeMakeupSupport;
local v16 = game:DefineFastFlag("AXLCSCouldNotFindTypeIdMutedError", false);
return {
    createAssetIdToOrderMapping = l_memoize_0(function(v17) --[[ Line: 36 ]]
        local v18 = {};
        for v19, v20 in v17 do
            v18[v20.id] = {
                order = #v17 - v19, 
                assetTypeId = v20.typeId
            };
        end;
        return v18;
    end), 
    formatForSetOrder = l_memoize_0(function(v21, v22) --[[ Line: 51 ]]
        if not v22 then
            return nil;
        else
            local v23 = {};
            for v24, v25 in v21 do
                if v22[v25.typeId] and v22[v25.typeId][v25.id] or v25.equipped then
                    v23[v25.id] = {
                        order = #v21 - v24, 
                        assetTypeId = v25.typeId
                    };
                end;
            end;
            return v23;
        end;
    end), 
    formatForSetOrderWithTryOns = l_memoize_0(function(v26, v27, v28, _) --[[ Line: 73 ]]
        -- upvalues: l_getTryOnItemReducerKey_0 (copy), v6 (copy)
        if not v27 then
            return nil;
        else
            local v30 = {};
            local v31 = {};
            for v32, v33 in v26 do
                local v34 = l_getTryOnItemReducerKey_0(v33.id, v6.ItemType.Asset);
                if v27[v33.typeId] and v27[v33.typeId][v33.id] or v33.equipped then
                    v30[v33.id] = {
                        order = #v26 - v32, 
                        assetTypeId = v33.typeId
                    };
                elseif v28 and v28[v34] then
                    v31[v33.id] = #v26 - v32;
                else
                    assert(v28 ~= nil, "tryOnItems should not be nil");
                    for _, v36 in v28 do
                        if v36.bundleInfo and v36.bundleInfo[v33.id] then
                            v31[v33.id] = #v26 - v32;
                            break;
                        end;
                    end;
                end;
            end;
            return v30, v31;
        end;
    end), 
    formatForEquipOutfit = l_memoize_0(function(v37, v38) --[[ Line: 124 ]]
        -- upvalues: v7 (copy)
        if not v38 then
            return nil;
        else
            local v39 = {};
            for v40, v41 in v37 do
                if v38[v41.typeId] and v38[v41.typeId][v41.id] or v41.equipped then
                    local v42 = v7.getDefaultMetadata(v41.typeId);
                    v42.order = #v37 - v40;
                    v39[v41.typeId] = {
                        [v41.id] = v42
                    };
                end;
            end;
            return v39;
        end;
    end), 
    getTableAndOrderAfterEquippingIntoSort = l_memoize_0(function(v43, v44) --[[ Line: 158 ]]
        -- upvalues: v6 (copy), v16 (copy), l_mutedError_0 (copy), l_FFlagFixLayeredSorting_0 (copy)
        if not v6.LayeredClothingOrder[v44.typeId] then
            return v43, 0;
        else
            local v45 = 0;
            local v46 = 0;
            for v47, v48 in v43 do
                if v16 and v6.LayeredClothingOrder[v48.typeId] == nil then
                    l_mutedError_0((("getTableAndOrderAfterEquippingIntoSort could not find in layeredClothingOrder typeId: %* assetId: %*"):format(v48.typeId, v48.id)));
                end;
                if v48.typeId == v44.typeId then
                    v45 = v47;
                    if l_FFlagFixLayeredSorting_0 and v48.id == v44.id then
                        table.remove(v43, v45);
                        return v43, (math.max(0, v45 - 1));
                    end;
                elseif v45 == 0 and v6.LayeredClothingOrder[v48.typeId] > v6.LayeredClothingOrder[v44.typeId] then
                    v46 = v47;
                end;
            end;
            local v49 = 1;
            if v45 > 0 then
                v49 = v45;
            elseif v46 > 0 then
                v49 = v46 + 1;
            end;
            table.insert(v43, v49, v44);
            return v43, #v43 - v49;
        end;
    end), 
    getSortedEquippedLCIfNoDefault = l_memoize_0(function(v50) --[[ Line: 209 ]]
        -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v6 (copy)
        if not v50 then
            return nil;
        else
            local v51 = {};
            local v52 = {};
            local v53 = true;
            for v54, v55 in v50 do
                if not l_FFlagAXCustomizeMakeupSupport_0 or not l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v54] then
                    for v56, v57 in v55 do
                        if v57.order and v57.order ~= v6.LayeredClothingOrder[v54] then
                            v53 = false;
                        end;
                        if v57.isLayered then
                            v51[v56] = v57.order or v6.LayeredClothingOrder[v54];
                            table.insert(v52, {
                                id = v56, 
                                typeId = v54
                            });
                        end;
                    end;
                end;
            end;
            if v53 then
                return nil;
            else
                table.sort(v52, function(v58, v59) --[[ Line: 245 ]]
                    -- upvalues: v51 (copy)
                    return v51[v58.id] > v51[v59.id];
                end);
                return v52;
            end;
        end;
    end)
};