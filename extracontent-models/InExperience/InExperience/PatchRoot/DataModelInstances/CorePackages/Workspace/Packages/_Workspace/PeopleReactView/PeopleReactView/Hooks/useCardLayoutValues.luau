local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_script_FirstAncestor_0.Constants);
return function() --[[ Line: 11 ]] --[[ Name: useCardLayoutValues ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v4 (copy)
    local v5 = l_useTokens_0();
    local v6, v7 = v2.useBinding(0);
    local v8, v9 = v2.useBinding(0);
    local v10, v11 = v2.useBinding(0);
    return v6, v8, v10, (v2.useCallback(function(v12, v13, v14) --[[ Line: 19 ]]
        -- upvalues: v4 (ref), v11 (copy), v7 (copy), v9 (copy), v5 (copy)
        local v15 = math.clamp(math.floor(v13 / v12), v4.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, v4.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS);
        local v16 = math.ceil(v14 * (v15 - 1) / v15);
        local v17 = math.floor(v13 / v15) - v16;
        v11(v15);
        v7(v17);
        v9(v17 + v5.Size.Size_1400);
    end, {
        v5.Size.Size_1400
    }));
end;