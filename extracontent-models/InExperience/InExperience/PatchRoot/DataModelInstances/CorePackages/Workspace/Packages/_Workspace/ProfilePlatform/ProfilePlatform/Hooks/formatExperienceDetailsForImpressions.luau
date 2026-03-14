local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy)
    if not v4 then
        return {};
    else
        return v2.Dictionary.map(v4, function(v5) --[[ Line: 14 ]]
            return {
                id = v5.experienceId, 
                universeId = tonumber(v5.experienceId), 
                placeId = tonumber(v5.rootPlaceId)
            };
        end);
    end;
end;