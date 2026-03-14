local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Enum_0 = v6.App.Button.Enum;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v12 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_Info_0 = v12.Components.AlertViews.Info;
local l_Warning_0 = v12.Components.AlertViews.Warning;
local v15 = {
    titleText = "", 
    cancelAlertText = "", 
    bodyText = "", 
    isButtonDisabled = false, 
    screenSize = Vector2.new(1000, 1000), 
    onActivated = function() --[[ Line: 41 ]] --[[ Name: onActivated ]]

    end, 
    onDismissed = function() --[[ Line: 42 ]] --[[ Name: onDismissed ]]

    end
};
return l_memo_0(function(v16) --[[ Line: 45 ]] --[[ Name: PartialModal ]]
    -- upvalues: v3 (copy), v15 (copy), l_useStyle_0 (copy), v11 (copy), l_Warning_0 (copy), l_Info_0 (copy), v4 (copy), l_PartialPageModal_0 (copy), l_Enum_0 (copy), l_StyledTextLabel_0 (copy)
    local v17 = v3.Dictionary.union(v15, v16);
    local v18 = l_useStyle_0();
    local v19 = v17.style or v18;
    local l_Space_300_0 = v19.Tokens.Global.Space_300;
    local l_LineHeight_400_0 = v19.Tokens.Global.LineHeight_400;
    if v11() then
        local v22 = if v17.actionText then l_Warning_0 else l_Info_0;
        local v23 = if v17.actionText then v17.cancelAlertText else nil;
        local v24 = if v17.actionText then v17.actionText else v17.cancelAlertText;
        return v4.createElement(v22, {
            titleText = v17.titleText, 
            bodyText = v17.bodyText, 
            cancelText = v23, 
            confirmText = v24, 
            screenSize = v17.screenSize, 
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8, 
            width = UDim.new(0.8, 0), 
            displayFailed = false, 
            onActivated = v17.onActivated, 
            onModalClose = v17.onDismissed
        });
    else
        return v4.createElement(l_PartialPageModal_0, {
            title = v17.titleText, 
            buttonStackProps = if v17.actionText then {
                buttons = {
                    {
                        buttonType = l_Enum_0.ButtonType.PrimarySystem, 
                        props = {
                            onActivated = v17.onActivated, 
                            text = v17.actionText, 
                            isDisabled = v17.isButtonDisabled
                        }
                    }
                }
            } else nil, 
            screenSize = v17.screenSize, 
            onCloseClicked = v17.onDismissed
        }, {
            Body = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ContentPadding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_Space_300_0 / 2), 
                    PaddingBottom = if v17.actionText then UDim.new(0, l_Space_300_0) else nil
                }), 
                Body = v4.createElement(l_StyledTextLabel_0, {
                    text = v17.bodyText, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    fontStyle = v19.Font.Body, 
                    lineHeight = l_LineHeight_400_0, 
                    colorStyle = v19.Theme.TextDefault, 
                    size = UDim2.fromScale(1, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    fluidSizing = false
                })
            })
        });
    end;
end);