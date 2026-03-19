local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local v2 = require(l_Common_0.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v5 = v2.PureComponent:extend("CheckBox");
v5.init = function(v6) --[[ Line: 17 ]] --[[ Name: init ]]
    v6.state = {
        hovering = false
    };
    v6.onActivated = function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy)
        if v6.props.Enabled and v6.props.OnActivated then
            v6.props.OnActivated();
        end;
    end;
    v6.onMouseEnter = function(_) --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        spawn(function() --[[ Line: 29 ]]
            -- upvalues: v6 (ref)
            v6:setState({
                hovering = true
            });
        end);
    end;
    v6.onMouseLeave = function(_) --[[ Line: 36 ]]
        -- upvalues: v6 (copy)
        spawn(function() --[[ Line: 37 ]]
            -- upvalues: v6 (ref)
            v6:setState({
                hovering = false
            });
        end);
    end;
end;
v5.render = function(v9) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local l_Enabled_0 = v9.props.Enabled;
    local l_LayoutOrder_0 = v9.props.LayoutOrder;
    local l_Selected_0 = v9.props.Selected;
    local l_Height_0 = v9.props.Height;
    local v14 = nil;
    local v15 = nil;
    if v9.state.hovering then
        v14 = "LuaApp/graphic/checkbox_unchecked_hover";
    elseif not l_Enabled_0 and not v9.state.hovering then
        v14 = "LuaApp/graphic/checkbox_unchecked_disabled";
    elseif l_Enabled_0 then
        v14 = "LuaApp/graphic/checkbox_unchecked";
    end;
    v15 = l_Enabled_0 and "LuaApp/graphic/checkbox_checked" or "LuaApp/graphic/checkbox_checked_disabled";
    return v2.createElement("Frame", {
        Size = UDim2.new(0, l_Height_0, 0, l_Height_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Background = v2.createElement(v3, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = l_Enabled_0 and 0 or 0.4, 
            Image = v14, 
            LayoutOrder = l_LayoutOrder_0 or 1, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = v9.onActivated, 
            [v2.Event.MouseEnter] = v9.onMouseEnter, 
            [v2.Event.MouseLeave] = v9.onMouseLeave
        }, {
            Selection = v2.createElement(v4, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = l_Selected_0, 
                Image = v15
            })
        })
    });
end;
return v5;