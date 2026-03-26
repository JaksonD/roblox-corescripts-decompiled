local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_script_FirstAncestor_0.Unibar.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature("InGameMenuStateStorageKey");
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local v8 = nil;
local v9 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v11 = "player_" .. tostring(if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else 0);
local function v12() --[[ Line: 27 ]] --[[ Name: initStore ]]
    -- upvalues: v8 (ref), v11 (copy)
    if v8.LocalPlayer == nil then
        v8.LocalPlayer = {};
    end;
    if v8.LocalPlayer[v11] == nil then
        v8.LocalPlayer[v11] = {};
    end;
    if v8.AnyPlayer == nil then
        v8.AnyPlayer = {};
    end;
end;
local function v14(v13) --[[ Line: 39 ]] --[[ Name: localPlayerSelector ]]
    -- upvalues: v11 (copy)
    if v13 and v13.LocalPlayer and v13.LocalPlayer[v11] then
        return v13.LocalPlayer[v11];
    else
        return v13;
    end;
end;
local function v16(v15) --[[ Line: 46 ]] --[[ Name: anyPlayerSelector ]]
    if v15 and v15.AnyPlayer then
        return v15.AnyPlayer;
    else
        return v15;
    end;
end;
local function v21() --[[ Line: 53 ]] --[[ Name: loadStore ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_AppStorageService_0 (copy), v9 (ref), l_HttpService_0 (copy), v8 (ref), v12 (copy)
    if not l_game_EngineFeature_0 then
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 57 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("InGameMenuState");
        end);
        if l_status_0 then
            v9 = true;
            if #l_result_0 > 0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 63 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 then
                    v8 = l_result_1;
                else
                    v8 = {};
                end;
            else
                v8 = {};
            end;
            v12();
        end;
        return;
    end;
end;
local function v26() --[[ Line: 78 ]] --[[ Name: saveStore ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v9 (ref), l_HttpService_0 (copy), v8 (ref), l_AppStorageService_0 (copy)
    if not l_game_EngineFeature_0 then
        return;
    else
        if v9 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 83 ]]
                -- upvalues: l_HttpService_0 (ref), v8 (ref)
                return l_HttpService_0:JSONEncode(v8);
            end);
            if l_status_2 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 87 ]]
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
local function v27(v28) --[[ Line: 101 ]] --[[ Name: deepCopy ]]
    -- upvalues: v27 (copy)
    if type(v28) ~= "table" then
        return v28;
    else
        local v29 = {};
        for v30, v31 in pairs(v28) do
            v29[v30] = v27(v31);
        end;
        return v29;
    end;
end;
local function _(v32, v33, v34) --[[ Line: 113 ]] --[[ Name: store ]]
    -- upvalues: v9 (ref), v21 (copy), v8 (ref), v27 (copy), v26 (copy)
    if not v9 then
        v21();
    end;
    if v9 then
        local v35 = v34 and v34(v8) or v8;
        local v36 = v35[v32];
        v35[v32] = v27(v33);
        if v36 ~= v35[v32] then
            v26();
        end;
    end;
end;
local function _(v38, v39) --[[ Line: 127 ]] --[[ Name: load ]]
    -- upvalues: v9 (ref), v21 (copy), v8 (ref), v27 (copy)
    if not v9 then
        v21();
    end;
    if v9 then
        local v40 = v39 and v39(v8) or v8;
        if v40 then
            return (v27(v40[v38]));
        end;
    end;
    return nil;
end;
local function v47(v42) --[[ Line: 140 ]] --[[ Name: getValue ]]
    -- upvalues: l_FFlagEnableUnibarFtuxTooltips_0 (copy), v14 (copy), v9 (ref), v21 (copy), v8 (ref), v11 (copy), v27 (copy)
    local v43 = false;
    if l_FFlagEnableUnibarFtuxTooltips_0 then
        local l_v14_0 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v45;
            if l_v14_0 then
                local l_v8_0 = v8;
                v45 = if l_v8_0 and l_v8_0.LocalPlayer and l_v8_0.LocalPlayer[v11] then l_v8_0.LocalPlayer[v11] else l_v8_0;
                v43 = v45;
            end;
            if not v43 then
                v45 = v8;
            end;
            v43 = false;
            if v45 then
                return (v27(v45[v42]));
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
local function v55(v48) --[[ Line: 148 ]] --[[ Name: getUniversesExposedTo ]]
    -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v11 (copy), v27 (copy)
    local v49 = false;
    local v50 = false;
    local l_v14_1 = v14;
    if not v9 then
        v21();
    end;
    local v52;
    if v9 then
        local v53;
        if l_v14_1 then
            local l_v8_1 = v8;
            v53 = if l_v8_1 and l_v8_1.LocalPlayer and l_v8_1.LocalPlayer[v11] then l_v8_1.LocalPlayer[v11] else l_v8_1;
            v49 = v53;
        end;
        if not v49 then
            v53 = v8;
        end;
        v49 = false;
        if v53 then
            v52 = v27(v53[v48]);
            v50 = true;
        end;
    end;
    if not v50 then
        v52 = nil;
    end;
    v50 = false;
    if not v52 then
        return {};
    else
        return v52;
    end;
end;
local function v68(v56, v57) --[[ Line: 156 ]] --[[ Name: addUniverseToExposureList ]]
    -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v11 (copy), v27 (copy), v5 (copy), v26 (copy)
    local v58 = false;
    local v59 = false;
    local v60 = false;
    local l_v14_2 = v14;
    if not v9 then
        v21();
    end;
    local v62;
    if v9 then
        local v63;
        if l_v14_2 then
            local l_v8_2 = v8;
            v63 = if l_v8_2 and l_v8_2.LocalPlayer and l_v8_2.LocalPlayer[v11] then l_v8_2.LocalPlayer[v11] else l_v8_2;
            v58 = v63;
        end;
        if not v58 then
            v63 = v8;
        end;
        v58 = false;
        if v63 then
            v62 = v27(v63[v56]);
            v59 = true;
        end;
    end;
    if not v59 then
        v62 = nil;
    end;
    v59 = false;
    local v65 = if not v62 then {} else v62;
    if not table.find(v65, v57) and #v65 < v5.MAX_NUM_UNIVERSES_SHOWN then
        table.insert(v65, v57);
        v62 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            if v62 then
                local l_v8_3 = v8;
                l_v14_2 = if l_v8_3 and l_v8_3.LocalPlayer and l_v8_3.LocalPlayer[v11] then l_v8_3.LocalPlayer[v11] else l_v8_3;
                v60 = l_v14_2;
            end;
            if not v60 then
                l_v14_2 = v8;
            end;
            v60 = false;
            local v67 = l_v14_2[v56];
            l_v14_2[v56] = v27(v65);
            if v67 ~= l_v14_2[v56] then
                v26();
            end;
        end;
    end;
end;
local function v76(v69) --[[ Line: 165 ]] --[[ Name: getNumUniversesExposedTo ]]
    -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v11 (copy), v27 (copy)
    local v70 = false;
    local v71 = false;
    local l_v14_3 = v14;
    if not v9 then
        v21();
    end;
    local v73;
    if v9 then
        local v74;
        if l_v14_3 then
            local l_v8_4 = v8;
            v74 = if l_v8_4 and l_v8_4.LocalPlayer and l_v8_4.LocalPlayer[v11] then l_v8_4.LocalPlayer[v11] else l_v8_4;
            v70 = v74;
        end;
        if not v70 then
            v74 = v8;
        end;
        v70 = false;
        if v74 then
            v73 = v27(v74[v69]);
            v71 = true;
        end;
    end;
    if not v71 then
        v73 = nil;
    end;
    v71 = false;
    return #if not v73 then {} else v73;
end;
return {
    isEnabled = function() --[[ Line: 171 ]] --[[ Name: isEnabled ]]
        -- upvalues: l_game_EngineFeature_0 (copy)
        return l_game_EngineFeature_0;
    end, 
    storeForLocalPlayer = function(v77, v78) --[[ Line: 174 ]] --[[ Name: storeForLocalPlayer ]]
        -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v11 (copy), v27 (copy), v26 (copy)
        local v79 = false;
        local l_v14_4 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v81;
            if l_v14_4 then
                local l_v8_5 = v8;
                v81 = if l_v8_5 and l_v8_5.LocalPlayer and l_v8_5.LocalPlayer[v11] then l_v8_5.LocalPlayer[v11] else l_v8_5;
                v79 = v81;
            end;
            if not v79 then
                v81 = v8;
            end;
            v79 = false;
            local v83 = v81[v77];
            v81[v77] = v27(v78);
            if v83 ~= v81[v77] then
                v26();
            end;
        end;
    end, 
    loadForLocalPlayer = function(v84) --[[ Line: 177 ]] --[[ Name: loadForLocalPlayer ]]
        -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v11 (copy), v27 (copy)
        local v85 = false;
        local l_v14_5 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v87;
            if l_v14_5 then
                local l_v8_6 = v8;
                v87 = if l_v8_6 and l_v8_6.LocalPlayer and l_v8_6.LocalPlayer[v11] then l_v8_6.LocalPlayer[v11] else l_v8_6;
                v85 = v87;
            end;
            if not v85 then
                v87 = v8;
            end;
            v85 = false;
            if v87 then
                return (v27(v87[v84]));
            end;
        end;
        return nil;
    end, 
    storeForAnyPlayer = function(v89, v90) --[[ Line: 181 ]] --[[ Name: storeForAnyPlayer ]]
        -- upvalues: v16 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy), v26 (copy)
        local v91 = false;
        local l_v16_0 = v16;
        if not v9 then
            v21();
        end;
        if v9 then
            local v93;
            if l_v16_0 then
                local l_v8_7 = v8;
                v93 = if l_v8_7 and l_v8_7.AnyPlayer then l_v8_7.AnyPlayer else l_v8_7;
                v91 = v93;
            end;
            if not v91 then
                v93 = v8;
            end;
            v91 = false;
            local v95 = v93[v89];
            v93[v89] = v27(v90);
            if v95 ~= v93[v89] then
                v26();
            end;
        end;
    end, 
    loadForAnyPlayer = function(v96) --[[ Line: 184 ]] --[[ Name: loadForAnyPlayer ]]
        -- upvalues: v16 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy)
        local v97 = false;
        local l_v16_1 = v16;
        if not v9 then
            v21();
        end;
        if v9 then
            local v99;
            if l_v16_1 then
                local l_v8_8 = v8;
                v99 = if l_v8_8 and l_v8_8.AnyPlayer then l_v8_8.AnyPlayer else l_v8_8;
                v97 = v99;
            end;
            if not v97 then
                v99 = v8;
            end;
            v97 = false;
            if v99 then
                return (v27(v99[v96]));
            end;
        end;
        return nil;
    end, 
    clearCache = function() --[[ Line: 188 ]] --[[ Name: clearCache ]]
        -- upvalues: v9 (ref), v8 (ref)
        v9 = false;
        v8 = nil;
    end, 
    getValue = v47, 
    getUniversesExposedTo = v55, 
    getNumUniversesExposedTo = v76, 
    addUniverseToExposureList = v68
};