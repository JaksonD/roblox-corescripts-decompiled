local v0 = require(script.Parent.GetFFlagAXEnableSlotBasedEditor);
game:DefineFastFlag("EnableNewCustomizeBundleEquip3", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("EnableNewCustomizeBundleEquip3") and v0();
end;