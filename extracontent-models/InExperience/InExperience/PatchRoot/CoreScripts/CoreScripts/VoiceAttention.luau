local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default.participantsUpdate.Event:Connect(function(v5) --[[ Line: 14 ]]
    -- upvalues: l_Players_0 (copy)
    for v6, v7 in pairs(v5) do
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v6);
        if l_l_Players_0_PlayerByUserId_0 then
            l_l_Players_0_PlayerByUserId_0:SetAttribute("RBXAttentionVoiceIsActive", v7.isSignalActive);
        end;
    end;
end);
local function v10() --[[ Line: 23 ]] --[[ Name: setLocalPlayerVideoAnimationEnabled ]]
    -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:SetAttribute("RBXAttentionVideoAnimationEnabled", l_FaceAnimatorService_0.VideoAnimationEnabled);
    end;
end;
local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
if l_LocalPlayer_1 then
    l_LocalPlayer_1:SetAttribute("RBXAttentionVideoAnimationEnabled", l_FaceAnimatorService_0.VideoAnimationEnabled);
end;
l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v10);