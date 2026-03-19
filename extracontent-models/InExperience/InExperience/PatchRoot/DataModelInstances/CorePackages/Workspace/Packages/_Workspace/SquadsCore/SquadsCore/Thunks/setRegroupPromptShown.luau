local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local v1 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v2 = require(l_script_FirstAncestor_0.RoduxSquads);
local v3 = require(l_script_FirstAncestor_0.Logger);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
return function(v6) --[[ Line: 10 ]]
    -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (copy), v1 (copy), v2 (copy), v3 (copy)
    return function(v7) --[[ Line: 11 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v1 (ref), v6 (copy), v2 (ref), v3 (ref)
        if not l_FFlagEnableSquadRegroupExperimentation_0 then
            return;
        else
            v7:dispatch(v1.SetRegroupPromptShown.API({
                groupUpId = v6
            })):andThen(function(v8) --[[ Line: 18 ]]
                -- upvalues: v7 (copy), v2 (ref)
                if v8.success then
                    v7:dispatch(v2.Actions.SelfPermissionUpdated({
                        canSeeRegroupPromptToast = false
                    }));
                end;
            end):catch(function(v9) --[[ Line: 25 ]]
                -- upvalues: v3 (ref)
                v3:error("Error occured with NetworkingSquads.SetRegroupPromptShown: {}", (tostring(v9)));
            end);
            return;
        end;
    end;
end;