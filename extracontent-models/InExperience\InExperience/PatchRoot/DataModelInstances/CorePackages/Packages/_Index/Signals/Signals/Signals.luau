local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SignalsScheduler);
local l_flush_0 = v1.flush;
local l_schedule_0 = v1.schedule;
local v4 = require(script.Parent.callUserSpace);
local v5 = table.freeze({
    __mode = "k"
});
local function _(v6) --[[ Line: 29 ]] --[[ Name: createWeakSet ]]
    -- upvalues: v5 (copy)
    return (setmetatable(v6, v5));
end;
local function v10(v8, v9) --[[ Line: 33 ]] --[[ Name: defaultEquals ]]
    return v8 == v9;
end;
local function v12(v11, ...) --[[ Line: 37 ]] --[[ Name: handleError ]]
    if not v11 then
        error((...));
    end;
end;
local function v15(v13, v14, ...) --[[ Line: 44 ]] --[[ Name: handleScopeValidation ]]
    -- upvalues: v12 (copy)
    v13();
    v12(v14, ...);
    return ...;
end;
local function v20(v16, v17) --[[ Line: 50 ]] --[[ Name: callUserSpaceWithScopeValidation ]]
    -- upvalues: v15 (copy), v4 (copy)
    local v18 = true;
    return v15(function() --[[ Line: 60 ]] --[[ Name: kill ]]
        -- upvalues: v18 (ref)
        v18 = false;
    end, pcall(v4, v16, function(v19) --[[ Line: 53 ]] --[[ Name: wrappedScope ]]
        -- upvalues: v18 (ref), v17 (copy)
        if not v18 then
            error("attempted to use scope beyond scope's lifetime");
        end;
        return v17(v19);
    end));
end;
local v21 = if _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__ then v20 else v4;
return {
    createSignal = function(v22, v23) --[[ Line: 70 ]] --[[ Name: createSignal ]]
        -- upvalues: v10 (copy), v4 (copy), v5 (copy), l_flush_0 (copy)
        local v24 = false;
        local v25 = 0;
        local v26 = nil;
        local v27 = nil;
        local v28 = if v23 ~= nil then v23 else v10;
        local function v29() --[[ Line: 79 ]] --[[ Name: ensureInitialized ]]
            -- upvalues: v24 (ref), v26 (ref), v22 (copy), v4 (ref), v25 (ref), v27 (ref), v5 (ref)
            if not v24 then
                v24 = true;
                v26 = if typeof(v22) == "function" then v4(v22) else v22;
                v25 = os.clock();
                v27 = setmetatable({}, v5);
            end;
        end;
        local function v32(v30, v31) --[[ Line: 88 ]] --[[ Name: source ]]
            -- upvalues: v27 (ref), v25 (ref)
            if v30 ~= nil then
                if v31 then
                    v27[v30] = nil;
                else
                    v27[v30] = true;
                end;
                return 0;
            else
                return v25;
            end;
        end;
        local function _(v33) --[[ Line: 101 ]] --[[ Name: connectToScope ]]
            -- upvalues: v32 (copy), v27 (ref)
            if v33 then
                v27[v33(v32)] = true;
            end;
        end;
        local function _() --[[ Line: 108 ]] --[[ Name: notifyObservers ]]
            -- upvalues: v27 (ref)
            for v35 in v27 do
                v35();
            end;
            table.clear(v27);
        end;
        return function(v37) --[[ Line: 115 ]] --[[ Name: getter ]]
            -- upvalues: v29 (copy), v32 (copy), v27 (ref), v26 (ref)
            v29();
            if v37 then
                v27[v37(v32)] = true;
            end;
            return v26;
        end, function(v38) --[[ Line: 121 ]] --[[ Name: setter ]]
            -- upvalues: v29 (copy), v4 (ref), v26 (ref), v28 (copy), v25 (ref), v27 (ref), l_flush_0 (ref)
            v29();
            local v39 = if typeof(v38) == "function" then v4(v38, v26) else v38;
            if not v4(v28, v26, v39) then
                v26 = v39;
                v25 = os.clock();
                for v40 in v27 do
                    v40();
                end;
                table.clear(v27);
                l_flush_0();
            end;
        end;
    end, 
    createComputed = function(v41, v42) --[[ Line: 135 ]] --[[ Name: createComputed ]]
        -- upvalues: v10 (copy), v5 (copy), v21 (copy), v4 (copy)
        local v43 = false;
        local v44 = false;
        local v45 = 0;
        local v46 = 0;
        local v47 = nil;
        local v48 = nil;
        local v49 = nil;
        local v50 = if v42 ~= nil then v42 else v10;
        local function _() --[[ Line: 147 ]] --[[ Name: notifyObservers ]]
            -- upvalues: v49 (ref)
            for v51 in v49 do
                v51();
            end;
            table.clear(v49);
        end;
        local function v54() --[[ Line: 154 ]] --[[ Name: observer ]]
            -- upvalues: v44 (ref), v49 (ref)
            if not v44 then
                v44 = true;
                for v53 in v49 do
                    v53();
                end;
                table.clear(v49);
            end;
        end;
        local function v56(v55) --[[ Line: 161 ]] --[[ Name: scope ]]
            -- upvalues: v48 (ref), v54 (copy)
            v48[v55] = true;
            return v54;
        end;
        local function v57() --[[ Line: 166 ]] --[[ Name: ensureInitialized ]]
            -- upvalues: v43 (ref), v49 (ref), v5 (ref), v48 (ref), v47 (ref), v21 (ref), v41 (copy), v56 (copy), v46 (ref), v45 (ref)
            if not v43 then
                v43 = true;
                v49 = setmetatable({}, v5);
                v48 = {};
                v47 = v21(v41, v56);
                v46 = os.clock();
                v45 = v46;
            end;
        end;
        local function _() --[[ Line: 177 ]] --[[ Name: disconnectSources ]]
            -- upvalues: v48 (ref), v54 (copy)
            for v58 in v48 do
                v58(v54, true);
            end;
            table.clear(v48);
        end;
        local function v64() --[[ Line: 184 ]] --[[ Name: flushNotifications ]]
            -- upvalues: v44 (ref), v48 (ref), v46 (ref), v54 (copy), v21 (ref), v41 (copy), v56 (copy), v4 (ref), v50 (copy), v47 (ref), v45 (ref)
            if v44 then
                v44 = false;
                for v60 in v48 do
                    if v60() > v46 then
                        for v61 in v48 do
                            v61(v54, true);
                        end;
                        table.clear(v48);
                        local v62 = v21(v41, v56);
                        v46 = os.clock();
                        if not v4(v50, v47, v62) then
                            v47 = v62;
                            v45 = v46;
                        end;
                        return;
                    end;
                end;
                for v63 in v48 do
                    v63(v54);
                end;
            end;
        end;
        local function v67(v65, v66) --[[ Line: 206 ]] --[[ Name: source ]]
            -- upvalues: v49 (ref), v64 (copy), v45 (ref)
            if v65 ~= nil then
                if v66 then
                    v49[v65] = nil;
                else
                    v49[v65] = true;
                end;
                return 0;
            else
                v64();
                return v45;
            end;
        end;
        local function _(v68) --[[ Line: 220 ]] --[[ Name: connectToScope ]]
            -- upvalues: v67 (copy), v49 (ref)
            if v68 then
                v49[v68(v67)] = true;
            end;
        end;
        return function(v70) --[[ Line: 227 ]] --[[ Name: getter ]]
            -- upvalues: v57 (copy), v64 (copy), v67 (copy), v49 (ref), v47 (ref)
            v57();
            v64();
            if v70 then
                v49[v70(v67)] = true;
            end;
            return v47;
        end;
    end, 
    createEffect = function(v71) --[[ Line: 237 ]] --[[ Name: createEffect ]]
        -- upvalues: v21 (copy), l_schedule_0 (copy)
        local v72 = false;
        local v73 = false;
        local v74 = 0;
        local v75 = {};
        local v76 = nil;
        local function _() --[[ Line: 246 ]] --[[ Name: disconnectSources ]]
            -- upvalues: v75 (copy), v76 (ref)
            for v77 in v75 do
                v77(v76, true);
            end;
            table.clear(v75);
        end;
        local function v80() --[[ Line: 253 ]] --[[ Name: dispose ]]
            -- upvalues: v73 (ref), v75 (copy), v76 (ref)
            v73 = true;
            for v79 in v75 do
                v79(v76, true);
            end;
            table.clear(v75);
        end;
        local function v82(v81) --[[ Line: 258 ]] --[[ Name: scope ]]
            -- upvalues: v75 (copy), v76 (ref)
            v75[v81] = true;
            return v76;
        end;
        local function v86() --[[ Line: 263 ]] --[[ Name: processNotification ]]
            -- upvalues: v73 (ref), v72 (ref), v75 (copy), v74 (ref), v76 (ref), v21 (ref), v71 (copy), v82 (copy)
            if not v73 then
                v72 = false;
                for v83 in v75 do
                    if v83() > v74 then
                        for v84 in v75 do
                            v84(v76, true);
                        end;
                        table.clear(v75);
                        v21(v71, v82);
                        v74 = os.clock();
                        return;
                    end;
                end;
                for v85 in v75 do
                    v85(v76);
                end;
            end;
        end;
        v76 = function() --[[ Line: 281 ]] --[[ Name: observer ]]
            -- upvalues: v73 (ref), v72 (ref), l_schedule_0 (ref), v86 (copy)
            if not v73 and not v72 then
                v72 = true;
                l_schedule_0(v86);
            end;
        end;
        v21(v71, v82);
        v74 = os.clock();
        return v80;
    end
};