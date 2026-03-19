local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v7 = {};
v7.__index = v7;
local v8 = game:GetService("ContentProvider").BaseUrl:lower();
v8 = string.gsub(v8, "http:", "https:");
local v9 = string.gsub(v8, "www", "friends") .. "v1/users/{userId}/friends/count";
v7.GetFriendCountAsync = function(_, v11) --[[ Line: 25 ]] --[[ Name: GetFriendCountAsync ]]
    -- upvalues: v9 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local v12 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 28 ]]
        -- upvalues: v9 (ref), v11 (copy), l_HttpRbxApiService_0 (ref)
        local v13 = string.gsub(v9, "{userId}", (tostring(v11)));
        return l_HttpRbxApiService_0:GetAsyncFullUrl(v13);
    end);
    if not l_status_0 then
        print(v9, "failed because", l_result_0);
        return nil;
    else
        l_result_0 = l_HttpService_0:JSONDecode(l_result_0);
        if l_result_0.count then
            v12 = l_result_0.count;
        end;
        return v12;
    end;
end;
v7.MaxFriendCount = function(_) --[[ Line: 46 ]] --[[ Name: MaxFriendCount ]]
    -- upvalues: v5 (copy)
    assert(not v5, "Should not call MaxFriendCount when FFlagRemoveHardCodedFriendLimitPrompt is enabled");
    return 200;
end;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
l_LocalPlayer_0.FriendStatusChanged:connect(function(v19, v20) --[[ Line: 54 ]]
    -- upvalues: l_BindableEvent_0 (copy), l_BindableEvent_1 (copy)
    if v20 == Enum.FriendStatus.Friend then
        l_BindableEvent_0:Fire(v19);
        return;
    else
        if v20 == Enum.FriendStatus.NotFriend then
            l_BindableEvent_1:Fire(v19);
        end;
        return;
    end;
end);
l_StarterGui_0:RegisterGetCore("PlayerFriendedEvent", function() --[[ Line: 62 ]]
    -- upvalues: l_BindableEvent_0 (copy)
    return l_BindableEvent_0;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnfriendedEvent", function() --[[ Line: 63 ]]
    -- upvalues: l_BindableEvent_1 (copy)
    return l_BindableEvent_1;
end);
return v7;