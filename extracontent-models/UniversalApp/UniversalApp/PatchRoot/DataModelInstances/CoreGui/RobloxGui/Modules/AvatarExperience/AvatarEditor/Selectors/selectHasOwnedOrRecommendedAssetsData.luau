local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v2 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local l_OwnedItemIdsBySubtype_0 = v4.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    local v6 = v1.getAvatarEditorCategoryInfoFromState(v4);
    local v7 = if v6.SearchUuid then v6.SearchUuid else v6.Name;
    local v8 = v1.getRecommendedKey(v6);
    if v3() then
        v8 = v2.generateRecommendedItemsKey(v8, v6.RecommendationsType);
    end;
    local v9 = false;
    if l_OwnedItemIdsBySubtype_0 ~= nil and v7 ~= nil and l_OwnedItemIdsBySubtype_0[v7] ~= nil then
        v9 = #l_OwnedItemIdsBySubtype_0[v7] > 0;
    end;
    local v10 = v4.AvatarExperience.AvatarEditor.RecommendedItems[v8] or {};
    return v6 and not v6.RenderItemTiles or v9 or #v10 > 0;
end;