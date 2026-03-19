local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_Toast_0 = v3.App.Dialog.Toast;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v9 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v10 = v2.PureComponent:extend("LuobuWarningToastComponent");
local v11 = v7:FormatByKey("InGame.CommonUI.Message.LuobuGameJoinWarning");
v10.init = function(v12) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: l_Images_0 (copy), l_ContentProvider_0 (copy), v11 (copy)
    v12.state = {
        isLoaded = false
    };
    task.spawn(function() --[[ Line: 23 ]]
        -- upvalues: l_Images_0 (ref), l_ContentProvider_0 (ref), v12 (copy)
        local l_Image_0 = l_Images_0["icons/status/alert"].Image;
        pcall(function() --[[ Line: 25 ]]
            -- upvalues: l_ContentProvider_0 (ref), l_Image_0 (copy)
            l_ContentProvider_0:PreloadAsync({
                l_Image_0
            });
        end);
        v12:setState({
            isLoaded = true
        });
    end);
    v12.getToastContent = function() --[[ Line: 33 ]]
        -- upvalues: l_Images_0 (ref), v11 (ref)
        return {
            iconImage = l_Images_0["icons/status/alert"], 
            iconColorStyle = {
                Color = Color3.new(1, 1, 1), 
                Transparency = 0
            }, 
            toastTitle = v11
        };
    end;
end;
v10.render = function(v14) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Toast_0 (copy), v9 (copy)
    if not v14.state.isLoaded then
        return nil;
    else
        local v15 = v2.createElement("ScreenGui", {
            AutoLocalize = false, 
            DisplayOrder = 9, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Content = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                WarningToast = v2.createElement(l_Toast_0, {
                    duration = 5, 
                    show = true, 
                    toastContent = v14.getToastContent()
                })
            })
        });
        return v9({
            RobloxCaptureNotificationGui = v15
        });
    end;
end;
return v10;