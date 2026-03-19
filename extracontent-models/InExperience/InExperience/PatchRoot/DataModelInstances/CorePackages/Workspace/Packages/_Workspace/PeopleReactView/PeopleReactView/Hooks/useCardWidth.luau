local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
return function() --[[ Line: 8 ]] --[[ Name: useCardWidth ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.useBinding(0);
    return v4, (v2.useCallback(function(v6, v7, v8) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v5 (copy)
        local v9 = math.clamp(math.floor(v7 / v6), v3.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, v3.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS);
        local v10 = math.ceil(v8 * (v9 - 1) / v9);
        local v11 = math.floor(v7 / v9) - v10;
        v5(v11);
    end, {}));
end;