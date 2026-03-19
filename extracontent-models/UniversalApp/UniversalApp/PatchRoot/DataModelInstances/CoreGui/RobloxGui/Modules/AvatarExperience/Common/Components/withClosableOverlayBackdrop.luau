local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v5) --[[ Line: 11 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), v4 (copy)
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: l_useNavigation_0 (ref), v2 (ref), v4 (ref), v5 (copy)
        local v7 = l_useNavigation_0();
        local v8 = v2.useCallback(function() --[[ Line: 15 ]]
            -- upvalues: v4 (ref), v7 (copy)
            v4.closeOverlay(v7);
        end, {
            v7
        });
        return v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v2.Event.Activated] = v8
        }, {
            Prompt = v2.createElement(v5, v6)
        });
    end;
end;