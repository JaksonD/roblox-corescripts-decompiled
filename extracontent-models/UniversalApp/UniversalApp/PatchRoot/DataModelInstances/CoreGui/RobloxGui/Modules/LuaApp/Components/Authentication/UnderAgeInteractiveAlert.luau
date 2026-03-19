local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_withStyle_0 = v3.Style.withStyle;
local v7 = require(l_Modules_0.LuaApp.withLocalization);
return function(v8) --[[ Line: 16 ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return l_withStyle_0(function(v9) --[[ Line: 17 ]]
        -- upvalues: v7 (ref), v2 (ref), v8 (copy), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref)
        return v7({
            cannotSignUpText = "Authentication.SignUp.Heading.CannotSignUp", 
            underAgeText = "Authentication.SignUp.Description.UnderAgeAlert", 
            understandText = "Authentication.SignUp.Action.IUnderstand"
        })(function(v10) --[[ Line: 22 ]]
            -- upvalues: v2 (ref), v9 (copy), v8 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref)
            return v2.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundColor3 = v9.Theme.Overlay.Color, 
                AutoButtonColor = false, 
                BackgroundTransparency = v9.Theme.Overlay.Transparency, 
                ZIndex = v8.ZIndex, 
                Text = "", 
                Visible = true, 
                [v2.Event.Activated] = function() --[[ Line: 32 ]]
                    -- upvalues: v8 (ref)
                    v8.onDismiss();
                end
            }, {
                Alert = v2.createElement(l_InteractiveAlert_0, {
                    title = v10.cannotSignUpText, 
                    bodyText = v10.underAgeText, 
                    buttonStackInfo = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    text = v10.understandText, 
                                    onActivated = function() --[[ Line: 45 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v8 (ref)
                                        v8.onDismiss();
                                    end
                                }
                            }
                        }
                    }, 
                    position = UDim2.fromScale(0.5, 0.5), 
                    screenSize = Vector2.new(100, 100), 
                    ZIndex = v8.ZIndex + 1
                })
            });
        end);
    end);
end;