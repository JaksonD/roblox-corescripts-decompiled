local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v5 = require(l_Parent_0.Promise);
local v6 = l_Logger_0:new("SquadsCore");
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v6 (copy), v3 (copy), v5 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v7 (copy), v6 (ref), v8 (copy), v3 (ref), v5 (ref)
        return v9:dispatch(v2.ReinviteToSquad.API({
            squadId = v7
        })):catch(function(v10) --[[ Line: 14 ]]
            -- upvalues: v6 (ref), v8 (ref), v9 (copy), v3 (ref), v5 (ref)
            v6:warning("Error reinviting parent channel participants to squad: {}", if v10.StatusCode then v10.StatusCode else -1);
            v8(v9, {
                hideCancelButton = true, 
                promptType = v3.Error
            });
            return v5.reject(v10);
        end);
    end;
end;