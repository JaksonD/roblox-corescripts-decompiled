local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local v1 = require(l_script_FirstAncestor_0.useNavigateToSeeAll);
local v2 = require(l_script_FirstAncestor_0.useNavigateToSortLinkWebView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagLuaAppHeaderButtonText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHeaderButtonText;
return function(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 15 ]] --[[ Name: useGameSortHeaderButtonParams ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy)
    local v18 = v1(v9, v10, v11, v12, v13, v14);
    local v19 = v4.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v18 (copy), v8 (copy)
        v18();
        v8();
    end, {
        v18, 
        v8
    });
    local v20 = v2();
    local v22 = v4.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy), v10 (copy), v15 (copy), v20 (copy), v14 (copy)
        local v21 = nil;
        if v9 then
            v21 = if v10 then v9.topicId else v9.gameSetTypeId;
        end;
        if v15 then
            v20(v15, v14, v9 and v9.displayName or "", v21);
        end;
    end, {
        v20, 
        v15, 
        v14, 
        v9, 
        v10
    });
    local v23 = if v15 then v22 else v19;
    local v24 = l_useLocalization_0({
        learnMore = "Feature.GameDetails.Label.LearnMore"
    });
    return v23, if l_FFlagLuaAppHeaderButtonText_0 and v17 then v17 else if v15 then v24.learnMore else nil, (v4.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v9 (copy), v16 (copy), v10 (copy), v20 (copy), v14 (copy), v23 (copy)
        if v9 and v16 then
            local v25 = if v10 then v9.topicId else v9.gameSetTypeId;
            v20(v16, v14, v9 and v9.displayName or "", v25);
            return;
        else
            v23();
            return;
        end;
    end, {
        v20, 
        v16, 
        v14, 
        v9, 
        v10, 
        v23
    }));
end;