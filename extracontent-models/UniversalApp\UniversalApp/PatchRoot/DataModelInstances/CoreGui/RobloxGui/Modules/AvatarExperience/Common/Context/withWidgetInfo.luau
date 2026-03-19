local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
return function(v5) --[[ Line: 14 ]] --[[ Name: withWidgetInfo ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    return function(v6) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v4 (ref), v5 (copy), v2 (ref)
        return v3.createElement(v4.Consumer, {
            render = function(v7) --[[ Line: 17 ]] --[[ Name: render ]]
                -- upvalues: v3 (ref), v5 (ref), v2 (ref), v6 (copy)
                return v3.createElement(v5, v2.join(v6, {
                    widgetInfo = v7
                }));
            end
        });
    end;
end;