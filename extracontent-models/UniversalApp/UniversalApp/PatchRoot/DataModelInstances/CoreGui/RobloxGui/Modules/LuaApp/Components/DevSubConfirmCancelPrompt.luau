local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v7 = require(l_Modules_0.LuaApp.Thunks.PatchDevSub);
local v8 = require(l_Modules_0.LuaApp.Actions.SetDevSub);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = v1.PureComponent:extend("DevSubConfirmCancelPrompt");
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v2.Style.withStyle;
v12.render = function(v15) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_withStyle_0 (copy), v1 (copy), v5 (copy)
    local l_containerWidth_0 = v15.props.containerWidth;
    local l_onConfirm_0 = v15.props.onConfirm;
    local l_onBack_0 = v15.props.onBack;
    local l_networking_0 = v15.props.networking;
    local l_devSub_0 = v15.props.devSub;
    return v13({
        titleText = "Feature.DevSubs.Action.CancelSubscription", 
        messageText = "Feature.DevSubs.Message.ConfirmCancellation", 
        confirmButtonText = "CommonUI.Controls.Action.Confirm", 
        cancelButtonText = "CommonUI.Controls.Action.Back"
    })(function(v21) --[[ Line: 32 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v5 (ref), l_containerWidth_0 (copy), l_onConfirm_0 (copy), l_networking_0 (copy), l_devSub_0 (copy), l_onBack_0 (copy)
        return l_withStyle_0(function(v22) --[[ Line: 33 ]]
            -- upvalues: v21 (copy), v1 (ref), v5 (ref), l_containerWidth_0 (ref), l_onConfirm_0 (ref), l_networking_0 (ref), l_devSub_0 (ref), l_onBack_0 (ref)
            local l_titleText_0 = v21.titleText;
            local l_messageText_0 = v21.messageText;
            local l_confirmButtonText_0 = v21.confirmButtonText;
            local l_cancelButtonText_0 = v21.cancelButtonText;
            return v1.createElement(v5, {
                containerWidth = l_containerWidth_0, 
                titleText = l_titleText_0, 
                titleFont = v22.Font.Title.Font, 
                titleTextSize = 22, 
                messageText = l_messageText_0, 
                messageFont = v22.Font.Body.Font, 
                buttonFont = v22.Font.Header1.Font, 
                confirmButtonText = l_confirmButtonText_0, 
                onConfirm = function() --[[ Line: 49 ]] --[[ Name: onConfirm ]]
                    -- upvalues: l_onConfirm_0 (ref), l_networking_0 (ref), l_devSub_0 (ref)
                    l_onConfirm_0(l_networking_0, l_devSub_0);
                end, 
                hasCancelButton = true, 
                cancelButtonText = l_cancelButtonText_0, 
                onCancel = l_onBack_0
            });
        end);
    end);
end;
v12 = v3.connect(nil, function(v27) --[[ Line: 61 ]]
    -- upvalues: v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return {
        onBack = function() --[[ Line: 63 ]] --[[ Name: onBack ]]
            -- upvalues: v27 (copy), v6 (ref)
            v27(v6());
        end, 
        onConfirm = function(v28, v29) --[[ Line: 66 ]] --[[ Name: onConfirm ]]
            -- upvalues: v27 (copy), v6 (ref), v7 (ref), v8 (ref), v9 (ref)
            v27(v6());
            v27(v7.Patch(v28, v29.id, false));
            v27(v8(v9.Dictionary.join(v29, {
                isAutoRenewing = false
            })));
        end
    };
end)(v12);
return l_RoactServices_0.connect({
    networking = v11
})(v12);