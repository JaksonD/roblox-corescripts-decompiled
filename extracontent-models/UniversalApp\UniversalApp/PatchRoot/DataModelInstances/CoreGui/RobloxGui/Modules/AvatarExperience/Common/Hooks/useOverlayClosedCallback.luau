local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_useLastInputMethod_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMethod;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return function(v8) --[[ Line: 14 ]] --[[ Name: useOverlayClosedCallback ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useLastInputMethod_0 (copy), v3 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local l_name_0 = l_useAvatarRoute_0().opaque.name;
    local v10 = l_useLastInputMethod_0() == "Gamepad";
    return (v3.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v10 (copy), v4 (ref), l_name_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v8 (copy)
        local l_v10_0 = v10;
        v4(l_name_0, l_v10_0);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_v10_0 and v8 then
            v8.captureFocus();
        end;
    end, {
        v10, 
        l_name_0, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8
    }));
end;