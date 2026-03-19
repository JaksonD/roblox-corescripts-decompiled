local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_Button_0 = v2.Button;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v9) --[[ Line: 17 ]] --[[ Name: SduiFeatureErrorUi ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonSize_0 (copy), l_ButtonVariant_0 (copy)
    local v10 = l_useTokens_0();
    local v11 = l_useLocalization_0({
        errorMessage = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        retryButtonText = "InGame.CommonUI.Button.Retry"
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v10.Gap.Large)
        }), 
        ErrorText = v1.createElement(l_Text_0, {
            tag = "auto-xy text-body-medium content-default text-align-x-center", 
            Text = v11.errorMessage, 
            LayoutOrder = 1
        }), 
        RetryButton = if v9.onRetry then v1.createElement(l_Button_0, {
            text = v11.retryButtonText, 
            onActivated = v9.onRetry, 
            LayoutOrder = 2, 
            size = l_ButtonSize_0.Medium, 
            variant = l_ButtonVariant_0.Emphasis
        }) else nil
    });
end;