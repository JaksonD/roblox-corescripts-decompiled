local l_StarterGui_0 = game:GetService("StarterGui");
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
ProcessMessage = function(v2, _, _) --[[ Line: 9 ]] --[[ Name: ProcessMessage ]]
    -- upvalues: l_StarterGui_0 (copy)
    if string.sub(v2, 1, 8):lower() == "/console" or string.sub(v2, 1, 11):lower() == "/newconsole" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
            -- upvalues: l_StarterGui_0 (ref)
            return l_StarterGui_0:GetCore("DevConsoleVisible");
        end);
        if l_status_0 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 13 ]]
                -- upvalues: l_StarterGui_0 (ref), l_result_0 (copy)
                l_StarterGui_0:SetCore("DevConsoleVisible", not l_result_0);
            end);
            if not l_status_1 and l_result_1 then
                print("Error making developer console visible: " .. l_result_1);
            end;
        end;
        return true;
    else
        return false;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};