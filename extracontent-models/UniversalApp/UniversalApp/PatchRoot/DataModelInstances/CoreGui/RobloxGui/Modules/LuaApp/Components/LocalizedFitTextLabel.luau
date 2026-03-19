local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
if require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return function(v7) --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v3 (copy), v6 (copy), v2 (copy)
        return v5({
            localizedText = v7.Text
        })(function(v8) --[[ Line: 14 ]]
            -- upvalues: v3 (ref), v6 (ref), v2 (ref), v7 (copy)
            return v3.createElement(v6, v2.Dictionary.join(v7, {
                Text = v8.localizedText
            }));
        end);
    end;
else
    return v4.connect({
        "Text"
    })(v6);
end;