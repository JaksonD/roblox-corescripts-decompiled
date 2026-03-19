local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_CharacterHistoryStateChangeButtonActivated_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
return v2.createReducer(v6.AvatarType.R15, {
    [v4.name] = function(v9, v10) --[[ Line: 23 ]]
        -- upvalues: v6 (copy)
        local l_playerAvatarType_0 = v10.avatarData.playerAvatarType;
        if l_playerAvatarType_0 and v6.AvatarType[l_playerAvatarType_0] == l_playerAvatarType_0 then
            return l_playerAvatarType_0;
        else
            return v9;
        end;
    end, 
    [v5.name] = function(_, v13) --[[ Line: 31 ]]
        return v13.avatarType;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v14, v15) --[[ Line: 34 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v15.equipped and v15.equipped.AvatarType then
            return v15.equipped.AvatarType;
        else
            return v14;
        end;
    end
});