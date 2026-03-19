local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_BaseSize_0 = v4.Style.Font.BaseSize;
    return v2.createFragment({
        Align = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 14), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Icon = not v4.HighKeyboardMode and v4.Icon, 
        WarningText = v4.WarningText, 
        InputArea = v4.InputBox and v2.createElement(v3.FitFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            fitAxis = v3.FitAxis.Height, 
            LayoutOrder = 3, 
            BackgroundTransparency = 1
        }, {
            Align = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 3), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            InputBox = v4.InputBox, 
            InputWarning = v4.InputWarning
        }), 
        NextButtonWrapper = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_BaseSize_0 * 2), 
            LayoutOrder = 4, 
            BackgroundTransparency = 1
        }, {
            NextButton = v4.ConfirmCodeButton or v4.LoginButton
        }), 
        CancelButton = v4.CancelButton and v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_BaseSize_0 * 2), 
            LayoutOrder = 5, 
            BackgroundTransparency = 1
        }, {
            CancelButton = v4.CancelButton
        })
    });
end;