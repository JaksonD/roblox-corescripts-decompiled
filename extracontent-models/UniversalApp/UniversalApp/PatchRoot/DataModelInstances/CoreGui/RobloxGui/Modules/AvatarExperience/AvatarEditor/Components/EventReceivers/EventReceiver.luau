local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetConnectionState);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GrantAsset);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RevokeAsset);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GrantOutfit);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateOutfit);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateAssetModerationStatus);
local v15 = v3.PureComponent:extend("EventReceiver");
local v16 = {
    approved = Enum.ModerationStatus.ReviewedApproved, 
    moderated = Enum.ModerationStatus.ReviewedRejected
};
v15.init = function(v17) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy)
    local l_RobloxEventReceiver_0 = v17.props.RobloxEventReceiver;
    local l_networking_0 = v17.props.networking;
    local l_analytics_0 = v17.props.analytics;
    local l_grantAsset_0 = v17.props.grantAsset;
    local l_revokeAsset_0 = v17.props.revokeAsset;
    local l_grantOutfit_0 = v17.props.grantOutfit;
    local l_revokeCostume_0 = v17.props.revokeCostume;
    local l_updateOutfit_0 = v17.props.updateOutfit;
    local l_updateAssetModerationStatus_0 = v17.props.updateAssetModerationStatus;
    local l_setConnectionState_0 = v17.props.setConnectionState;
    v17.tokens = {
        l_RobloxEventReceiver_0:observeEvent("AvatarAssetOwnershipNotifications", function(v28) --[[ Line: 43 ]]
            -- upvalues: v17 (copy), l_grantAsset_0 (copy), l_networking_0 (copy), l_analytics_0 (copy), l_revokeAsset_0 (copy)
            if v28.Type == "Grant" then
                local l_opaquePage_0 = v17.props.opaquePage;
                l_grantAsset_0(tostring(v28.AssetTypeId), tostring(v28.AssetId), l_networking_0, l_analytics_0, l_opaquePage_0);
                return;
            else
                if v28.Type == "Revoke" then
                    l_revokeAsset_0(v28.AssetTypeId, v28.AssetId);
                end;
                return;
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("signalR", function(v30) --[[ Line: 53 ]]
            -- upvalues: l_setConnectionState_0 (copy)
            l_setConnectionState_0(v30);
        end), 
        l_RobloxEventReceiver_0:observeEvent("AvatarOutfitOwnershipNotifications", function(v31) --[[ Line: 56 ]]
            -- upvalues: v17 (copy), l_grantOutfit_0 (copy), l_revokeCostume_0 (copy), l_updateOutfit_0 (copy), l_networking_0 (copy)
            if v31.Type == "Grant" then
                local l_opaquePage_1 = v17.props.opaquePage;
                l_grantOutfit_0(v31.UserOutfitId, l_opaquePage_1);
                return;
            elseif v31.Type == "Revoke" then
                l_revokeCostume_0(v31.UserOutfitId);
                return;
            else
                if v31.Type == "Update" then
                    l_updateOutfit_0(v31.UserOutfitId, l_networking_0);
                end;
                return;
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("IecOutfitModerationStatus", function(v33) --[[ Line: 66 ]]
            -- upvalues: l_updateOutfit_0 (copy), l_networking_0 (copy)
            if v33 and v33.UserOutfitId then
                l_updateOutfit_0(v33.UserOutfitId, l_networking_0);
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("IecAssetModerationStatus", function(v34) --[[ Line: 71 ]]
            -- upvalues: v16 (ref), l_updateAssetModerationStatus_0 (copy)
            if v34 and v34.TargetId and v34.ModerationStatus then
                local v35 = v16[v34.ModerationStatus];
                if v35 then
                    l_updateAssetModerationStatus_0(v34.TargetId, v35, v34.TargetName, v34.UniverseId);
                end;
            end;
        end)
    };
end;
v15.render = function(_) --[[ Line: 82 ]] --[[ Name: render ]]

end;
v15.willUnmount = function(v37) --[[ Line: 84 ]] --[[ Name: willUnmount ]]
    for _, v39 in v37.tokens do
        v39:disconnect();
    end;
end;
v15 = l_RoactServices_0.connect({
    networking = v7, 
    analytics = v5
})(v15);
return v4.connect(function(v40) --[[ Line: 95 ]]
    local l_opaque_0 = v40.AvatarExperience.AvatarScene.AvatarRoute.opaque;
    return {
        opaquePage = l_opaque_0 and l_opaque_0.name or nil
    };
end, function(v42) --[[ Line: 100 ]]
    -- upvalues: v10 (copy), v11 (copy), v8 (copy), v12 (copy), v9 (copy), v13 (copy), v14 (copy)
    return {
        grantAsset = function(v43, v44, v45, v46, v47) --[[ Line: 102 ]] --[[ Name: grantAsset ]]
            -- upvalues: v42 (copy), v10 (ref)
            return v42(v10(v43, v44, v45, v46, v47));
        end, 
        revokeAsset = function(v48, v49) --[[ Line: 105 ]] --[[ Name: revokeAsset ]]
            -- upvalues: v42 (copy), v11 (ref)
            return v42(v11(v48, v49));
        end, 
        setConnectionState = function(v50) --[[ Line: 108 ]] --[[ Name: setConnectionState ]]
            -- upvalues: v42 (copy), v8 (ref)
            return v42(v8(v50));
        end, 
        grantOutfit = function(v51, v52) --[[ Line: 111 ]] --[[ Name: grantOutfit ]]
            -- upvalues: v42 (copy), v12 (ref)
            return v42(v12(tostring(v51), v52));
        end, 
        revokeCostume = function(v53) --[[ Line: 114 ]] --[[ Name: revokeCostume ]]
            -- upvalues: v42 (copy), v9 (ref)
            return v42(v9(v53));
        end, 
        updateOutfit = function(v54, v55) --[[ Line: 117 ]] --[[ Name: updateOutfit ]]
            -- upvalues: v42 (copy), v13 (ref)
            return v42(v13(tostring(v54), v55));
        end, 
        updateAssetModerationStatus = function(v56, v57, v58, v59) --[[ Line: 120 ]] --[[ Name: updateAssetModerationStatus ]]
            -- upvalues: v42 (copy), v14 (ref)
            return v42(v14(tostring(v56), v57, v58, (tostring(v59))));
        end
    };
end)(v15);