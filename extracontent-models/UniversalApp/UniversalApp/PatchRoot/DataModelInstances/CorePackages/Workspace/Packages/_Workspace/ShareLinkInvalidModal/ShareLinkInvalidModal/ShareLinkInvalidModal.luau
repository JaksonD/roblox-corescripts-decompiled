local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withLocalization_0 = v1.withLocalization;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local v8 = l_Roact_0.Component:extend("ShareLinkInvalidModal");
v8.validateProps = l_t_0.interface({
    closeModal = l_t_0.callback, 
    screenSize = l_t_0.Vector2
});
v8.render = function(v9) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_Roact_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v9.props;
    return l_withLocalization_0({
        titleText = "Feature.SocialShare.Label.InvalidLinkError", 
        bodyText = "Feature.SocialShare.Description.InvalidLinkError", 
        buttonText = "Feature.Friends.Label.Cancel"
    })(function(v11) --[[ Line: 35 ]]
        -- upvalues: l_Roact_0 (ref), l_InteractiveAlert_0 (ref), l_props_0 (copy), l_ButtonType_0 (ref)
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            title = v11.titleText, 
            bodyText = v11.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v11.buttonText, 
                            onActivated = l_props_0.closeModal
                        }
                    }
                }
            }
        });
    end);
end;
return v8;