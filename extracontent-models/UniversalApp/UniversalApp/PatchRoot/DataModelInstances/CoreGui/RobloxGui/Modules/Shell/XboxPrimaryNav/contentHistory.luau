local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v1 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return ((function() --[[ Line: 12 ]] --[[ Name: contentHistory ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    local v3 = nil;
    v2.setLastSelectedContent = function(_, v5) --[[ Line: 17 ]] --[[ Name: setLastSelectedContent ]]
        -- upvalues: v3 (ref)
        v3 = v5;
    end;
    v2.getLastContentName = function(_) --[[ Line: 21 ]] --[[ Name: getLastContentName ]]
        -- upvalues: v1 (ref), v3 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
            -- upvalues: v1 (ref), v3 (ref)
            if v1() then
                return v3:GetId();
            else
                return v3:GetName();
            end;
        end);
        if l_status_0 then
            return l_result_0;
        else
            return;
        end;
    end;
    return v2;
end)());