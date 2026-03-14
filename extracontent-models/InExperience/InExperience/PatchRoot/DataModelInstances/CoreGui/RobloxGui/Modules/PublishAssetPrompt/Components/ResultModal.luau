local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v6 = v2.App.ImageSet.Images["icons/controls/keys/xboxA"];
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.Thunks.CloseResultModal);
local l_Parent_1 = script.Parent.Parent;
local v15 = require(l_Parent_1.GetFFlagValidateDescription);
local v16 = v7.PureComponent:extend("ResultModal");
v16.validateProps = v9.strictInterface({
    screenSize = v9.Vector2, 
    resultModalType = v9.enum(Enum.PromptPublishAssetResult), 
    closeResultModal = v9.callback
});
local function _(v17) --[[ Line: 38 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), v10 (copy)
    return l_getInputGroup_0(v17) == v10.InputTypeConstants.Gamepad;
end;
v16.init = function(v19) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v10 (copy)
    local v20 = {};
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v20.isGamepad = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == v10.InputTypeConstants.Gamepad;
    v19:setState(v20);
end;
v16.getLocalizedStringForResultPrompt = function(_, v23) --[[ Line: 49 ]] --[[ Name: getLocalizedStringForResultPrompt ]]
    -- upvalues: v5 (copy)
    if v23 == Enum.PromptPublishAssetResult.Success then
        return v5:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage");
    elseif v23 == Enum.PromptPublishAssetResult.UploadFailed then
        return v5:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed");
    elseif v23 == Enum.PromptPublishAssetResult.NoUserInput then
        return v5:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput");
    else
        return v5:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", {
            RESULT_TYPE = tostring(v23)
        });
    end;
end;
v16.getLocalizedTitleForResultPrompt = function(_, v25) --[[ Line: 64 ]] --[[ Name: getLocalizedTitleForResultPrompt ]]
    -- upvalues: v5 (copy)
    if v25 == Enum.PromptPublishAssetResult.Success then
        return v5:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle");
    else
        return v5:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle");
    end;
end;
v16.render = function(v26) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v15 (copy), v5 (copy), v6 (copy)
    return v7.createElement(l_InteractiveAlert_0, {
        title = v26:getLocalizedTitleForResultPrompt(v26.props.resultModalType), 
        bodyText = v26:getLocalizedStringForResultPrompt(v26.props.resultModalType), 
        screenSize = v26.props.screenSize, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v26.props.closeResultModal, 
                        text = if v15() then v5:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk") else v5:FormatByKey("InGame.CommonUI.Button.Ok"), 
                        inputIcon = v26.state.isGamepad and v6 or nil
                    }
                }
            }
        }
    });
end;
return v8.connect(function(v27) --[[ Line: 94 ]] --[[ Name: mapStateToProps ]]
    return {
        resultModalType = v27.promptRequest.resultModalType
    };
end, function(v28) --[[ Line: 100 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy)
    return {
        closeResultModal = function() --[[ Line: 102 ]] --[[ Name: closeResultModal ]]
            -- upvalues: v28 (copy), v13 (ref)
            return v28(v13);
        end
    };
end)(v16);