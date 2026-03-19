local v0 = require(script.Parent.GetFFlagAXEnableSlotBasedEditor);
game:DefineFastFlag("AXAddNavigationKeyToEditorSubcategories2", false);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return v0() and game:GetFastFlag("AXAddNavigationKeyToEditorSubcategories2");
end;