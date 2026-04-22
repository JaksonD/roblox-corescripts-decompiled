local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 21 ]]
    -- upvalues: l_createSignal_0 (copy)
    local v2, v3 = l_createSignal_0({});
    local v4, v5 = l_createSignal_0({});
    return {
        getMutedGlobalUsernames = v2, 
        getMutedGlobalDisplayNames = v4, 
        muteGlobalUsername = function(v6) --[[ Line: 25 ]] --[[ Name: muteGlobalUsername ]]
            -- upvalues: v2 (copy), v3 (copy)
            local v7 = string.lower(v6);
            local v8 = table.clone(v2(false));
            v8[v7] = true;
            v3(v8);
        end, 
        unmuteGlobalUsername = function(v9) --[[ Line: 32 ]] --[[ Name: unmuteGlobalUsername ]]
            -- upvalues: v2 (copy), v3 (copy)
            local v10 = string.lower(v9);
            local v11 = table.clone(v2(false));
            v11[v10] = nil;
            v3(v11);
        end, 
        muteGlobalDisplayName = function(v12) --[[ Line: 39 ]] --[[ Name: muteGlobalDisplayName ]]
            -- upvalues: v4 (copy), v5 (copy)
            local v13 = string.lower(v12);
            local v14 = table.clone(v4(false));
            v14[v13] = true;
            v5(v14);
        end, 
        unmuteGlobalDisplayName = function(v15) --[[ Line: 46 ]] --[[ Name: unmuteGlobalDisplayName ]]
            -- upvalues: v4 (copy), v5 (copy)
            local v16 = string.lower(v15);
            local v17 = table.clone(v4(false));
            v17[v16] = nil;
            v5(v17);
        end, 
        isUsernameMuted = function(v18) --[[ Line: 53 ]] --[[ Name: isUsernameMuted ]]
            -- upvalues: v2 (copy)
            return v2(false)[string.lower(v18)] == true;
        end, 
        isDisplayNameMuted = function(v19) --[[ Line: 57 ]] --[[ Name: isDisplayNameMuted ]]
            -- upvalues: v4 (copy)
            return v4(false)[string.lower(v19)] == true;
        end
    };
end;