local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = v2.PureComponent:extend("ScreenGuiWithBlurControl");
v4.render = function(v5) --[[ Line: 9 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_hasScreenGuiBlur_0 = v5.props.hasScreenGuiBlur;
    local l_blurDisplayOrder_0 = v5.props.blurDisplayOrder;
    local l_DisplayOrder_0 = v5.props.DisplayOrder;
    local v9 = false;
    if l_hasScreenGuiBlur_0 and l_blurDisplayOrder_0 <= l_DisplayOrder_0 then
        v9 = true;
    end;
    local v10 = v1.Dictionary.join(v5.props, {
        hasScreenGuiBlur = v1.None, 
        blurDisplayOrder = v1.None, 
        OnTopOfCoreBlur = v9
    });
    return v2.createElement("ScreenGui", v10);
end;
return (v3.connect(function(v11, _) --[[ Line: 28 ]]
    return {
        hasScreenGuiBlur = v11.ScreenGuiBlur.hasBlur, 
        blurDisplayOrder = v11.ScreenGuiBlur.blurDisplayOrder
    };
end)(v4));