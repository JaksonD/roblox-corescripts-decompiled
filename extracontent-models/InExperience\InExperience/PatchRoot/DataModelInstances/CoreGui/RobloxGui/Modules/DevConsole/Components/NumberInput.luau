local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = v2.Component:extend("NumberInput");
v3.init = function(v4) --[[ Line: 18 ]] --[[ Name: init ]]
    v4.state = {
        Value = v4.props.DefaultValue
    };
end;
v3.render = function(v5) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_props_0 = v5.props;
    return v2.createElement("TextBox", {
        Font = v1.Font.Log, 
        Text = ("%*"):format(v5.state.Value), 
        TextColor3 = v1.Color.Text, 
        TextSize = v1.GeneralFormatting.NumberInputTextSize, 
        TextXAlignment = l_props_0.TextXAlignment or Enum.TextXAlignment.Center, 
        BackgroundColor3 = v1.Color.TextBoxGray, 
        BorderColor3 = v1.GeneralFormatting.LineColor, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        ClearTextOnFocus = true, 
        [v2.Event.FocusLost] = function(v7) --[[ Line: 43 ]]
            -- upvalues: v5 (copy), l_props_0 (copy)
            local v8 = tonumber(v7.Text);
            if v8 == nil or v8 ~= v8 then
                v7.Text = ("%*"):format(v5.state.Value);
                return;
            else
                if l_props_0.IntegerOnly then
                    v8 = math.floor(v8);
                end;
                v8 = math.clamp(v8, l_props_0.Range.Min, l_props_0.Range.Max);
                v5:setState({
                    Value = v8
                });
                v7.Text = ("%*"):format(v8);
                if l_props_0.OnNumberInputChanged then
                    l_props_0.OnNumberInputChanged(v8);
                end;
                return;
            end;
        end
    });
end;
return v3;