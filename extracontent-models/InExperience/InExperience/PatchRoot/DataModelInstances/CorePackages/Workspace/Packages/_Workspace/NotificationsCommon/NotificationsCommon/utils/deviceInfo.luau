local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
return {
    isDesktopDevice = function() --[[ Line: 4 ]]
        -- upvalues: l_UserInputService_0 (copy)
        local l_None_0 = Enum.Platform.None;
        pcall(function() --[[ Line: 6 ]]
            -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        local v3 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v3 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v3 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v3;
    end, 
    isConsole = function() --[[ Line: 12 ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0:IsTenFootInterface();
    end
};