local l_StarterGui_0 = game:GetService("StarterGui");
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/console"
    }, 
    clientRun = function() --[[ Line: 7 ]] --[[ Name: clientRun ]]
        -- upvalues: l_StarterGui_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_StarterGui_0 (ref)
            return l_StarterGui_0:GetCore("DevConsoleVisible");
        end);
        if l_status_0 then
            pcall(function() --[[ Line: 12 ]]
                -- upvalues: l_StarterGui_0 (ref), l_result_0 (copy)
                l_StarterGui_0:SetCore("DevConsoleVisible", not l_result_0);
            end);
        end;
        return nil;
    end
};