local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LoginStatus;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v10 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchReminderOfNorms);
local l_GetFFlagEnableCachingforReminderOfNorms_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCachingforReminderOfNorms;
local function _(v12, v13, v14) --[[ Line: 19 ]] --[[ Name: shouldFetchReminderOfNorms ]]
    -- upvalues: l_MemStorageService_0 (copy), v9 (copy)
    if not v12 then
        return false;
    elseif not v13 then
        return true;
    else
        return not l_MemStorageService_0:HasItem(v9.ReminderOfNorms) or v14 ~= l_MemStorageService_0:GetItem(v9.ReminderOfNorms);
    end;
end;
return function(_) --[[ Line: 34 ]] --[[ Name: CheckForReminderOfNorms ]]
    -- upvalues: l_useSelector_0 (copy), l_LoginStatus_0 (copy), l_useDispatch_0 (copy), v8 (copy), v7 (copy), v2 (copy), l_GetFFlagEnableCachingforReminderOfNorms_0 (copy), l_MemStorageService_0 (copy), v9 (copy), v10 (copy)
    local v18 = l_useSelector_0(function(v17) --[[ Line: 35 ]]
        -- upvalues: l_LoginStatus_0 (ref)
        return v17.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 38 ]]
        return v19.LocalUserId;
    end);
    local v21 = l_useDispatch_0();
    local v22 = v8(v7);
    v2.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy), l_GetFFlagEnableCachingforReminderOfNorms_0 (ref), v20 (copy), l_MemStorageService_0 (ref), v9 (ref), v21 (copy), v10 (ref), v22 (copy)
        local l_v18_0 = v18;
        local v24 = l_GetFFlagEnableCachingforReminderOfNorms_0();
        local l_v20_0 = v20;
        if not not l_v18_0 and (not v24 or not l_MemStorageService_0:HasItem(v9.ReminderOfNorms) or l_v20_0 ~= l_MemStorageService_0:GetItem(v9.ReminderOfNorms)) then
            v21(v10(v22)):andThen(function() --[[ Line: 48 ]]
                -- upvalues: l_MemStorageService_0 (ref), v9 (ref), v20 (ref)
                l_MemStorageService_0:SetItem(v9.ReminderOfNorms, v20);
            end):catch(function() --[[ Line: 51 ]]

            end);
        end;
        return nil;
    end, {
        v18, 
        v20, 
        v22
    });
    return nil;
end;