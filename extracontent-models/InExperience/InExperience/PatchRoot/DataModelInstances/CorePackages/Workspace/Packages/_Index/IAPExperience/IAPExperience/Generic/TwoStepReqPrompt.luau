local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v8 = v2.Component:extend(script.Name);
v8.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v8.render = function(v9) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy)
    return v2.createElement(v7, {
        keys = {
            title = {
                key = "Authentication.TwoStepVerification.Title.VerificationRequired"
            }, 
            message = {
                key = "Authentication.TwoStepVerification.Label.TwoStepRequired"
            }, 
            cancel = {
                key = "Authentication.TwoStepVerification.Action.Cancel"
            }, 
            backToGame = {
                key = "IAPExperience.PurchaseSuccess.Action.BackToGame"
            }, 
            gotoSecurity = {
                key = "Authentication.TwoStepVerification.Action.GoToSecurity"
            }
        }, 
        render = function(v10) --[[ Line: 54 ]] --[[ Name: render ]]
            -- upvalues: v9 (copy)
            return v9:renderAlert(v10);
        end
    });
end;
v8.renderAlert = function(v11, v12) --[[ Line: 60 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_ButtonType_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_Images_0 (copy)
    local l_props_0 = v11.props;
    local v14 = nil;
    v14 = if l_props_0.openSecuritySettings then {
        buttons = {
            {
                props = {
                    onActivated = l_props_0.closePrompt, 
                    text = v12.cancel, 
                    inputIcon = l_props_0.cancelControllerIcon
                }
            }, 
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = l_props_0.openSecuritySettings, 
                    text = v12.gotoSecurity, 
                    inputIcon = l_props_0.doneControllerIcon
                }
            }
        }
    } else {
        buttons = {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = l_props_0.closePrompt, 
                    text = v12.backToGame, 
                    inputIcon = l_props_0.doneControllerIcon
                }
            }
        }
    };
    return v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = l_props_0.anchorPoint, 
        position = l_props_0.position, 
        screenSize = l_props_0.screenSize, 
        title = v12.title, 
        titleIcon = l_Images_0["icons/status/error_large"], 
        bodyText = v12.message, 
        buttonStackInfo = v14
    });
end;
return v8;