local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Util.joinGame);
local v4 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v5 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayerContextualMenu);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v8) --[[ Line: 12 ]]
        -- upvalues: v5 (ref), v4 (ref), v2 (ref), v3 (ref), v7 (copy)
        v8:dispatch(v5(v4.PlayerContextualMenu, v2.Dictionary.join({
            joinExperience = function(v9, v10) --[[ Line: 16 ]] --[[ Name: joinExperience ]]
                -- upvalues: v3 (ref)
                v3:ByUser({
                    id = v9
                }, v10);
            end
        }, v7)));
    end;
end;