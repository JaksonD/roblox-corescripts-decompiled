local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_RoactRodux_0 = v1.RoactRodux;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v10 = require(l_Parent_0.Common.TextKeys);
local v11 = require(l_Parent_0.Common.Constants);
local v12 = require(l_Parent_0.Flags.getFFlagPassNavigationToContactsRevoked);
local v13 = l_Roact_0.PureComponent:extend("ContactsRevokedAccessDialog");
v13.validateProps = l_t_0.strictInterface({
    navigation = l_t_0.table, 
    screenSize = l_t_0.Vector2
});
v13.render = function(v14) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v10 (copy), l_withStyle_0 (copy), v11 (copy), v12 (copy), l_Roact_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return l_withLocalization_0({
        titleText = v10.CONTACTS_LIST_TITLE, 
        revokedFlow = v10.CONTACTS_REVOKED_FLOW, 
        closeModalOk = v10.CLOSE_MODAL_OK
    })(function(v15) --[[ Line: 36 ]]
        -- upvalues: l_withStyle_0 (ref), v14 (copy), v11 (ref), v12 (ref), l_Roact_0 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref)
        return l_withStyle_0(function(_) --[[ Line: 37 ]]
            -- upvalues: v14 (ref), v11 (ref), v12 (ref), l_Roact_0 (ref), l_InteractiveAlert_0 (ref), v15 (copy), l_ButtonType_0 (ref)
            local l_props_0 = v14.props;
            local l_navigation_0 = l_props_0.navigation;
            local v19 = l_navigation_0.getParam(v11.CLOSE_MODAL) or v12() and l_navigation_0.pop;
            return l_Roact_0.createElement(l_InteractiveAlert_0, {
                title = v15.titleText, 
                screenSize = l_props_0.screenSize, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = function() --[[ Line: 51 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v19 (copy)
                                    v19();
                                end, 
                                text = v15.closeModalOk
                            }
                        }
                    }, 
                    buttonHeight = 48, 
                    forcedFillDirection = Enum.FillDirection.Vertical
                }, 
                bodyText = v15.revokedFlow
            });
        end);
    end);
end;
return l_RoactRodux_0.connect(function(v20) --[[ Line: 67 ]]
    return {
        screenSize = v20.ScreenSize
    };
end, nil)(v13);