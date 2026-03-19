local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Modules_0 = l_RobloxGui_0.Modules;
local v7 = require(l_Modules_0.PromptCreator);
local v8 = require(l_Modules_0.SocialUtil);
local v9 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v10 = require(l_Modules_0.Settings.onBlockButtonActivated);
local l_Size150x150_0 = Enum.ThumbnailSize.Size150x150;
local l_Size352x352_0 = Enum.ThumbnailSize.Size352x352;
local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
createFetchImageFunction = function(...) --[[ Line: 33 ]] --[[ Name: createFetchImageFunction ]]
    -- upvalues: v8 (copy)
    local v15 = {
        ...
    };
    return function(v16) --[[ Line: 35 ]]
        -- upvalues: v8 (ref), v15 (copy)
        spawn(function() --[[ Line: 36 ]]
            -- upvalues: v8 (ref), v15 (ref), v16 (copy)
            local v17 = v8.GetPlayerImage(unpack(v15));
            if v16 and v16.Parent then
                v16.Image = v17;
            end;
        end);
    end;
end;
DoPromptBlockPlayer = function(v18) --[[ Line: 45 ]] --[[ Name: DoPromptBlockPlayer ]]
    -- upvalues: v9 (copy), v10 (copy)
    if v9:IsPlayerBlockedByUserId(v18.UserId) then
        return;
    else
        v10(v18);
        return;
    end;
end;
PromptBlockPlayer = function(v19) --[[ Line: 53 ]] --[[ Name: PromptBlockPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptBlockPlayer can not be called for guests!");
    end;
    if typeof(v19) == "Instance" and v19:IsA("Player") then
        if v19.UserId < 0 then
            error("PromptBlockPlayer can not be called on guests!");
        end;
        if v19 == l_LocalPlayer_0 then
            error("PromptBlockPlayer: A user can not block themselves!");
        end;
        DoPromptBlockPlayer(v19);
        return;
    else
        error("Invalid argument to PromptBlockPlayer");
        return;
    end;
end;
DoPromptUnblockPlayer = function(v20) --[[ Line: 70 ]] --[[ Name: DoPromptUnblockPlayer ]]
    -- upvalues: v9 (copy), v7 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy)
    local v21 = not v9:IsPlayerBlockedByUserId(v20.UserId);
    v21 = function(v22) --[[ Line: 78 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v9 (ref), v20 (copy), v7 (ref), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
        if v22 and not v9:UnblockPlayerAsync(v20) then
            while v7:IsCurrentlyPrompting() do
                wait();
            end;
            v7:CreatePrompt({
                WindowTitle = "Error Unblocking User", 
                MainText = string.format("An error occurred while unblocking %s. Please try again later.", v20.Name), 
                ConfirmationText = "Okay", 
                Image = "", 
                ImageConsoleVR = "", 
                FetchImageFunction = createFetchImageFunction(v20.UserId, l_Size150x150_0, l_HeadShot_0), 
                FetchImageFunctionConsoleVR = createFetchImageFunction(v20.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                StripeColor = Color3.fromRGB(183, 34, 54)
            });
        end;
    end;
    v7:CreatePrompt({
        WindowTitle = "Confirm Unblock", 
        MainText = string.format("Would you like to unblock %s?", v20.Name), 
        ConfirmationText = "Unblock", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v20.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v20.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v21
    });
end;
PromptUnblockPlayer = function(v23) --[[ Line: 113 ]] --[[ Name: PromptUnblockPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnblockPlayer can not be called for guests!");
    end;
    if typeof(v23) == "Instance" and v23:IsA("Player") then
        if v23.UserId < 0 then
            error("PromptUnblockPlayer can not be called on guests!");
        end;
        if v23 == l_LocalPlayer_0 then
            error("PromptUnblockPlayer: A user can not block themselves!");
        end;
        DoPromptUnblockPlayer(v23);
        return;
    else
        error("Invalid argument to PromptUnblockPlayer");
        return;
    end;
end;
GetBlockedUserIds = function() --[[ Line: 130 ]] --[[ Name: GetBlockedUserIds ]]
    -- upvalues: l_LocalPlayer_0 (ref), v9 (copy)
    if l_LocalPlayer_0.UserId < 0 then
        error("GetBlockedUserIds can not be called for guests!");
    end;
    return v9:GetBlockedUserIdsAsync();
end;
l_StarterGui_0:RegisterSetCore("PromptBlockPlayer", PromptBlockPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnblockPlayer", PromptUnblockPlayer);
l_StarterGui_0:RegisterGetCore("GetBlockedUserIds", GetBlockedUserIds);