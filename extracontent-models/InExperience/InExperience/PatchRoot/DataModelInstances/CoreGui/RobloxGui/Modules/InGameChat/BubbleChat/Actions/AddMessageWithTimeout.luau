local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(script.Parent.Parent.Types);
local v4 = require(script.Parent.Parent.Helpers.maybeAssert);
local v5 = require(script.Parent.AddMessage);
local v6 = require(script.Parent.RemoveMessage);
local v7 = require(script.Parent.Parent.Helpers.getSettingsForMessage);
local v8 = game:DefineFastInt("BubbleChatAddMessageRolloutPercent", 100);
return function(v9) --[[ Line: 13 ]] --[[ Name: addMessageWithTimeout ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), v7 (copy), v6 (copy), l_RbxAnalyticsService_0 (copy), v8 (copy)
    v4(v3.IMessage(v9));
    return function(v10) --[[ Line: 16 ]]
        -- upvalues: v5 (ref), v9 (copy), v7 (ref), v6 (ref), l_RbxAnalyticsService_0 (ref), v8 (ref)
        v10:dispatch(v5(v9));
        local v11 = v7(v10:getState().chatSettings, v9);
        local v12 = v10:getState().userMessages[v9.userId];
        local l_messages_0 = v10:getState().messages;
        for v14 = 1, #v12 - v11.MaxBubbles do
            v10:dispatch(v6(l_messages_0[v12[v14]]));
        end;
        l_RbxAnalyticsService_0:ReportCounter("RoactBubbleChat-MessagesSent");
        if v8 >= math.random(1, 100) then
            l_RbxAnalyticsService_0:SendEventDeferred("client", "bubbleChatMetric", "messageAdded", {
                placeId = game.PlaceId, 
                senderUserId = v9.userId
            });
        end;
        wait(v11.BubbleDuration);
        v10:dispatch(v6(v9));
    end;
end;