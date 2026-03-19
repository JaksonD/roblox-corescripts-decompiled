local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v3 = {};
local v4 = 0;
local l_StringValue_0 = Instance.new("StringValue");
l_StringValue_0.Name = "LeaderstatsOrder";
l_StringValue_0.Parent = l_RobloxReplicatedStorage_0;
updateStats = function() --[[ Line: 20 ]] --[[ Name: updateStats ]]
    -- upvalues: l_StringValue_0 (copy), l_HttpService_0 (copy), v3 (copy)
    l_StringValue_0.Value = l_HttpService_0:JSONEncode(v3);
end;
updateStats();
local function _(v6) --[[ Line: 26 ]] --[[ Name: addLeaderstat ]]
    -- upvalues: v3 (copy), v4 (ref)
    if v3[v6] then
        return;
    else
        v3[v6] = v4;
        v4 = v4 + 1;
        updateStats();
        return;
    end;
end;
local function v9(v8) --[[ Line: 35 ]] --[[ Name: isValidStat ]]
    return v8:IsA("StringValue") or v8:IsA("IntValue") or v8:IsA("BoolValue") or v8:IsA("NumberValue") or v8:IsA("DoubleConstrainedValue") or v8:IsA("IntConstrainedValue");
end;
local function _(v10) --[[ Line: 44 ]] --[[ Name: isValidContainer ]]
    return v10:IsA("ValueBase") or v10:IsA("Folder") or v10:IsA("Configuration") or v10:IsA("Model");
end;
local v12 = {};
local function _(v13, v14) --[[ Line: 62 ]] --[[ Name: getLeaderstatConnections ]]
    -- upvalues: v12 (copy)
    if not v12[v13] then
        return nil;
    else
        return v12[v13].leaderstats[v14];
    end;
end;
local function v23(v16, v17, v18) --[[ Line: 70 ]] --[[ Name: leaderstatChildAdded ]]
    -- upvalues: v9 (copy), v12 (copy), v3 (copy), v4 (ref)
    if not v9(v18) then
        return;
    else
        local v19 = if not v12[v16] then nil else v12[v16].leaderstats[v17];
        if not v19 then
            return;
        else
            assert(v19 ~= nil);
            local v21 = v18:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 80 ]]
                -- upvalues: v18 (copy), v3 (ref), v4 (ref)
                local l_Name_0 = v18.Name;
                if v3[l_Name_0] then
                    return;
                else
                    v3[l_Name_0] = v4;
                    v4 = v4 + 1;
                    updateStats();
                    return;
                end;
            end);
            v19.leaderStatNameChanged[v18] = v21;
            local l_Name_1 = v18.Name;
            if v3[l_Name_1] then
                return;
            else
                v3[l_Name_1] = v4;
                v4 = v4 + 1;
                updateStats();
                return;
            end;
        end;
    end;
end;
local function _(v24, v25, v26) --[[ Line: 87 ]] --[[ Name: leaderstatChildRemoved ]]
    -- upvalues: v12 (copy)
    local v27 = if not v12[v24] then nil else v12[v24].leaderstats[v25];
    if not v27 then
        return;
    else
        assert(v27 ~= nil);
        if not v27.leaderStatNameChanged[v26] then
            return;
        else
            v27.leaderStatNameChanged[v26]:Disconnect();
            v27.leaderStatNameChanged[v26] = nil;
            return;
        end;
    end;
end;
local function v40(v29, v30) --[[ Line: 102 ]] --[[ Name: leaderstatsAdded ]]
    -- upvalues: v12 (copy), v23 (copy)
    if not v12[v29] then
        return;
    else
        local v32 = v30.ChildAdded:Connect(function(v31) --[[ Line: 107 ]]
            -- upvalues: v23 (ref), v29 (copy), v30 (copy)
            v23(v29, v30, v31);
        end);
        local v37 = v30.ChildRemoved:Connect(function(v33) --[[ Line: 110 ]]
            -- upvalues: v29 (copy), v30 (copy), v12 (ref)
            local l_v29_0 = v29;
            local l_v30_0 = v30;
            local v36 = if not v12[l_v29_0] then nil else v12[l_v29_0].leaderstats[l_v30_0];
            if not v36 then
                return;
            else
                assert(v36 ~= nil);
                if not v36.leaderStatNameChanged[v33] then
                    return;
                else
                    v36.leaderStatNameChanged[v33]:Disconnect();
                    v36.leaderStatNameChanged[v33] = nil;
                    return;
                end;
            end;
        end);
        v12[v29].leaderstats[v30] = {
            childAdded = v32, 
            childRemoved = v37, 
            leaderStatNameChanged = {}
        };
        for _, v39 in v30:GetChildren() do
            v23(v29, v30, v39);
        end;
        return;
    end;
end;
local _ = function(v41) --[[ Line: 125 ]] --[[ Name: disconnectTableOfConnections ]]
    for _, v43 in v41 do
        v43:Disconnect();
    end;
end;
local _ = function(v45, v46) --[[ Line: 131 ]] --[[ Name: leaderstatsRemoved ]]
    -- upvalues: v12 (copy)
    if not v12[v45] then
        return;
    else
        local v47 = v12[v45].leaderstats[v46];
        if not v47 then
            return;
        else
            v47.childAdded:Disconnect();
            v47.childRemoved:Disconnect();
            for _, v49 in v47.leaderStatNameChanged do
                v49:Disconnect();
            end;
            v12[v45].leaderstats[v46] = nil;
            return;
        end;
    end;
end;
local _ = function(v51, v52) --[[ Line: 147 ]] --[[ Name: playerChildNameChanged ]]
    -- upvalues: v40 (copy), v12 (copy)
    if v52.Name == "leaderstats" then
        v40(v51, v52);
        return;
    elseif not v12[v51] then
        return;
    else
        local v53 = v12[v51].leaderstats[v52];
        if not v53 then
            return;
        else
            v53.childAdded:Disconnect();
            v53.childRemoved:Disconnect();
            for _, v55 in v53.leaderStatNameChanged do
                v55:Disconnect();
            end;
            v12[v51].leaderstats[v52] = nil;
            return;
        end;
    end;
end;
local function v68(v57, v58) --[[ Line: 155 ]] --[[ Name: playerChildAdded ]]
    -- upvalues: v12 (copy), v40 (copy)
    if not (v58:IsA("ValueBase") or v58:IsA("Folder") or v58:IsA("Configuration") or v58:IsA("Model")) then
        return;
    elseif not v12[v57] then
        return;
    else
        local v64 = v58:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 163 ]]
            -- upvalues: v57 (copy), v58 (copy), v40 (ref), v12 (ref)
            local l_v57_0 = v57;
            local l_v58_0 = v58;
            if l_v58_0.Name == "leaderstats" then
                v40(l_v57_0, l_v58_0);
                return;
            elseif not v12[l_v57_0] then
                return;
            else
                local v61 = v12[l_v57_0].leaderstats[l_v58_0];
                if not v61 then
                    return;
                else
                    v61.childAdded:Disconnect();
                    v61.childRemoved:Disconnect();
                    for _, v63 in v61.leaderStatNameChanged do
                        v63:Disconnect();
                    end;
                    v12[l_v57_0].leaderstats[l_v58_0] = nil;
                    return;
                end;
            end;
        end);
        v12[v57].namedChanged[v58] = v64;
        if v58.Name == "leaderstats" then
            v40(v57, v58);
            return;
        elseif not v12[v57] then
            return;
        else
            local v65 = v12[v57].leaderstats[v58];
            if not v65 then
                return;
            else
                v65.childAdded:Disconnect();
                v65.childRemoved:Disconnect();
                for _, v67 in v65.leaderStatNameChanged do
                    v67:Disconnect();
                end;
                v12[v57].leaderstats[v58] = nil;
                return;
            end;
        end;
    end;
end;
local _ = function(v69, v70) --[[ Line: 171 ]] --[[ Name: playerChildRemoved ]]
    -- upvalues: v12 (copy)
    if not v12[v69] then
        return;
    else
        if v12[v69].namedChanged[v70] then
            v12[v69].namedChanged[v70]:Disconnect();
            v12[v69].namedChanged[v70] = nil;
        end;
        if v70.Name == "leaderstats" then
            if not v12[v69] then
                return;
            else
                local v71 = v12[v69].leaderstats[v70];
                if not v71 then
                    return;
                else
                    v71.childAdded:Disconnect();
                    v71.childRemoved:Disconnect();
                    for _, v73 in v71.leaderStatNameChanged do
                        v73:Disconnect();
                    end;
                    v12[v69].leaderstats[v70] = nil;
                end;
            end;
        end;
        return;
    end;
end;
local function v85(v75) --[[ Line: 186 ]] --[[ Name: playerAdded ]]
    -- upvalues: v12 (copy), v68 (copy)
    local v81 = v75.ChildRemoved:Connect(function(v76) --[[ Line: 187 ]]
        -- upvalues: v75 (copy), v12 (ref)
        local l_v75_0 = v75;
        if not v12[l_v75_0] then
            return;
        else
            if v12[l_v75_0].namedChanged[v76] then
                v12[l_v75_0].namedChanged[v76]:Disconnect();
                v12[l_v75_0].namedChanged[v76] = nil;
            end;
            if v76.Name == "leaderstats" then
                if not v12[l_v75_0] then
                    return;
                else
                    local v78 = v12[l_v75_0].leaderstats[v76];
                    if not v78 then
                        return;
                    else
                        v78.childAdded:Disconnect();
                        v78.childRemoved:Disconnect();
                        for _, v80 in v78.leaderStatNameChanged do
                            v80:Disconnect();
                        end;
                        v12[l_v75_0].leaderstats[v76] = nil;
                    end;
                end;
            end;
            return;
        end;
    end);
    v12[v75] = {
        childAdded = v75.ChildAdded:Connect(function(v82) --[[ Line: 190 ]]
            -- upvalues: v68 (ref), v75 (copy)
            v68(v75, v82);
        end), 
        childRemoved = v81, 
        namedChanged = {}, 
        leaderstats = {}
    };
    for _, v84 in v75:GetChildren() do
        v68(v75, v84);
    end;
end;
local function v93(v86) --[[ Line: 205 ]] --[[ Name: playerRemoving ]]
    -- upvalues: v12 (copy)
    if not v12[v86] then
        return;
    else
        v12[v86].childAdded:Disconnect();
        v12[v86].childRemoved:Disconnect();
        for _, v88 in v12[v86].namedChanged do
            v88:Disconnect();
        end;
        for _, v90 in v12[v86].leaderstats do
            v90.childAdded:Disconnect();
            v90.childRemoved:Disconnect();
            for _, v92 in v90.leaderStatNameChanged do
                v92:Disconnect();
            end;
        end;
        v12[v86] = nil;
        return;
    end;
end;
l_Players_0.PlayerAdded:Connect(v85);
l_Players_0.PlayerRemoving:Connect(v93);
for _, v95 in l_Players_0:GetPlayers() do
    v85(v95);
end;