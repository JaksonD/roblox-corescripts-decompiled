local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.createDataCache);
local v3 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Profile.Requests);
local _ = require(l_script_FirstAncestor_0.Profile.Enums.ProfileCTAEnums);
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1);
local function _() --[[ Line: 36 ]]
    return game:GetFastInt("ProfileCTAStoreProcessDelaySec");
end;
return function() --[[ Line: 40 ]] --[[ Name: createProfileCTAStore ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v9 = v2();
    local v19 = v3({
        cache = v9, 
        queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"), 
        fetchFn = function(v10) --[[ Line: 46 ]] --[[ Name: fetchFn ]]
            -- upvalues: v5 (ref), v6 (ref)
            local v11 = v5.Dictionary.keys(v10);
            return v6.GetUserProfileCTA(v11):andThen(function(v12) --[[ Line: 49 ]]
                -- upvalues: v11 (copy)
                local v13 = {};
                if v12.responseBody and v12.responseBody.profiles then
                    for _, v15 in v11 do
                        local v16 = tostring(v15);
                        local v17 = v12.responseBody.profiles[v16];
                        v13[v16] = v17 and v17.components and v17.components.Actions or {};
                    end;
                end;
                return v13;
            end):catch(function(_) --[[ Line: 63 ]]
                return {};
            end);
        end
    });
    return {
        getCTA = function(v20, v21) --[[ Line: 69 ]] --[[ Name: getCTA ]]
            -- upvalues: v19 (copy)
            local v22 = nil;
            if v21 ~= nil then
                local v23 = v21 == true;
                v22 = function(_) --[[ Line: 73 ]]
                    -- upvalues: v23 (copy)
                    return v23;
                end;
            end;
            return v19.getAndFetchItem(v20, v22);
        end, 
        getBatchCTAs = function(v25, v26) --[[ Line: 80 ]] --[[ Name: getBatchCTAs ]]
            -- upvalues: v19 (copy)
            local v27 = nil;
            if v26 then
                local v28 = 0;
                do
                    local l_v28_0 = v28;
                    v27 = function(_) --[[ Line: 87 ]]
                        -- upvalues: l_v28_0 (ref), v25 (copy), v26 (copy)
                        l_v28_0 = l_v28_0 + 1;
                        local v31 = v25[l_v28_0];
                        if v31 then
                            return v26[v31] == true;
                        else
                            return false;
                        end;
                    end;
                end;
            end;
            return v19.getAndFetchItems(v25, v27);
        end, 
        clear = function() --[[ Line: 99 ]] --[[ Name: clear ]]
            -- upvalues: v9 (copy), v19 (copy)
            v9.clear();
            v19.clear();
        end, 
        dispose = function() --[[ Line: 104 ]] --[[ Name: dispose ]]
            -- upvalues: v19 (copy)
            v19.dispose();
        end
    };
end;