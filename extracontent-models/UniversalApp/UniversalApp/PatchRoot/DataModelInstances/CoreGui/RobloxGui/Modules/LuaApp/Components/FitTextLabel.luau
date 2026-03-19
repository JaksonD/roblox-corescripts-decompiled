local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.Common.Text);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = v1.PureComponent:extend("FitTextLabel");
v5.defaultProps = {
    fitAxis = v4.FitAxis.Height, 
    maxWidth = nil
};
v5.init = function(v6) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v3 (copy)
    v6.onRef = function(v7) --[[ Line: 17 ]]
        -- upvalues: v6 (copy)
        v6.ref = v7;
    end;
    v6.resize = function(v8) --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v4 (ref), v3 (ref)
        local l_fitAxis_0 = v6.props.fitAxis;
        local l_maxWidth_0 = v6.props.maxWidth;
        if l_fitAxis_0 == v4.FitAxis.Width or l_fitAxis_0 == v4.FitAxis.Both then
            local v11 = UDim.new(0, v3.GetTextWidth(v8.Text, v8.Font, v8.TextSize));
            local v12 = nil;
            if l_maxWidth_0 ~= nil and l_maxWidth_0 < v11.Offset then
                v11 = UDim.new(0, l_maxWidth_0);
                v12 = UDim.new(0, v3.GetTextHeight(v8.Text, v8.Font, v8.TextSize, v11.Offset));
            else
                v12 = l_fitAxis_0 == v4.FitAxis.Both and UDim.new(0, v8.TextSize) or v8.Size.Height;
            end;
            v6:setState({
                width = v11, 
                height = v12
            });
            return;
        else
            local v13 = UDim.new(0, v3.GetTextHeight(v8.Text, v8.Font, v8.TextSize, v8.AbsoluteSize.X));
            v6:setState({
                width = v8.Size.Width, 
                height = v13
            });
            return;
        end;
    end;
    v6:setState({
        width = nil, 
        height = nil
    });
end;
v5.render = function(v14) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy)
    local v15 = v14.props.fitAxis or v4.FitAxis.Height;
    local v16 = v2.RemoveFromDictionary(v14.props, "fitAxis", "maxWidth");
    local l_width_0 = v14.state.width;
    local l_height_0 = v14.state.height;
    if l_width_0 and l_height_0 then
        v16 = v2.JoinDictionaries(v16, {
            Size = UDim2.new(l_width_0, l_height_0)
        });
    end;
    return v1.createElement("TextLabel", v2.JoinDictionaries(v16, {
        [v1.Ref] = v14.onRef, 
        [v1.Change.Text] = v14.resize, 
        [v1.Change.TextSize] = v14.resize, 
        [v1.Change.AbsoluteSize] = v15 == v4.FitAxis.Height and v14.resize or nil
    }));
end;
v5.didMount = function(v19) --[[ Line: 84 ]] --[[ Name: didMount ]]
    v19.resize(v19.ref);
end;
return v5;