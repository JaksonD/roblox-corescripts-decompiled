local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v4 = "Other";
pcall(function() --[[ Line: 11 ]]
    -- upvalues: l_UserInputService_0 (copy), v4 (ref)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        v4 = "Android";
        return;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        v4 = "iOS";
        return;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        v4 = "Win";
        return;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
        v4 = "UWP";
        return;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        v4 = "Mac";
        return;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
        v4 = "XBox";
        return;
    else
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
            v4 = "PS";
        end;
        return;
    end;
end);
return function(v6, v7, v8, v9) --[[ Line: 32 ]]
    -- upvalues: l_AppPage_0 (copy), v4 (ref), l_IsVRAppBuild_0 (copy)
    if not v6 or not v6.Diag then
        return;
    elseif not v7 then
        return;
    else
        local v10 = "Other";
        if v7 == l_AppPage_0.Home or v7 == l_AppPage_0.Games then
            if v9 == 1 then
                v10 = "GamesList";
            elseif v7 == l_AppPage_0.Home then
                v10 = "Home";
            else
                assert(v7 == l_AppPage_0.Games, (("%* should always be Games here"):format(v7)));
                v10 = "Games";
            end;
        elseif v7 == "recommended" then
            v10 = "GameDetail";
        elseif v7 == l_AppPage_0.SearchPage then
            v10 = "SearchPage";
        end;
        local l_v4_0 = v4;
        if l_IsVRAppBuild_0() then
            l_v4_0 = "VR";
        end;
        local v12 = l_v4_0 .. "-GameImps-" .. v10;
        v6.Diag:reportCounterSimple(v12, v8);
        return;
    end;
end;