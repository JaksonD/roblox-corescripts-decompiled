local l_RunService_0 = game:GetService("RunService");
local l_IXPService_0 = game:GetService("IXPService");
game:DefineFastFlag("IXPServiceWrapperWaitRefactor", false);
local function _() --[[ Line: 17 ]]
    return game:GetFastFlag("IXPServiceWrapperWaitRefactor");
end;
return {
    InitializeAsync = function(v3, v4, v5) --[[ Line: 35 ]] --[[ Name: InitializeAsync ]]
        -- upvalues: l_RunService_0 (copy), l_IXPService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
            -- upvalues: l_RunService_0 (ref), l_IXPService_0 (ref), v5 (copy), v4 (copy), v3 (copy)
            if l_RunService_0:IsStudio() then
                l_IXPService_0:ClearUserLayers();
            end;
            l_IXPService_0:RegisterUserLayers(v5);
            l_IXPService_0:InitializeUserLayers(v4);
            if game:GetFastFlag("IXPServiceWrapperWaitRefactor") then
                return v3:WaitForInitialization();
            else
                local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
                while l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.None or l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Pending do
                    l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
                    l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
                end;
                return l_l_IXPService_0_UserLayerLoadingStatus_0;
            end;
        end);
        return l_status_0, l_result_0;
    end, 
    WaitForInitialization = function(_) --[[ Line: 64 ]] --[[ Name: WaitForInitialization ]]
        -- upvalues: l_IXPService_0 (copy)
        local l_l_IXPService_0_UserLayerLoadingStatus_1 = l_IXPService_0:GetUserLayerLoadingStatus();
        while l_l_IXPService_0_UserLayerLoadingStatus_1 == Enum.IXPLoadingStatus.None or l_l_IXPService_0_UserLayerLoadingStatus_1 == Enum.IXPLoadingStatus.Pending do
            l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
            l_l_IXPService_0_UserLayerLoadingStatus_1 = l_IXPService_0:GetUserLayerLoadingStatus();
        end;
        return l_l_IXPService_0_UserLayerLoadingStatus_1;
    end, 
    GetLayerData = function(_, v12) --[[ Line: 82 ]] --[[ Name: GetLayerData ]]
        -- upvalues: l_IXPService_0 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 83 ]]
            -- upvalues: l_IXPService_0 (ref), v12 (copy)
            return l_IXPService_0:GetUserLayerVariables(v12);
        end);
        return l_status_1 and l_result_1 or nil;
    end, 
    LogUserLayerExposure = function(_, v16) --[[ Line: 95 ]] --[[ Name: LogUserLayerExposure ]]
        -- upvalues: l_IXPService_0 (copy)
        pcall(function() --[[ Line: 96 ]]
            -- upvalues: l_IXPService_0 (ref), v16 (copy)
            l_IXPService_0:LogUserLayerExposure(v16);
        end);
    end, 
    LogBrowserTrackerLayerExposure = function(_, v18) --[[ Line: 106 ]] --[[ Name: LogBrowserTrackerLayerExposure ]]
        -- upvalues: l_IXPService_0 (copy)
        pcall(function() --[[ Line: 107 ]]
            -- upvalues: l_IXPService_0 (ref), v18 (copy)
            l_IXPService_0:LogBrowserTrackerLayerExposure(v18);
        end);
    end
};