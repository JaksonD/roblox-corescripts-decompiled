local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Parent_0.SduiCoreSystem);
local function v15() --[[ Line: 12 ]] --[[ Name: useFriendsInGame ]]
    -- upvalues: l_useSelector_0 (copy), v1 (copy)
    local v6 = l_useSelector_0(function(v5) --[[ Line: 13 ]]
        return v5.LocalUserId;
    end);
    local v8 = l_useSelector_0(function(v7) --[[ Line: 17 ]]
        return v7.InGameUsersByGame;
    end);
    return v1.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v8 (copy), v6 (copy)
        local v9 = {};
        for v10, v11 in v8 do
            local v12 = {};
            for v13, _ in v11 do
                if v13 ~= tostring(v6) then
                    v12[v13] = v13;
                end;
            end;
            if next(v12) then
                v9[tostring(v10)] = v12;
            end;
        end;
        return v9;
    end, {
        v6, 
        v8
    });
end;
return function() --[[ Line: 39 ]] --[[ Name: useSduiSocialData ]]
    -- upvalues: v1 (copy), v2 (copy), v15 (copy)
    local v16, v17 = v1.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v2 (ref)
        return v2.createSignal({});
    end, {});
    v17((v15()));
    return v1.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v16 (copy)
        return {
            getInGameFriendsByGame = v16
        };
    end, {
        v16
    });
end;