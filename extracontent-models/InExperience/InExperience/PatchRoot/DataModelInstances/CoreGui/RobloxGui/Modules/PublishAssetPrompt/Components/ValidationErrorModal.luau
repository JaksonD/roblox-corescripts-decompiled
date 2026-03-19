local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v1.App.Dialog.Alert.InteractiveAlert;
local l_Overlay_0 = v1.App.Dialog.Overlay;
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v6 = v1.App.ImageSet.Images["icons/controls/keys/xboxA"];
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useIsGamepad_0 = v7.Hooks.useIsGamepad;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local v10 = require(l_CorePackages_0.Packages.React);
local l_Parent_0 = script.Parent.Parent;
local v12 = require(l_Parent_0.Actions.CloseOpenPrompt);
return function(v13) --[[ Line: 29 ]]
    -- upvalues: l_useIsGamepad_0 (copy), l_useDispatch_0 (copy), v12 (copy), v10 (copy), l_Overlay_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v5 (copy), v6 (copy)
    local v14 = l_useIsGamepad_0();
    local v15 = l_useDispatch_0();
    local function v16() --[[ Line: 33 ]]
        -- upvalues: v15 (copy), v12 (ref)
        v15(v12());
    end;
    return v10.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 3
    }, {
        Overlay = v10.createElement(l_Overlay_0, {
            showGradient = false, 
            ZIndex = 3
        }), 
        InteractiveAlertWrapper = v10.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 4
        }, {
            InteractiveAlert = v10.createElement(l_InteractiveAlert_0, {
                title = "Something Went Wrong", 
                bodyText = "Your creation could not be created due to an error. A report has been sent to the developer of this experience.", 
                screenSize = v13.screenSize, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v16, 
                                text = v5:FormatByKey("InGame.CommonUI.Button.Ok"), 
                                inputIcon = v14 and v6 or nil
                            }
                        }
                    }
                }
            })
        })
    });
end;