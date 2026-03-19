local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppUpdate");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local l_joinGamePlayButton_0 = require(l_Parent_0.DiscoveryAnalytics).Points.joinGamePlayButton;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v5 = require(l_script_FirstAncestor_0.Thunks.OpenCentralOverlayForUpdateRequiredPrompt);
local v6 = require(l_script_FirstAncestor_0.UpdateMessageType);
local l_game_EngineFeature_0 = game:GetEngineFeature("NewCallbackForBetaProgramEngineFeature");
return function(v8, v9, v10, v11, v12) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), l_joinGamePlayButton_0 (copy), l_SetNetworkingErrorToast_0 (copy), l_game_EngineFeature_0 (copy), v5 (copy), v6 (copy)
    return function(v13) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v11 (copy), v9 (copy), v12 (copy), v2 (ref), l_joinGamePlayButton_0 (ref), v10 (copy), l_SetNetworkingErrorToast_0 (ref), l_game_EngineFeature_0 (ref), v5 (ref), v6 (ref)
        if v8 == nil then
            warn("appUpdateImpl is nil");
            if v11 then
                v11();
            end;
            return;
        elseif not v9 or v8:canPerformBinaryUpdate() then
            v8:checkForUpdate():andThen(function(v14) --[[ Line: 29 ]]
                -- upvalues: v12 (ref), v2 (ref), l_joinGamePlayButton_0 (ref), v10 (ref), v13 (copy), l_SetNetworkingErrorToast_0 (ref), l_game_EngineFeature_0 (ref), v5 (ref), v8 (ref), v6 (ref), v11 (ref)
                local l_appUpdateStatus_0 = v14.appUpdateStatus;
                local v16 = {
                    appUpdateStatus = l_appUpdateStatus_0
                };
                if v12 then
                    v16 = v2.join(v16, v12);
                end;
                l_joinGamePlayButton_0(v10.InfluxDb, "checkForUpdate", v16);
                if v14.errorMessage then
                    warn(v14.errorMessage);
                    v13:dispatch(l_SetNetworkingErrorToast_0({
                        HttpError = Enum.HttpError.OK
                    }));
                    return;
                elseif l_appUpdateStatus_0 == Enum.AppUpdateStatus.Available then
                    if l_game_EngineFeature_0 then
                        v13:dispatch(v5(v8:canPerformBinaryUpdate(), false, v6.Default));
                        return;
                    else
                        v13:dispatch(v5(v8:canPerformBinaryUpdate(), false));
                        return;
                    end;
                elseif l_appUpdateStatus_0 == Enum.AppUpdateStatus.AvailableBoundChannel then
                    if l_game_EngineFeature_0 then
                        v13:dispatch(v5(v8:canPerformBinaryUpdate(), false, v6.InternalChannel));
                        return;
                    else
                        v13:dispatch(v5(v8:canPerformBinaryUpdate(), true));
                        return;
                    end;
                elseif l_game_EngineFeature_0 and l_appUpdateStatus_0 == Enum.AppUpdateStatus.AvailableBetaProgram then
                    v13:dispatch(v5(v8:canPerformBinaryUpdate(), false, v6.BetaProgram));
                    return;
                else
                    if v11 then
                        v11();
                    end;
                    return;
                end;
            end);
            return;
        else
            if v11 then
                v11();
            end;
            return;
        end;
    end;
end;