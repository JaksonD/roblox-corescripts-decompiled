local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_FFlagAddNewPlayerListMobileFocusNav_0 = require(l_CorePackages_0.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav;
local v8 = v1.PureComponent:extend("ActionModal");
v8.defaultProps = {
    screenSize = Vector2.new(1000, 1000)
};
v8.validateProps = v2.interface({
    block = v2.callback, 
    blockText = v2.string, 
    blockAndReport = v2.callback, 
    blockAndReportText = v2.string, 
    cancel = v2.callback, 
    cancelText = v2.string, 
    body = v2.string, 
    title = v2.string, 
    screenSize = v2.optional(v2.Vector2)
});
v8.render = function(v9) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_InteractiveAlert_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_ButtonType_0 (copy)
    return l_withStyle_0(function(v10) --[[ Line: 34 ]]
        -- upvalues: v1 (ref), v9 (copy), l_InteractiveAlert_0 (ref), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), l_ButtonType_0 (ref)
        return v1.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v10.Theme.Overlay.Transparency, 
            BackgroundColor3 = v10.Theme.Overlay.Color, 
            Active = true, 
            AutoButtonColor = false, 
            Selectable = false, 
            Visible = v9.props.Visible, 
            [v1.Event.Activated] = v9.props.cancel
        }, {
            AlertModal = v1.createElement(l_InteractiveAlert_0, {
                screenSize = v9.props.screenSize, 
                title = v9.props.title, 
                bodyText = v9.props.body, 
                richText = true, 
                isRoactGamepadEnabled = not l_FFlagAddNewPlayerListMobileFocusNav_0 and nil, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                text = v9.props.cancelText, 
                                onActivated = v9.props.cancel
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Alert, 
                            props = {
                                text = v9.props.blockAndReportText, 
                                onActivated = v9.props.blockAndReport
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Alert, 
                            props = {
                                text = v9.props.blockText, 
                                onActivated = v9.props.block
                            }
                        }
                    }
                }
            })
        });
    end);
end;
return v8;