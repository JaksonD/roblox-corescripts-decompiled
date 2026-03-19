local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local _ = require(l_Parent_0.InteractionFeedback);
local v2 = {
    Default = "Default"
};
local v3 = {
    Press = "Press", 
    Hover = "Hover", 
    Release = "Release"
};
local v4 = {
    Default = {
        Press = {
            Haptic = Enum.HapticEffectType.UIClick
        }, 
        Hover = {
            Haptic = Enum.HapticEffectType.UIHover
        }, 
        Release = {
            Haptic = Enum.HapticEffectType.UIClick
        }
    }
};
return {
    HapticFeedbackContext = v2, 
    HapticFeedbackType = v3, 
    HapticFeedbackConfig = v4
};