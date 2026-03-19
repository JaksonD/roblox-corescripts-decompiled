local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Immutable);
local v5 = require(l_Modules_0.Common.Text);
local v6 = require(l_Modules_0.LuaApp.FitChildren);
local v7 = v3.PureComponent:extend("FitTextButton");
v7.defaultProps = {
    fitAxis = v6.FitAxis.Height
};
v7.init = function(v8) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy)
    v8.ref = v8.props.forwardRef or v3.createRef();
    v8.resize = function(v9) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v6 (ref), v5 (ref)
        local l_fitAxis_0 = v8.props.fitAxis;
        if l_fitAxis_0 == v6.FitAxis.Width or l_fitAxis_0 == v6.FitAxis.Both then
            local v11 = UDim.new(0, v5.GetTextWidth(v9.Text, v9.Font, v9.TextSize));
            local v12 = l_fitAxis_0 == v6.FitAxis.Both and UDim.new(0, v9.TextSize) or v9.Size.Height;
            v9.Size = UDim2.new(v11, v12);
            return;
        else
            local v13 = UDim.new(0, v5.GetTextHeight(v9.Text, v9.Font, v9.TextSize, v9.AbsoluteSize.X));
            v9.Size = UDim2.new(v9.Size.Width, v13);
            return;
        end;
    end;
end;
v7.render = function(v14) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy)
    local v15 = v14.props.fitAxis or v6.FitAxis.Height;
    local v16 = v4.RemoveFromDictionary(v14.props, "fitAxis", "forwardRef");
    return v3.createElement("TextButton", v4.JoinDictionaries(v16, {
        [v3.Ref] = v14.ref, 
        [v3.Change.Text] = v14.resize, 
        [v3.Change.TextSize] = v14.resize, 
        [v3.Change.AbsoluteSize] = v15 == v6.FitAxis.Height and v14.resize or nil
    }));
end;
v7.didMount = function(v17) --[[ Line: 56 ]] --[[ Name: didMount ]]
    v17.resize(v17.ref.current);
end;
return v3.forwardRef(function(v18, v19) --[[ Line: 60 ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy)
    return v3.createElement(v7, v2.Dictionary.join(v18, {
        forwardRef = v19
    }));
end);