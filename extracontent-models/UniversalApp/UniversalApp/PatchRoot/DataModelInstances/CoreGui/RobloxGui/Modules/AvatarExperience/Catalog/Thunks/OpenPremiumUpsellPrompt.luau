local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v6 = require(l_Modules_0.LuaApp.Components.PremiumUpsell.Enum.PremiumUpsellTriggerContext);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(_, _, v10, v11, _, v13, v14) --[[ Line: 33 ]]
    -- upvalues: v2 (copy), l_AvatarScreen_0 (copy), v6 (copy), l_NavigateWithLock_0 (copy)
    v2.isTypeOrNil(v13, "string", "OpenPremiumUpsellPrompt expects itemId");
    v2.isTypeOrNil(v14, "string", "OpenPremiumUpsellPrompt expects itemType");
    return function(v15) --[[ Line: 36 ]]
        -- upvalues: v11 (copy), l_AvatarScreen_0 (ref), v10 (copy), v6 (ref), l_NavigateWithLock_0 (ref)
        v15:dispatch(l_NavigateWithLock_0(function() --[[ Line: 37 ]]
            -- upvalues: v11 (ref), l_AvatarScreen_0 (ref), v10 (ref), v6 (ref)
            v11.navigate(l_AvatarScreen_0.PremiumUpsellPrompt, {
                onCancel = function() --[[ Line: 39 ]] --[[ Name: onCancel ]]

                end, 
                onOverlayClosed = v10, 
                triggerContext = v6.UACatalog
            });
        end));
    end;
end;