local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v1.PureComponent:extend("BottomInsetBackground");
v4.validateProps = v3.strictInterface({
    globalGuiInset = v3.strictInterface({
        left = v3.integer, 
        top = v3.integer, 
        right = v3.integer, 
        bottom = v3.integer
    })
});
v4.renderWithStyle = function(v5, v6) --[[ Line: 24 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v1 (copy)
    local l_Theme_0 = v6.Theme;
    local l_globalGuiInset_0 = v5.props.globalGuiInset;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = UDim2.new(1, 0, 0, l_globalGuiInset_0.bottom), 
        ZIndex = 3
    });
end;
v4.render = function(v9) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v10) --[[ Line: 40 ]]
        -- upvalues: v9 (copy)
        return v9:renderWithStyle(v10);
    end);
end;
return v4;