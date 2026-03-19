local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignalMap_0 = require(l_Parent_0.CoreScriptsRoactCommon).Utilities.createSignalMap;
local v3 = require(script.Parent.createRBXEventSignal);
local v4 = require(script.Parent.isValidStat);
local v5 = require(script.Parent.getScoreValue);
local _ = require(script.Parent.LeaderboardStoreTypes);
local l_FFlagPlayerListFixLeaderstatsStacking_0 = require(l_Parent_0.SharedFlags).FFlagPlayerListFixLeaderstatsStacking;
local v8 = {
    PlayerChildAdded = "PlayerChildAdded", 
    PlayerChildRemoved = "PlayerChildRemoved", 
    LeaderstatNameChanged = "LeaderstatNameChanged", 
    StatChanged = "StatChanged", 
    StatChildAdded = "StatChildAdded", 
    StatChildRemoved = "StatChildRemoved"
};
return function(v9, v10, v11, v12, v13, v14) --[[ Line: 54 ]] --[[ Name: createPlayerStore ]]
    -- upvalues: v1 (copy), l_createSignalMap_0 (copy), v3 (copy), v5 (copy), v8 (copy), v4 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy)
    local v15 = {};
    local v16 = {};
    local v17, v18 = v1.createSignal(0);
    local v19 = l_createSignalMap_0();
    local v20 = "Neutral";
    local v21 = {
        order = v17, 
        stats = v19
    };
    local function _() --[[ Line: 75 ]] --[[ Name: getPlayerTeam ]]
        -- upvalues: v9 (copy)
        return v9.Team or "Neutral";
    end;
    local function _(v23, v24, v25) --[[ Line: 80 ]] --[[ Name: addStatConnection ]]
        -- upvalues: v16 (ref)
        if v16[v23] == nil then
            v16[v23] = {};
        end;
        v16[v23][v24] = v25;
    end;
    local function _(v27, v28) --[[ Line: 87 ]] --[[ Name: _removeStatConnection ]]
        -- upvalues: v16 (ref)
        local v29 = v16[v27];
        if v29 == nil then
            return;
        else
            local v30 = v29[v28];
            if v30 then
                if v30.Disconnect then
                    v30:Disconnect();
                end;
                v29[v28] = nil;
            end;
            return;
        end;
    end;
    local function v44(v32) --[[ Line: 102 ]] --[[ Name: onStatAdded ]]
        -- upvalues: v3 (ref), v1 (ref), v5 (ref), v10 (copy), v19 (copy), v12 (copy), v20 (ref), v13 (copy), v8 (ref), v16 (ref)
        local l_Value_0 = v32.Value;
        local v34, v35 = v3(v32.Changed, l_Value_0);
        local v37 = v1.createComputed(function(v36) --[[ Line: 105 ]]
            -- upvalues: v5 (ref), v34 (copy)
            return v5(v34(v36));
        end);
        v10(v32);
        v19.setData(v32.Name, v37, false);
        local v39 = v1.createEffect(function(v38) --[[ Line: 114 ]]
            -- upvalues: v37 (copy), v12 (ref), v20 (ref), v32 (copy), v13 (ref)
            v37(v38);
            v12(v20, v32.Name);
            v13(v20, v32.Name);
        end);
        local l_Name_0 = v32.Name;
        local l_StatChanged_0 = v8.StatChanged;
        local v42 = {
            Disconnect = function() --[[ Line: 121 ]] --[[ Name: Disconnect ]]
                -- upvalues: v39 (copy), v35 (copy)
                v39();
                v35:Disconnect();
            end
        };
        if v16[l_Name_0] == nil then
            v16[l_Name_0] = {};
        end;
        v16[l_Name_0][l_StatChanged_0] = v42;
        l_Name_0 = v32.ChildAdded:Connect(function() --[[ Line: 128 ]]
            -- upvalues: v10 (ref), v32 (copy)
            v10(v32);
        end);
        l_StatChanged_0 = v32.Name;
        v42 = v8.StatChildAdded;
        if v16[l_StatChanged_0] == nil then
            v16[l_StatChanged_0] = {};
        end;
        v16[l_StatChanged_0][v42] = l_Name_0;
        l_StatChanged_0 = v32.ChildRemoved:Connect(function() --[[ Line: 133 ]]
            -- upvalues: v10 (ref), v32 (copy)
            v10(v32);
        end);
        v42 = v32.Name;
        local l_StatChildRemoved_0 = v8.StatChildRemoved;
        if v16[v42] == nil then
            v16[v42] = {};
        end;
        v16[v42][l_StatChildRemoved_0] = l_StatChanged_0;
    end;
    local function v49(v45) --[[ Line: 139 ]] --[[ Name: onStatRemoved ]]
        -- upvalues: v16 (ref), v19 (copy), v11 (copy)
        local v46 = v16[v45.Name];
        if v46 == nil then
            return;
        else
            for _, v48 in pairs(v46) do
                if v48.Disconnect then
                    v48:Disconnect();
                end;
            end;
            v16[v45.Name] = nil;
            v19.removeData(v45.Name, false);
            v11(v45);
            return;
        end;
    end;
    local function v56(v50) --[[ Line: 155 ]] --[[ Name: leaderstatsAdded ]]
        -- upvalues: v4 (ref), v44 (copy), v15 (ref), v49 (copy)
        v15.leaderstatsChildAdded = v50.ChildAdded:Connect(function(v51) --[[ Line: 156 ]]
            -- upvalues: v4 (ref), v44 (ref)
            if v4(v51) then
                v44(v51);
            end;
        end);
        v15.leaderstatsChildRemoved = v50.ChildRemoved:Connect(function(v52) --[[ Line: 163 ]]
            -- upvalues: v4 (ref), v49 (ref)
            if v4(v52) then
                v49(v52);
            end;
        end);
        local l_v50_Children_0 = v50:GetChildren();
        for _, v55 in ipairs(l_v50_Children_0) do
            if v4(v55) then
                v44(v55);
            end;
        end;
    end;
    local function v62(v57) --[[ Line: 179 ]] --[[ Name: onPlayerChildAdded ]]
        -- upvalues: v56 (copy), v15 (ref), v8 (ref)
        local v58 = v57.Name == "leaderstats";
        local v59 = v57:IsA("ValueBase") or v57:IsA("Folder") or v57:IsA("Model");
        if not v58 and not v59 then
            return;
        else
            local v61 = v57.Changed:Connect(function(v60) --[[ Line: 186 ]]
                -- upvalues: v57 (copy), v56 (ref)
                if v60 == "Name" and v57.Name == "leaderstats" then
                    v56(v57);
                end;
            end);
            v15[v8.LeaderstatNameChanged] = v61;
            if v57.Name == "leaderstats" then
                v56(v57);
            end;
            return;
        end;
    end;
    local function v67(v63) --[[ Line: 200 ]] --[[ Name: onPlayerChildRemoved ]]
        -- upvalues: v4 (ref), v49 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (ref), v14 (copy), v13 (copy), v20 (ref)
        if v63.Name == "leaderstats" then
            local l_v63_Children_0 = v63:GetChildren();
            for _, v66 in ipairs(l_v63_Children_0) do
                if v4(v66) then
                    v49(v66);
                end;
            end;
            if l_FFlagPlayerListFixLeaderstatsStacking_0 then
                v14();
            end;
        end;
        v13(v20);
    end;
    local function v75() --[[ Line: 217 ]] --[[ Name: connectPlayerEvents ]]
        -- upvalues: v9 (copy), v62 (copy), v15 (ref), v8 (ref), v67 (copy), v56 (copy)
        local v69 = v9.ChildAdded:Connect(function(v68) --[[ Line: 218 ]]
            -- upvalues: v62 (ref)
            v62(v68);
        end);
        v15[v8.PlayerChildAdded] = v69;
        local v71 = v9.ChildRemoved:Connect(function(v70) --[[ Line: 223 ]]
            -- upvalues: v67 (ref)
            v67(v70);
        end);
        v15[v8.PlayerChildRemoved] = v71;
        local l_leaderstats_0 = v9:FindFirstChild("leaderstats");
        if l_leaderstats_0 then
            v56(l_leaderstats_0);
            return;
        else
            for _, v74 in ipairs(v9:GetChildren()) do
                v62(v74);
            end;
            return;
        end;
    end;
    v20 = v9.Team or "Neutral";
    v75();
    local function v79(v76, v77) --[[ Line: 243 ]] --[[ Name: getStatValue ]]
        -- upvalues: v19 (copy)
        local v78 = v19.getData(v76, false);
        if v78 then
            return v78(v77);
        else
            return nil;
        end;
    end;
    local function v81(v80) --[[ Line: 251 ]] --[[ Name: setOrder ]]
        -- upvalues: v18 (copy)
        v18(v80);
    end;
    local function v83(v82) --[[ Line: 255 ]] --[[ Name: setTeam ]]
        -- upvalues: v20 (ref)
        v20 = v82;
    end;
    local function v90() --[[ Line: 259 ]] --[[ Name: destroy ]]
        -- upvalues: v16 (ref), v15 (ref)
        for _, v85 in pairs(v16) do
            for _, v87 in pairs(v85) do
                if v87.Disconnect then
                    v87:Disconnect();
                end;
            end;
        end;
        v16 = {};
        for _, v89 in pairs(v15) do
            if v89.Disconnect then
                v89:Disconnect();
            end;
        end;
        v15 = {};
    end;
    return {
        getPlayer = function() --[[ Line: 281 ]] --[[ Name: getPlayer ]]
            -- upvalues: v9 (copy)
            return v9;
        end, 
        getPlayerEntry = function() --[[ Line: 284 ]] --[[ Name: getPlayerEntry ]]
            -- upvalues: v21 (copy)
            return v21;
        end, 
        getStatValue = v79, 
        getTeam = function() --[[ Line: 288 ]] --[[ Name: getTeam ]]
            -- upvalues: v20 (ref)
            return v20;
        end, 
        setOrder = v81, 
        setTeam = v83, 
        destroy = v90
    };
end;