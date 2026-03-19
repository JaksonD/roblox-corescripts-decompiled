local v0 = require(script.Parent.GetFFlagAXEnableSlotBasedEditor);
game:DefineFastFlag("AXExtractEmotesCategory2", false);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return v0() and game:GetFastFlag("AXExtractEmotesCategory2");
end;