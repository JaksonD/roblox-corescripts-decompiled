local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_useCountdownBinding_0 = require(l_Parent_0.InterventionShared).Hooks.useCountdownBinding;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v4.Core.Control.Interactable;
local v9 = {
    bodyText = "Chat Disabled", 
    defaultCountdownString = "", 
    onActivated = function() --[[ Line: 26 ]] --[[ Name: onActivated ]]

    end
};
return function(v10) --[[ Line: 29 ]] --[[ Name: ChatInputBoxDisabled ]]
    -- upvalues: v1 (copy), v9 (copy), v2 (copy), l_useCountdownBinding_0 (copy), v3 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v11 = v1.Dictionary.union(v9, v10);
    local v12 = v2.Hooks.useTokens();
    local v13 = l_useCountdownBinding_0(v11.endTimestamp, v11.defaultCountdownString);
    return v3.createElement(l_Interactable_0, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Event.Activated] = v11.onActivated
    }, {
        uiListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, v12.Gap.Small), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        disabledText = v3.createElement(v2.Text, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 1, 0), 
            Text = v11.bodyText, 
            Font = v11.font, 
            TextSize = v11.contentSize, 
            textStyle = v12.Color.System.Alert, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            tag = "fill", 
            LayoutOrder = 1
        }), 
        countdownText = if v11.endTimestamp ~= nil then v3.createElement(v2.Text, {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(0, 0, 1, 0), 
            Text = v13, 
            Font = v11.font, 
            TextSize = v11.contentSize, 
            textStyle = v12.Color.Content.Emphasis, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = false, 
            LayoutOrder = 2
        }) else nil, 
        icon = v3.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v11.contentSize, 0, v11.contentSize), 
            BackgroundTransparency = 1, 
            ImageColor3 = v12.Color.System.Alert.Color3, 
            ImageTransparency = v12.Color.System.Alert.Transparency, 
            Image = l_Images_0["icons/status/error_large"], 
            LayoutOrder = 3
        })
    });
end;