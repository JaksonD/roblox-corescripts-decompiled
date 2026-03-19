local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("GuiService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = game:GetService("UserInputService");
local _ = game:GetService("Players");
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent;
local v9 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v11 = {};
v11.__index = v11;
v11.new = function() --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v11 (copy), l_game_EngineFeature_0 (copy), v7 (copy), v9 (copy)
    local v12 = setmetatable({
        _target = "client", 
        _context = "topbar", 
        _defaultProps = {
            universeid = tostring(game.GameId), 
            placeid = tostring(game.PlaceId), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId()
        }
    }, v11);
    if l_game_EngineFeature_0 then
        v12._defaultProps.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v12._sendEvent = function(v13, v14) --[[ Line: 59 ]]
        -- upvalues: v7 (ref), v12 (copy), l_RbxAnalyticsService_0 (ref)
        local v15 = v7.Dictionary.join(v12._defaultProps, v14 or {});
        l_RbxAnalyticsService_0:SendEventDeferred(v12._target, v12._context, v13, v15);
        return nil;
    end;
    v12._onButtonActivated = function(v16, v17) --[[ Line: 65 ]]
        -- upvalues: v12 (copy), v9 (ref)
        return v12._sendEvent(v9.Analytics.EventNameTopBarButtonActivated, {
            button = v16, 
            status = if v17 then v9.Analytics.StatusActive else v9.Analytics.StatusInactive
        });
    end;
    return v12;
end;
v11.onChatButtonActivated = function(v18, v19) --[[ Line: 75 ]] --[[ Name: onChatButtonActivated ]]
    -- upvalues: v9 (copy)
    return v18._onButtonActivated(v9.Analytics.ChatButtonName, v19);
end;
v11.onMoreMenuActivated = function(v20) --[[ Line: 79 ]] --[[ Name: onMoreMenuActivated ]]
    -- upvalues: v9 (copy)
    return v20._onButtonActivated(v9.Analytics.MoreMenuButtonName, true);
end;
v11.onInventoryActivated = function(v21, v22) --[[ Line: 84 ]] --[[ Name: onInventoryActivated ]]
    -- upvalues: v9 (copy)
    return v21._onButtonActivated(v9.Analytics.InventoryButtonName, v22);
end;
v11.onLeaderboardActivated = function(v23, v24) --[[ Line: 88 ]] --[[ Name: onLeaderboardActivated ]]
    -- upvalues: v9 (copy)
    return v23._onButtonActivated(v9.Analytics.LeaderboardButtonName, v24);
end;
v11.onEmotesActivated = function(v25, v26) --[[ Line: 92 ]] --[[ Name: onEmotesActivated ]]
    -- upvalues: v9 (copy)
    return v25._onButtonActivated(v9.Analytics.EmotesButtonName, v26);
end;
v11.onShowGamepadNavigationDialog = function(v27) --[[ Line: 96 ]] --[[ Name: onShowGamepadNavigationDialog ]]
    -- upvalues: v9 (copy)
    return v27._sendEvent(v9.Analytics.ShowGamepadNavigationDialog);
end;
v11.onDismissGamepadNavigationDialog = function(v28) --[[ Line: 100 ]] --[[ Name: onDismissGamepadNavigationDialog ]]
    -- upvalues: v9 (copy)
    return v28._sendEvent(v9.Analytics.DismissGamepadNavigationDialog);
end;
v11.default = v11.new();
return v11;