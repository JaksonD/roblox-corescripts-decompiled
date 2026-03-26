local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v8 = require(l_Modules_0.Shell.GlobalSettings);
local v9 = require(l_Modules_0.Shell.LocalizedStrings);
local l_FFlagAppShellMigrateLocales_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v13 = require(l_Modules_0.Shell.Components.Overscan.ControllerHint);
local v14 = require(script.Parent.Edges);
return function(v15) --[[ Line: 27 ]] --[[ Name: Overscan ]]
    -- upvalues: l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), v2 (copy), v8 (copy), l_FFlagAppShellMigrateLocales_0 (copy), v9 (copy), v13 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v14 (copy)
    local v16 = l_useNavigation_0();
    local v17 = v15.onUnmount or v16.goBack;
    local v18 = l_useLocalization_0({
        accept = "CommonUI.Controls.Action.Accept", 
        cancel = "CommonUI.Controls.Action.Cancel"
    });
    local v20 = l_useDesignTokens_0(function(v19) --[[ Line: 37 ]]
        return {
            buttonHeight = v19.Global.Size_600, 
            marginBetween = v19.Global.Space_150
        };
    end);
    local v21 = l_useStyle_0();
    local v22 = v2.useRef(nil);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 1, 
        BackgroundTransparency = v15.BackgroundTransparency, 
        BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941)
    }, {
        v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941), 
            BorderSizePixel = 1, 
            Visible = v15.ImageVisible, 
            Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Background.png"
        }); 
        Title = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 230, 0, 205), 
            BackgroundTransparency = 1, 
            Font = v8.LightFont, 
            FontSize = v8.HeaderSize, 
            TextColor3 = v8.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = if l_FFlagAppShellMigrateLocales_0 then v9:LocStringUA("Xbox.Old.ScreenSizeWord") else v9:LocalizedString("ScreenSizeWord")
        }), 
        Prompt = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 230, 0, 243), 
            BackgroundTransparency = 1, 
            Font = v8.RegularFont, 
            FontSize = v8.ButtonSize, 
            TextColor3 = v8.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = if l_FFlagAppShellMigrateLocales_0 then v9:LocStringUA("Xbox.Old.ResizeScreenPrompt") else v9:LocalizedString("ResizeScreenPrompt")
        }), 
        Controller = v2.createElement(v13), 
        Actions = v2.createElement("Frame", {
            Size = UDim2.fromScale(0.4, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -201)
        }, {
            v2.createElement(l_ButtonStack_0, {
                buttonHeight = v20.buttonHeight, 
                marginBetween = v20.marginBetween, 
                forcedFillDirection = Enum.FillDirection.Horizontal, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            text = v18.cancel, 
                            fontStyle = v21.Font.Header1, 
                            onActivated = v17
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v18.accept, 
                            fontStyle = v21.Font.Header1, 
                            onActivated = function() --[[ Line: 112 ]] --[[ Name: onActivated ]]
                                -- upvalues: v22 (copy)
                                if v22.current then
                                    v22.current.onAccept();
                                end;
                            end
                        }
                    }
                }
            })
        }), 
        EdgeSelector = v2.createElement(v14, {
            onSetEdges = v17, 
            ref = v22
        })
    });
end;