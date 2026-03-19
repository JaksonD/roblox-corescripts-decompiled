local v0 = require(script.Parent.GetFFlagPackagifySettingsShowSignal);
game:DefineFastFlag("NotificationModalSetMenuIsOpen", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return v0() and game:GetFastFlag("NotificationModalSetMenuIsOpen");
end;