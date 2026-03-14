local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_AccountService_0 = game:GetService("AccountService");
local l_game_EngineFeature_0 = game:GetEngineFeature("MagicLogin");
local l_useEffect_0 = require(l_Parent_0.React).useEffect;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v8 = require(l_script_FirstAncestor_0.Components.Constants);
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v12 = require(l_Parent_0.t);
return function(v13) --[[ Line: 25 ]] --[[ Name: MagicLoginApprovePopupEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), l_AccountService_0 (ref), l_game_EngineFeature_0 (ref), l_useEffect_0 (copy), l_HttpService_0 (copy), v8 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_Logger_0 (copy), l_MessageBus_0 (copy), v12 (copy)
    local v14 = v13.useDispatch or l_useDispatch_0();
    l_AccountService_0 = v13.AccountService or l_AccountService_0;
    l_game_EngineFeature_0 = v13.MagicLoginEngineFeature or l_game_EngineFeature_0;
    l_useEffect_0(function() --[[ Line: 31 ]]
        -- upvalues: l_AccountService_0 (ref), l_game_EngineFeature_0 (ref), l_HttpService_0 (ref), v8 (ref), v14 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_Logger_0 (ref), l_MessageBus_0 (ref), v12 (ref)
        local v15 = nil;
        local v16 = nil;
        if l_AccountService_0 and l_game_EngineFeature_0 then
            v15 = l_AccountService_0.MagicLoginEvent:Connect(function(v17) --[[ Line: 36 ]]
                -- upvalues: l_HttpService_0 (ref), v8 (ref), v14 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_Logger_0 (ref)
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v17);
                if l_status_0 then
                    if l_result_0.magicLoginActionKey == v8.CONNECTION_INIT then
                        v14(l_SetCentralOverlay_0(l_CentralOverlayType_0.MagicLoginApprovePopup, {
                            endpointName = l_result_0.endpointName, 
                            endpointType = l_result_0.endpointType, 
                            authenticationDigits = l_result_0.authenticationDigits, 
                            authCode = l_result_0.code
                        }));
                        return;
                    end;
                else
                    l_Logger_0:warning("Magic login Failed to parse JSON data from string: " .. v17);
                end;
            end);
            v16 = l_MessageBus_0.Subscriber.new();
            v16:subscribe({
                mid = l_MessageBus_0.getMessageId("Game", "onGameLeave"), 
                validateParams = v12.table
            }, function(_) --[[ Line: 57 ]]
                -- upvalues: l_AccountService_0 (ref), v8 (ref)
                l_AccountService_0:MagicLogin(v8.START_ADVERTISEMENT);
            end);
            v16:subscribe({
                mid = l_MessageBus_0.getMessageId("Game", "launchSuccess"), 
                validateParams = v12.table
            }, function(_) --[[ Line: 64 ]]
                -- upvalues: l_AccountService_0 (ref), v8 (ref)
                l_AccountService_0:MagicLogin(v8.STOP_ADVERTISEMENT);
            end);
        end;
        return function() --[[ Line: 68 ]]
            -- upvalues: v15 (ref), v16 (ref)
            if v15 then
                v15:Disconnect();
            end;
            if v16 then
                v16:unsubscribeFromAllMessages();
            end;
        end;
    end, {});
    return nil;
end;