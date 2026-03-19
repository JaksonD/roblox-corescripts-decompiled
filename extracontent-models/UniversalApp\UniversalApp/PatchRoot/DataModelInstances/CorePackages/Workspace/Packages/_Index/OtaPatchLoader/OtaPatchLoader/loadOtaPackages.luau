local v0 = require(script.Parent.OtaPatchLoaderTelemetry);
local l_Events_0 = v0.Events;
local v2 = game:DefineFastInt("LuaAppUpdatePatchDeferTimeMs", 45000);
local v3 = {};
local _ = function(v4, v5) --[[ Line: 8 ]] --[[ Name: FindFromPath ]]
    local l_v4_0 = v4;
    for _, v8 in v5 do
        l_v4_0 = l_v4_0:FindFirstChild(v8, false);
        if not l_v4_0 then
            return nil;
        end;
    end;
    return l_v4_0;
end;
local function _(v10, v11, v12, v13) --[[ Line: 20 ]] --[[ Name: recordEvent ]]
    -- upvalues: v0 (copy)
    v0.sendTelemetryEvent(v10, v11, {
        patchName = v12, 
        extraMessage = v13
    });
end;
return function(v15, v16, v17, v18, v19, v20, v21) --[[ Line: 31 ]]
    -- upvalues: l_Events_0 (copy), v0 (copy), v3 (copy), v2 (copy)
    if not v16 then
        return nil;
    else
        local l_loggingProtocol_0 = v21.loggingProtocol;
        local l_dataModelPatchService_0 = v21.dataModelPatchService;
        if not l_dataModelPatchService_0 then
            error("DataModelPatchService not provided to loadOtaPackages");
        end;
        if not v15 or v15 == 0 then
            local l_NoUserId_0 = l_Events_0.NoUserId;
            v0.sendTelemetryEvent(l_loggingProtocol_0, l_NoUserId_0, {
                patchName = v16, 
                extraMessage = nil
            });
            return nil;
        else
            local v25 = ("%*:%*"):format(v15, v16);
            local v26 = v3[v25];
            if v26 ~= nil then
                if v26 == "NONE" then
                    return nil;
                else
                    return v3[v25];
                end;
            else
                local l_PatchLoadEntryPoint_0 = l_Events_0.PatchLoadEntryPoint;
                v0.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadEntryPoint_0, {
                    patchName = v16, 
                    extraMessage = nil
                });
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 67 ]]
                    -- upvalues: v17 (copy), v18 (copy), v19 (copy), l_dataModelPatchService_0 (copy), v16 (copy), v15 (copy), v0 (ref), l_loggingProtocol_0 (copy), v2 (ref), l_Events_0 (ref), v20 (copy)
                    local v28 = false;
                    local v29 = false;
                    assert(v17, "patchBehavior is nil");
                    assert(v18, "patchConfig is nil");
                    assert(v19, "patchPackagesRoot is nil");
                    local v30 = tick();
                    l_dataModelPatchService_0:RegisterPatch(v16, v17, v18, v15);
                    local l_l_dataModelPatchService_0_Patch_0 = l_dataModelPatchService_0:GetPatch(v16);
                    local v32 = tick() - v30;
                    v0.logCheckpointGetPatch(l_loggingProtocol_0, v32, {
                        patchName = v16
                    });
                    task.defer(function() --[[ Line: 81 ]]
                        -- upvalues: v2 (ref), l_dataModelPatchService_0 (ref), v15 (ref), v16 (ref)
                        local v33 = v2 / 1000;
                        if v33 > 0 then
                            task.wait(v33);
                        end;
                        l_dataModelPatchService_0:UpdatePatch(v15, v16, function() --[[ Line: 88 ]]

                        end);
                    end);
                    if not l_l_dataModelPatchService_0_Patch_0 then
                        local l_l_loggingProtocol_0_0 = l_loggingProtocol_0;
                        local l_NoPatchFound_0 = l_Events_0.NoPatchFound;
                        local l_v16_0 = v16;
                        v0.sendTelemetryEvent(l_l_loggingProtocol_0_0, l_NoPatchFound_0, {
                            patchName = l_v16_0, 
                            extraMessage = nil
                        });
                        return nil;
                    else
                        local l_v19_0 = v19;
                        local l_l_l_dataModelPatchService_0_Patch_0_0 = l_l_dataModelPatchService_0_Patch_0;
                        local v39;
                        for _, v41 in l_v19_0 do
                            l_l_l_dataModelPatchService_0_Patch_0_0 = l_l_l_dataModelPatchService_0_Patch_0_0:FindFirstChild(v41, false);
                            if not l_l_l_dataModelPatchService_0_Patch_0_0 then
                                v39 = nil;
                                v28 = true;
                            end;
                            if v28 then
                                break;
                            end;
                        end;
                        if not v28 then
                            v39 = l_l_l_dataModelPatchService_0_Patch_0_0;
                        end;
                        v28 = false;
                        if not v39 then
                            l_v19_0 = table.concat(v19, ".");
                            l_l_l_dataModelPatchService_0_Patch_0_0 = l_loggingProtocol_0;
                            local l_MissingPatchRoot_0 = l_Events_0.MissingPatchRoot;
                            local l_v16_1 = v16;
                            v0.sendTelemetryEvent(l_l_l_dataModelPatchService_0_Patch_0_0, l_MissingPatchRoot_0, {
                                patchName = l_v16_1, 
                                extraMessage = l_v19_0
                            });
                            return nil;
                        else
                            assert(v39, "otaPackagesRoot is nil");
                            if v20 then
                                l_l_l_dataModelPatchService_0_Patch_0_0 = v20;
                                local l_l_l_dataModelPatchService_0_Patch_0_1 = l_l_dataModelPatchService_0_Patch_0;
                                for _, v46 in l_l_l_dataModelPatchService_0_Patch_0_0 do
                                    l_l_l_dataModelPatchService_0_Patch_0_1 = l_l_l_dataModelPatchService_0_Patch_0_1:FindFirstChild(v46, false);
                                    if not l_l_l_dataModelPatchService_0_Patch_0_1 then
                                        l_v19_0 = nil;
                                        v29 = true;
                                    end;
                                    if v29 then
                                        break;
                                    end;
                                end;
                                if not v29 then
                                    l_v19_0 = l_l_l_dataModelPatchService_0_Patch_0_1;
                                end;
                                v29 = false;
                                if l_v19_0 then
                                    l_l_l_dataModelPatchService_0_Patch_0_0 = tick();
                                    l_l_l_dataModelPatchService_0_Patch_0_1 = require(l_v19_0);
                                    if l_l_l_dataModelPatchService_0_Patch_0_1 then
                                        l_l_l_dataModelPatchService_0_Patch_0_1();
                                    end;
                                    local v47 = tick() - l_l_l_dataModelPatchService_0_Patch_0_0;
                                    v0.logCheckpointRequireStarter(l_loggingProtocol_0, v47, {
                                        patchName = v16
                                    });
                                end;
                            end;
                            return v39;
                        end;
                    end;
                end);
                if l_status_0 and l_result_0 then
                    local l_PatchLoadedOk_0 = l_Events_0.PatchLoadedOk;
                    v0.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadedOk_0, {
                        patchName = v16, 
                        extraMessage = nil
                    });
                    v3[v25] = l_result_0;
                    return l_result_0;
                else
                    if not l_status_0 then
                        local l_PatchLoadError_0 = l_Events_0.PatchLoadError;
                        local v52 = tostring(l_result_0);
                        v0.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadError_0, {
                            patchName = v16, 
                            extraMessage = v52
                        });
                    else
                        local l_PatchLoadFailed_0 = l_Events_0.PatchLoadFailed;
                        v0.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadFailed_0, {
                            patchName = v16, 
                            extraMessage = nil
                        });
                    end;
                    v3[v25] = "NONE";
                    return nil;
                end;
            end;
        end;
    end;
end;