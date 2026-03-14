local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.ReactRoblox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v7 = game:DefineFastFlag("EnableToastNotificationsDeeplinkConfirmationModalHeightFix", false);
local v8 = require(l_Parent_0.RobloxTranslator);
return function(v9) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), v8 (copy), v7 (copy), l_GuiService_0 (copy), v4 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v10, v11 = v2.useState(Vector2.new(800, 600));
    local v12 = v8:FormatByKey("Notifications.ToastNotifications.Title.LeavingExperience");
    local v13 = v8:FormatByKey("Notifications.ToastNotifications.Label.LeaveExperienceConfirmation");
    local v14 = v8:FormatByKey("InGame.InspectMenu.Action.Cancel");
    local v15 = v8:FormatByKey("InGame.InspectMenu.Action.Confirm");
    return v2.createElement("Frame", {
        Active = true, 
        BackgroundTransparency = if v9.backgroundTransparency then v9.backgroundTransparency else 0.5, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        Size = UDim2.new(1, 0, 1, if v7 then l_GuiService_0.TopbarInset.Height else 0), 
        [v4.Change.AbsoluteSize] = function(v16) --[[ Line: 42 ]]
            -- upvalues: v11 (copy)
            v11(v16.AbsoluteSize);
        end, 
        Position = if v7 then UDim2.fromOffset(0, -l_GuiService_0.TopbarInset.Height) else nil
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            screenSize = v10, 
            title = v12, 
            bodyText = v13, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = function() --[[ Line: 57 ]] --[[ Name: onActivated ]]
                                -- upvalues: v9 (copy)
                                v9.closeCallback(false);
                            end, 
                            text = v14
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 66 ]] --[[ Name: onActivated ]]
                                -- upvalues: v9 (copy)
                                v9.closeCallback(true);
                            end, 
                            text = v15
                        }
                    }
                }
            }
        })
    });
end;