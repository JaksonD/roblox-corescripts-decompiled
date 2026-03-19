local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
game:DefineFastFlag("AXEnableSlotBasedEditor3", false);
return function() --[[ Line: 7 ]]
    -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    return l_FFlagAXRootSlotBasedEditorFlag_0 and game:GetFastFlag("AXEnableSlotBasedEditor3");
end;