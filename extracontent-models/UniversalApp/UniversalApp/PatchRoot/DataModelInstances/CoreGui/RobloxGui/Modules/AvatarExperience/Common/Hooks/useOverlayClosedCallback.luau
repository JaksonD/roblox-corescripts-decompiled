local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_logOnOverlayClosed_0 = v2.Debug.logOnOverlayClosed;
local l_useAvatarRoute_0 = v2.AvatarRoute.Hooks.useAvatarRoute;
local l_useLastInputMethod_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMethod;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return function(v7) --[[ Line: 11 ]] --[[ Name: useOverlayClosedCallback ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useLastInputMethod_0 (copy), v1 (copy), l_logOnOverlayClosed_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local l_name_0 = l_useAvatarRoute_0().opaque.name;
    local v9 = l_useLastInputMethod_0() == "Gamepad";
    return (v1.useCallback(function() --[[ Line: 15 ]]
        -- upvalues: v9 (copy), l_logOnOverlayClosed_0 (ref), l_name_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v7 (copy)
        local l_v9_0 = v9;
        l_logOnOverlayClosed_0(l_name_0, l_v9_0);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_v9_0 and v7 then
            v7.captureFocus();
        end;
    end, {
        v9, 
        l_name_0, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7
    }));
end;