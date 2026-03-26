local l_Parent_0 = script:FindFirstAncestor("EditProfileBackground").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Players_0 = game:GetService("Players");
local v3 = {};
local v9 = {
    prefetch = function(v4) --[[ Line: 11 ]] --[[ Name: prefetch ]]
        -- upvalues: v3 (copy), v1 (copy), l_Players_0 (copy)
        if v3[v4] then
            return;
        else
            v3[v4] = v1.new(function(v5, v6) --[[ Line: 16 ]]
                -- upvalues: l_Players_0 (ref), v4 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
                    -- upvalues: l_Players_0 (ref), v4 (ref)
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_Players_0:CreateHumanoidModelFromUserIdAsync(v4);
                    else
                        return game.Players:CreateHumanoidModelFromUserId(v4);
                    end;
                end);
                if l_status_0 and l_result_0 then
                    v5(l_result_0);
                    return;
                else
                    v6("CharacterModelCreationFailed");
                    return;
                end;
            end);
            return;
        end;
    end
};
v9.get = function(v10) --[[ Line: 32 ]] --[[ Name: get ]]
    -- upvalues: v3 (copy), v9 (copy)
    if v3[v10] then
        return v3[v10];
    else
        v9.prefetch(v10);
        return v3[v10];
    end;
end;
v9.clear = function(v11) --[[ Line: 41 ]] --[[ Name: clear ]]
    -- upvalues: v3 (copy)
    v3[v11] = nil;
end;
return v9;