local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.Models.ExperienceDetailsModel);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return (v2.createReducer({}, {
        [v4.GetExperiencesDetails.Succeeded.name] = function(v5, v6) --[[ Line: 13 ]]
            -- upvalues: v1 (ref)
            local v7 = v6.ids[1];
            local v8 = v6.responseBody.data[1];
            return v1.Dictionary.join(v5, {
                [v7] = v8
            });
        end, 
        [v4.GetExperiencesDetails.Failed.name] = function(v9, _) --[[ Line: 24 ]]
            return v9;
        end
    }));
end;