local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Modules_0 = l_RobloxGui_0.Modules;
local v8 = require(l_Modules_0.PromptCreator);
local v9 = require(l_Modules_0.SocialUtil);
local v10 = require(l_Modules_0.FriendingUtility);
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v12 = require(l_Modules_0.Common.LegacyThumbnailUrls);
local v13 = require(l_Modules_0.Flags.FFlagRemoveHardCodedFriendLimitPrompt);
local _ = v12.Thumbnail;
local _ = v12.Bust;
local l_Size150x150_0 = Enum.ThumbnailSize.Size150x150;
local l_Size352x352_0 = Enum.ThumbnailSize.Size352x352;
local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
local function _(v20, v21) --[[ Line: 46 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v11 (copy)
    pcall(function() --[[ Line: 47 ]]
        -- upvalues: v21 (ref), v11 (ref), v20 (copy)
        v21 = v11:FormatByKey(v20);
    end);
    return v21;
end;
createFetchImageFunction = function(...) --[[ Line: 53 ]] --[[ Name: createFetchImageFunction ]]
    -- upvalues: v9 (copy)
    local v23 = {
        ...
    };
    return function(v24) --[[ Line: 55 ]]
        -- upvalues: v9 (ref), v23 (copy)
        spawn(function() --[[ Line: 56 ]]
            -- upvalues: v9 (ref), v23 (ref), v24 (copy)
            local v25 = v9.GetPlayerImage(unpack(v23));
            if v24 and v24.Parent then
                v24.Image = v25;
            end;
        end);
    end;
end;
SendFriendRequest = function(v26) --[[ Line: 65 ]] --[[ Name: SendFriendRequest ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref)
    l_RbxAnalyticsService_0:ReportCounter("FriendPlayerPrompt-RequestFriendship");
    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt");
    return (pcall(function() --[[ Line: 69 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v26 (copy)
        l_LocalPlayer_0:RequestFriendship(v26);
    end));
end;
AtFriendLimit = function(v27) --[[ Line: 75 ]] --[[ Name: AtFriendLimit ]]
    -- upvalues: v13 (copy), v10 (copy)
    assert(not v13, "Should not call AtFriendLimit when FFlagRemoveHardCodedFriendLimitPrompt is enabled");
    local l_v10_FriendCountAsync_0 = v10:GetFriendCountAsync(v27.UserId);
    if l_v10_FriendCountAsync_0 == nil then
        return false;
    elseif v10:MaxFriendCount() <= l_v10_FriendCountAsync_0 then
        return true;
    else
        return false;
    end;
end;
DoPromptRequestFriendPlayer = function(v29) --[[ Line: 87 ]] --[[ Name: DoPromptRequestFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref), v13 (copy), v8 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy), v11 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        if l_LocalPlayer_0:IsFriendsWithAsync(v29.UserId) then
            return;
        end;
    elseif l_LocalPlayer_0:IsFriendsWith(v29.UserId) then
        return;
    end;
    local function v33(v30) --[[ Line: 101 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v13 (ref), l_LocalPlayer_0 (ref), v8 (ref), v29 (copy), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
        if v30 then
            if not v13 and AtFriendLimit(l_LocalPlayer_0) then
                while v8:IsCurrentlyPrompting() do
                    wait();
                end;
                v8:CreatePrompt({
                    WindowTitle = "Friend Limit Reached", 
                    MainText = "You can not send a friend request because you are at the max friend limit.", 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v29.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v29.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
                return;
            elseif not v13 and AtFriendLimit(v29) then
                local v31 = string.format("You can not send a friend request to %s because they are at the max friend limit.", v29.Name);
                v8:CreatePrompt({
                    WindowTitle = "Error Sending Friend Request", 
                    MainText = v31, 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v29.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v29.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
                return;
            elseif not SendFriendRequest(v29) then
                while v8:IsCurrentlyPrompting() do
                    wait();
                end;
                local v32 = string.format("An error occurred while sending %s a friend request. Please try again later.", v29.Name);
                v8:CreatePrompt({
                    WindowTitle = "Error Sending Friend Request", 
                    MainText = v32, 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v29.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v29.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
            end;
        end;
    end;
    local v34 = string.format("Would you like to send %s a Friend Request?", v29.Name);
    v8:CreatePrompt({
        WindowTitle = v11:FormatByKey("InGame.FriendPlayerPrompt.Title.SendFriendRequest"), 
        MainText = v34, 
        ConfirmationText = "Send Request", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v29.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v29.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v33
    });
end;
PromptRequestFriendPlayer = function(v35) --[[ Line: 177 ]] --[[ Name: PromptRequestFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptSendFriendRequest can not be called for guests!");
    end;
    if typeof(v35) == "Instance" and v35:IsA("Player") then
        if v35.UserId < 0 then
            error("PromptSendFriendRequest can not be called on guests!");
        end;
        if v35 == l_LocalPlayer_0 then
            error("PromptSendFriendRequest: A user can not friend themselves!");
        end;
        DoPromptRequestFriendPlayer(v35);
        return;
    else
        error("Invalid argument to PromptSendFriendRequest");
        return;
    end;
end;
UnFriendPlayer = function(v36) --[[ Line: 194 ]] --[[ Name: UnFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    return (pcall(function() --[[ Line: 195 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v36 (copy)
        l_LocalPlayer_0:RevokeFriendship(v36);
    end));
end;
DoPromptUnfriendPlayer = function(v37) --[[ Line: 201 ]] --[[ Name: DoPromptUnfriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref), v8 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        if not l_LocalPlayer_0:IsFriendsWithAsync(v37.UserId) then
            return;
        end;
    elseif not l_LocalPlayer_0:IsFriendsWith(v37.UserId) then
        return;
    end;
    local function v40(v38) --[[ Line: 215 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v37 (copy), v8 (ref), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
        if v38 and not UnFriendPlayer(v37) then
            while v8:IsCurrentlyPrompting() do
                wait();
            end;
            local v39 = string.format("An error occurred while unfriending %s. Please try again later.", v37.Name);
            v8:CreatePrompt({
                WindowTitle = "Error Unfriending Person", 
                MainText = v39, 
                ConfirmationText = "Okay", 
                CancelActive = false, 
                Image = "", 
                ImageConsoleVR = "", 
                FetchImageFunction = createFetchImageFunction(v37.UserId, l_Size150x150_0, l_HeadShot_0), 
                FetchImageFunctionConsoleVR = createFetchImageFunction(v37.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                StripeColor = Color3.fromRGB(183, 34, 54)
            });
        end;
    end;
    local v41 = string.format("Would you like to remove %s from your friends list?", v37.Name);
    v8:CreatePrompt({
        WindowTitle = "Unfriend Person?", 
        MainText = v41, 
        ConfirmationText = "Unfriend", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v37.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v37.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v40
    });
end;
PromptUnfriendPlayer = function(v42) --[[ Line: 256 ]] --[[ Name: PromptUnfriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnfriend can not be called for guests!");
    end;
    if typeof(v42) == "Instance" and v42:IsA("Player") then
        if v42.UserId < 0 then
            error("PromptUnfriend can not be called on guests!");
        end;
        if v42 == l_LocalPlayer_0 then
            error("PromptUnfriend: A user can not unfriend themselves!");
        end;
        DoPromptUnfriendPlayer(v42);
        return;
    else
        error("Invalid argument to PromptUnfriend");
        return;
    end;
end;
l_StarterGui_0:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer);