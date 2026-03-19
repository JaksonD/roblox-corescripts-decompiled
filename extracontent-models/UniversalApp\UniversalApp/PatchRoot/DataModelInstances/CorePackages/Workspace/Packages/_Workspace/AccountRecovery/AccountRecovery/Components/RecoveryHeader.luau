local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v5.IconButton;
local l_Text_0 = v5.Text;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_InputSize_0 = v5.Enums.InputSize;
local l_useTokens_0 = v5.Hooks.useTokens;
local v11 = require(l_script_FirstAncestor_0.Analytics.EventService);
local function _() --[[ Line: 28 ]] --[[ Name: releaseAnyFocus ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
    if l_l_UserInputService_0_FocusedTextBox_0 then
        l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
    end;
    if l_GuiService_0.SelectedObject ~= nil then
        l_GuiService_0.SelectedObject = nil;
    end;
end;
return function(v14) --[[ Line: 38 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_IconButton_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v11 (copy), l_Text_0 (copy)
    local v15 = l_useTokens_0();
    return v2.createElement("Frame", {
        LayoutOrder = v14.LayoutOrder, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        BackButton = if v14.onBackActivated then v2.createElement(l_IconButton_0, {
            icon = "icons/actions/cycleLeft", 
            size = l_InputSize_0.Medium, 
            variant = l_ButtonVariant_0.Utility, 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
                -- upvalues: l_UserInputService_0 (ref), l_GuiService_0 (ref), v11 (ref), v14 (copy)
                local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
                if l_l_UserInputService_0_FocusedTextBox_1 then
                    l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
                end;
                if l_GuiService_0.SelectedObject ~= nil then
                    l_GuiService_0.SelectedObject = nil;
                end;
                v11.sendBackButtonClickedEvent(v14.recoverySessionId or "", v14.currentComponent or "");
                v14.onBackActivated();
            end, 
            isDisabled = v14.backButtonDisabled or false
        }) else nil, 
        RecoveryHeadingText = v2.createElement(l_Text_0, {
            Text = v14.recoveryHeadingText, 
            Size = UDim2.new(1, 0, 1, 0), 
            fontStyle = v15.Typography.HeadingSmall, 
            textStyle = v15.Color.Content.Emphasis, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;