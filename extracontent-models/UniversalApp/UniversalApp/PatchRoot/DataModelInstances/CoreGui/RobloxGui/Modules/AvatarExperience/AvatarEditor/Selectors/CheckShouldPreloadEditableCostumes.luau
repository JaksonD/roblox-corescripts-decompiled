local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v6) --[[ Line: 14 ]] --[[ Name: CheckShouldPreloadEditableCostumes ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v4 (copy), l_RetrievalStatus_0 (copy)
    if l_PerformFetch_0.GetStatus(v6, v5.OutfitsKey .. v4.EditableCharacterKey) == l_RetrievalStatus_0.Fetching then
        return false;
    else
        local v7 = v6.AvatarExperience.AvatarEditor.PageFinished[v4.CharacterKey];
        local v8 = v6.AvatarExperience.AvatarEditor.PageFinished[v4.EditableCharacterKey];
        if v7 then
            return false;
        elseif v8 then
            return false;
        else
            local v9 = v6.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v4.EditableCharacterKey];
            if v9 and #v9 > v4.MaxPreloadEditableCharacters then
                return false;
            else
                return true;
            end;
        end;
    end;
end;