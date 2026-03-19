local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Logger);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        v4:dispatch(v1.rodux.UpdateTypingStatus.API(v3)):catch(function(v5) --[[ Line: 8 ]]
            -- upvalues: v2 (ref)
            v2:error((("AppChatNetworking failure in updateTypingStatus, Status: %*"):format((tostring(v5)))));
        end);
    end;
end;