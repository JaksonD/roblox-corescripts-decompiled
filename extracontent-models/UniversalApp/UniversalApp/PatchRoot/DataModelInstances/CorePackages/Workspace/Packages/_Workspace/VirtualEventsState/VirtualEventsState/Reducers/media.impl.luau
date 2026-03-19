local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.Models.ExperienceMediaModel);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return (v2.createReducer({}, {
        [v4.GetExperienceMedia.Succeeded.name] = function(v5, v6) --[[ Line: 13 ]]
            -- upvalues: v1 (ref)
            local v7 = v6.ids[1];
            return v1.Dictionary.join(v5, {
                [v7] = v6.responseBody.data
            });
        end, 
        [v4.GetExperienceMedia.Failed.name] = function(v8, _) --[[ Line: 21 ]]
            return v8;
        end
    }));
end;