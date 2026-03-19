local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignalMap_0 = require(l_Parent_0.CoreScriptsRoactCommon).Utilities.createSignalMap;
local _ = require(script.Parent.LeaderboardStoreTypes);
return function(v4, _) --[[ Line: 40 ]] --[[ Name: createTeamStore ]]
    -- upvalues: l_createSignalMap_0 (copy), v1 (copy)
    local v6 = {};
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = l_createSignalMap_0();
    local v14 = l_createSignalMap_0();
    local v15 = {};
    if v4 == "Neutral" then
        local v16, v17 = v1.createSignal("Neutral");
        v7 = v16;
        v8 = v17;
        v16, v17 = v1.createSignal(BrickColor.White().Color);
        v9 = v16;
        v10 = v17;
        v16, v17 = v1.createSignal(1000);
        v11 = v16;
        v12 = v17;
    else
        local v18, v19 = v1.createSignal(v4.Name);
        v7 = v18;
        v8 = v19;
        v18, v19 = v1.createSignal(v4.TeamColor.Color);
        v9 = v18;
        v10 = v19;
        v18, v19 = v1.createSignal(v4.ChildOrder);
        v11 = v18;
        v12 = v19;
        v6.teamPropChanged = v4.Changed:Connect(function(v20) --[[ Line: 72 ]]
            -- upvalues: v8 (ref), v4 (copy), v10 (ref), v12 (ref)
            if v20 == "Name" then
                v8(v4.Name);
                return;
            elseif v20 == "TeamColor" then
                v10(v4.TeamColor.Color);
                return;
            else
                if v20 == "ChildOrder" then
                    v12(v4.ChildOrder);
                end;
                return;
            end;
        end);
    end;
    local function v30(v21, v22) --[[ Line: 84 ]] --[[ Name: updateStat ]]
        -- upvalues: v1 (ref), v14 (copy), v13 (copy), v15 (ref)
        local v29 = v1.createComputed(function(v23) --[[ Line: 85 ]]
            -- upvalues: v14 (ref), v22 (copy), v21 (copy)
            local v24 = nil;
            local v25 = v14.getAllData(v23);
            if typeof(v25) == "table" then
                for v26, _ in pairs(v25) do
                    local v28 = v22(v26, v21, v23);
                    if v28 and type(v28) == "number" then
                        if v24 then
                            v24 = v24 + v28;
                        else
                            v24 = v28;
                        end;
                    end;
                end;
            end;
            return v24;
        end);
        v13.setData(v21, v29, false);
        v15[v21] = v22;
    end;
    local _ = function() --[[ Line: 108 ]] --[[ Name: updateAllStats ]]
        -- upvalues: v15 (ref), v1 (ref), v14 (copy), v13 (copy)
        for v31, v32 in pairs(v15) do
            local v39 = v1.createComputed(function(v33) --[[ Line: 85 ]]
                -- upvalues: v14 (ref), v32 (copy), v31 (copy)
                local v34 = nil;
                local v35 = v14.getAllData(v33);
                if typeof(v35) == "table" then
                    for v36, _ in pairs(v35) do
                        local v38 = v32(v36, v31, v33);
                        if v38 and type(v38) == "number" then
                            if v34 then
                                v34 = v34 + v38;
                            else
                                v34 = v38;
                            end;
                        end;
                    end;
                end;
                return v34;
            end);
            v13.setData(v31, v39, false);
            v15[v31] = v32;
        end;
    end;
    local function v42(v41) --[[ Line: 115 ]] --[[ Name: removeStat ]]
        -- upvalues: v13 (copy), v15 (ref)
        v13.removeData(v41, false);
        v15[v41] = nil;
    end;
    local function v53(v43) --[[ Line: 122 ]] --[[ Name: addPlayer ]]
        -- upvalues: v14 (copy), v15 (ref), v1 (ref), v13 (copy)
        v14.setData(v43, v43.UserId, false);
        for v44, v45 in pairs(v15) do
            local v52 = v1.createComputed(function(v46) --[[ Line: 85 ]]
                -- upvalues: v14 (ref), v45 (copy), v44 (copy)
                local v47 = nil;
                local v48 = v14.getAllData(v46);
                if typeof(v48) == "table" then
                    for v49, _ in pairs(v48) do
                        local v51 = v45(v49, v44, v46);
                        if v51 and type(v51) == "number" then
                            if v47 then
                                v47 = v47 + v51;
                            else
                                v47 = v51;
                            end;
                        end;
                    end;
                end;
                return v47;
            end);
            v13.setData(v44, v52, false);
            v15[v44] = v45;
        end;
    end;
    local function v64(v54) --[[ Line: 128 ]] --[[ Name: removePlayer ]]
        -- upvalues: v14 (copy), v15 (ref), v1 (ref), v13 (copy)
        v14.removeData(v54, false);
        for v55, v56 in pairs(v15) do
            local v63 = v1.createComputed(function(v57) --[[ Line: 85 ]]
                -- upvalues: v14 (ref), v56 (copy), v55 (copy)
                local v58 = nil;
                local v59 = v14.getAllData(v57);
                if typeof(v59) == "table" then
                    for v60, _ in pairs(v59) do
                        local v62 = v56(v60, v55, v57);
                        if v62 and type(v62) == "number" then
                            if v58 then
                                v58 = v58 + v62;
                            else
                                v58 = v62;
                            end;
                        end;
                    end;
                end;
                return v58;
            end);
            v13.setData(v55, v63, false);
            v15[v55] = v56;
        end;
    end;
    local function v67() --[[ Line: 134 ]] --[[ Name: destroy ]]
        -- upvalues: v6 (ref), v15 (ref)
        for _, v66 in pairs(v6) do
            if v66.Disconnect then
                v66:Disconnect();
            end;
        end;
        v6 = {};
        v15 = {};
    end;
    return {
        getName = v7, 
        getColor = v9, 
        getOrder = v11, 
        getStats = v13, 
        getPlayers = v14, 
        updateStat = v30, 
        removeStat = v42, 
        addPlayer = v53, 
        removePlayer = v64, 
        destroy = v67
    };
end;