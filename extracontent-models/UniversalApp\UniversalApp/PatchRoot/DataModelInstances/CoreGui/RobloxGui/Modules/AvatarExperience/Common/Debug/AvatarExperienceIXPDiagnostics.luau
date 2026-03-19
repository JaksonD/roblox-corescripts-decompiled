local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_useEventConnection_0 = require(l_CorePackages_0.Packages.ReactUtils).useEventConnection;
local v3 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.init");
local l_AvatarExperienceFeatureLayer_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers.AvatarExperienceFeatureLayer;
return function() --[[ Line: 11 ]] --[[ Name: AvatarExperienceIXPDiagnostics ]]
    -- upvalues: l_useEventConnection_0 (copy), l_IXPService_0 (copy), v3 (copy), l_AvatarExperienceFeatureLayer_0 (copy)
    l_useEventConnection_0(l_IXPService_0.OnUserLayerLoadingStatusChanged, function(v5) --[[ Line: 12 ]]
        -- upvalues: v3 (ref), l_IXPService_0 (ref), l_AvatarExperienceFeatureLayer_0 (ref)
        v3:info("IXPLayerLoadingStatusChanged: {}", v5);
        local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
        local l_l_IXPService_0_UserStatusForLayer_0 = l_IXPService_0:GetUserStatusForLayer(l_AvatarExperienceFeatureLayer_0);
        if l_l_IXPService_0_UserLayerLoadingStatus_0 ~= v5 then
            v3:info("IXPLayerLoadingStatusChanged -- latest status differs: {}", l_l_IXPService_0_UserLayerLoadingStatus_0);
        end;
        if l_l_IXPService_0_UserStatusForLayer_0 ~= v5 then
            v3:info("IXPLayerLoadingStatusChanged -- status for layer {} differs: {}", l_AvatarExperienceFeatureLayer_0, l_l_IXPService_0_UserStatusForLayer_0);
        end;
    end);
    return nil;
end;