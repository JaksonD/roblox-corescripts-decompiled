local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v4 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local v5 = require(l_script_FirstAncestor_0.Components.ReportActionBar);
local v6 = UDim2.fromScale(1, 1);
local v7 = UDim.new(0, 10);
return function(v8) --[[ Line: 18 ]] --[[ Name: ReportStep ]]
    -- upvalues: v4 (copy), v6 (copy), v7 (copy), v2 (copy), v5 (copy)
    local v9 = v4();
    local l_ReportStep_0 = v9.ReportStep;
    local v11 = l_ReportStep_0.size and l_ReportStep_0.size or v6;
    local v12 = l_ReportStep_0.verticalPadding or v7;
    local v13 = UDim.new((v9.ReportActionBar.size and v9.ReportActionBar.size.Y.Scale or 0) + 2 * v12.Scale, (v9.ReportActionBar.size and v9.ReportActionBar.size.Y.Offset or 0) + 2 * v12.Offset);
    return v2.createElement("Frame", {
        Size = v11, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = v12, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v8.title and v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v8.title, 
            Font = l_ReportStep_0.headerFontStyle and l_ReportStep_0.headerFontStyle.Font, 
            TextColor3 = l_ReportStep_0.headerTextColor and l_ReportStep_0.headerTextColor.Color3, 
            TextSize = l_ReportStep_0.headerFontStyle and l_ReportStep_0.headerFontStyle.FontSize, 
            LineHeight = l_ReportStep_0.headerFontStyle and l_ReportStep_0.headerFontStyle.LineHeight, 
            LayoutOrder = 1
        }) or nil, 
        Body = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1 - v13.Scale, -v13.Offset), 
            BackgroundTransparency = 1
        }, v8.children), 
        Actions = v2.createElement(v5, {
            layoutOrder = 3, 
            buttons = v8.buttons, 
            tokens = v9.ReportActionBar
        })
    });
end;