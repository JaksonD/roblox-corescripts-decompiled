local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Models.GameModel);
local v5 = {};
return function(v6) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    local l_networkingGames_0 = v6.networkingGames;
    return v2.createReducer(v5, {
        [l_networkingGames_0.GetExperiencesDetails.Succeeded.name] = function(v8, v9) --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v4 (ref)
            return v3.reduce(v9.responseBody.data, function(v10, v11) --[[ Line: 18 ]]
                -- upvalues: v3 (ref), v4 (ref)
                local v12 = tostring(v11.id);
                return v3.join(v10, {
                    [v12] = v4.format(v11)
                });
            end, v8);
        end
    });
end;