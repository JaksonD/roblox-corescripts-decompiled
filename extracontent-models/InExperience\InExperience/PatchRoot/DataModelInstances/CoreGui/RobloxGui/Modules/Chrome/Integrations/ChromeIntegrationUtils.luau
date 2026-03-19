local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
dismissRobloxMenuAndRun = function(v5) --[[ Line: 10 ]] --[[ Name: dismissRobloxMenuAndRun ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_RobloxGui_0 (copy)
    if l_FFlagEnableConsoleExpControls_0 and l_UserInputService_0.GamepadEnabled then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    local v6 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    if l_GuiService_0.MenuIsOpen then
        local v7 = tick() + 3;
        local v8 = nil;
        v8 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 20 ]]
            -- upvalues: v8 (ref), v7 (copy), v5 (copy)
            if v8 then
                v8:Disconnect();
                v8 = nil;
            end;
            if tick() < v7 then
                v5(true);
            end;
        end);
        v6:SetVisibility(false);
        return;
    else
        v5(false);
        return;
    end;
end;
return {
    dismissRobloxMenuAndRun = dismissRobloxMenuAndRun
};