local l_Parent_0 = script:FindFirstAncestor("OtaPatchLoader").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = game:DefineFastInt("OtaLoaderInfoEventHundredthsPercent2", 0);
local v4 = game:DefineFastInt("OtaLoaderErrorEventHundredthsPercent2", 0);
local v5 = game:DefineFastInt("OtaLoaderCheckpointEventHundredthsPercent", 0);
local v6 = {
    INFO = "INFO", 
    ERROR = "ERROR"
};
local function _(v7, v8) --[[ Line: 16 ]] --[[ Name: genEvent ]]
    return {
        Type = v7, 
        Description = v8
    };
end;
local v10 = {
    PatchLoadEntryPoint = {
        Type = v6.INFO, 
        Description = "Patch load entry point"
    }, 
    NoUserId = {
        Type = v6.INFO, 
        Description = "No User Id; can't load patch"
    }, 
    NoPatchFound = {
        Type = v6.INFO, 
        Description = "No patch found"
    }, 
    PatchLoadedOk = {
        Type = v6.INFO, 
        Description = "Patch loaded successfully"
    }, 
    PatchPackageFound = {
        Type = v6.INFO, 
        Description = "Package found in patch; attemping to require"
    }, 
    PatchPackageRequiredOk = {
        Type = v6.INFO, 
        Description = "Package successfully required from patch; using patch's package"
    }, 
    PackageValidationFailed = {
        Type = v6.INFO, 
        Description = "Package validation failed"
    }, 
    PatchLoadFailed = {
        Type = v6.INFO, 
        Description = "Patch failed to load"
    }, 
    MissingPatchRoot = {
        Type = v6.ERROR, 
        Description = "Could not find root of patch"
    }, 
    PatchLoadError = {
        Type = v6.ERROR, 
        Description = "Error when loading a patch"
    }, 
    RequirePackageError = {
        Type = v6.ERROR, 
        Description = "Script error on requiring the patch package"
    }, 
    RequirePackageEmpty = {
        Type = v6.ERROR, 
        Description = "Patch package was empty"
    }, 
    PatchPackageMissing = {
        Type = v6.ERROR, 
        Description = "Package missing in patch"
    }, 
    PackageValidationError = {
        Type = v6.ERROR, 
        Description = "Package validation script error"
    }
};
local v11 = {
    eventName = "OtaPatch_Info", 
    backends = {
        l_default_0.TelemetryBackends.Points
    }, 
    throttlingPercentage = v3, 
    lastUpdated = {
        24, 
        6, 
        5
    }, 
    description = "Informative events for the OTA patch loader", 
    links = ""
};
local v12 = {
    eventName = "OtaPatch_Error", 
    backends = {
        l_default_0.TelemetryBackends.Points
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        24, 
        6, 
        5
    }, 
    description = "Errors for the OTA patch loader", 
    links = ""
};
local v13 = {
    eventName = "OtaPatch_Checkpoint_Total", 
    backends = {
        l_default_0.TelemetryBackends.Stats
    }, 
    throttlingPercentage = v5, 
    lastUpdated = {
        24, 
        11, 
        12
    }, 
    description = "Total time to load the ota patch", 
    links = ""
};
local v14 = {
    eventName = "OtaPatch_Checkpoint_GetPatch", 
    backends = {
        l_default_0.TelemetryBackends.Stats
    }, 
    throttlingPercentage = v5, 
    lastUpdated = {
        24, 
        11, 
        12
    }, 
    description = "Time to register and load an ota patch", 
    links = ""
};
local v15 = {
    eventName = "OtaPatch_Checkpoint_RequireStarter", 
    backends = {
        l_default_0.TelemetryBackends.Stats
    }, 
    throttlingPercentage = v5, 
    lastUpdated = {
        24, 
        11, 
        12
    }, 
    description = "Time to require the patch starter script", 
    links = ""
};
local v16 = {};
local v17 = {};
for v18, _ in pairs(v10) do
    v17[v18] = v18;
end;
v16.Events = v17;
setmetatable(v16.Events, {
    __newindex = function(_, v21, v22) --[[ Line: 113 ]] --[[ Name: __newindex ]]
        error((("Trying to modify static table with key %*, index %*"):format(v21, v22)));
    end, 
    __index = function(_, v24) --[[ Line: 116 ]] --[[ Name: __index ]]
        error((("OtaPatchLoaderTelemetry - Could not find telemetry event for %*"):format(v24)));
    end
});
v16.sendTelemetryEvent = function(v25, v26, v27) --[[ Line: 121 ]] --[[ Name: sendTelemetryEvent ]]
    -- upvalues: v10 (copy), v6 (copy), v12 (copy), v11 (copy), l_Logger_0 (copy)
    if not v25 then
        return;
    else
        local v28 = nil;
        local v29 = v10[v26];
        if not v29 then
            error((("OtaPatchLoaderTelemetry - Could not find telemetry event for %*"):format(v26)));
            return;
        else
            if v29.Type == v6.ERROR then
                v28 = v12;
            elseif v29.Type == v6.INFO then
                v28 = v11;
            else
                error((("OtaPatchLoaderTelemetry - Unknown event type %* for event %*"):format(v29.Type, v26)));
                return;
            end;
            local v30 = "[OtaPatchLoaderTelemetry]";
            if v27.packageName then
                v30 = ("%*[%*]"):format(v30, v27.packageName);
            end;
            v30 = ("%* Event %*"):format(v30, v26);
            if v27.extraMessage then
                v30 = ("%* - %*"):format(v30, v27.extraMessage);
            end;
            l_Logger_0:info(v30);
            local v31 = table.clone(v27);
            v31.eventName = v26;
            v25:logRobloxTelemetryEvent(v28, {
                v25.StandardizedFields.addOsInfo
            }, v31);
            return;
        end;
    end;
end;
local function v39(v32, v33, v34, v35) --[[ Line: 166 ]] --[[ Name: logCheckpoint ]]
    -- upvalues: l_Logger_0 (copy)
    if not v32 then
        return;
    else
        local v36 = {};
        if v35 then
            v36 = table.clone(v35);
        end;
        local v37 = v34 * 1000;
        local v38 = ("[OtaPatchLoaderTelemetry] Checkpoint %* took %*ms"):format(v33.eventName, v37);
        l_Logger_0:info(v38);
        v32:logRobloxTelemetryStat(v33, v37, v36);
        return;
    end;
end;
v16.logCheckpointTotal = function(v40, v41, v42) --[[ Line: 183 ]] --[[ Name: logCheckpointTotal ]]
    -- upvalues: v39 (copy), v13 (copy)
    v39(v40, v13, v41, v42);
end;
v16.logCheckpointGetPatch = function(v43, v44, v45) --[[ Line: 187 ]] --[[ Name: logCheckpointGetPatch ]]
    -- upvalues: v39 (copy), v14 (copy)
    v39(v43, v14, v44, v45);
end;
v16.logCheckpointRequireStarter = function(v46, v47, v48) --[[ Line: 191 ]] --[[ Name: logCheckpointRequireStarter ]]
    -- upvalues: v39 (copy), v15 (copy)
    v39(v46, v15, v47, v48);
end;
return v16;