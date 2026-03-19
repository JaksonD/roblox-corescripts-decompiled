local l_HapticService_0 = game:GetService("HapticService");
local _ = require(script.Parent.Parent.EventType);
return {
    Name = "HapticFeedbackEvent", 
    StartEvent = function() --[[ Line: 10 ]] --[[ Name: StartEvent ]]
        -- upvalues: l_HapticService_0 (copy)
        local l_Gamepad1_0 = Enum.UserInputType.Gamepad1;
        local l_Gamepad2_0 = Enum.UserInputType.Gamepad2;
        l_HapticService_0:SetMotor(l_Gamepad1_0, Enum.VibrationMotor.Large, 10);
        l_HapticService_0:SetMotor(l_Gamepad2_0, Enum.VibrationMotor.Large, 10);
        task.wait(1);
        l_HapticService_0:SetMotor(l_Gamepad1_0, Enum.VibrationMotor.Large, 0);
        l_HapticService_0:SetMotor(l_Gamepad2_0, Enum.VibrationMotor.Large, 0);
    end
};