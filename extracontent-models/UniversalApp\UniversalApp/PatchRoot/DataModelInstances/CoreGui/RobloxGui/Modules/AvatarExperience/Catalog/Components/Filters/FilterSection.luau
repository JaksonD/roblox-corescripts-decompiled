local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local v6 = UDim.new(0, 12);
return function(v7) --[[ Line: 24 ]] --[[ Name: FilterSection ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v5 (copy), v6 (copy), v2 (copy)
    local v8 = l_useStyle_0();
    local l_Theme_0 = v8.Theme;
    local l_Font_0 = v8.Font;
    return v3.createElement("Frame", {
        Size = v7.Size, 
        AutomaticSize = if v5() then v7.AutomaticSize else nil, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v6
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = v6, 
            PaddingBottom = v6, 
            PaddingLeft = v6, 
            PaddingRight = v6
        }), 
        Title = v3.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_0.Header1.Font, 
            TextSize = l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize, 
            Text = v7.title, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency
        }), 
        Content = v3.createElement("Frame", {
            LayoutOrder = 2, 
            Size = v7.contentSize, 
            AutomaticSize = if v5() then v7.AutomaticSize else nil, 
            BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BorderSizePixel = 0
        }, v2.join({
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }, v7.children))
    });
end;