local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
return function() --[[ Line: 7 ]] --[[ Name: enrolledInLuafiedRecoveryExperiment ]]
    -- upvalues: l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy)
    local l_l_IXPServiceWrapper_0_BTIDLayerData_0 = l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.AccountRecoveryUILayer);
    l_IXPServiceWrapper_0:LogBrowserTrackerLayerExposure(l_AppBtidLayers_0.AccountRecoveryUILayer);
    if not l_l_IXPServiceWrapper_0_BTIDLayerData_0 then
        return false;
    else
        return l_l_IXPServiceWrapper_0_BTIDLayerData_0.shouldShowLuafiedRecoveryFlow or false;
    end;
end;