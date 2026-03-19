local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v4 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local v5 = UDim2.new(1, 0, 1, 0);
return function(v6) --[[ Line: 26 ]] --[[ Name: ReportHeader ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy)
    local l_ReportHeader_0 = v4().ReportHeader;
    local v8 = l_ReportHeader_0.size or v5;
    local v9 = l_ReportHeader_0.dividerVerticalPadding or 36;
    local v10 = l_ReportHeader_0.dividerHeight or 2;
    return v2.createElement("Frame", {
        Size = v8, 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UIPadding = if l_ReportHeader_0.verticalPadding then v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_ReportHeader_0.verticalPadding), 
            PaddingBottom = UDim.new(0, l_ReportHeader_0.verticalPadding)
        }) else nil, 
        Title = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v6.title, 
            Font = l_ReportHeader_0.titleFontStyle and l_ReportHeader_0.titleFontStyle.Font, 
            TextColor3 = l_ReportHeader_0.titleTextColor and l_ReportHeader_0.titleTextColor.Color3, 
            TextSize = l_ReportHeader_0.titleFontStyle and l_ReportHeader_0.titleFontStyle.FontSize, 
            LineHeight = l_ReportHeader_0.titleFontStyle and l_ReportHeader_0.titleFontStyle.LineHeight, 
            LayoutOrder = 1
        }), 
        Subtitle = if v6.subtitle then v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v6.subtitle, 
            Font = l_ReportHeader_0.subtitleFontStyle and l_ReportHeader_0.subtitleFontStyle.Font, 
            TextColor3 = l_ReportHeader_0.subtitleTextColor and l_ReportHeader_0.subtitleTextColor.Color3, 
            TextSize = l_ReportHeader_0.subtitleFontStyle and l_ReportHeader_0.subtitleFontStyle.FontSize, 
            LineHeight = l_ReportHeader_0.subtitleFontStyle and l_ReportHeader_0.subtitleFontStyle.LineHeight, 
            LayoutOrder = 2
        }) else nil, 
        Decoration = if v6.hasDivider then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v9), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Divider = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = l_ReportHeader_0.dividerColor and l_ReportHeader_0.dividerColor.Color3, 
                BackgroundTransparency = l_ReportHeader_0.dividerColor and l_ReportHeader_0.dividerColor.Transparency or 0.8
            })
        }) else nil
    });
end;