local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getTryOnItemReducerKey_0 = v3.Utils.getTryOnItemReducerKey;
local l_LAYERED_MAKEUP_ORDER_0 = v3.Constants.LAYERED_MAKEUP_ORDER;
local l_MAX_MAKEUP_LAYERS_0 = v3.Constants.MAX_MAKEUP_LAYERS;
return {
    getEquippedAssetsBasedOnSortTable = function(v11, v12, v13, v14) --[[ Line: 30 ]]
        -- upvalues: v6 (copy), v2 (copy), l_getTryOnItemReducerKey_0 (copy), v5 (copy)
        if not v12 then
            return {};
        else
            local v15 = {};
            for v16, v17 in v11 do
                if v12[v17.typeId] and v12[v17.typeId][v17.id] then
                    local v18 = v6.getDefaultMetadata(v17.typeId);
                    v18.order = #v11 - v16;
                    v15[v17.typeId] = v2.Dictionary.join(v15[v17.typeId] or {}, {
                        [v17.id] = v18
                    });
                end;
                if v14 then
                    for v19, v20 in v14 do
                        if v19 == v17.id and not v13[l_getTryOnItemReducerKey_0(v19, v5.ItemType.Asset)] then
                            local v21 = v6.getDefaultMetadata(v20);
                            v21.order = #v11 - v16;
                            v15[v17.typeId] = v2.Dictionary.join(v15[v17.typeId] or {}, {
                                [v17.id] = v21
                            });
                        end;
                    end;
                end;
            end;
            return v15;
        end;
    end, 
    getTryOnItemsOrderBasedOnSortTable = function(v22, v23) --[[ Line: 73 ]]
        -- upvalues: l_getTryOnItemReducerKey_0 (copy), v5 (copy)
        if not v23 then
            return {};
        else
            local v24 = {};
            for v25, v26 in v22 do
                if v23[l_getTryOnItemReducerKey_0(v26.id, v5.ItemType.Asset)] then
                    v24[v26.id] = #v22 - v25;
                end;
            end;
            return v24;
        end;
    end, 
    getTableAndOrderAfterEquippingIntoSort = function(v27, v28) --[[ Line: 98 ]]
        -- upvalues: l_LAYERED_MAKEUP_ORDER_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy)
        if not l_LAYERED_MAKEUP_ORDER_0[v28.typeId] then
            return v27, 0;
        else
            local l_v27_0 = v27;
            table.insert(l_v27_0, 1, v28);
            if #l_v27_0 > l_MAX_MAKEUP_LAYERS_0 then
                l_v27_0 = {
                    table.unpack(l_v27_0, 1, l_MAX_MAKEUP_LAYERS_0)
                };
            end;
            return l_v27_0, #l_v27_0;
        end;
    end, 
    getSortedEquippedLayeredMakeup = function(v30) --[[ Line: 117 ]]
        -- upvalues: v5 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy)
        if not v30 then
            return nil;
        else
            local v31 = {};
            local v32 = {};
            for v33, v34 in v30 do
                if not v5.LayeredClothingOrder[v33] then
                    for v35, v36 in v34 do
                        if v36.isLayered then
                            v31[v35] = v36.order or l_LAYERED_MAKEUP_ORDER_0[v33];
                            table.insert(v32, {
                                id = v35, 
                                typeId = v33
                            });
                        end;
                    end;
                end;
            end;
            table.sort(v32, function(v37, v38) --[[ Line: 144 ]]
                -- upvalues: v31 (copy)
                return v31[v37.id] > v31[v38.id];
            end);
            return v32;
        end;
    end
};