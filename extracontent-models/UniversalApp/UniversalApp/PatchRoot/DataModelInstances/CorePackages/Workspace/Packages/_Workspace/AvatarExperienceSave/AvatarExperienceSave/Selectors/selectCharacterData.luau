local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
return function(v2) --[[ Line: 5 ]] --[[ Name: selectCharacterData ]]
    return {
        tryOn = {
            TryOn = v2.AvatarExperience.AvatarScene.TryOn, 
            OutfitTryOn = v2.AvatarExperience.AvatarScene.OutfitTryOn, 
            LastSavedTriedOnOutfit = v2.AvatarExperience.AvatarScene.LastSavedTriedOnOutfit
        }, 
        equipped = {
            AvatarType = v2.AvatarExperience.AvatarEditor.Character.AvatarType, 
            AvatarScales = v2.AvatarExperience.AvatarEditor.Character.AvatarScales, 
            BodyColor3s = v2.AvatarExperience.AvatarEditor.Character.BodyColor3s, 
            BodyPartRangeIds = v2.AvatarExperience.AvatarEditor.Character.BodyPartRangeIds, 
            EquippedAssets = v2.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
            EquippedEmotes = v2.AvatarExperience.AvatarEditor.EquippedEmotes
        }
    };
end;