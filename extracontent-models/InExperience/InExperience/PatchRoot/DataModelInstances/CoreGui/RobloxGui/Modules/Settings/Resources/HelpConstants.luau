local v0 = {
    GamepadQuest = {
        Image = "rbxassetid://13262267483", 
        HeightRatio = 0.5119047619047619
    }
};
local v1 = {
    {
        labelKey = "ResetCameraLabel", 
        xPosition = -0.015, 
        yPosition = 0.335, 
        xAlignment = Enum.TextXAlignment.Right, 
        width = 0.17
    }, 
    {
        labelKey = "MenuLabel", 
        xPosition = -0.015, 
        yPosition = 0.397, 
        xAlignment = Enum.TextXAlignment.Right, 
        width = 0.17
    }, 
    {
        labelKey = "SelectItemLabel", 
        xPosition = 0.442, 
        yPosition = 0.621, 
        xAlignment = Enum.TextXAlignment.Center, 
        width = 0.09
    }, 
    {
        labelKey = "BackExitLabel", 
        xPosition = 0.818, 
        yPosition = 0.287, 
        xAlignment = Enum.TextXAlignment.Left, 
        width = 0.17
    }, 
    {
        labelKey = "FirstPersonCameraLabel", 
        xPosition = 0.818, 
        yPosition = 0.342, 
        xAlignment = Enum.TextXAlignment.Left, 
        width = 0.17
    }, 
    {
        labelKey = "JumpSelectLabel", 
        xPosition = 0.818, 
        yPosition = 0.413, 
        xAlignment = Enum.TextXAlignment.Left, 
        width = 0.17
    }
};
return {
    Images = v0, 
    Labels = {
        QuestGamepadLabels = {
            LabelRelativeTextHeight = 0.026, 
            LocalizationKeyPrefix = "CoreScripts.InGameMenu.Controls.", 
            LabelsInfo = v1
        }
    }
};