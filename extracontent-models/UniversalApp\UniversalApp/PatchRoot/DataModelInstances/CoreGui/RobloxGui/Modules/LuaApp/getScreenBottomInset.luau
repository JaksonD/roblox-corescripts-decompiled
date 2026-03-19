local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
return function() --[[ Line: 4 ]] --[[ Name: getScreenBottomInset ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if not _G.__TESTEZ_RUNNING_TEST__ then
        local l_Y_0 = l_UserInputService_0.BottomBarSize.Y;
        local l_bottom_0 = l_GuiService_0:GetSafeZoneOffsets().bottom;
        return l_Y_0 == 0 and l_bottom_0 or l_Y_0;
    else
        return 0;
    end;
end;