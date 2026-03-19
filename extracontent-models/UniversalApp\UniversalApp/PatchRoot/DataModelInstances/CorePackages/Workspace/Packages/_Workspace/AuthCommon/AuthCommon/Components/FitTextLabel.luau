local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_script_FirstAncestor_0.Components.FitChildren);
local v6 = v2.PureComponent:extend("FitTextLabel");
v6.defaultProps = {
    fitAxis = v5.FitAxis.Height, 
    maxWidth = nil
};
v6.init = function(v7) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_Text_0 (copy)
    v7.onRef = function(v8) --[[ Line: 18 ]]
        -- upvalues: v7 (copy)
        v7.ref = v8;
    end;
    v7.resize = function(v9) --[[ Line: 22 ]]
        -- upvalues: v7 (copy), v5 (ref), l_Text_0 (ref)
        local l_fitAxis_0 = v7.props.fitAxis;
        local l_maxWidth_0 = v7.props.maxWidth;
        if l_fitAxis_0 == v5.FitAxis.Width or l_fitAxis_0 == v5.FitAxis.Both then
            local v12 = UDim.new(0, l_Text_0.GetTextWidth(v9.Text, v9.Font, v9.TextSize));
            local v13 = nil;
            if l_maxWidth_0 ~= nil and l_maxWidth_0 < v12.Offset then
                v12 = UDim.new(0, l_maxWidth_0);
                v13 = UDim.new(0, l_Text_0.GetTextHeight(v9.Text, v9.Font, v9.TextSize, v12.Offset));
            else
                v13 = l_fitAxis_0 == v5.FitAxis.Both and UDim.new(0, v9.TextSize) or v9.Size.Height;
            end;
            v7:setState({
                width = v12, 
                height = v13
            });
            return;
        else
            local v14 = UDim.new(0, l_Text_0.GetTextHeight(v9.Text, v9.Font, v9.TextSize, v9.AbsoluteSize.X));
            v7:setState({
                width = v9.Size.Width, 
                height = v14
            });
            return;
        end;
    end;
    v7:setState({
        width = nil, 
        height = nil
    });
end;
v6.render = function(v15) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_Immutable_0 (copy), v2 (copy)
    local v16 = v15.props.fitAxis or v5.FitAxis.Height;
    local v17 = l_Immutable_0.RemoveFromDictionary(v15.props, "fitAxis", "maxWidth");
    local l_width_0 = v15.state.width;
    local l_height_0 = v15.state.height;
    if l_width_0 and l_height_0 then
        v17 = l_Immutable_0.JoinDictionaries(v17, {
            Size = UDim2.new(l_width_0, l_height_0)
        });
    end;
    return v2.createElement("TextLabel", l_Immutable_0.JoinDictionaries(v17, {
        [v2.Ref] = v15.onRef, 
        [v2.Change.Text] = v15.resize, 
        [v2.Change.TextSize] = v15.resize, 
        [v2.Change.AbsoluteSize] = v16 == v5.FitAxis.Height and v15.resize or nil
    }));
end;
v6.didMount = function(v20) --[[ Line: 85 ]] --[[ Name: didMount ]]
    v20.resize(v20.ref);
end;
return v6;