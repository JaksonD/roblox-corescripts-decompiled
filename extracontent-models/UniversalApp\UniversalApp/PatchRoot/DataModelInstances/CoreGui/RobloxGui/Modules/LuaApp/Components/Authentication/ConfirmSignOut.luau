local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v8 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v10 = v1.PureComponent:extend("ConfirmSignOut");
v10.render = function(v11) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v7 (copy), v9 (copy), v6 (copy)
    local l_theme_0 = v11.props.theme;
    local l_containerWidth_0 = v11.props.containerWidth;
    local l_closeAlert_0 = v11.props.closeAlert;
    local l_continueFunc_0 = v11.props.continueFunc;
    local l_localization_0 = v11.props.localization;
    local function v18(v17) --[[ Line: 25 ]]
        -- upvalues: v1 (ref), v7 (ref), l_theme_0 (copy), l_containerWidth_0 (copy), l_continueFunc_0 (copy), l_closeAlert_0 (copy)
        return v1.createElement(v7, {
            theme = l_theme_0, 
            containerWidth = l_containerWidth_0, 
            titleText = v17.titleText, 
            titleFont = l_theme_0.AlertWindow.Title.Font, 
            messageText = v17.messageText, 
            messageFont = l_theme_0.AlertWindow.Title.Font, 
            buttonFont = l_theme_0.AlertWindow.Button.Font, 
            confirmButtonText = v17.confirmButtonText, 
            onConfirm = l_continueFunc_0, 
            isConfirming = false, 
            hasCancelButton = true, 
            onCancel = l_closeAlert_0
        });
    end;
    if v9() then
        return v6({
            titleText = "Application.Logout.Title.Logout", 
            messageText = "Application.Logout.Message.Confirmation", 
            confirmButtonText = "Application.Logout.Action.Logout", 
            cancelButtonText = "Feature.GamePage.LabelCancelField"
        })(v18);
    else
        return v18({
            titleText = l_localization_0:Format("Application.Logout.Title.Logout"), 
            messageText = l_localization_0:Format("Application.Logout.Message.Confirmation"), 
            confirmButtonText = l_localization_0:Format("Application.Logout.Action.Logout"), 
            cancelButtonText = l_localization_0:Format("Feature.GamePage.LabelCancelField")
        });
    end;
end;
v10 = v2.connect(nil, function(v19) --[[ Line: 59 ]]
    -- upvalues: v8 (copy)
    return {
        closeAlert = function() --[[ Line: 61 ]] --[[ Name: closeAlert ]]
            -- upvalues: v19 (copy), v8 (ref)
            return v19(v8());
        end
    };
end)(v10);
return (l_RoactServices_0.connect({
    localization = v5
})(v10));