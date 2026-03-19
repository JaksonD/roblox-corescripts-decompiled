local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.Parent.Constants);
local l_MainWindowHeader_0 = v3.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v3.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v3.Color.Text;
local l_UnselectedGray_0 = v3.Color.UnselectedGray;
local l_InactiveBox_0 = v3.Color.InactiveBox;
return function(v9) --[[ Line: 20 ]] --[[ Name: BoxButton ]]
    -- upvalues: v1 (copy), v2 (copy), l_MainWindowHeader_1 (copy), l_Text_0 (copy), l_MainWindowHeader_0 (copy), l_UnselectedGray_0 (copy), l_InactiveBox_0 (copy)
    local l_text_0 = v9.text;
    local l_size_0 = v9.size;
    local l_pos_0 = v9.pos;
    local _ = v9.onClicked;
    local v14 = typeof(v9.enabled) ~= "boolean" or v9.enabled;
    local v15 = v1.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v9 (copy)
        v9.onClicked(v9.text);
    end, {
        v9.onClicked, 
        v9.text
    });
    return v2.createElement("TextButton", {
        Text = l_text_0, 
        TextSize = l_MainWindowHeader_1, 
        TextColor3 = l_Text_0, 
        Font = l_MainWindowHeader_0, 
        Size = l_size_0, 
        Position = l_pos_0, 
        AutoButtonColor = v14, 
        BackgroundColor3 = if v14 then l_UnselectedGray_0 else l_InactiveBox_0, 
        Active = v14, 
        BackgroundTransparency = 0, 
        [v2.Event.Activated] = v15
    });
end;