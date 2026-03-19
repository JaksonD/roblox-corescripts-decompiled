local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.LeaderboardStore);
local function v11(v3) --[[ Line: 43 ]] --[[ Name: getSortedPlayerInstances ]]
    local v4 = {};
    for _, v6 in v3 do
        for _, v8 in v6.players do
            table.insert(v4, {
                teamId = v6.teamId, 
                teamOrder = v6.order(false), 
                playerOrder = v8.order(false), 
                playerInstance = v8
            });
        end;
    end;
    table.sort(v4, function(v9, v10) --[[ Line: 57 ]]
        if v9.teamOrder == v10.teamOrder then
            return v9.playerOrder < v10.playerOrder;
        else
            return v9.teamOrder < v10.teamOrder;
        end;
    end);
    return v4;
end;
return {
    getNextPlayerInstance = function(v12, v13, v14) --[[ Line: 68 ]] --[[ Name: getNextPlayerInstance ]]
        -- upvalues: v11 (copy)
        local v15 = v11(v12);
        local v16 = nil;
        for v17, v18 in v15 do
            if v18.playerInstance.userId == v13.userId then
                if v18.playerInstance.object == v13.object then
                    local v19 = if v17 - 1 > 0 then v15[v17 - 1] else nil;
                    local v20 = if v17 + 1 <= #v15 then v15[v17 + 1] else nil;
                    if v20 then
                        if v20.teamId == v14 or not v19 or v19.teamId ~= v14 then
                            v16 = v20.playerInstance;
                        else
                            v16 = v19.playerInstance;
                        end;
                    elseif v19 then
                        v16 = v19.playerInstance;
                    end;
                else
                    return v18.playerInstance;
                end;
            end;
        end;
        return v16;
    end, 
    getFirstPlayerInstance = function(v21) --[[ Line: 104 ]] --[[ Name: getFirstPlayerInstance ]]
        local v22 = nil;
        local v23 = 1e999;
        for _, v25 in v21 do
            if next(v25.players) then
                local v26 = v25.order(false);
                if not v22 or v23 >= v26 then
                    for _, v28 in v25.players do
                        if not v22 or v28.order(false) < v22.order(false) then
                            v22 = v28;
                            v23 = v26;
                        end;
                    end;
                end;
            end;
        end;
        return v22;
    end
};