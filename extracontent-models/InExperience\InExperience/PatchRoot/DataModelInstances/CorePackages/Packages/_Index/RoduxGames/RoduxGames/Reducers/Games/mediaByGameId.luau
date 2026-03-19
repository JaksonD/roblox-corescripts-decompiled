local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Models.GameMediaModel);
local v5 = {};
return function(v6) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    local l_networkingGames_0 = v6.networkingGames;
    return v2.createReducer(v5, {
        [l_networkingGames_0.GetExperienceMedia.Succeeded.name] = function(v8, v9) --[[ Line: 16 ]]
            -- upvalues: v3 (ref), v4 (ref)
            local v10 = tostring(v9.ids[1]);
            return v3.join(v8, {
                [v10] = v3.map(v9.responseBody.data, function(v11) --[[ Line: 19 ]]
                    -- upvalues: v4 (ref)
                    return v4.format(v11);
                end)
            });
        end
    });
end;