local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v3 = game:DefineFastFlag("UseLargerHeaderTextOnMultipageSignup", false);
return function(v4) --[[ Line: 14 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v1 (copy)
    local v5 = l_useStyle_0();
    local v6 = if v3 then v5.Font.Header1 else v5.Font.Header2;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v4.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        TitleText = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v4.titleText, 
            TextColor3 = v5.Theme.TextEmphasis.Color, 
            TextSize = v5.Font.BaseSize * v6.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v6.Font, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        HelpText = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v4.helpText, 
            TextColor3 = v5.Theme.TextDefault.Color, 
            TextSize = v5.Font.BaseSize * v5.Font.CaptionBody.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v5.Font.CaptionBody.Font, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        })
    });
end;