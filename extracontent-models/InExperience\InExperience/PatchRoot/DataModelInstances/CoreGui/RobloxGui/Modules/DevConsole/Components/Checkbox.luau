local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = v2.Component:extend("Checkbox");
v3.render = function(v4) --[[ Line: 8 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Size_0 = v4.props.Size;
    local v6 = v4.props.Position or UDim2.new(0, 0, 0, 0);
    local v7 = v4.props.LayoutOrder or 0;
    local l_Name_0 = v4.props.Name;
    local v9 = v4.props.SelectedColor or v1.Color.SelectedBlue;
    local v10 = v4.props.UnselectedColor or v1.Color.UnselectedGray;
    local l_OnSelectedStateChanged_0 = v4.props.OnSelectedStateChanged;
    local v12 = "";
    local v13 = 1;
    local l_v10_0 = v10;
    if v4.props.IsSelected then
        v12 = v1.Image.Check;
        v13 = 0;
        l_v10_0 = v9;
    end;
    return v2.createElement("ImageButton", {
        Size = l_Size_0, 
        Position = v6, 
        Image = v12, 
        BackgroundColor3 = l_v10_0, 
        BackgroundTransparency = 0, 
        BorderColor3 = v1.Color.Text, 
        BorderSizePixel = v13, 
        LayoutOrder = v7, 
        [v2.Event.Activated] = function(_) --[[ Line: 39 ]]
            -- upvalues: l_OnSelectedStateChanged_0 (copy), l_Name_0 (copy), v4 (copy)
            if l_OnSelectedStateChanged_0 then
                l_OnSelectedStateChanged_0(l_Name_0, not v4.props.IsSelected);
            end;
        end
    });
end;
return v3;