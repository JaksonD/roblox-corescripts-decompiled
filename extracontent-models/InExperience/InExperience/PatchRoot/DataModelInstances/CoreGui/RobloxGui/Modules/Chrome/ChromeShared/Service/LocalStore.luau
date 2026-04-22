local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_script_FirstAncestor_0.Unibar.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature("InGameMenuStateStorageKey");
local v6 = nil;
local v7 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = "player_" .. tostring(if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else 0);
local function v10() --[[ Line: 25 ]] --[[ Name: initStore ]]
    -- upvalues: v6 (ref), v9 (copy)
    if v6.LocalPlayer == nil then
        v6.LocalPlayer = {};
    end;
    if v6.LocalPlayer[v9] == nil then
        v6.LocalPlayer[v9] = {};
    end;
    if v6.AnyPlayer == nil then
        v6.AnyPlayer = {};
    end;
end;
local function v12(v11) --[[ Line: 37 ]] --[[ Name: localPlayerSelector ]]
    -- upvalues: v9 (copy)
    if v11 and v11.LocalPlayer and v11.LocalPlayer[v9] then
        return v11.LocalPlayer[v9];
    else
        return v11;
    end;
end;
local function v14(v13) --[[ Line: 44 ]] --[[ Name: anyPlayerSelector ]]
    if v13 and v13.AnyPlayer then
        return v13.AnyPlayer;
    else
        return v13;
    end;
end;
local function v19() --[[ Line: 51 ]] --[[ Name: loadStore ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_AppStorageService_0 (copy), v7 (ref), l_HttpService_0 (copy), v6 (ref), v10 (copy)
    if not l_game_EngineFeature_0 then
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 55 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("InGameMenuState");
        end);
        if l_status_0 then
            v7 = true;
            if #l_result_0 > 0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 61 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 then
                    v6 = l_result_1;
                else
                    v6 = {};
                end;
            else
                v6 = {};
            end;
            v10();
        end;
        return;
    end;
end;
local function v24() --[[ Line: 76 ]] --[[ Name: saveStore ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v7 (ref), l_HttpService_0 (copy), v6 (ref), l_AppStorageService_0 (copy)
    if not l_game_EngineFeature_0 then
        return;
    else
        if v7 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_HttpService_0 (ref), v6 (ref)
                return l_HttpService_0:JSONEncode(v6);
            end);
            if l_status_2 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 85 ]]
                    -- upvalues: l_AppStorageService_0 (ref), l_result_2 (copy)
                    l_AppStorageService_0:SetItem("InGameMenuState", l_result_2);
                    l_AppStorageService_0:Flush();
                end);
                if not l_status_3 then
                    print(l_result_3);
                    error("Failed to write JSON to AppStorageService", 0);
                    return;
                end;
            else
                error("Failed to encode JSON", 0);
            end;
        end;
        return;
    end;
end;
local function v25(v26) --[[ Line: 99 ]] --[[ Name: deepCopy ]]
    -- upvalues: v25 (copy)
    if type(v26) ~= "table" then
        return v26;
    else
        local v27 = {};
        for v28, v29 in pairs(v26) do
            v27[v28] = v25(v29);
        end;
        return v27;
    end;
end;
local function _(v30, v31, v32) --[[ Line: 111 ]] --[[ Name: store ]]
    -- upvalues: v7 (ref), v19 (copy), v6 (ref), v25 (copy), v24 (copy)
    if not v7 then
        v19();
    end;
    if v7 then
        local v33 = v32 and v32(v6) or v6;
        local v34 = v33[v30];
        v33[v30] = v25(v31);
        if v34 ~= v33[v30] then
            v24();
        end;
    end;
end;
local function _(v36, v37) --[[ Line: 125 ]] --[[ Name: load ]]
    -- upvalues: v7 (ref), v19 (copy), v6 (ref), v25 (copy)
    if not v7 then
        v19();
    end;
    if v7 then
        local v38 = v37 and v37(v6) or v6;
        if v38 then
            return (v25(v38[v36]));
        end;
    end;
    return nil;
end;
local function v45(v40) --[[ Line: 138 ]] --[[ Name: getValue ]]
    -- upvalues: v12 (copy), v7 (ref), v19 (copy), v6 (ref), v9 (copy), v25 (copy)
    local v41 = false;
    local l_v12_0 = v12;
    if not v7 then
        v19();
    end;
    if v7 then
        local v43;
        if l_v12_0 then
            local l_v6_0 = v6;
            v43 = if l_v6_0 and l_v6_0.LocalPlayer and l_v6_0.LocalPlayer[v9] then l_v6_0.LocalPlayer[v9] else l_v6_0;
            v41 = v43;
        end;
        if not v41 then
            v43 = v6;
        end;
        v41 = false;
        if v43 then
            return (v25(v43[v40]));
        end;
    end;
    return nil;
end;
local function v53(v46) --[[ Line: 143 ]] --[[ Name: getUniversesExposedTo ]]
    -- upvalues: v12 (copy), v7 (ref), v19 (copy), v6 (ref), v9 (copy), v25 (copy)
    local v47 = false;
    local v48 = false;
    local l_v12_1 = v12;
    if not v7 then
        v19();
    end;
    local v50;
    if v7 then
        local v51;
        if l_v12_1 then
            local l_v6_1 = v6;
            v51 = if l_v6_1 and l_v6_1.LocalPlayer and l_v6_1.LocalPlayer[v9] then l_v6_1.LocalPlayer[v9] else l_v6_1;
            v47 = v51;
        end;
        if not v47 then
            v51 = v6;
        end;
        v47 = false;
        if v51 then
            v50 = v25(v51[v46]);
            v48 = true;
        end;
    end;
    if not v48 then
        v50 = nil;
    end;
    v48 = false;
    if not v50 then
        return {};
    else
        return v50;
    end;
end;
local function v66(v54, v55) --[[ Line: 151 ]] --[[ Name: addUniverseToExposureList ]]
    -- upvalues: v12 (copy), v7 (ref), v19 (copy), v6 (ref), v9 (copy), v25 (copy), v4 (copy), v24 (copy)
    local v56 = false;
    local v57 = false;
    local v58 = false;
    local l_v12_2 = v12;
    if not v7 then
        v19();
    end;
    local v60;
    if v7 then
        local v61;
        if l_v12_2 then
            local l_v6_2 = v6;
            v61 = if l_v6_2 and l_v6_2.LocalPlayer and l_v6_2.LocalPlayer[v9] then l_v6_2.LocalPlayer[v9] else l_v6_2;
            v56 = v61;
        end;
        if not v56 then
            v61 = v6;
        end;
        v56 = false;
        if v61 then
            v60 = v25(v61[v54]);
            v57 = true;
        end;
    end;
    if not v57 then
        v60 = nil;
    end;
    v57 = false;
    local v63 = if not v60 then {} else v60;
    if not table.find(v63, v55) and #v63 < v4.MAX_NUM_UNIVERSES_SHOWN then
        table.insert(v63, v55);
        v60 = v12;
        if not v7 then
            v19();
        end;
        if v7 then
            if v60 then
                local l_v6_3 = v6;
                l_v12_2 = if l_v6_3 and l_v6_3.LocalPlayer and l_v6_3.LocalPlayer[v9] then l_v6_3.LocalPlayer[v9] else l_v6_3;
                v58 = l_v12_2;
            end;
            if not v58 then
                l_v12_2 = v6;
            end;
            v58 = false;
            local v65 = l_v12_2[v54];
            l_v12_2[v54] = v25(v63);
            if v65 ~= l_v12_2[v54] then
                v24();
            end;
        end;
    end;
end;
local function v74(v67) --[[ Line: 160 ]] --[[ Name: getNumUniversesExposedTo ]]
    -- upvalues: v12 (copy), v7 (ref), v19 (copy), v6 (ref), v9 (copy), v25 (copy)
    local v68 = false;
    local v69 = false;
    local l_v12_3 = v12;
    if not v7 then
        v19();
    end;
    local v71;
    if v7 then
        local v72;
        if l_v12_3 then
            local l_v6_4 = v6;
            v72 = if l_v6_4 and l_v6_4.LocalPlayer and l_v6_4.LocalPlayer[v9] then l_v6_4.LocalPlayer[v9] else l_v6_4;
            v68 = v72;
        end;
        if not v68 then
            v72 = v6;
        end;
        v68 = false;
        if v72 then
            v71 = v25(v72[v67]);
            v69 = true;
        end;
    end;
    if not v69 then
        v71 = nil;
    end;
    v69 = false;
    return #if not v71 then {} else v71;
end;
return {
    isEnabled = function() --[[ Line: 166 ]] --[[ Name: isEnabled ]]
        -- upvalues: l_game_EngineFeature_0 (copy)
        return l_game_EngineFeature_0;
    end, 
    storeForLocalPlayer = function(v75, v76) --[[ Line: 169 ]] --[[ Name: storeForLocalPlayer ]]
        -- upvalues: v12 (copy), v7 (ref), v19 (copy), v6 (ref), v9 (copy), v25 (copy), v24 (copy)
        local v77 = false;
        local l_v12_4 = v12;
        if not v7 then
            v19();
        end;
        if v7 then
            local v79;
            if l_v12_4 then
                local l_v6_5 = v6;
                v79 = if l_v6_5 and l_v6_5.LocalPlayer and l_v6_5.LocalPlayer[v9] then l_v6_5.LocalPlayer[v9] else l_v6_5;
                v77 = v79;
            end;
            if not v77 then
                v79 = v6;
            end;
            v77 = false;
            local v81 = v79[v75];
            v79[v75] = v25(v76);
            if v81 ~= v79[v75] then
                v24();
            end;
        end;
    end, 
    loadForLocalPlayer = function(v82) --[[ Line: 172 ]] --[[ Name: loadForLocalPlayer ]]
        -- upvalues: v12 (copy), v7 (ref), v19 (copy), v6 (ref), v9 (copy), v25 (copy)
        local v83 = false;
        local l_v12_5 = v12;
        if not v7 then
            v19();
        end;
        if v7 then
            local v85;
            if l_v12_5 then
                local l_v6_6 = v6;
                v85 = if l_v6_6 and l_v6_6.LocalPlayer and l_v6_6.LocalPlayer[v9] then l_v6_6.LocalPlayer[v9] else l_v6_6;
                v83 = v85;
            end;
            if not v83 then
                v85 = v6;
            end;
            v83 = false;
            if v85 then
                return (v25(v85[v82]));
            end;
        end;
        return nil;
    end, 
    storeForAnyPlayer = function(v87, v88) --[[ Line: 176 ]] --[[ Name: storeForAnyPlayer ]]
        -- upvalues: v14 (copy), v7 (ref), v19 (copy), v6 (ref), v25 (copy), v24 (copy)
        local v89 = false;
        local l_v14_0 = v14;
        if not v7 then
            v19();
        end;
        if v7 then
            local v91;
            if l_v14_0 then
                local l_v6_7 = v6;
                v91 = if l_v6_7 and l_v6_7.AnyPlayer then l_v6_7.AnyPlayer else l_v6_7;
                v89 = v91;
            end;
            if not v89 then
                v91 = v6;
            end;
            v89 = false;
            local v93 = v91[v87];
            v91[v87] = v25(v88);
            if v93 ~= v91[v87] then
                v24();
            end;
        end;
    end, 
    loadForAnyPlayer = function(v94) --[[ Line: 179 ]] --[[ Name: loadForAnyPlayer ]]
        -- upvalues: v14 (copy), v7 (ref), v19 (copy), v6 (ref), v25 (copy)
        local v95 = false;
        local l_v14_1 = v14;
        if not v7 then
            v19();
        end;
        if v7 then
            local v97;
            if l_v14_1 then
                local l_v6_8 = v6;
                v97 = if l_v6_8 and l_v6_8.AnyPlayer then l_v6_8.AnyPlayer else l_v6_8;
                v95 = v97;
            end;
            if not v95 then
                v97 = v6;
            end;
            v95 = false;
            if v97 then
                return (v25(v97[v94]));
            end;
        end;
        return nil;
    end, 
    clearCache = function() --[[ Line: 183 ]] --[[ Name: clearCache ]]
        -- upvalues: v7 (ref), v6 (ref)
        v7 = false;
        v6 = nil;
    end, 
    getValue = v45, 
    getUniversesExposedTo = v53, 
    getNumUniversesExposedTo = v74, 
    addUniverseToExposureList = v66
};