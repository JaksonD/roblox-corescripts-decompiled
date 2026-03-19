local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local v2 = game:DefineFastString("MicrophoneDevicePermissionsLoggingEventName", "microphoneDevicePermissionPrompted");
return {
    _initialized = false, 
    placeId = 0, 
    universeId = 0, 
    placeVoiceEnabled = false, 
    universeVoiceEnabled = false, 
    clientSessionId = "", 
    UIType = {
        EXPERIENCE_JOIN = 0, 
        PROMPT_IMPRESSION = 1, 
        PROMPT_INTERACTION = 2
    }, 
    _init = function(v3, v4, v5) --[[ Line: 56 ]] --[[ Name: _init ]]
        -- upvalues: l_AvatarChatService_0 (copy)
        v3._initialized = true;
        v3.placeId = game.PlaceId;
        v3.universeId = game.GameId;
        v3.placeVoiceEnabled = l_AvatarChatService_0:IsEnabled(v4, Enum.AvatarChatServiceFeature.PlaceAudio);
        v3.universeVoiceEnabled = l_AvatarChatService_0:IsEnabled(v4, Enum.AvatarChatServiceFeature.UniverseAudio);
        v3:logExperienceJoin({
            didAuthorize = v5
        });
    end, 
    _getEventPayload = function(v6, v7, v8) --[[ Line: 68 ]] --[[ Name: _getEventPayload ]]
        return {
            uiType = v7, 
            uiContext = v8.uiContext, 
            didAuthorize = v8.didAuthorize, 
            placeId = v6.placeId, 
            universeId = v6.universeId, 
            placeVoiceEnabled = v6.placeVoiceEnabled, 
            universeVoiceEnabled = v6.universeVoiceEnabled, 
            clientSessionId = v6.clientSessionId
        };
    end, 
    _isReady = function(v9) --[[ Line: 81 ]] --[[ Name: _isReady ]]
        return v9._initialized;
    end, 
    init = function(v10, v11) --[[ Line: 85 ]] --[[ Name: init ]]
        -- upvalues: l_AvatarChatService_0 (copy)
        if l_AvatarChatService_0.ClientFeaturesInitialized then
            v10:_init(l_AvatarChatService_0.ClientFeatures, v11);
            return;
        else
            local v12 = nil;
            v12 = l_AvatarChatService_0:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 90 ]]
                -- upvalues: v10 (copy), l_AvatarChatService_0 (ref), v11 (copy), v12 (ref)
                v10:_init(l_AvatarChatService_0.ClientFeatures, v11);
                v12:Disconnect();
            end);
            return;
        end;
    end, 
    logExperienceJoin = function(v13, v14) --[[ Line: 97 ]] --[[ Name: logExperienceJoin ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v2 (copy)
        if not v13:_isReady() then
            return;
        else
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v2, v13:_getEventPayload(v13.UIType.EXPERIENCE_JOIN, v14));
            return;
        end;
    end, 
    logPromptImpression = function(v15, v16) --[[ Line: 110 ]] --[[ Name: logPromptImpression ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v2 (copy)
        if not v15:_isReady() then
            return;
        else
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v2, v15:_getEventPayload(v15.UIType.PROMPT_IMPRESSION, v16));
            return;
        end;
    end, 
    logPromptInteraction = function(v17, v18) --[[ Line: 123 ]] --[[ Name: logPromptInteraction ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v2 (copy)
        if not v17:_isReady() then
            return;
        else
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v2, v17:_getEventPayload(v17.UIType.PROMPT_INTERACTION, v18));
            return;
        end;
    end, 
    setClientSessionId = function(v19, v20) --[[ Line: 136 ]] --[[ Name: setClientSessionId ]]
        if not v19:_isReady() or v19.clientSessionId == v20 then
            return;
        else
            v19.clientSessionId = v20;
            return;
        end;
    end
};