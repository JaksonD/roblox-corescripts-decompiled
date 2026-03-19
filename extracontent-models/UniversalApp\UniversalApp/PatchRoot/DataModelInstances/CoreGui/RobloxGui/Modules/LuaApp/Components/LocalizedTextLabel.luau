local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
if require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v5 (copy), v3 (copy), v2 (copy)
        return v5({
            localizedText = v6.Text
        })(function(v7) --[[ Line: 13 ]]
            -- upvalues: v3 (ref), v2 (ref), v6 (copy)
            return v3.createElement("TextLabel", v2.Dictionary.join(v6, {
                Text = v7.localizedText
            }));
        end);
    end;
else
    return v4.connect({
        "Text"
    })("TextLabel");
end;