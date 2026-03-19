local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local l_UpdatePromptAssignment_0 = require(l_Parent_0.PromptAssignments).Thunks.UpdatePromptAssignment;
local l_PromptType_0 = require(l_Parent_0.PromptAssignments).Enum.PromptType;
local l_PromptAssignmentAction_0 = require(l_Parent_0.PromptAssignments).Enum.PromptAssignmentAction;
local l_HttpService_0 = game:GetService("HttpService");
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
return function(v6, v7) --[[ Line: 14 ]] --[[ Name: updateCooldown ]]
    -- upvalues: l_UpdatePromptAssignment_0 (copy), l_PromptType_0 (copy), l_PromptAssignmentAction_0 (copy), l_Logger_0 (copy), l_HttpService_0 (copy)
    return v7(l_UpdatePromptAssignment_0(v6, l_PromptType_0.PasskeyUpsell, l_PromptAssignmentAction_0.DismissPrompt)):catch(function(v8) --[[ Line: 16 ]]
        -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref)
        l_Logger_0:debug("Error updating passkey upsell prompt cooldown {}", l_HttpService_0:JSONEncode(v8));
    end);
end;