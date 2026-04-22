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
local v12 = require(l_CorePackages_0.Workspace.Packages.UserRelationshipModals);
local v13 = require(l_Modules_0.Common.LegacyThumbnailUrls);
local v14 = require(l_Modules_0.Flags.FFlagRemoveHardCodedFriendLimitPrompt);
local v15 = game:DefineFastFlag("FriendRequestModalRevamp", false);
local _ = v13.Thumbnail;
local _ = v13.Bust;
local l_Size150x150_0 = Enum.ThumbnailSize.Size150x150;
local l_Size352x352_0 = Enum.ThumbnailSize.Size352x352;
local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
local function _(v22, v23) --[[ Line: 48 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v11 (copy)
    pcall(function() --[[ Line: 49 ]]
        -- upvalues: v23 (ref), v11 (ref), v22 (copy)
        v23 = v11:FormatByKey(v22);
    end);
    return v23;
end;
createFetchImageFunction = function(...) --[[ Line: 55 ]] --[[ Name: createFetchImageFunction ]]
    -- upvalues: v9 (copy)
    local v25 = {
        ...
    };
    return function(v26) --[[ Line: 57 ]]
        -- upvalues: v9 (ref), v25 (copy)
        spawn(function() --[[ Line: 58 ]]
            -- upvalues: v9 (ref), v25 (ref), v26 (copy)
            local v27 = v9.GetPlayerImage(unpack(v25));
            if v26 and v26.Parent then
                v26.Image = v27;
            end;
        end);
    end;
end;
SendFriendRequest = function(v28) --[[ Line: 67 ]] --[[ Name: SendFriendRequest ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref)
    l_RbxAnalyticsService_0:ReportCounter("FriendPlayerPrompt-RequestFriendship");
    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt");
    return (pcall(function() --[[ Line: 71 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v28 (copy)
        l_LocalPlayer_0:RequestFriendship(v28);
    end));
end;
AtFriendLimit = function(v29) --[[ Line: 77 ]] --[[ Name: AtFriendLimit ]]
    -- upvalues: v14 (copy), v10 (copy)
    assert(not v14, "Should not call AtFriendLimit when FFlagRemoveHardCodedFriendLimitPrompt is enabled");
    local l_v10_FriendCountAsync_0 = v10:GetFriendCountAsync(v29.UserId);
    if l_v10_FriendCountAsync_0 == nil then
        return false;
    elseif v10:MaxFriendCount() <= l_v10_FriendCountAsync_0 then
        return true;
    else
        return false;
    end;
end;
DoPromptRequestFriendPlayer = function(v31) --[[ Line: 89 ]] --[[ Name: DoPromptRequestFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref), v15 (copy), v12 (copy), v14 (copy), v8 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy), v11 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        if l_LocalPlayer_0:IsFriendsWithAsync(v31.UserId) then
            return;
        end;
    elseif l_LocalPlayer_0:IsFriendsWith(v31.UserId) then
        return;
    end;
    if v15 then
        v12.launchPromptFriendRequestModal(v31.UserId);
        return;
    else
        local function v35(v32) --[[ Line: 108 ]] --[[ Name: promptCompletedCallback ]]
            -- upvalues: v14 (ref), l_LocalPlayer_0 (ref), v8 (ref), v31 (copy), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
            if v32 then
                if not v14 and AtFriendLimit(l_LocalPlayer_0) then
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
                        FetchImageFunction = createFetchImageFunction(v31.UserId, l_Size150x150_0, l_HeadShot_0), 
                        FetchImageFunctionConsoleVR = createFetchImageFunction(v31.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                        StripeColor = Color3.fromRGB(183, 34, 54)
                    });
                    return;
                elseif not v14 and AtFriendLimit(v31) then
                    local v33 = string.format("You can not send a friend request to %s because they are at the max friend limit.", v31.Name);
                    v8:CreatePrompt({
                        WindowTitle = "Error Sending Friend Request", 
                        MainText = v33, 
                        ConfirmationText = "Okay", 
                        CancelActive = false, 
                        Image = "", 
                        ImageConsoleVR = "", 
                        FetchImageFunction = createFetchImageFunction(v31.UserId, l_Size150x150_0, l_HeadShot_0), 
                        FetchImageFunctionConsoleVR = createFetchImageFunction(v31.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                        StripeColor = Color3.fromRGB(183, 34, 54)
                    });
                    return;
                elseif not SendFriendRequest(v31) then
                    while v8:IsCurrentlyPrompting() do
                        wait();
                    end;
                    local v34 = string.format("An error occurred while sending %s a friend request. Please try again later.", v31.Name);
                    v8:CreatePrompt({
                        WindowTitle = "Error Sending Friend Request", 
                        MainText = v34, 
                        ConfirmationText = "Okay", 
                        CancelActive = false, 
                        Image = "", 
                        ImageConsoleVR = "", 
                        FetchImageFunction = createFetchImageFunction(v31.UserId, l_Size150x150_0, l_HeadShot_0), 
                        FetchImageFunctionConsoleVR = createFetchImageFunction(v31.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                        StripeColor = Color3.fromRGB(183, 34, 54)
                    });
                end;
            end;
        end;
        local v36 = string.format("Would you like to send %s a Friend Request?", v31.Name);
        v8:CreatePrompt({
            WindowTitle = v11:FormatByKey("InGame.FriendPlayerPrompt.Title.SendFriendRequest"), 
            MainText = v36, 
            ConfirmationText = "Send Request", 
            CancelText = "Cancel", 
            CancelActive = true, 
            Image = "", 
            ImageConsoleVR = "", 
            FetchImageFunction = createFetchImageFunction(v31.UserId, l_Size150x150_0, l_HeadShot_0), 
            FetchImageFunctionConsoleVR = createFetchImageFunction(v31.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
            PromptCompletedCallback = v35
        });
        return;
    end;
end;
PromptRequestFriendPlayer = function(v37) --[[ Line: 184 ]] --[[ Name: PromptRequestFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptSendFriendRequest can not be called for guests!");
    end;
    if typeof(v37) == "Instance" and v37:IsA("Player") then
        if v37.UserId < 0 then
            error("PromptSendFriendRequest can not be called on guests!");
        end;
        if v37 == l_LocalPlayer_0 then
            error("PromptSendFriendRequest: A user can not friend themselves!");
        end;
        DoPromptRequestFriendPlayer(v37);
        return;
    else
        error("Invalid argument to PromptSendFriendRequest");
        return;
    end;
end;
UnFriendPlayer = function(v38) --[[ Line: 201 ]] --[[ Name: UnFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    return (pcall(function() --[[ Line: 202 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v38 (copy)
        l_LocalPlayer_0:RevokeFriendship(v38);
    end));
end;
DoPromptUnfriendPlayer = function(v39) --[[ Line: 208 ]] --[[ Name: DoPromptUnfriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref), v8 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        if not l_LocalPlayer_0:IsFriendsWithAsync(v39.UserId) then
            return;
        end;
    elseif not l_LocalPlayer_0:IsFriendsWith(v39.UserId) then
        return;
    end;
    local function v42(v40) --[[ Line: 222 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v39 (copy), v8 (ref), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
        if v40 and not UnFriendPlayer(v39) then
            while v8:IsCurrentlyPrompting() do
                wait();
            end;
            local v41 = string.format("An error occurred while unfriending %s. Please try again later.", v39.Name);
            v8:CreatePrompt({
                WindowTitle = "Error Unfriending Person", 
                MainText = v41, 
                ConfirmationText = "Okay", 
                CancelActive = false, 
                Image = "", 
                ImageConsoleVR = "", 
                FetchImageFunction = createFetchImageFunction(v39.UserId, l_Size150x150_0, l_HeadShot_0), 
                FetchImageFunctionConsoleVR = createFetchImageFunction(v39.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                StripeColor = Color3.fromRGB(183, 34, 54)
            });
        end;
    end;
    local v43 = string.format("Would you like to remove %s from your friends list?", v39.Name);
    v8:CreatePrompt({
        WindowTitle = "Unfriend Person?", 
        MainText = v43, 
        ConfirmationText = "Unfriend", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v39.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v39.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v42
    });
end;
PromptUnfriendPlayer = function(v44) --[[ Line: 263 ]] --[[ Name: PromptUnfriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnfriend can not be called for guests!");
    end;
    if typeof(v44) == "Instance" and v44:IsA("Player") then
        if v44.UserId < 0 then
            error("PromptUnfriend can not be called on guests!");
        end;
        if v44 == l_LocalPlayer_0 then
            error("PromptUnfriend: A user can not unfriend themselves!");
        end;
        DoPromptUnfriendPlayer(v44);
        return;
    else
        error("Invalid argument to PromptUnfriend");
        return;
    end;
end;
l_StarterGui_0:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer);