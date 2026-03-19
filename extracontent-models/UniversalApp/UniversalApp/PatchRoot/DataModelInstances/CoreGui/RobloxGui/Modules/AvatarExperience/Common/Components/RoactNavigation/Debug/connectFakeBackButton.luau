local l_UserInputService_0 = game:GetService("UserInputService");
if not game:GetService("RunService"):IsStudio() then
    return function(_) --[[ Line: 6 ]]

    end;
else
    return function(v2) --[[ Line: 9 ]]
        -- upvalues: l_UserInputService_0 (copy)
        l_UserInputService_0.InputEnded:Connect(function(v3) --[[ Line: 10 ]]
            -- upvalues: v2 (copy)
            local v4 = v3.UserInputType == Enum.UserInputType.Keyboard;
            local v5 = v3:isModifierKeyDown(Enum.ModifierKey.Shift);
            if v4 and v5 and v3.KeyCode == Enum.KeyCode.Backspace then
                v2();
            end;
        end);
    end;
end;