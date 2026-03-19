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
local function v45(v42) --[[ Line: 140 ]] --[[ Name: getValue ]]
    -- upvalues: l_FFlagEnableUnibarFtuxTooltips_0 (copy), v14 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy)
    if l_FFlagEnableUnibarFtuxTooltips_0 then
        local l_v14_0 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v44 = l_v14_0 and l_v14_0(v8) or v8;
            if v44 then
                return (v27(v44[v42]));
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
local function v51(v46) --[[ Line: 148 ]] --[[ Name: getUniversesExposedTo ]]
    -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy)
    local v47 = false;
    local l_v14_1 = v14;
    if not v9 then
        v21();
    end;
    local v49;
    if v9 then
        local v50 = l_v14_1 and l_v14_1(v8) or v8;
        if v50 then
            v49 = v27(v50[v46]);
            v47 = true;
        end;
    end;
    if not v47 then
        v49 = nil;
    end;
    v47 = false;
    if not v49 then
        return {};
    else
        return v49;
    end;
end;
local function v60(v52, v53) --[[ Line: 156 ]] --[[ Name: addUniverseToExposureList ]]
    -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy), v5 (copy), v26 (copy)
    local v54 = false;
    local l_v14_2 = v14;
    if not v9 then
        v21();
    end;
    local v56;
    if v9 then
        local v57 = l_v14_2 and l_v14_2(v8) or v8;
        if v57 then
            v56 = v27(v57[v52]);
            v54 = true;
        end;
    end;
    if not v54 then
        v56 = nil;
    end;
    v54 = false;
    local v58 = if not v56 then {} else v56;
    if not table.find(v58, v53) and #v58 < v5.MAX_NUM_UNIVERSES_SHOWN then
        table.insert(v58, v53);
        v56 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            l_v14_2 = v56 and v56(v8) or v8;
            local v59 = l_v14_2[v52];
            l_v14_2[v52] = v27(v58);
            if v59 ~= l_v14_2[v52] then
                v26();
            end;
        end;
    end;
end;
local function v66(v61) --[[ Line: 165 ]] --[[ Name: getNumUniversesExposedTo ]]
    -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy)
    local v62 = false;
    local l_v14_3 = v14;
    if not v9 then
        v21();
    end;
    local v64;
    if v9 then
        local v65 = l_v14_3 and l_v14_3(v8) or v8;
        if v65 then
            v64 = v27(v65[v61]);
            v62 = true;
        end;
    end;
    if not v62 then
        v64 = nil;
    end;
    v62 = false;
    return #if not v64 then {} else v64;
end;
return {
    isEnabled = function() --[[ Line: 171 ]] --[[ Name: isEnabled ]]
        -- upvalues: l_game_EngineFeature_0 (copy)
        return l_game_EngineFeature_0;
    end, 
    storeForLocalPlayer = function(v67, v68) --[[ Line: 174 ]] --[[ Name: storeForLocalPlayer ]]
        -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy), v26 (copy)
        local l_v14_4 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v70 = l_v14_4 and l_v14_4(v8) or v8;
            local v71 = v70[v67];
            v70[v67] = v27(v68);
            if v71 ~= v70[v67] then
                v26();
            end;
        end;
    end, 
    loadForLocalPlayer = function(v72) --[[ Line: 177 ]] --[[ Name: loadForLocalPlayer ]]
        -- upvalues: v14 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy)
        local l_v14_5 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v74 = l_v14_5 and l_v14_5(v8) or v8;
            if v74 then
                return (v27(v74[v72]));
            end;
        end;
        return nil;
    end, 
    storeForAnyPlayer = function(v75, v76) --[[ Line: 181 ]] --[[ Name: storeForAnyPlayer ]]
        -- upvalues: v16 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy), v26 (copy)
        local l_v16_0 = v16;
        if not v9 then
            v21();
        end;
        if v9 then
            local v78 = l_v16_0 and l_v16_0(v8) or v8;
            local v79 = v78[v75];
            v78[v75] = v27(v76);
            if v79 ~= v78[v75] then
                v26();
            end;
        end;
    end, 
    loadForAnyPlayer = function(v80) --[[ Line: 184 ]] --[[ Name: loadForAnyPlayer ]]
        -- upvalues: v16 (copy), v9 (ref), v21 (copy), v8 (ref), v27 (copy)
        local l_v16_1 = v16;
        if not v9 then
            v21();
        end;
        if v9 then
            local v82 = l_v16_1 and l_v16_1(v8) or v8;
            if v82 then
                return (v27(v82[v80]));
            end;
        end;
        return nil;
    end, 
    clearCache = function() --[[ Line: 188 ]] --[[ Name: clearCache ]]
        -- upvalues: v9 (ref), v8 (ref)
        v9 = false;
        v8 = nil;
    end, 
    getValue = v45, 
    getUniversesExposedTo = v51, 
    getNumUniversesExposedTo = v66, 
    addUniverseToExposureList = v60
};