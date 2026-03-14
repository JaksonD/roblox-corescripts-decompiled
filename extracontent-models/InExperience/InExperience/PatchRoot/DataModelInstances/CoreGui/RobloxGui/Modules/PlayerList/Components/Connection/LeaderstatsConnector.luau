local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.FormatStatString);
local v8 = require(l_Parent_0.Actions.AddGameStat);
local v9 = require(l_Parent_0.Actions.RemoveGameStat);
local v10 = require(l_Parent_0.Actions.SetPlayerLeaderstat);
local v11 = require(l_Parent_0.Actions.SetGameStatText);
local v12 = require(l_Parent_0.Actions.SetGameStatAddId);
local v13 = v4.PureComponent:extend("LeaderstatsConnector");
local v14 = require(l_Parent_0.Flags.FFlagLeaderstatsWithASideOfClient);
local function v16(v15) --[[ Line: 44 ]] --[[ Name: isValidStat ]]
    return v15:IsA("StringValue") or v15:IsA("IntValue") or v15:IsA("BoolValue") or v15:IsA("NumberValue") or v15:IsA("DoubleConstrainedValue") or v15:IsA("IntConstrainedValue");
end;
local function _(v17) --[[ Line: 53 ]] --[[ Name: getScoreValue ]]
    if v17:IsA("DoubleConstrainedValue") or v17:IsA("IntConstrainedValue") then
        return v17.ConstrainedValue;
    elseif v17:IsA("BoolValue") then
        if v17.Value then
            return 1;
        else
            return 0;
        end;
    else
        return v17.Value;
    end;
end;
local v19 = nil;
local v20 = nil;
if v14 then
    v20 = Instance.new("BindableEvent");
    v19 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
    l_RobloxReplicatedStorage_0:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function() --[[ Line: 75 ]]
        -- upvalues: v19 (ref), l_RobloxReplicatedStorage_0 (copy), v20 (ref)
        v19 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
        v20:Fire(v19);
    end);
    local l_HttpService_0 = game:GetService("HttpService");
    local function v23(v22) --[[ Line: 84 ]] --[[ Name: decodeJSON ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:JSONDecode(v22);
    end;
    local function _(v24) --[[ Line: 88 ]] --[[ Name: decodeAddOrder ]]
        -- upvalues: v23 (copy)
        local l_status_0, l_result_0 = pcall(v23, v24);
        return l_status_0 and l_result_0 or {};
    end;
    local v28 = nil;
    do
        local l_v28_0 = v28;
        local function v37(v30) --[[ Line: 95 ]] --[[ Name: childAdded ]]
            -- upvalues: l_v28_0 (ref), v19 (ref), v23 (copy), v20 (ref)
            if v30.Name ~= "LeaderstatsOrder" then
                return;
            else
                l_v28_0:Disconnect();
                local l_Value_0 = v30.Value;
                local l_status_1, l_result_1 = pcall(v23, l_Value_0);
                v19 = l_status_1 and l_result_1 or {};
                v30.Changed:Connect(function(v34) --[[ Line: 101 ]]
                    -- upvalues: v19 (ref), v23 (ref), v20 (ref)
                    local l_status_2, l_result_2 = pcall(v23, v34);
                    v19 = l_status_2 and l_result_2 or {};
                    v20:Fire(v19);
                end);
                return;
            end;
        end;
        l_v28_0 = l_RobloxReplicatedStorage_0.ChildAdded:Connect(v37);
        for _, v39 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
            if v39.Name == "LeaderstatsOrder" then
                l_v28_0:Disconnect();
                local l_Value_1 = v39.Value;
                local l_status_3, l_result_3 = pcall(v23, l_Value_1);
                v19 = l_status_3 and l_result_3 or {};
                v39.Changed:Connect(function(v43) --[[ Line: 101 ]]
                    -- upvalues: v19 (ref), v23 (copy), v20 (ref)
                    local l_status_4, l_result_4 = pcall(v23, v43);
                    v19 = l_status_4 and l_result_4 or {};
                    v20:Fire(v19);
                end);
            end;
        end;
    end;
end;
v13.init = function(v46) --[[ Line: 115 ]] --[[ Name: init ]]
    v46.playerConnections = {};
end;
v13.checkGameStatsExist = function(v47, v48) --[[ Line: 119 ]] --[[ Name: checkGameStatsExist ]]
    local v49 = {};
    for _, v51 in ipairs(v47.props.gameStats) do
        v49[v51.name] = false;
    end;
    local l_players_0 = v47.props.players;
    for _, v54 in ipairs(l_players_0) do
        if v54 ~= v48 then
            local l_leaderstats_0 = v54:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                for v56 in pairs(v49) do
                    if l_leaderstats_0:FindFirstChild(v56) then
                        v49[v56] = true;
                    end;
                end;
            end;
        end;
    end;
    for v57, v58 in pairs(v49) do
        if not v58 then
            v47.props.removeGameStat(v57);
        end;
    end;
end;
v13.addGameStat = function(v59, v60) --[[ Line: 144 ]] --[[ Name: addGameStat ]]
    local v61 = false;
    local v62 = 0;
    local l_IsPrimary_0 = v60:FindFirstChild("IsPrimary");
    if l_IsPrimary_0 then
        v61 = not l_IsPrimary_0:IsA("BoolValue") or l_IsPrimary_0.Value;
    end;
    local l_Priority_0 = v60:FindFirstChild("Priority");
    if l_Priority_0 and (l_Priority_0:IsA("IntValue") or l_Priority_0:IsA("NumberValue")) then
        v62 = l_Priority_0.Value;
    end;
    v59.props.addGameStat(v60.Name, v61, v62);
end;
v13.onStatAdded = function(v65, v66, v67) --[[ Line: 163 ]] --[[ Name: onStatAdded ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v14 (copy), v20 (ref), v19 (ref)
    local v72 = v67.Changed:Connect(function() --[[ Line: 164 ]]
        -- upvalues: v65 (copy), v66 (copy), v67 (copy), l_Players_0 (ref), v7 (ref)
        local l_setPlayerLeaderstat_0 = v65.props.setPlayerLeaderstat;
        local l_v66_0 = v66;
        local l_Name_0 = v67.Name;
        local l_v67_0 = v67;
        l_setPlayerLeaderstat_0(l_v66_0, l_Name_0, if not not l_v67_0:IsA("DoubleConstrainedValue") or l_v67_0:IsA("IntConstrainedValue") then l_v67_0.ConstrainedValue else if l_v67_0:IsA("BoolValue") then l_v67_0.Value and 1 or 0 else l_v67_0.Value);
        if v66 == l_Players_0.LocalPlayer then
            l_setPlayerLeaderstat_0 = v65.props.setGameStatText;
            l_v66_0 = v67.Name;
            l_Name_0 = v7;
            l_v67_0 = v67;
            l_setPlayerLeaderstat_0(l_v66_0, l_Name_0(if not not l_v67_0:IsA("DoubleConstrainedValue") or l_v67_0:IsA("IntConstrainedValue") then l_v67_0.ConstrainedValue else if l_v67_0:IsA("BoolValue") then l_v67_0.Value and 1 or 0 else l_v67_0.Value));
        end;
    end);
    table.insert(v65.playerConnections[v66], v72);
    if v14 and v66 == l_Players_0.LocalPlayer then
        local v77 = v67:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 173 ]]
            -- upvalues: v65 (copy), v67 (copy), v7 (ref)
            local l_setGameStatText_0 = v65.props.setGameStatText;
            local l_Name_1 = v67.Name;
            local l_v7_0 = v7;
            local l_v67_1 = v67;
            l_setGameStatText_0(l_Name_1, l_v7_0(if not not l_v67_1:IsA("DoubleConstrainedValue") or l_v67_1:IsA("IntConstrainedValue") then l_v67_1.ConstrainedValue else if l_v67_1:IsA("BoolValue") then l_v67_1.Value and 1 or 0 else l_v67_1.Value));
        end);
        table.insert(v65.playerConnections[v66], v77);
        local v80 = v20.Event:Connect(function(v78) --[[ Line: 178 ]]
            -- upvalues: v67 (copy), v65 (copy)
            local l_Name_2 = v67.Name;
            v65.props.setGameStatAddId(l_Name_2, v78[l_Name_2]);
        end);
        table.insert(v65.playerConnections[v66], v80);
    end;
    local v81 = v67.ChildAdded:Connect(function() --[[ Line: 185 ]]
        -- upvalues: v65 (copy), v67 (copy)
        v65:addGameStat(v67);
    end);
    table.insert(v65.playerConnections[v66], v81);
    local v82 = v67.ChildRemoved:Connect(function() --[[ Line: 190 ]]
        -- upvalues: v65 (copy), v67 (copy)
        v65:addGameStat(v67);
    end);
    table.insert(v65.playerConnections[v66], v82);
    v65:addGameStat(v67);
    v65.props.setPlayerLeaderstat(v66, v67.Name, if not not v67:IsA("DoubleConstrainedValue") or v67:IsA("IntConstrainedValue") then v67.ConstrainedValue else if v67:IsA("BoolValue") then v67.Value and 1 or 0 else v67.Value);
    if v66 == l_Players_0.LocalPlayer then
        local l_Name_3 = v67.Name;
        if v14 then
            v65.props.setGameStatAddId(l_Name_3, v19[l_Name_3]);
        end;
        v65.props.setGameStatText(l_Name_3, v7(if not not v67:IsA("DoubleConstrainedValue") or v67:IsA("IntConstrainedValue") then v67.ConstrainedValue else if v67:IsA("BoolValue") then v67.Value and 1 or 0 else v67.Value));
    end;
end;
v13.leaderstatsAdded = function(v84, v85, v86) --[[ Line: 206 ]] --[[ Name: leaderstatsAdded ]]
    -- upvalues: v16 (copy), v3 (copy), l_Players_0 (copy), v7 (copy)
    local v88 = v86.ChildAdded:Connect(function(v87) --[[ Line: 207 ]]
        -- upvalues: v16 (ref), v84 (copy), v85 (copy)
        if v16(v87) then
            v84:onStatAdded(v85, v87);
        end;
    end);
    table.insert(v84.playerConnections[v85], v88);
    local v90 = v86.ChildRemoved:Connect(function(v89) --[[ Line: 214 ]]
        -- upvalues: v84 (copy), v85 (copy), v3 (ref), l_Players_0 (ref), v7 (ref)
        v84.props.setPlayerLeaderstat(v85, v89.Name, v3.None);
        if v85 == l_Players_0.LocalPlayer then
            v84.props.setGameStatText(v89.Name, v7(nil));
        end;
        v84:checkGameStatsExist();
    end);
    table.insert(v84.playerConnections[v85], v90);
    local l_v86_Children_0 = v86:GetChildren();
    for _, v93 in ipairs(l_v86_Children_0) do
        if v16(v93) then
            v84:onStatAdded(v85, v93);
        end;
    end;
end;
v13.onPlayerChildAdded = function(v94, v95, v96) --[[ Line: 231 ]] --[[ Name: onPlayerChildAdded ]]
    local v97 = v96.Name == "leaderstats";
    local v98 = v96:IsA("ValueBase") or v96:IsA("Folder") or v96:IsA("Model");
    if not v97 and not v98 then
        return;
    else
        local v100 = v96.Changed:Connect(function(v99) --[[ Line: 238 ]]
            -- upvalues: v96 (copy), v94 (copy), v95 (copy)
            if v99 == "Name" and v96.Name == "leaderstats" then
                v94:leaderstatsAdded(v95, v96);
            end;
        end);
        table.insert(v94.playerConnections[v95], v100);
        if v96.Name == "leaderstats" then
            v94:leaderstatsAdded(v95, v96);
        end;
        return;
    end;
end;
v13.connectLeaderstatsEvents = function(v101, v102) --[[ Line: 251 ]] --[[ Name: connectLeaderstatsEvents ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), v7 (copy)
    v101.playerConnections[v102] = {};
    local v104 = v102.ChildAdded:Connect(function(v103) --[[ Line: 253 ]]
        -- upvalues: v101 (copy), v102 (copy)
        v101:onPlayerChildAdded(v102, v103);
    end);
    table.insert(v101.playerConnections[v102], v104);
    local v109 = v102.ChildRemoved:Connect(function(v105) --[[ Line: 258 ]]
        -- upvalues: v101 (copy), v102 (copy), v3 (ref), l_Players_0 (ref), v7 (ref)
        if v105.Name == "leaderstats" then
            local l_v105_Children_0 = v105:GetChildren();
            for _, v108 in pairs(l_v105_Children_0) do
                v101.props.setPlayerLeaderstat(v102, v108.Name, v3.None);
                if v102 == l_Players_0.LocalPlayer then
                    v101.props.setGameStatText(v108.Name, v7(nil));
                end;
            end;
            v101:checkGameStatsExist();
        end;
    end);
    table.insert(v101.playerConnections[v102], v109);
    local l_leaderstats_1 = v102:FindFirstChild("leaderstats");
    if l_leaderstats_1 then
        v101:leaderstatsAdded(v102, l_leaderstats_1);
        return;
    else
        for _, v112 in ipairs(v102:GetChildren()) do
            v101:onPlayerChildAdded(v102, v112);
        end;
        return;
    end;
end;
v13.didMount = function(v113) --[[ Line: 282 ]] --[[ Name: didMount ]]
    for _, v115 in ipairs(v113.props.players) do
        v113:connectLeaderstatsEvents(v115);
    end;
end;
v13.didUpdate = function(v116) --[[ Line: 288 ]] --[[ Name: didUpdate ]]
    local v117 = {};
    for _, v119 in ipairs(v116.props.players) do
        v117[v119] = true;
        if not v116.playerConnections[v119] then
            v116:connectLeaderstatsEvents(v119);
        end;
    end;
    for v120 in pairs(v116.playerConnections) do
        if not v117[v120] then
            for _, v122 in ipairs(v116.playerConnections[v120]) do
                v122:Disconnect();
            end;
            v116.playerConnections[v120] = nil;
        end;
    end;
end;
v13.render = function(_) --[[ Line: 307 ]] --[[ Name: render ]]
    return nil;
end;
v13.willUnmount = function(v124) --[[ Line: 311 ]] --[[ Name: willUnmount ]]
    for _, v126 in pairs(v124.playerConnections) do
        for _, v128 in ipairs(v126) do
            v128:Disconnect();
        end;
    end;
    v124.playerConnections = {};
end;
return v5.connect(function(v129) --[[ Line: 321 ]] --[[ Name: mapStateToProps ]]
    return {
        players = v129.players, 
        gameStats = v129.gameStats
    };
end, function(v130) --[[ Line: 328 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v9 (copy), v10 (copy), v11 (copy), v14 (copy), v12 (copy)
    return {
        addGameStat = function(v131, v132, v133) --[[ Line: 330 ]] --[[ Name: addGameStat ]]
            -- upvalues: v130 (copy), v8 (ref)
            return v130(v8(v131, v132, v133));
        end, 
        removeGameStat = function(v134) --[[ Line: 334 ]] --[[ Name: removeGameStat ]]
            -- upvalues: v130 (copy), v9 (ref)
            return v130(v9(v134));
        end, 
        setPlayerLeaderstat = function(v135, v136, v137) --[[ Line: 338 ]] --[[ Name: setPlayerLeaderstat ]]
            -- upvalues: v130 (copy), v10 (ref)
            return v130(v10(v135, v136, v137));
        end, 
        setGameStatText = function(v138, v139) --[[ Line: 342 ]] --[[ Name: setGameStatText ]]
            -- upvalues: v130 (copy), v11 (ref)
            return v130(v11(v138, v139));
        end, 
        setGameStatAddId = v14 and function(v140, v141) --[[ Line: 346 ]]
            -- upvalues: v130 (copy), v12 (ref)
            return v130(v12(v140, v141));
        end or nil
    };
end)(v13);