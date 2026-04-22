local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppUpdate");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local l_joinGamePlayButton_0 = require(l_Parent_0.DiscoveryAnalytics).Points.joinGamePlayButton;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v5 = require(l_script_FirstAncestor_0.Thunks.OpenCentralOverlayForUpdateRequiredPrompt);
local v6 = require(l_script_FirstAncestor_0.UpdateMessageType);
return function(v7, v8, v9, v10, v11) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), l_joinGamePlayButton_0 (copy), l_SetNetworkingErrorToast_0 (copy), v5 (copy), v6 (copy)
    return function(v12) --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v10 (copy), v8 (copy), v11 (copy), v2 (ref), l_joinGamePlayButton_0 (ref), v9 (copy), l_SetNetworkingErrorToast_0 (ref), v5 (ref), v6 (ref)
        if v7 == nil then
            warn("appUpdateImpl is nil");
            if v10 then
                v10();
            end;
            return;
        elseif not v8 or v7:canPerformBinaryUpdate() then
            v7:checkForUpdate():andThen(function(v13) --[[ Line: 27 ]]
                -- upvalues: v11 (ref), v2 (ref), l_joinGamePlayButton_0 (ref), v9 (ref), v12 (copy), l_SetNetworkingErrorToast_0 (ref), v5 (ref), v7 (ref), v6 (ref), v10 (ref)
                local l_appUpdateStatus_0 = v13.appUpdateStatus;
                local v15 = {
                    appUpdateStatus = l_appUpdateStatus_0
                };
                if v11 then
                    v15 = v2.join(v15, v11);
                end;
                l_joinGamePlayButton_0(v9.InfluxDb, "checkForUpdate", v15);
                if v13.errorMessage then
                    warn(v13.errorMessage);
                    v12:dispatch(l_SetNetworkingErrorToast_0({
                        HttpError = Enum.HttpError.OK
                    }));
                    return;
                elseif l_appUpdateStatus_0 == Enum.AppUpdateStatus.Available then
                    v12:dispatch(v5(v7:canPerformBinaryUpdate(), false, v6.Default));
                    return;
                elseif l_appUpdateStatus_0 == Enum.AppUpdateStatus.AvailableBoundChannel then
                    v12:dispatch(v5(v7:canPerformBinaryUpdate(), false, v6.InternalChannel));
                    return;
                elseif l_appUpdateStatus_0 == Enum.AppUpdateStatus.AvailableBetaProgram then
                    v12:dispatch(v5(v7:canPerformBinaryUpdate(), false, v6.BetaProgram));
                    return;
                else
                    if v10 then
                        v10();
                    end;
                    return;
                end;
            end);
            return;
        else
            if v10 then
                v10();
            end;
            return;
        end;
    end;
end;