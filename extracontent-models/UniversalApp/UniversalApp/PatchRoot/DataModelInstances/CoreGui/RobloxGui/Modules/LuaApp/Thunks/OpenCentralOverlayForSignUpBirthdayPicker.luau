local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
return function(v6) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_Birthday_0 (copy), v4 (copy), v3 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v6 (copy), l_Birthday_0 (ref), v4 (ref), v3 (ref)
        v2.isType(v6.onClose, "function", "props.onClose passed down to OpenCentralOverlayForSignUpBirthdayPicker");
        if v6.initialBirthday then
            v2.assert(l_Birthday_0.is(v6.initialBirthday), "props.initialBirthday passed down to OpenCentralOverlayForSignUpBirthdayPicker");
        end;
        v7:dispatch(v4(v3.SignUpBirthdayPickerOverlay, v6));
    end;
end;