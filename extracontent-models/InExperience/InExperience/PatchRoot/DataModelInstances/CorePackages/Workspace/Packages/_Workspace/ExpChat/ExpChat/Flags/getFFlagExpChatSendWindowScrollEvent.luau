local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
game:DefineFastFlag("ExpChatSendWindowScrollEvent", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("ExpChatSendWindowScrollEvent") and v1();
end;