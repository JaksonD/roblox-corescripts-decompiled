local l_CorePackages_0 = game:GetService("CorePackages");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.ReactOtter);
local v6 = require(l_CorePackages_0.Packages.SignalsReact);
local v7 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v9 = require(l_CorePackages_0.Workspace.Packages.DataHydration);
local v10 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_SettingsShowSignal_0 = v7.SettingsShowSignal;
local l_Traversal_0 = v8.Traversal;
local l_DataHydrationTypes_0 = v9.DataHydrationTypes;
local l_getGameInfoStore_0 = v9.Game.getGameInfoStore;
local l_Constants_0 = l_Traversal_0.Constants;
local l_TeleportBackButton_0 = l_Traversal_0.TeleportBackButton;
local l_TraversalTelemetry_0 = l_Traversal_0.TraversalTelemetry;
local l_useHistoryItems_0 = l_Traversal_0.useHistoryItems;
local l_useLocalization_0 = v10.Hooks.useLocalization;
local l_FFlagUseTeleportTraversalHistory_0 = l_Traversal_0.Flags.FFlagUseTeleportTraversalHistory;
local l_FFlagUseLocalTraversalHistory_0 = l_Traversal_0.Flags.FFlagUseLocalTraversalHistory;
local l_FFlagAddTraversalBackButtonAnimation_0 = l_Traversal_0.Flags.FFlagAddTraversalBackButtonAnimation;
local v25 = game:DefineFastFlag("FixTraversalBackButtonAnimation", false);
local v26 = game:DefineFastFlag("FixTraversalBackPlaceName", false);
return v4.memo(function(_) --[[ Line: 37 ]] --[[ Name: TraversalBackButton ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_TeleportService_0 (copy), l_Constants_0 (copy), l_SettingsShowSignal_0 (copy), l_TraversalTelemetry_0 (copy), l_useLocalization_0 (copy), v26 (copy), l_getGameInfoStore_0 (copy), l_DataHydrationTypes_0 (copy), v6 (copy), l_useHistoryItems_0 (copy), l_FFlagUseLocalTraversalHistory_0 (copy), l_FFlagUseTeleportTraversalHistory_0 (copy), v25 (copy), l_FFlagAddTraversalBackButtonAnimation_0 (copy), v5 (copy), l_UserGameSettings_0 (copy), l_View_0 (copy), l_TeleportBackButton_0 (copy)
    local v28 = l_useTokens_0();
    local v29 = v4.useRef(nil);
    local l_l_TeleportService_0_ThirdPartyTeleportInfo_0, v31 = l_TeleportService_0:GetThirdPartyTeleportInfo(false);
    if l_l_TeleportService_0_ThirdPartyTeleportInfo_0 <= l_Constants_0.NO_UNIVERSE_ID or v31 <= l_Constants_0.NO_PLACE_ID then
        return nil;
    else
        local v32, v33 = v4.useState(false);
        v4.useEffect(function() --[[ Line: 47 ]]
            -- upvalues: l_SettingsShowSignal_0 (ref), v33 (copy)
            local v35 = l_SettingsShowSignal_0:connect(function(v34) --[[ Line: 48 ]]
                -- upvalues: v33 (ref)
                v33(v34);
            end);
            return function() --[[ Line: 51 ]]
                -- upvalues: v35 (copy)
                v35:Disconnect();
            end;
        end, {});
        v4.useEffect(function() --[[ Line: 56 ]]
            -- upvalues: v32 (copy), l_TraversalTelemetry_0 (ref), l_l_TeleportService_0_ThirdPartyTeleportInfo_0 (copy)
            if v32 then
                l_TraversalTelemetry_0.sendBackButtonActionEvent({
                    integration_id = "back_button", 
                    destination_universe_id = l_l_TeleportService_0_ThirdPartyTeleportInfo_0, 
                    event_type = "impression"
                });
            end;
        end, {
            v32, 
            l_l_TeleportService_0_ThirdPartyTeleportInfo_0
        });
        local v36 = l_useLocalization_0({
            defaultBackButtonText = "CoreScripts.TopBar.Traversal.BackButtonDefault"
        });
        local v37 = nil;
        if v26 then
            local v42 = v4.useCallback(function(v38) --[[ Line: 72 ]]
                -- upvalues: l_getGameInfoStore_0 (ref), l_l_TeleportService_0_ThirdPartyTeleportInfo_0 (copy), l_DataHydrationTypes_0 (ref), v36 (copy)
                local v39 = l_getGameInfoStore_0(v38).getAndFetchGameInfo((tostring(l_l_TeleportService_0_ThirdPartyTeleportInfo_0)));
                local v40 = v39.data(v38);
                local v41 = v39.status(v38);
                if not v40 or v41 ~= l_DataHydrationTypes_0.DataStatus.Ready then
                    return v36.defaultBackButtonText;
                else
                    return v40.name;
                end;
            end, {
                l_l_TeleportService_0_ThirdPartyTeleportInfo_0, 
                l_getGameInfoStore_0
            });
            v37 = v6.useSignalState(v42);
        else
            local v43 = l_useHistoryItems_0(2);
            v37 = if l_FFlagUseLocalTraversalHistory_0 and typeof(v43[2]) == "table" and v43[2].name then v43[2].name else if l_FFlagUseTeleportTraversalHistory_0 and typeof(v43[1]) == "table" and v43[1].name then v43[1].name else v36.defaultBackButtonText;
        end;
        local v44 = nil;
        if v25 then
            v44 = v4.useRef(nil);
        end;
        local v45 = v28.Size.Size_2500 * 2;
        local v46 = nil;
        local v47 = nil;
        local v48 = nil;
        local v49 = nil;
        local v50 = nil;
        local v51 = nil;
        local v52 = nil;
        if l_FFlagAddTraversalBackButtonAnimation_0 then
            v46 = v4.useRef(nil);
            v47 = v4.useRef(nil);
            if v25 then
                v48 = v4.useRef(nil);
            end;
            local v53 = v4.useMemo(function() --[[ Line: 113 ]]
                -- upvalues: v28 (copy)
                return {
                    duration = v28.Time.Time_300, 
                    easingStyle = v28.Ease.StandardOut
                };
            end, {
                v28
            });
            local v55, v56 = v5.useAnimatedBinding(0, function(v54) --[[ Line: 119 ]]
                -- upvalues: v46 (ref), v25 (ref), v48 (ref), v47 (ref)
                v46.current = nil;
                if v25 then
                    if not v48.current and v47.current and v54 == 1 then
                        v48.current = v47.current;
                    end;
                    if v54 == 0 then
                        v47.current = 0;
                        return;
                    end;
                else
                    v47.current = nil;
                end;
            end);
            v49 = v55;
            v50 = v56;
            v4.useEffect(function() --[[ Line: 132 ]]
                -- upvalues: v32 (copy), v25 (ref), v44 (ref), v37 (ref), v48 (ref), v29 (copy), v50 (ref), v5 (ref), v53 (copy)
                if v32 then
                    if v25 then
                        if v44.current ~= v37 then
                            v48.current = nil;
                            v44.current = v37;
                            if v29.current then
                                v50(v5.ease(0.99, v53));
                            end;
                        else
                            v50(v5.ease(1, v53));
                        end;
                    else
                        v50(v5.ease(1, v53));
                    end;
                else
                    v50(v5.ease(0, v53));
                end;
                if v25 and v44.current == nil then
                    v44.current = v37;
                end;
            end, {
                v32, 
                v53, 
                v37
            });
            v51 = v4.useCallback(function(v57) --[[ Line: 155 ]]
                -- upvalues: v25 (ref), v48 (ref), v32 (copy), v29 (copy), v46 (ref), v47 (ref), v45 (copy)
                if v25 then
                    if v48.current then
                        return UDim2.new(0, v57 * v48.current, 0, 0);
                    else
                        local v58 = nil;
                        if v32 and v29.current then
                            local l_X_0 = v29.current.AbsoluteSize.X;
                            if not v46.current then
                                v46.current = v29.current.AbsoluteSize.X;
                            end;
                            if v47.current and l_X_0 <= v47.current then
                                return UDim2.new(0, if v25 then l_X_0 else v47.current, 0, 0);
                            else
                                if v46.current and v46.current ~= l_X_0 then
                                    v47.current = l_X_0;
                                end;
                                v58 = v57 * v45;
                            end;
                        else
                            v58 = v57 * (v47.current or v45);
                        end;
                        return UDim2.new(0, v58, 0, 0);
                    end;
                else
                    if v32 and v29.current then
                        local l_X_1 = v29.current.AbsoluteSize.X;
                        if not v46.current then
                            v46.current = v29.current.AbsoluteSize.X;
                        end;
                        if v47.current and l_X_1 <= v47.current then
                            return UDim2.new(0, v47.current, 0, 0);
                        elseif v46.current and v46.current ~= l_X_1 then
                            v47.current = l_X_1;
                        end;
                    end;
                    local v61 = v57 * v45;
                    return UDim2.new(0, v61, 0, 0);
                end;
            end, {
                v32
            });
            v52 = v4.useCallback(function(v62) --[[ Line: 195 ]]
                -- upvalues: v32 (copy)
                local v63 = true;
                if v62 <= 0 then
                    v63 = v32;
                end;
                return v63;
            end, {
                v32
            });
        end;
        if l_FFlagAddTraversalBackButtonAnimation_0 and not l_UserGameSettings_0.ReducedMotion then
            return v4.createElement(l_View_0, {
                tag = "auto-y", 
                Visible = v49:map(v52), 
                Size = v49:map(v51), 
                ZIndex = -1
            }, {
                TraversalBackButton = v4.createElement(l_TeleportBackButton_0, {
                    text = v37, 
                    textLimitWidth = v45, 
                    ref = v29
                })
            });
        else
            return v32 and v4.createElement(l_View_0, {
                tag = "auto-xy shrink"
            }, {
                TraversalBackButton = v4.createElement(l_TeleportBackButton_0, {
                    text = v37, 
                    textLimitWidth = v45, 
                    ref = v29
                })
            });
        end;
    end;
end);