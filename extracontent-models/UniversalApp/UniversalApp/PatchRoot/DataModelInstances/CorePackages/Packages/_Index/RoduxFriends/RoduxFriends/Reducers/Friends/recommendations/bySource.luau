local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.RecommendationSourceCreated);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v7 = {};
return function(_) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v7 (copy), v5 (copy), v3 (copy)
    return v2.createReducer(v7, {
        [v5.name] = function(v9, v10) --[[ Line: 16 ]]
            -- upvalues: v3 (ref)
            local l_source_0 = v10.payload.source;
            local v12 = v10.payload.recommendationIds or {};
            local v15 = v3.List.reduce(v12, function(v13, v14) --[[ Line: 23 ]]
                v13[tostring(v14)] = true;
                return v13;
            end, {});
            return v3.Dictionary.join(v9, {
                [l_source_0] = v15
            });
        end
    });
end;