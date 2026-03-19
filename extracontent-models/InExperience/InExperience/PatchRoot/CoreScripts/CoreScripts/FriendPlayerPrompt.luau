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
local l_status_0, l_result_0 = pcall(function() --[[ Line: 46 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v22 = l_status_0 and l_result_0;
local function _(v23, v24) --[[ Line: 49 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v11 (copy)
    pcall(function() --[[ Line: 50 ]]
        -- upvalues: v24 (ref), v11 (ref), v23 (copy)
        v24 = v11:FormatByKey(v23);
    end);
    return v24;
end;
createFetchImageFunction = function(...) --[[ Line: 56 ]] --[[ Name: createFetchImageFunction ]]
    -- upvalues: v9 (copy)
    local v26 = {
        ...
    };
    return function(v27) --[[ Line: 58 ]]
        -- upvalues: v9 (ref), v26 (copy)
        spawn(function() --[[ Line: 59 ]]
            -- upvalues: v9 (ref), v26 (ref), v27 (copy)
            local v28 = v9.GetPlayerImage(unpack(v26));
            if v27 and v27.Parent then
                v27.Image = v28;
            end;
        end);
    end;
end;
SendFriendRequest = function(v29) --[[ Line: 68 ]] --[[ Name: SendFriendRequest ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref)
    l_RbxAnalyticsService_0:ReportCounter("FriendPlayerPrompt-RequestFriendship");
    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt");
    return (pcall(function() --[[ Line: 72 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v29 (copy)
        l_LocalPlayer_0:RequestFriendship(v29);
    end));
end;
AtFriendLimit = function(v30) --[[ Line: 78 ]] --[[ Name: AtFriendLimit ]]
    -- upvalues: v13 (copy), v10 (copy)
    assert(not v13, "Should not call AtFriendLimit when FFlagRemoveHardCodedFriendLimitPrompt is enabled");
    local l_v10_FriendCountAsync_0 = v10:GetFriendCountAsync(v30.UserId);
    if l_v10_FriendCountAsync_0 == nil then
        return false;
    elseif v10:MaxFriendCount() <= l_v10_FriendCountAsync_0 then
        return true;
    else
        return false;
    end;
end;
DoPromptRequestFriendPlayer = function(v32) --[[ Line: 90 ]] --[[ Name: DoPromptRequestFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref), v13 (copy), v8 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy), v22 (copy), v11 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        if l_LocalPlayer_0:IsFriendsWithAsync(v32.UserId) then
            return;
        end;
    elseif l_LocalPlayer_0:IsFriendsWith(v32.UserId) then
        return;
    end;
    local function v48(v33) --[[ Line: 104 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v13 (ref), l_LocalPlayer_0 (ref), v8 (ref), v32 (copy), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref), v22 (ref), v11 (ref)
        if v33 then
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
                    FetchImageFunction = createFetchImageFunction(v32.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v32.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
                return;
            elseif not v13 and AtFriendLimit(v32) then
                local v34 = string.format("You can not send a friend request to %s because they are at the max friend limit.", v32.Name);
                if v22 then
                    local l_gsub_0 = string.gsub;
                    local l_v34_0 = v34;
                    local l_pcall_0 = pcall;
                    local v38 = "InGame.FriendPlayerPrompt.promptCompletedCallback.AtFriendLimit";
                    local v39;
                    do
                        local l_l_v34_0_0 = l_v34_0;
                        l_pcall_0(function() --[[ Line: 50 ]]
                            -- upvalues: l_l_v34_0_0 (ref), v11 (ref), v38 (copy)
                            l_l_v34_0_0 = v11:FormatByKey(v38);
                        end);
                        v39 = l_l_v34_0_0;
                    end;
                    v34 = l_gsub_0(v39, "{RBX_NAME}", v32.Name);
                end;
                v8:CreatePrompt({
                    WindowTitle = "Error Sending Friend Request", 
                    MainText = v34, 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v32.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v32.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
                return;
            elseif not SendFriendRequest(v32) then
                while v8:IsCurrentlyPrompting() do
                    wait();
                end;
                local v41 = string.format("An error occurred while sending %s a friend request. Please try again later.", v32.Name);
                if v22 then
                    local l_gsub_1 = string.gsub;
                    local l_v41_0 = v41;
                    local l_pcall_1 = pcall;
                    local v45 = "InGame.FriendPlayerPrompt.promptCompletedCallback.UnknownError";
                    local v46;
                    do
                        local l_l_v41_0_0 = l_v41_0;
                        l_pcall_1(function() --[[ Line: 50 ]]
                            -- upvalues: l_l_v41_0_0 (ref), v11 (ref), v45 (copy)
                            l_l_v41_0_0 = v11:FormatByKey(v45);
                        end);
                        v46 = l_l_v41_0_0;
                    end;
                    v41 = l_gsub_1(v46, "{RBX_NAME}", v32.Name);
                end;
                v8:CreatePrompt({
                    WindowTitle = "Error Sending Friend Request", 
                    MainText = v41, 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v32.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v32.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
            end;
        end;
    end;
    local v49 = string.format("Would you like to send %s a Friend Request?", v32.Name);
    if v22 then
        local l_gsub_2 = string.gsub;
        local l_v49_0 = v49;
        local l_pcall_2 = pcall;
        local v53 = "InGame.FriendPlayerPrompt.DoPromptRequestFriendPlayer";
        local v54;
        do
            local l_l_v49_0_0 = l_v49_0;
            l_pcall_2(function() --[[ Line: 50 ]]
                -- upvalues: l_l_v49_0_0 (ref), v11 (ref), v53 (copy)
                l_l_v49_0_0 = v11:FormatByKey(v53);
            end);
            v54 = l_l_v49_0_0;
        end;
        v49 = l_gsub_2(v54, "{RBX_NAME}", v32.Name);
    end;
    v8:CreatePrompt({
        WindowTitle = v11:FormatByKey("InGame.FriendPlayerPrompt.Title.SendFriendRequest"), 
        MainText = v49, 
        ConfirmationText = "Send Request", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v32.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v32.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v48
    });
end;
PromptRequestFriendPlayer = function(v56) --[[ Line: 200 ]] --[[ Name: PromptRequestFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptSendFriendRequest can not be called for guests!");
    end;
    if typeof(v56) == "Instance" and v56:IsA("Player") then
        if v56.UserId < 0 then
            error("PromptSendFriendRequest can not be called on guests!");
        end;
        if v56 == l_LocalPlayer_0 then
            error("PromptSendFriendRequest: A user can not friend themselves!");
        end;
        DoPromptRequestFriendPlayer(v56);
        return;
    else
        error("Invalid argument to PromptSendFriendRequest");
        return;
    end;
end;
UnFriendPlayer = function(v57) --[[ Line: 217 ]] --[[ Name: UnFriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    return (pcall(function() --[[ Line: 218 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v57 (copy)
        l_LocalPlayer_0:RevokeFriendship(v57);
    end));
end;
DoPromptUnfriendPlayer = function(v58) --[[ Line: 224 ]] --[[ Name: DoPromptUnfriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref), v8 (copy), v22 (copy), v11 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        if not l_LocalPlayer_0:IsFriendsWithAsync(v58.UserId) then
            return;
        end;
    elseif not l_LocalPlayer_0:IsFriendsWith(v58.UserId) then
        return;
    end;
    local function v67(v59) --[[ Line: 238 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v58 (copy), v8 (ref), v22 (ref), v11 (ref), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
        if v59 and not UnFriendPlayer(v58) then
            while v8:IsCurrentlyPrompting() do
                wait();
            end;
            local v60 = string.format("An error occurred while unfriending %s. Please try again later.", v58.Name);
            if v22 then
                local l_gsub_3 = string.gsub;
                local l_v60_0 = v60;
                local l_pcall_3 = pcall;
                local v64 = "InGame.FriendPlayerPrompt.promptCompletedCallback.UnknownError";
                local v65;
                do
                    local l_l_v60_0_0 = l_v60_0;
                    l_pcall_3(function() --[[ Line: 50 ]]
                        -- upvalues: l_l_v60_0_0 (ref), v11 (ref), v64 (copy)
                        l_l_v60_0_0 = v11:FormatByKey(v64);
                    end);
                    v65 = l_l_v60_0_0;
                end;
                v60 = l_gsub_3(v65, "{RBX_NAME}", v58.Name);
            end;
            v8:CreatePrompt({
                WindowTitle = "Error Unfriending Person", 
                MainText = v60, 
                ConfirmationText = "Okay", 
                CancelActive = false, 
                Image = "", 
                ImageConsoleVR = "", 
                FetchImageFunction = createFetchImageFunction(v58.UserId, l_Size150x150_0, l_HeadShot_0), 
                FetchImageFunctionConsoleVR = createFetchImageFunction(v58.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                StripeColor = Color3.fromRGB(183, 34, 54)
            });
        end;
    end;
    local v68 = string.format("Would you like to remove %s from your friends list?", v58.Name);
    if v22 then
        local l_gsub_4 = string.gsub;
        local l_v68_0 = v68;
        local l_pcall_4 = pcall;
        local v72 = "InGame.FriendPlayerPrompt.DoPromptUnfriendPlayer";
        local v73;
        do
            local l_l_v68_0_0 = l_v68_0;
            l_pcall_4(function() --[[ Line: 50 ]]
                -- upvalues: l_l_v68_0_0 (ref), v11 (ref), v72 (copy)
                l_l_v68_0_0 = v11:FormatByKey(v72);
            end);
            v73 = l_l_v68_0_0;
        end;
        v68 = l_gsub_4(v73, "{RBX_NAME}", v58.Name);
    end;
    v8:CreatePrompt({
        WindowTitle = "Unfriend Person?", 
        MainText = v68, 
        ConfirmationText = "Unfriend", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v58.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v58.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v67
    });
end;
PromptUnfriendPlayer = function(v75) --[[ Line: 291 ]] --[[ Name: PromptUnfriendPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnfriend can not be called for guests!");
    end;
    if typeof(v75) == "Instance" and v75:IsA("Player") then
        if v75.UserId < 0 then
            error("PromptUnfriend can not be called on guests!");
        end;
        if v75 == l_LocalPlayer_0 then
            error("PromptUnfriend: A user can not unfriend themselves!");
        end;
        DoPromptUnfriendPlayer(v75);
        return;
    else
        error("Invalid argument to PromptUnfriend");
        return;
    end;
end;
l_StarterGui_0:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer);