local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local v1 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.deleteScheduledSquad);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v1 (ref), v2 (ref), v3 (copy), v5 (copy)
        local function v7() --[[ Line: 12 ]]
            -- upvalues: v4 (ref), v6 (copy), v1 (ref)
            v4(v6, {
                promptType = v1.Error
            });
        end;
        return v4(v6, {
            onConfirm = function() --[[ Line: 19 ]] --[[ Name: onConfirm ]]
                -- upvalues: v2 (ref), v3 (ref), v5 (ref), v7 (copy)
                v2({
                    scheduledGroupUpId = v3
                }, v5, v7);
            end, 
            promptType = v1.ConfirmDeleteScheduledSquad
        });
    end;
end;