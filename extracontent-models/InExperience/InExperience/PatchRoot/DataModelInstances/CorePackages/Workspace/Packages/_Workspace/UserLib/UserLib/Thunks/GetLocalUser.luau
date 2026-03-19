local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v4 = require(l_script_FirstAncestor_0.Utils.isPlayerVerified);
local v5 = require(l_script_FirstAncestor_0.Actions);
local l_AddUser_0 = v5.AddUser;
local l_SetLocalUserId_0 = v5.SetLocalUserId;
local l_SetUserMembershipType_0 = v5.SetUserMembershipType;
local l_SetUserHasRobloxSubscription_0 = v5.SetUserHasRobloxSubscription;
local l_SetLocalUserUnder13_0 = v5.SetLocalUserUnder13;
local l_UserModel_0 = require(l_script_FirstAncestor_0.Models).UserModel;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local function v16(v13) --[[ Line: 19 ]] --[[ Name: getHasRobloxSubscription ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy), l_mutedError_0 (copy)
    if not l_FFlagEnableBlackbirdCheckDev_0 then
        return false;
    elseif not game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
            -- upvalues: v13 (copy)
            return v13.HasRobloxSubscription;
        end);
        if not l_status_0 then
            l_mutedError_0("[GetLocalUser] Failed to read HasRobloxSubscription: " .. tostring(l_result_0));
        end;
        return l_status_0 and l_result_0 == true;
    end;
end;
return function() --[[ Line: 35 ]]
    -- upvalues: l_Players_0 (copy), l_UserModel_0 (copy), v4 (copy), l_AddUser_0 (copy), l_SetLocalUserId_0 (copy), l_SetUserMembershipType_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_SetUserHasRobloxSubscription_0 (copy), v16 (copy), l_SetLocalUserUnder13_0 (copy)
    return function(v17) --[[ Line: 36 ]]
        -- upvalues: l_Players_0 (ref), l_UserModel_0 (ref), v4 (ref), l_AddUser_0 (ref), l_SetLocalUserId_0 (ref), l_SetUserMembershipType_0 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), l_SetUserHasRobloxSubscription_0 (ref), v16 (ref), l_SetLocalUserUnder13_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v19 = tostring(l_LocalPlayer_0.UserId);
        local v20 = l_UserModel_0.fromDataTable({
            id = v19, 
            name = l_LocalPlayer_0.Name, 
            displayName = l_LocalPlayer_0.displayName, 
            isFriend = false, 
            hasVerifiedBadge = v4(l_LocalPlayer_0)
        });
        v17:dispatch(l_AddUser_0(v20));
        v17:dispatch(l_SetLocalUserId_0(v19));
        v17:dispatch(l_SetUserMembershipType_0(v19, l_LocalPlayer_0.MembershipType));
        if l_FFlagEnableBlackbirdCheckDev_0 then
            v17:dispatch(l_SetUserHasRobloxSubscription_0(v19, (v16(l_LocalPlayer_0))));
        end;
        v17:dispatch(l_SetLocalUserUnder13_0(l_LocalPlayer_0:GetUnder13()));
    end;
end;