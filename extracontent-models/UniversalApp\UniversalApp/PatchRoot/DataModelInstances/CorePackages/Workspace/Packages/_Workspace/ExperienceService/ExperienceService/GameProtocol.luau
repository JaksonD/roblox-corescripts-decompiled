local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Cryo);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local _ = require(script.Parent.GameProtocolTypes);
local v7 = require(script.Parent.Flags.GetFFlagMoveLuaExpLaunchBegin);
local v8 = v3.strictInterface({
    placeId = v3.optional(v3.number), 
    userId = v3.optional(v3.number), 
    accessCode = v3.optional(v3.string), 
    gameInstanceId = v3.optional(v3.string), 
    linkCode = v3.optional(v3.string), 
    referralPage = v3.optional(v3.string), 
    launchData = v3.optional(v3.string), 
    eventId = v3.optional(v3.string), 
    referredByPlayerId = v3.optional(v3.number), 
    joinAttemptOrigin = v3.optional(v3.string), 
    joinAttemptId = v3.string
});
local v10 = {
    GAME_LAUNCH_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Game", "launch"), 
        validateParams = v3.intersection(v8, function(v9) --[[ Line: 45 ]] --[[ Name: checkRequiredParams ]]
            return v9.placeId or v9.userId;
        end)
    }
};
v10.__index = v10;
v10.new = function() --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v10 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v10));
end;
v10.launchGame = function(v11, v12, v13, v14) --[[ Line: 64 ]] --[[ Name: launchGame ]]
    -- upvalues: l_HttpService_0 (copy), v4 (copy), v7 (copy), l_default_0 (copy), l_MessageBus_0 (copy)
    if type(v12.placeId) == "string" then
        v12.placeId = tonumber(v12.placeId);
    end;
    if type(v12.userId) == "string" then
        v12.userId = tonumber(v12.userId);
    end;
    local v15 = if v12.joinAttemptId ~= nil then v12.joinAttemptId else l_HttpService_0:GenerateGUID(false);
    v12 = v4.Dictionary.join(v12, {
        joinAttemptId = v15, 
        joinAttemptOrigin = if v13 ~= nil then v13 else v12.joinAttemptOrigin
    });
    if v14 then
        v14(v15);
    end;
    if v7() then
        l_default_0:logEvent("experience_launch_begin");
    end;
    l_MessageBus_0.publish(v11.GAME_LAUNCH_DESCRIPTOR, v12);
end;
v10.default = v10.new();
return v10;