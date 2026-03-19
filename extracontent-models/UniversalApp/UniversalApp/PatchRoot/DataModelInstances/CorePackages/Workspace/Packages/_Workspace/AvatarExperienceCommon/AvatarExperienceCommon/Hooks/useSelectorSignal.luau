local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local function v6(v4, v5) --[[ Line: 16 ]]
    return v4 == v5;
end;
return function(v7, v8) --[[ Line: 20 ]] --[[ Name: useSelectorSignal ]]
    -- upvalues: l_useStore_0 (copy), v1 (copy), v2 (copy), v6 (copy)
    local v9 = l_useStore_0();
    local v10 = v9:getState();
    local v11, v12 = v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v2 (ref), v10 (copy)
        return v2.createSignal(v10);
    end, {});
    v1.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v9 (copy), v12 (copy)
        local v13 = v9:getState();
        v12(v13);
        local v14 = v9.changed:connect(v12);
        return function() --[[ Line: 32 ]]
            -- upvalues: v14 (copy)
            v14:disconnect();
        end;
    end, {
        v9
    });
    return v1.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v2 (ref), v7 (copy), v11 (copy), v8 (copy), v6 (ref)
        return v2.createComputed(function(v15) --[[ Line: 38 ]]
            -- upvalues: v7 (ref), v11 (ref)
            return v7(v11(v15));
        end, v8 or v6);
    end, {
        v11, 
        v7, 
        v8
    });
end;