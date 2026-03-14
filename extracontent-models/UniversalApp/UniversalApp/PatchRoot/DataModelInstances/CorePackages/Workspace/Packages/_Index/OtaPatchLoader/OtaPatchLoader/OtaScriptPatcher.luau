local l_Players_0 = game:GetService("Players");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("OtaPatchLoader");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_OtaPackagesStatus_0 = require(l_Parent_0.OtaPatchPackagesStatus).OtaPackagesStatus;
local v7 = require(script.Parent.loadOtaPackages);
local v8 = require(script.Parent.OtaPatchLoaderTelemetry);
local l_Events_0 = v8.Events;
local _ = require(script.Parent.OtaPatchTypes);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppDisableAllOtaPackages);
local v12 = {};
v12.__index = v12;
local function _(v13, v14, v15, v16) --[[ Line: 23 ]] --[[ Name: recordEvent ]]
    -- upvalues: v8 (copy), l_default_0 (copy)
    v8.sendTelemetryEvent(l_default_0, v13, {
        patchName = v14, 
        packageName = v15, 
        extraMessage = v16
    });
end;
v12.new = function() --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    local v18 = {
        corePackages = game:GetService("CorePackages"), 
        patchName = nil, 
        otaPackagesRoot = nil
    };
    setmetatable(v18, v12);
    return v18;
end;
v12.load = function(v19, v20) --[[ Line: 42 ]] --[[ Name: load ]]
    -- upvalues: v11 (copy), l_Players_0 (copy), l_AppStorageService_0 (copy), l_default_0 (copy), l_DataModelPatchService_0 (copy), v7 (copy), v8 (copy)
    local v21 = tick();
    if v11 then
        return;
    elseif _G.__TESTEZ_RUNNING_TEST__ then
        return;
    else
        v19.patchName = v20.patchName;
        local v22 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
        if not v22 or v22 <= 0 then
            v22 = tonumber(l_AppStorageService_0:GetItem("UserId")) or 0;
        end;
        assert(v22, "userId should always exist; assert to workaround static analysis");
        local v23 = {
            loggingProtocol = l_default_0, 
            dataModelPatchService = l_DataModelPatchService_0
        };
        local v24 = v7(v22, v19.patchName, v20.patchBehavior, v20.patchConfig, v20.patchPackagesRoot, v20.patchStarterScriptPath, v23);
        v19.otaPackagesRoot = v24;
        local v25 = tick() - v21;
        v8.logCheckpointTotal(l_default_0, v25, {
            patchName = v19.patchName, 
            otaPackagesLoaded = v24 ~= nil and "true" or "false"
        });
        return;
    end;
end;
local v26 = nil;
v12.replacePackage = function(v27, v28, v29) --[[ Line: 89 ]] --[[ Name: replacePackage ]]
    -- upvalues: v26 (ref)
    if not v28 or not v29 then
        return;
    else
        if not v26 then
            v26 = v27.corePackages:FindFirstChild("OtaBackups");
            if not v26 then
                v26 = Instance.new("Folder");
                assert(v26, "otaBackups should always exist");
                v26.Name = "OtaBackups";
                v26.Parent = v27.corePackages;
            end;
        end;
        v29.Name = v28.Name;
        v29.Parent = v28.Parent;
        v28.Parent = v26;
        return;
    end;
end;
v12.revertPackage = function(_, v31) --[[ Line: 109 ]] --[[ Name: revertPackage ]]
    -- upvalues: v26 (ref)
    if v26 then
        local l_Name_0 = v31.Name;
        local l_v26_FirstChild_0 = v26:FindFirstChild(l_Name_0);
        if l_v26_FirstChild_0 then
            l_v26_FirstChild_0.Parent = v31.Parent;
            v31.Name = ("%*_bad"):format(l_Name_0);
            v31.Parent = nil;
            return l_v26_FirstChild_0;
        end;
    end;
    return nil;
end;
v12.requirePackageFromOta = function(v34, v35) --[[ Line: 126 ]] --[[ Name: requirePackageFromOta ]]
    -- upvalues: l_Events_0 (copy), v8 (copy), l_default_0 (copy), l_OtaPackagesStatus_0 (copy)
    local l_patchName_0 = v34.patchName;
    local l_Name_1 = v35.Name;
    local l_otaPackagesRoot_0 = v34.otaPackagesRoot;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    if l_otaPackagesRoot_0 then
        v39 = l_otaPackagesRoot_0:FindFirstChild(l_Name_1);
        if v39 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 137 ]]
                -- upvalues: v39 (ref)
                return (require(v39));
            end);
            v40 = l_status_0;
            v41 = l_result_0;
            if v40 and v41 then
                l_status_0 = l_Events_0.PatchPackageRequiredOk;
                v8.sendTelemetryEvent(l_default_0, l_status_0, {
                    patchName = l_patchName_0, 
                    packageName = l_Name_1, 
                    extraMessage = nil
                });
                l_OtaPackagesStatus_0.AddPackageStatus(l_patchName_0, l_Name_1, true);
                return v41;
            end;
        end;
    end;
    if not v39 then
        local l_PatchPackageMissing_0 = l_Events_0.PatchPackageMissing;
        v8.sendTelemetryEvent(l_default_0, l_PatchPackageMissing_0, {
            patchName = l_patchName_0, 
            packageName = l_Name_1, 
            extraMessage = nil
        });
    elseif not v40 then
        local v45 = tostring(v41);
        local l_RequirePackageError_0 = l_Events_0.RequirePackageError;
        v8.sendTelemetryEvent(l_default_0, l_RequirePackageError_0, {
            patchName = l_patchName_0, 
            packageName = l_Name_1, 
            extraMessage = v45
        });
    elseif v41 == nil then
        local l_RequirePackageEmpty_0 = l_Events_0.RequirePackageEmpty;
        v8.sendTelemetryEvent(l_default_0, l_RequirePackageEmpty_0, {
            patchName = l_patchName_0, 
            packageName = l_Name_1, 
            extraMessage = nil
        });
    end;
    local v48 = v34:revertPackage(v35);
    if v48 then
        l_OtaPackagesStatus_0.AddPackageStatus(l_patchName_0, l_Name_1, false);
        return (require(v48));
    else
        error((("Could not require OTA package '%*', from '%*'. Original package is missing and cannot be found anymore."):format(l_Name_1, l_patchName_0)));
        return nil;
    end;
end;
return v12;