local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_React_0 = v1.React;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_SMSProtocol_0 = v1.SMSProtocol;
local l_Dash_0 = v1.Dash;
local l_useStyle_0 = v1.useStyle;
local l_useLocalization_0 = v1.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagContactsListEntryUpdatedTruncationFix);
local v15 = require(script.Parent.sendInviteLink);
local v16 = {
    smsProtocol = l_SMSProtocol_0.default
};
ContactsListInviteEntry = function(v17) --[[ Line: 42 ]] --[[ Name: ContactsListInviteEntry ]]
    -- upvalues: l_Dash_0 (copy), v16 (copy), l_useLocalization_0 (copy), v8 (copy), l_useStyle_0 (copy), v15 (copy), l_SMSProtocol_0 (copy), l_React_0 (copy), l_Roact_0 (copy), v14 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v18 = l_Dash_0.join(v16, v17);
    local v19 = l_useLocalization_0({
        invite = v8.INVITE_BUTTON_TEXT
    });
    local v20 = l_useStyle_0();
    local v21 = v15({
        address = v18.phoneNumber, 
        deviceContactId = v18.deviceContactId, 
        smsProtocol = l_SMSProtocol_0.default
    });
    local v22, v23 = l_React_0.useState(0);
    return l_Roact_0.createElement("Frame", {
        Name = v18.deviceContactId, 
        Size = UDim2.new(1, 0, 0, 72), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        entryContent = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 26), 
                PaddingBottom = UDim.new(0, 26)
            }), 
            contactNameLabel = if v14() then l_Roact_0.createElement(l_StyledTextLabel_0, {
                size = UDim2.new(1, v22, 0, 20), 
                colorStyle = v20.Theme.TextEmphasis, 
                fontStyle = v20.Font.Header2, 
                lineHeight = 1, 
                text = v18.contactName, 
                fluidSizing = false, 
                richText = false, 
                textWrapped = false, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Bottom, 
                textTruncate = Enum.TextTruncate.AtEnd
            }) else l_Roact_0.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v20.Theme.TextEmphasis, 
                fontStyle = v20.Font.Header2, 
                lineHeight = 1, 
                text = v18.contactName, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Bottom
            }), 
            sendInviteButton = if not v18.hasSentRequest then l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                position = UDim2.new(1, -1, 0.5, 0), 
                anchorPoint = Vector2.new(1, 0.5), 
                standardSize = l_StandardButtonSize_0.XSmall, 
                fitContent = true, 
                text = v19.invite, 
                isDisabled = v21.isLoading, 
                onActivated = v21.sendInvite, 
                [l_React_0.Change.AbsoluteSize] = function(v24) --[[ Line: 108 ]]
                    -- upvalues: v14 (ref), v23 (copy)
                    if v14() then
                        v23(0 - (v24.AbsoluteSize.X + 10));
                    end;
                end
            }) else l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                position = UDim2.new(1, -1, 0.5, 0), 
                anchorPoint = Vector2.new(1, 0.5), 
                standardSize = l_StandardButtonSize_0.XSmall, 
                isDisabled = true, 
                text = v19.invite, 
                onActivated = l_Dash_0.noop, 
                [l_React_0.Change.AbsoluteSize] = function(v25) --[[ Line: 122 ]]
                    -- upvalues: v14 (ref), v23 (copy)
                    if v14() then
                        v23(0 - (v25.AbsoluteSize.X + 10));
                    end;
                end
            })
        }), 
        divider = if v18.hasDivider then l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v20.Theme.Divider.Color, 
            BackgroundTransparency = v20.Theme.Divider.Transparency
        }) else nil
    });
end;
return ContactsListInviteEntry;