local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
local l_PlayingSwimAnimation_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Reducers.PlayingSwimAnimation;
local v3 = require(l_Parent_0.CurrentCharacter);
local v4 = require(l_Parent_0.CharacterVersion);
local v5 = require(l_Parent_0.CharacterModelVersion);
local v6 = require(l_Parent_0.TryOnCharacterModelVersion);
local v7 = require(l_Parent_0.SavedCharacterModelVersion);
local v8 = require(l_Parent_0.ApplyingLayeredClothing);
local v9 = require(l_Parent_0.ShouldDelaySaveManager);
local v10 = require(l_Parent_0.WaitingOnLayeredClothingUpdates);
return function(v11, v12) --[[ Line: 29 ]]
    -- upvalues: v4 (copy), v3 (copy), l_PlayingSwimAnimation_0 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v10 (copy)
    v11 = v11 or {};
    return {
        CharacterVersion = v4(v11.CharacterVersion, v12), 
        CurrentCharacter = v3(v11.CurrentCharacter, v12), 
        PlayingSwimAnimation = l_PlayingSwimAnimation_0(v11.PlayingSwimAnimation, v12), 
        ApplyingLayeredClothing = v8(v11.ApplyingLayeredClothing, v12), 
        CharacterModelVersion = v5(v11.CharacterModelVersion, v12), 
        TryOnCharacterModelVersion = v6(v11.TryOnCharacterModelVersion, v12), 
        SavedCharacterModelVersion = v7(v11.SavedCharacterModelVersion, v12), 
        ShouldDelaySaveManager = v9(v11.ShouldDelaySaveManager, v12), 
        WaitingOnLayeredClothingUpdates = v10(v11.WaitingOnLayeredClothingUpdates, v12)
    };
end;