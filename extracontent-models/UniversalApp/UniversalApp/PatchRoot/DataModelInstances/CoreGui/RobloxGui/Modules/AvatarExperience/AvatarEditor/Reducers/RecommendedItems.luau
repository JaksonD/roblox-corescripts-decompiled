local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRecommendedItemsV2);
local v6 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v7 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
return v3.createReducer({}, {
    [v5.name] = function(v8, v9) --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v4 (copy), v6 (copy), v2 (copy)
        if v7() then
            v4.isType(v9.recommendationsType, "string", "recommendationsType must be a string.");
            v4.isType(v9.itemTypeId, "string", "itemTypeId must be a string.");
            v4.isType(v9.items, "table", "items data must be a table.");
            local v10 = v6.generateRecommendedItemsKey(v9.itemTypeId, v9.recommendationsType);
            local v11 = {};
            for _, v13 in v9.items do
                local l_id_0 = v13.id;
                local l_itemType_0 = v13.itemType;
                if l_id_0 and l_itemType_0 then
                    table.insert(v11, {
                        itemId = tostring(l_id_0), 
                        itemType = l_itemType_0
                    });
                end;
            end;
            return v2.Dictionary.join(v8, {
                [v10] = v11
            });
        else
            v4.isType(v9.itemTypeId, "string", "itemTypeId must be a string.");
            v4.isType(v9.items, "table", "items data must be a table.");
            local l_itemTypeId_0 = v9.itemTypeId;
            local l_items_0 = v9.items;
            local v18 = {};
            for _, v20 in l_items_0 do
                local l_id_1 = v20.id;
                if l_id_1 then
                    v18[#v18 + 1] = tostring(l_id_1);
                end;
            end;
            return v2.Dictionary.join(v8, {
                [l_itemTypeId_0] = v18
            });
        end;
    end
});