local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.SelfView.Analytics).new();
local v3 = require(l_Modules_0.SelfView.publicApi);
local v4 = require(l_Modules_0.SelfView.toggleSelfViewSignal);
return function() --[[ Line: 9 ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    if l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted() then
        l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
        v2:setLastCtx("bubbleChatToggle");
        local v5 = v3.getSelfViewIsOpenAndVisible();
        if l_FaceAnimatorService_0.VideoAnimationEnabled and not v5 then
            v4:fire();
        end;
    end;
end;