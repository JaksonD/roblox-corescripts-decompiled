local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v2 = require(l_Modules_0.AvatarExperience.Common.Actions.AddSelectedBundleInfo);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOrderedToggledOnItemsList);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnItems);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v6 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
return function(v7) --[[ Line: 21 ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), v6 (copy), v5 (copy), v2 (copy)
    return function(v8) --[[ Line: 22 ]]
        -- upvalues: v3 (ref), v4 (ref), v7 (copy), v1 (ref), v6 (ref), v5 (ref), v2 (ref)
        local v9 = v8:getState();
        local v10, v11 = v3(v9);
        local v12 = v4(v9, v7, v1.ItemType.Bundle, nil, v10, v11);
        if v12.equippedAssetsToSetOrder then
            v8:dispatch(v6(v12.equippedAssetsToSetOrder));
        end;
        if v12.itemIdToOrderMap then
            v8:dispatch(v5(v12.itemIdToOrderMap));
        end;
        v8:dispatch(v2(v7, v12.bundleInfoMapping));
    end;
end;