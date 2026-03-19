local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Constants);
local l_MainWindowHeader_0 = v2.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v2.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v2.Color.Text;
return function(v6) --[[ Line: 18 ]] --[[ Name: HeaderButton ]]
    -- upvalues: v1 (copy), l_MainWindowHeader_1 (copy), l_Text_0 (copy), l_MainWindowHeader_0 (copy)
    local l_text_0 = v6.text;
    local l_size_0 = v6.size;
    local l_pos_0 = v6.pos;
    local l_sortfunction_0 = v6.sortfunction;
    return v1.createElement("TextButton", {
        Text = l_text_0, 
        TextSize = l_MainWindowHeader_1, 
        TextColor3 = l_Text_0, 
        Font = l_MainWindowHeader_0, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = function() --[[ Line: 35 ]]
            -- upvalues: l_sortfunction_0 (copy), l_text_0 (copy)
            if l_sortfunction_0 then
                l_sortfunction_0(l_text_0);
            end;
        end
    });
end;