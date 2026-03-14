local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_HeaderText_0 = require(script.Parent.MoreText).HeaderText;
local v5 = {
    withDivider = true
};
return function(v6) --[[ Line: 19 ]] --[[ Name: Section ]]
    -- upvalues: l_useDesignTokens_0 (copy), v5 (copy), v2 (copy), v1 (copy), l_HeaderText_0 (copy)
    local v7 = l_useDesignTokens_0();
    local l_Divider_0 = v7.Semantic.Color.Common.Divider;
    local v9 = UDim.new(0, v7.Global.Space_200);
    local v10 = if type(v6.withDivider) == "boolean" then v6.withDivider else v5.withDivider;
    return v2.createElement("Frame", {
        LayoutOrder = v6.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, v1.assign({
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v9
        }), 
        Title = v2.createElement(l_HeaderText_0, {
            layoutOrder = -1, 
            text = v6.title
        }), 
        Divider = if v10 then v2.createElement("Frame", {
            LayoutOrder = 10000000, 
            BackgroundColor3 = l_Divider_0.Color3, 
            BackgroundTransparency = l_Divider_0.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1)
        }) else nil
    }, v6.children));
end;