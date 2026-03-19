local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagUAppBlockPageUseTextFromGUAC);
local v11 = require(l_Modules_0.LuaApp.Flags.FFlagUAppBlockPageDisableLogOutFromGUAC);
local v12 = require(l_Modules_0.LuaApp.Flags.FFlagUAppBlockPageResponsiveLayout);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_Modules_0.Common.Roact);
local v15 = require(l_CorePackages_0.Packages.UIBlox);
local l_StyledTextLabel_0 = v15.App.Text.StyledTextLabel;
local l_FullPageModal_0 = v15.App.Dialog.Modal.FullPageModal;
local l_withStyle_0 = v15.Style.withStyle;
local v19 = require(l_Modules_0.LuaApp.withLocalization);
local v20 = {
    AgeBlock = "CommonUI.Messages.Label.AgeBlock", 
    FeatureNotAvailableForAccount = "CommonUI.Messages.Label.FeatureNotAvailableForAccount"
};
local v21 = v3.PureComponent:extend("UAppBlockPage");
v21.validateProps = v2.strictInterface({
    screenSize = if v12 then v2.Vector2 else nil, 
    logoutWithoutShowConfirmation = v2.callback, 
    shouldDisableLogOut = if v11 then v2.optional(v2.boolean) else nil, 
    uAppBlockPageTextMapKey = v2.optional(v2.string), 
    guiService = v2.any, 
    networkImpl = v2.any
});
getBlockTextLocalizationKeyFromMapKey = function(v22) --[[ Line: 49 ]] --[[ Name: getBlockTextLocalizationKeyFromMapKey ]]
    -- upvalues: v20 (copy)
    if v22 ~= nil and v20[v22] then
        return v20[v22];
    else
        return v20.FeatureNotAvailableForAccount;
    end;
end;
v21.init = function(v23) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy)
    v23.logOut = function() --[[ Line: 57 ]]
        -- upvalues: v11 (ref), v23 (copy)
        if v11 and v23.props.shouldDisableLogOut then
            return;
        else
            v23.props.logoutWithoutShowConfirmation(v23.props.networkImpl, v23.props.guiService);
            return;
        end;
    end;
end;
v21.render = function(v24) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v10 (copy), l_withStyle_0 (copy), v14 (copy), l_FullPageModal_0 (copy), v12 (copy), v11 (copy), l_StyledTextLabel_0 (copy)
    return v19({
        blockText = if v10 then getBlockTextLocalizationKeyFromMapKey(v24.props.uAppBlockPageTextMapKey) else "CommonUI.Messages.Label.AgeBlock", 
        logOutText = "Application.Logout.Action.Logout"
    })(function(v25) --[[ Line: 72 ]]
        -- upvalues: l_withStyle_0 (ref), v14 (ref), l_FullPageModal_0 (ref), v12 (ref), v24 (copy), v11 (ref), l_StyledTextLabel_0 (ref)
        return l_withStyle_0(function(v26) --[[ Line: 73 ]]
            -- upvalues: v14 (ref), l_FullPageModal_0 (ref), v12 (ref), v24 (ref), v11 (ref), v25 (copy), l_StyledTextLabel_0 (ref)
            return v14.createElement(l_FullPageModal_0, {
                screenSize = if v12 then v24.props.screenSize else Vector2.new(1920, 1080), 
                marginSize = if v12 then nil else 0, 
                distanceFromTop = v12 and 37 or 400, 
                onCloseClicked = if v11 and v24.props.shouldDisableLogOut then nil else v24.logOut, 
                buttonStackProps = if v11 and v24.props.shouldDisableLogOut then nil else {
                    buttons = {
                        {
                            props = {
                                isDisabled = false, 
                                onActivated = v24.logOut, 
                                text = v25.logOutText
                            }
                        }
                    }
                }
            }, {
                UIListLayout = v14.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                TextLabel = v14.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.Y, 
                    colorStyle = {
                        Color = Color3.new(0, 0, 0), 
                        Transparency = 0
                    }, 
                    fontStyle = v26.Font.Body, 
                    lineHeight = 1, 
                    size = UDim2.new(1, 0, 0, 0), 
                    text = v25.blockText, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Bottom, 
                    textWrapped = v12 and true or nil
                })
            });
        end);
    end);
end;
local function v28(v27) --[[ Line: 123 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v27.ScreenSize
    };
end;
v21 = v4.connect(if v12 then v28 else function(_, _) --[[ Line: 130 ]]

end, function(v31) --[[ Line: 131 ]]
    -- upvalues: v5 (copy), v9 (copy)
    return {
        logoutWithoutShowConfirmation = function(v32, v33) --[[ Line: 133 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v31 (copy), v5 (ref), v9 (ref)
            v31(v5(v32, v33, v9.MoreLogOut));
        end
    };
end)(v21);
v21 = l_RoactAppPolicy_0.connect(function(v34, _) --[[ Line: 140 ]]
    -- upvalues: v11 (copy), v10 (copy)
    return {
        shouldDisableLogOut = if v11 then v34.getUAppBlockPageShouldDisableLogOut() else nil, 
        uAppBlockPageTextMapKey = if v10 then v34.getUAppBlockPageTextMapKey() else nil
    };
end)(v21);
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v8
})(v21);