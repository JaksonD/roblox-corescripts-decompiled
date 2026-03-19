local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
return function(v6) --[[ Line: 27 ]] --[[ Name: withAdaptiveScrolling ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    return function(v7) --[[ Line: 28 ]]
        -- upvalues: v3 (ref), v4 (ref), v6 (copy), v2 (ref)
        return v3.createElement(v4.Consumer, {
            render = function(v8) --[[ Line: 30 ]] --[[ Name: render ]]
                -- upvalues: v3 (ref), v6 (ref), v2 (ref), v7 (copy)
                return v3.createElement(v6, v2.join(v7, {
                    adaptiveScrolling = v8
                }));
            end
        });
    end;
end;