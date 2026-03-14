local l_RunService_0 = game:GetService("RunService");
local l_IXPService_0 = game:GetService("IXPService");
return {
    InitializeAsync = function(_, v3, v4) --[[ Line: 30 ]] --[[ Name: InitializeAsync ]]
        -- upvalues: l_RunService_0 (copy), l_IXPService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_RunService_0 (ref), l_IXPService_0 (ref), v4 (copy), v3 (copy)
            if l_RunService_0:IsStudio() then
                l_IXPService_0:ClearUserLayers();
            end;
            l_IXPService_0:RegisterUserLayers(v4);
            l_IXPService_0:InitializeUserLayers(v3);
            local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
            while l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.None or l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Pending do
                l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
                l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
            end;
            return l_l_IXPService_0_UserLayerLoadingStatus_0;
        end);
        return l_status_0, l_result_0;
    end, 
    WaitForInitialization = function(_) --[[ Line: 55 ]] --[[ Name: WaitForInitialization ]]
        -- upvalues: l_IXPService_0 (copy)
        local l_l_IXPService_0_UserLayerLoadingStatus_1 = l_IXPService_0:GetUserLayerLoadingStatus();
        while l_l_IXPService_0_UserLayerLoadingStatus_1 == Enum.IXPLoadingStatus.None or l_l_IXPService_0_UserLayerLoadingStatus_1 == Enum.IXPLoadingStatus.Pending do
            l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
            l_l_IXPService_0_UserLayerLoadingStatus_1 = l_IXPService_0:GetUserLayerLoadingStatus();
        end;
        return l_l_IXPService_0_UserLayerLoadingStatus_1;
    end, 
    GetLayerData = function(_, v11) --[[ Line: 73 ]] --[[ Name: GetLayerData ]]
        -- upvalues: l_IXPService_0 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 74 ]]
            -- upvalues: l_IXPService_0 (ref), v11 (copy)
            return l_IXPService_0:GetUserLayerVariables(v11);
        end);
        return l_status_1 and l_result_1 or nil;
    end, 
    GetBTIDLayerData = function(_, v15) --[[ Line: 89 ]] --[[ Name: GetBTIDLayerData ]]
        -- upvalues: l_IXPService_0 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 90 ]]
            -- upvalues: l_IXPService_0 (ref), v15 (copy)
            return l_IXPService_0:GetBrowserTrackerLayerVariables(v15);
        end);
        return l_status_2 and l_result_2 or nil;
    end, 
    LogUserLayerExposure = function(_, v19) --[[ Line: 102 ]] --[[ Name: LogUserLayerExposure ]]
        -- upvalues: l_IXPService_0 (copy)
        pcall(function() --[[ Line: 103 ]]
            -- upvalues: l_IXPService_0 (ref), v19 (copy)
            l_IXPService_0:LogUserLayerExposure(v19);
        end);
    end, 
    LogBrowserTrackerLayerExposure = function(_, v21) --[[ Line: 113 ]] --[[ Name: LogBrowserTrackerLayerExposure ]]
        -- upvalues: l_IXPService_0 (copy)
        pcall(function() --[[ Line: 114 ]]
            -- upvalues: l_IXPService_0 (ref), v21 (copy)
            l_IXPService_0:LogBrowserTrackerLayerExposure(v21);
        end);
    end, 
    LogFlagLinkedUserLayerExposure = function(_, v23) --[[ Line: 124 ]] --[[ Name: LogFlagLinkedUserLayerExposure ]]
        -- upvalues: l_IXPService_0 (copy)
        if game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
            pcall(function() --[[ Line: 126 ]]
                -- upvalues: l_IXPService_0 (ref), v23 (copy)
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v23);
            end);
        end;
    end
};