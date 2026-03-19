local l_Parent_0 = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent;
local _ = require(l_Parent_0.InteractionFeedback);
local l_Sounds_0 = require(l_Parent_0.SoundManager).Sounds;
return {
    Default = {
        Press = {
            Sound = l_Sounds_0.AppSelect.Name, 
            Haptic = Enum.HapticEffectType.UIClick
        }, 
        Hover = {
            Sound = l_Sounds_0.AppHover1.Name, 
            Haptic = Enum.HapticEffectType.UIHover
        }
    }, 
    PlayExperienceButton = {
        Press = {
            Sound = l_Sounds_0.NotificationHigh.Name, 
            Haptic = Enum.HapticEffectType.UIClick
        }, 
        Hover = {
            Sound = l_Sounds_0.AppHover1.Name, 
            Haptic = Enum.HapticEffectType.UIHover
        }
    }, 
    MakePurchase = {
        Press = {
            Sound = l_Sounds_0.Purchase.Name, 
            Haptic = Enum.HapticEffectType.UIClick
        }, 
        Hover = {
            Sound = l_Sounds_0.AppHover1.Name, 
            Haptic = Enum.HapticEffectType.UIHover
        }
    }
};