local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local v6 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_abbreviateCount_0 = v4.abbreviateCount;
local v9 = require(script.Parent.Parent.config.SocialCountsConfig);
return function(_, v11, v12, v13) --[[ Line: 25 ]] --[[ Name: useSocialCountsData ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v3 (copy), v9 (copy), l_useLocalization_0 (copy), l_abbreviateCount_0 (copy)
    local l_counts_0 = v6(v5.Components.UserProfileHeader).counts;
    local v16 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v9 (ref)
        return v3.Dictionary.map(v9.RowConfig, function(v15) --[[ Line: 34 ]]
            return v15.textKey;
        end);
    end, {});
    local v17 = l_useLocalization_0(v16);
    local v19 = v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v3 (ref), v9 (ref)
        return v3.Dictionary.map(v9.RowConfig, function(v18) --[[ Line: 42 ]]
            return v18.singleTextKey;
        end);
    end, {});
    local v20 = l_useLocalization_0(v19);
    return v2.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: l_counts_0 (copy), v9 (ref), v17 (copy), v20 (copy), v13 (copy), l_abbreviateCount_0 (ref), v12 (copy), v11 (copy)
        local v21 = {};
        for v22, v23 in l_counts_0 do
            local v24 = v9.RowConfig[v22];
            if v24 then
                local v25 = l_counts_0[v24.enabledKey];
                if v25 == nil then
                    v25 = true;
                end;
                local v26 = v17[v22];
                if v23 == 1 and v20[v22] then
                    v26 = v20[v22];
                end;
                local v27 = nil;
                if v24.getLeading and v13 then
                    v27 = v24.getLeading({
                        mutualFriendIds = v13
                    });
                end;
                table.insert(v21, {
                    fieldName = v22, 
                    count = l_abbreviateCount_0(v23), 
                    text = v26, 
                    layoutOrder = v24.layoutOrder, 
                    leading = v27, 
                    isDisabled = v24.getIsDisabled(v12, v11, v25)
                });
            end;
        end;
        table.sort(v21, function(v28, v29) --[[ Line: 89 ]]
            return v28.layoutOrder < v29.layoutOrder;
        end);
        return v21;
    end, {
        l_counts_0, 
        v17, 
        v20, 
        v12, 
        v11, 
        v13
    });
end;