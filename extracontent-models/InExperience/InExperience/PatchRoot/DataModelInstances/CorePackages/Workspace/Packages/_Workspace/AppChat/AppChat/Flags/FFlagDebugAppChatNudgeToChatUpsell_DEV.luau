local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
return game:DefineFastFlag("DebugAppChatNudgeToChatUpsell_DEV", false) and v1;