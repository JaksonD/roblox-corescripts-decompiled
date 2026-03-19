local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(script.Parent.OutfitTryOn);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.SetLastSavedTriedOnOutfit);
local l_CharacterHistoryStateChangeButtonActivated_0 = v2.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
return v3.createReducer({}, {
    [v6.name] = function(_, v10) --[[ Line: 26 ]]
        return v10.savedOutfit;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v11, v12) --[[ Line: 30 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v12.tryOn and v12.tryOn.LastSavedTriedOnOutfit then
            return table.clone(v12.tryOn.LastSavedTriedOnOutfit);
        else
            return v11;
        end;
    end
});