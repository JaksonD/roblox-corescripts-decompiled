local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
return function(v6) --[[ Line: 18 ]] --[[ Name: withTheme_DEPRECATED ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    return function(v7) --[[ Line: 19 ]] --[[ Name: ComponentWithTheme ]]
        -- upvalues: v3 (ref), v5 (ref), v6 (copy), v4 (ref)
        return v3.createElement(v5.Consumer, {
            render = function(v8) --[[ Line: 21 ]] --[[ Name: render ]]
                -- upvalues: v3 (ref), v6 (ref), v4 (ref), v7 (copy)
                return v3.createElement(v6, v4.Dictionary.join(v7, {
                    appTheme = v8
                }));
            end
        });
    end;
end;