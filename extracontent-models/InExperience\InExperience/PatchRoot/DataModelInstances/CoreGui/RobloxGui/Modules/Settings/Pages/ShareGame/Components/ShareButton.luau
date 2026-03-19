local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v4 = v3.font(Enum.Font.SourceSansSemibold, "Semibold");
local v5 = v3.textSize(19);
local v6 = Color3.fromRGB(222, 225, 227);
local v7 = Color3.fromRGB(255, 255, 255);
local v8 = v1.PureComponent:extend("ShareButton");
v8.init = function(v9) --[[ Line: 14 ]] --[[ Name: init ]]
    v9.state = {
        isHovering = false
    };
end;
v8.render = function(v10) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v7 (copy), v3 (copy), v5 (copy), v4 (copy)
    local l_size_0 = v10.props.size;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local l_onShare_0 = v10.props.onShare;
    local l_isEnabled_0 = v10.props.isEnabled;
    local l_text_0 = v10.props.text;
    local v16 = {
        Border = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = if v10.state.isHovering and l_isEnabled_0 then v6 else v7, 
            Thickness = v3.DefaultStokeThickness, 
            Transparency = l_isEnabled_0 and 0 or 0.5
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = v3.DefaultCornerRadius
        })
    };
    return v1.createElement("TextButton", {
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_0, 
        Text = l_text_0, 
        TextSize = v5, 
        Font = v4, 
        AutoButtonColor = false, 
        BackgroundColor3 = if v10.state.isHovering and l_isEnabled_0 then v6 else v7, 
        Transparency = l_isEnabled_0 and 0 or 0.5, 
        [v1.Event.Activated] = function() --[[ Line: 48 ]]
            -- upvalues: l_isEnabled_0 (copy), l_onShare_0 (copy)
            if l_isEnabled_0 then
                l_onShare_0();
            end;
        end, 
        [v1.Event.InputBegan] = function() --[[ Line: 53 ]]
            -- upvalues: v10 (copy)
            v10:setState({
                isHovering = true
            });
        end, 
        [v1.Event.InputEnded] = function() --[[ Line: 56 ]]
            -- upvalues: v10 (copy)
            v10:setState({
                isHovering = false
            });
        end
    }, v16);
end;
return v8;