return function(v0) --[[ Line: 1 ]]
    local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
    if l_UserGameSettings_0.ReadAloud then
        v0.Enable();
    end;
    l_UserGameSettings_0:GetPropertyChangedSignal("ReadAloud"):Connect(function() --[[ Line: 9 ]]
        -- upvalues: l_UserGameSettings_0 (copy), v0 (copy)
        if l_UserGameSettings_0.ReadAloud then
            v0.Enable();
            v0.ReadSystemTextFromKey("SystemEnabled");
            return;
        else
            v0.Disable();
            return;
        end;
    end);
end;