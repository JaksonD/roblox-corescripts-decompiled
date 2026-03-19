local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v9) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), v4 (copy), v6 (copy), l_PerformFetch_0 (copy), v5 (copy)
    local v10 = v7.getAvatarEditorCategoryInfoFromState(v9).RenderOutfitItemTiles == true;
    local v11 = v4.selectAssetTypeKey(v9);
    local l_Failed_0 = v6.Failed;
    if v11 then
        if v10 then
            return (l_PerformFetch_0.GetStatus(v9, v5.OutfitsKey .. v11));
        else
            l_Failed_0 = l_PerformFetch_0.GetStatus(v9, v5.UserInventoryKey .. v11);
        end;
    end;
    return l_Failed_0;
end;