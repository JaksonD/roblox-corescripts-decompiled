local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v9 = require(l_Modules_0.LuaApp.Enum.NotificationType);
return function(v10) --[[ Line: 19 ]]
    -- upvalues: v8 (copy), v4 (copy), l_GuiService_0 (copy), v9 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v11 = v8({
        closeRoblox = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
    });
    local v12 = v4.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: l_GuiService_0 (ref), v9 (ref)
        l_GuiService_0:BroadcastNotification("", v9.NATIVE_EXIT);
    end, {});
    return v4.createElement("Frame", {
        LayoutOrder = v10.layoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v10.buttonHeight)
    }, {
        UISizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v10.buttonMaxWidth, v10.buttonHeight)
        }), 
        ExitAppButton = v4.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            isDisabled = false, 
            isLoading = false, 
            onActivated = v12, 
            maxWidth = v10.buttonMaxWidth, 
            size = UDim2.new(1, 0, 0, v10.buttonHeight), 
            text = v11.closeRoblox
        })
    });
end;