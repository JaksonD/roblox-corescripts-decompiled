local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Players_0 = game:GetService("Players");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_game_EngineFeature_0 = game:GetEngineFeature("UseTeleportedPlacesBackHistory2");
local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.Signals);
local v8 = require(script.Parent.Flags);
local l_FFlagUseLocalTraversalHistory_0 = v8.FFlagUseLocalTraversalHistory;
local l_FFlagUseTeleportTraversalHistory_0 = v8.FFlagUseTeleportTraversalHistory;
local l_FFlagUseHistoryItemsWaitForGameLoad_0 = v8.FFlagUseHistoryItemsWaitForGameLoad;
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: l_FFlagUseHistoryItemsWaitForGameLoad_0 (copy), v7 (copy), v12 (copy), l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    local v14 = {
        _connections = {}, 
        _historyKey = "", 
        _history = {}
    };
    if l_FFlagUseHistoryItemsWaitForGameLoad_0 then
        local v15, v16 = v7.createSignal({});
        v14._historySignal = v15;
        v14._setHistorySignal = v16;
    end;
    if v13 == nil or v13 == "" then
        return (setmetatable(v14, v12));
    else
        local function v19() --[[ Line: 65 ]] --[[ Name: initLocalHistory ]]
            -- upvalues: v14 (copy), v13 (copy), l_MemStorageService_0 (ref), l_HttpService_0 (ref), l_FFlagUseHistoryItemsWaitForGameLoad_0 (ref)
            v14._historyKey = "TraversalHistory" .. v13;
            local l_l_MemStorageService_0_Item_0 = l_MemStorageService_0:GetItem(v14._historyKey);
            if l_l_MemStorageService_0_Item_0 and l_l_MemStorageService_0_Item_0 ~= "" then
                local v18 = l_HttpService_0:JSONDecode(l_l_MemStorageService_0_Item_0);
                if typeof(v18) == "table" then
                    v14._history = v18;
                end;
            end;
            table.insert(v14._history, 1, {
                universeId = tostring(game.GameId), 
                placeId = tostring(game.PlaceId)
            });
            l_MemStorageService_0:SetItem(v14._historyKey, l_HttpService_0:JSONEncode(v14._history));
            if l_FFlagUseHistoryItemsWaitForGameLoad_0 then
                v14._setHistorySignal(v14._history);
            end;
        end;
        table.insert(v14._connections, game.Loaded:Connect(function() --[[ Line: 88 ]]
            -- upvalues: v19 (copy)
            v19();
        end));
        return (setmetatable(v14, v12));
    end;
end;
v12.addHistoryEntry = function(v20, v21) --[[ Line: 96 ]] --[[ Name: addHistoryEntry ]]
    -- upvalues: l_FFlagUseHistoryItemsWaitForGameLoad_0 (copy)
    table.insert(v20._history, 1, v21);
    if l_FFlagUseHistoryItemsWaitForGameLoad_0 then
        v20._setHistorySignal(v20._history);
    end;
end;
v12.addHistoryEntries = function(v22, v23) --[[ Line: 103 ]] --[[ Name: addHistoryEntries ]]
    -- upvalues: v6 (copy), l_FFlagUseHistoryItemsWaitForGameLoad_0 (copy)
    v22._history = v6.List.join(v23, v22._history);
    if l_FFlagUseHistoryItemsWaitForGameLoad_0 then
        v22._setHistorySignal(v22._history);
    end;
end;
local function _(v24, v25) --[[ Line: 111 ]] --[[ Name: getNMostRecent ]]
    if v25 == nil then
        return v24;
    else
        local v26 = {};
        for v27 = 1, v25 do
            table.insert(v26, v24[v27]);
        end;
        return v26;
    end;
end;
v12.getHistory = function(v29, v30) --[[ Line: 122 ]] --[[ Name: getHistory ]]
    local l__history_0 = v29._history;
    if v30 == nil then
        return l__history_0;
    else
        local v32 = {};
        for v33 = 1, v30 do
            table.insert(v32, l__history_0[v33]);
        end;
        return v32;
    end;
end;
if l_FFlagUseHistoryItemsWaitForGameLoad_0 then
    v12.getUniverseHistorySignal = function(v34, v35) --[[ Line: 127 ]] --[[ Name: getUniverseHistorySignal ]]
        -- upvalues: v7 (copy)
        return v7.createComputed(function(v36) --[[ Line: 128 ]]
            -- upvalues: v34 (copy), v35 (copy)
            local v37 = v34._historySignal(v36);
            local l_v35_0 = v35;
            local v39;
            if l_v35_0 == nil then
                v39 = v37;
            else
                local v40 = {};
                for v41 = 1, l_v35_0 do
                    table.insert(v40, v37[v41]);
                end;
                v39 = v40;
            end;
            l_v35_0 = {};
            for _, v43 in v39 do
                table.insert(l_v35_0, v43.universeId);
            end;
            return l_v35_0;
        end);
    end;
end;
v12.getUniverseHistory = function(v44, v45) --[[ Line: 140 ]] --[[ Name: getUniverseHistory ]]
    -- upvalues: l_FFlagUseTeleportTraversalHistory_0 (copy), l_game_EngineFeature_0 (copy), l_TeleportService_0 (copy), v6 (copy)
    local v46 = {};
    if l_FFlagUseTeleportTraversalHistory_0 and l_game_EngineFeature_0 then
        local v47 = l_TeleportService_0:TeleportedUniversesBackHistory();
        local v48 = v6.List.map(v47, tostring);
        if v45 == nil then
            return v48;
        else
            local v49 = {};
            for v50 = 1, v45 do
                table.insert(v49, v48[v50]);
            end;
            return v49;
        end;
    else
        local l__history_1 = v44._history;
        local v52;
        if v45 == nil then
            v52 = l__history_1;
        else
            local v53 = {};
            for v54 = 1, v45 do
                table.insert(v53, l__history_1[v54]);
            end;
            v52 = v53;
        end;
        for _, v56 in v52 do
            table.insert(v46, v56.universeId);
        end;
        return v46;
    end;
end;
v12.writeHistory = function(v57) --[[ Line: 156 ]] --[[ Name: writeHistory ]]
    -- upvalues: l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    l_MemStorageService_0:SetItem(v57._historyKey, l_HttpService_0:JSONEncode(v57._history));
end;
v12.disconnect = function(v58) --[[ Line: 160 ]] --[[ Name: disconnect ]]
    for _, v60 in v58._connections do
        v60:Disconnect();
    end;
    v58._connections = {};
end;
local function _() --[[ Line: 167 ]] --[[ Name: getDefaultId ]]
    -- upvalues: l_Players_0 (copy)
    local v61 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
    if v61 == nil or v61 <= 0 then
        return "Local";
    else
        return (tostring(v61));
    end;
end;
if l_FFlagUseLocalTraversalHistory_0 or l_FFlagUseTeleportTraversalHistory_0 then
    local l_new_0 = v12.new;
    local v64 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
    v12.default = l_new_0((not (v64 ~= nil) or v64 <= 0) and "Local" or tostring(v64));
    return v12;
else
    v12.default = v12.new("");
    return v12;
end;