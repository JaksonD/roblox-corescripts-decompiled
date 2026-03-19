local l_Parent_0 = script.Parent.Parent;
return {
    [require(l_Parent_0.Enums.PlatformEnum).QuestVR] = {
        FirstPersonToggleEvent = "FirstPersonToggleEvent", 
        MoveToGoalEvent = "MoveToGoalEvent", 
        HapticFeedbackEvent = "HapticFeedbackEvent", 
        HapticFeedbackTwiceEvent = "HapticFeedbackTwiceEvent", 
        SoundFeedbackEvent = "SoundFeedbackEvent", 
        JumpEvent = "JumpEvent", 
        PerspectiveTooltipEvent = "PerspectiveTooltipEvent", 
        MovementTooltipEvent = "MovementTooltipEvent", 
        LeaveGameIconHighlightEvent = "LeaveGameIconHighlightEvent"
    }
};