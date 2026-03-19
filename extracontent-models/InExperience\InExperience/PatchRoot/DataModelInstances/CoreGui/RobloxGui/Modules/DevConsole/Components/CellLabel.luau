local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Constants);
local l_MainWindow_0 = v2.DefaultFontSize.MainWindow;
local l_Text_0 = v2.Color.Text;
local l_MainWindow_1 = v2.Font.MainWindow;
local l_MainWindowBold_0 = v2.Font.MainWindowBold;
return function(v7) --[[ Line: 21 ]] --[[ Name: CellLabel ]]
    -- upvalues: v1 (copy), l_MainWindow_0 (copy), l_Text_0 (copy), l_MainWindowBold_0 (copy), l_MainWindow_1 (copy)
    local l_text_0 = v7.text;
    local l_size_0 = v7.size;
    local l_pos_0 = v7.pos;
    local l_bold_0 = v7.bold;
    local l_layoutOrder_0 = v7.layoutOrder;
    local l_richText_0 = v7.richText;
    local v14 = v7.textWrapped == nil or v7.textWrapped;
    local v15 = if v7.textTruncate ~= nil then v7.textTruncate else nil;
    return v1.createElement("TextLabel", {
        Text = l_text_0, 
        TextSize = l_MainWindow_0, 
        TextColor3 = l_Text_0, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = v14, 
        TextTruncate = v15, 
        Font = l_bold_0 and l_MainWindowBold_0 or l_MainWindow_1, 
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        RichText = l_richText_0
    });
end;