local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.NotificationModalsManager);
local v2 = require(script.Parent.Components.NotificationsUpsellModal);
local l_GetGameNameAndDescription_0 = require(l_Parent_0.GameDetailRodux).GetGameNameAndDescription;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v6 = require(script.Parent.Analytics.ModalEventConstants);
local v7 = require(l_Parent_0.HttpRequest);
local v8 = v7.config({
    requestFunction = v7.requestFunctions.HttpRbxApi, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("SetupNotificationsUpsellHttpRetryCount", 4) else nil
});
local v9 = game:DefineFastFlag("NotificationsUpsellDisableBackgroundDismiss", false);
local function v18(v10) --[[ Line: 22 ]] --[[ Name: openModal ]]
    -- upvalues: l_sendEventDeferred_0 (copy), v6 (copy), v1 (copy), l_GetGameNameAndDescription_0 (copy), v8 (copy), v2 (copy), v9 (copy)
    local function v11() --[[ Line: 23 ]]
        -- upvalues: l_sendEventDeferred_0 (ref), v6 (ref), v10 (copy)
        game:GetService("ExperienceNotificationService"):InvokeOptInPromptClosed();
        l_sendEventDeferred_0(v6.ModalContext, v6.OptInEventName, {
            [v6.ActionType] = v6.Closed, 
            [v6.UniverseId] = v10
        });
    end;
    local function v12() --[[ Line: 30 ]]
        -- upvalues: v1 (ref)
        v1.CloseModal("UENUpsell");
    end;
    local v13 = false;
    local v14 = nil;
    if v10 ~= "0" and v10 ~= "" then
        local v16, v17 = l_GetGameNameAndDescription_0(v8, v10):andThen(function(v15) --[[ Line: 36 ]]
            return v15 and v15.Name;
        end, function() --[[ Line: 38 ]]
            return nil;
        end):await();
        v13 = v16;
        v14 = v17;
    end;
    l_sendEventDeferred_0(v6.ModalContext, v6.OptInEventName, {
        [v6.ActionType] = v6.Opened, 
        [v6.UniverseId] = v10
    });
    v1.OpenModal("UENUpsell", v2, {
        CloseCallback = v11, 
        Props = {
            CloseModal = v12, 
            ExperienceId = v10, 
            ExperienceName = if v13 then v14 else nil
        }, 
        DisableBackgroundDismiss = v9 and true or nil
    });
end;
return function() --[[ Line: 59 ]]
    -- upvalues: v18 (copy)
    game:GetService("ExperienceNotificationService").PromptOptInRequested:Connect(function() --[[ Line: 60 ]]
        -- upvalues: v18 (ref)
        v18((tostring(game.GameId)));
    end);
end;