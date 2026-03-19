local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_GetPromptAssignments_0 = require(l_Parent_0.PromptAssignments).Thunks.GetPromptAssignments;
local l_PromptType_0 = require(l_Parent_0.PromptAssignments).Enum.PromptType;
return function(v4, v5) --[[ Line: 14 ]] --[[ Name: hasCooldown ]]
    -- upvalues: l_GetPromptAssignments_0 (copy), l_PromptType_0 (copy), l_Logger_0 (copy)
    return v5:dispatch(l_GetPromptAssignments_0(v4)):andThen(function(v6) --[[ Line: 17 ]]
        -- upvalues: l_PromptType_0 (ref), l_Logger_0 (ref)
        for _, v8 in ipairs(v6) do
            if v8 and l_PromptType_0.fromRawValue(v8.promptType) == l_PromptType_0.PasskeyUpsell then
                l_Logger_0:info("User does NOT have a cooldown for passkey upsell.");
                return false;
            end;
        end;
        l_Logger_0:info("User has a cooldown for passkey upsell.");
        return true;
    end):catch(function(v9) --[[ Line: 29 ]]
        -- upvalues: l_Logger_0 (ref)
        l_Logger_0:debug("Error checking for passkey cooldown: {}", v9);
        return false;
    end);
end;