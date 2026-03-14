local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagLuaAppSupportDeviceSafeInsets_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSupportDeviceSafeInsets;
game:DefineFastFlag("LuaAppFixStudioNotchSupport3", false);
return function() --[[ Line: 6 ]]
    -- upvalues: l_FFlagLuaAppSupportDeviceSafeInsets_0 (copy)
    return game:GetFastFlag("LuaAppFixStudioNotchSupport3") or l_FFlagLuaAppSupportDeviceSafeInsets_0;
end;