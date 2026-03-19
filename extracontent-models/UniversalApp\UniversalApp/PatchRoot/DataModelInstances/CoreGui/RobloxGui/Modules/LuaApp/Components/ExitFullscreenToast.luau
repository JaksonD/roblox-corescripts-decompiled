local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_Toast_0 = v8.App.Dialog.Toast;
local v11 = "F11";
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    v11 = "Ctrl + Command + F";
end;
return function(_) --[[ Line: 26 ]] --[[ Name: ExitFullscreenToast ]]
    -- upvalues: v4 (copy), l_withStyle_0 (copy), v7 (copy), l_Toast_0 (copy), v11 (ref), l_CoreGui_0 (copy), v6 (copy), v5 (copy)
    return v4({
        titleText = "CommonUI.Messages.Label.ToExitFullscreen"
    })(function(v13) --[[ Line: 29 ]]
        -- upvalues: l_withStyle_0 (ref), v7 (ref), l_Toast_0 (ref), v11 (ref), l_CoreGui_0 (ref), v6 (ref), v5 (ref)
        return l_withStyle_0(function(_) --[[ Line: 30 ]]
            -- upvalues: v7 (ref), l_Toast_0 (ref), v11 (ref), v13 (copy), l_CoreGui_0 (ref), v6 (ref), v5 (ref)
            local v15 = v7.createElement(l_Toast_0, {
                duration = 3, 
                toastContent = {
                    toastTitle = v11, 
                    toastSubtitle = v13.titleText
                }
            });
            return v7.createElement(v7.Portal, {
                target = l_CoreGui_0
            }, {
                ExitFullscreenToastScreen = v7.createElement(v6, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = v5.DisplayOrder.Toast
                }, {
                    Toast = v15
                })
            });
        end);
    end);
end;