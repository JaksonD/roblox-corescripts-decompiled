local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.ScreenshotFlowStepHandler);
local v3 = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v4 = v1.PureComponent:extend("ScreenshotFlowStepHandlerContainer");
v4.render = function(v5) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return v3({
        ScreenshotFlowStepHandlerContainer = v1.createElement(v2, v5.props)
    });
end;
return v4;