local v0 = require(script.Parent.GetFFlagAXEnableSlotBasedEditor);
game:DefineFastFlag("AXEnableClearAllConfirmationPrompt2", false);
return v0() and game:GetFastFlag("AXEnableClearAllConfirmationPrompt2");