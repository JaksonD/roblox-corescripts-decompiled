local v0 = require(script.Parent.FFlagTCUpsellModalEnabled_DEV);
local v1 = require(script.Parent.FFlagAppChatEnableDoubleOptIn);
return v0 and game:DefineFastFlag("DebugEnableTCDoubleOptIn_DEV", false) and v1;