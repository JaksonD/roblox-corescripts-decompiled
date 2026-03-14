local l_Parent_0 = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent;
local _ = require(l_Parent_0.InteractionFeedback);
local l_Sounds_0 = require(l_Parent_0.SoundManager).Sounds;
return {
    PlayExperienceButton = {
        Release = {
            Sound = l_Sounds_0.NotificationHigh.Name
        }
    }, 
    MakePurchase = {
        Press = {
            Sound = l_Sounds_0.Purchase.Name, 
            Haptic = Enum.HapticEffectType.UIClick
        }
    }, 
    TileLongPress = {
        Press = {
            Haptic = Enum.HapticEffectType.UIClick
        }
    }
};