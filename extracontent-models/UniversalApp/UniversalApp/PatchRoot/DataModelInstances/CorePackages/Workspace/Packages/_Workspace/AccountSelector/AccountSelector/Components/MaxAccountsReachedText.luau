local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function() --[[ Line: 10 ]] --[[ Name: MaxAccountsReachedText ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), l_React_0 (copy)
    local v6 = l_useLocalization_0({
        maxAccountsReachedText = "Authentication.AccountSwitch.Label.AccountLimitReached.2"
    });
    local v7 = l_useStyle_0();
    return l_React_0.createElement("TextLabel", {
        Text = v6.maxAccountsReachedText, 
        TextSize = v7.Font.BaseSize, 
        TextColor3 = v7.Theme.TextDefault.Color, 
        TextTransparency = v7.Theme.TextDefault.Transparency, 
        BackgroundColor3 = v7.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = 1, 
        Font = v7.Font.Body.Font, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextWrapped = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        })
    });
end;