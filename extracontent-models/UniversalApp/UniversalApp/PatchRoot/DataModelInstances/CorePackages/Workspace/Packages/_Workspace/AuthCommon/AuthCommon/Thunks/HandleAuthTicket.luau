local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v6 = require(l_Parent_0.Promise);
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_GameParams_0 = require(l_Parent_0.ExperienceService).GameParams;
local v9 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableLuaAccountSwitch_0 = v9.FFlagEnableLuaAccountSwitch;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v9.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local v12 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v13 = require(l_script_FirstAncestor_0.Thunks.User);
local v14 = require(l_script_FirstAncestor_0.Common.AccountSwitcherConstants);
local function _(v15) --[[ Line: 22 ]] --[[ Name: castStringToInferredType ]]
    local v16 = tonumber(v15);
    if v16 then
        return v16;
    elseif v15 == "true" then
        return true;
    elseif v15 == "false" then
        return false;
    else
        return v15;
    end;
end;
local function v28(v18) --[[ Line: 41 ]] --[[ Name: parsePlaceLauncherUrl ]]
    if not v18 or v18 == "" then
        return {};
    else
        local v20 = v18:gsub("%%(%x%x)", function(v19) --[[ Line: 47 ]]
            return (string.char((tonumber(v19, 16))));
        end);
        local v21 = {};
        local _, v23 = string.find(v20, "?");
        if not v23 then
            return v21;
        else
            local v24 = string.sub(v20, v23 + 1);
            for v25 in string.gmatch(v24, "[^&]+") do
                local v26, v27 = string.match(v25, "([^=]+)=?(.*)");
                if v26 then
                    v21[v26] = v27;
                end;
            end;
            return v21;
        end;
    end;
end;
return function(v29, v30, v31, v32, v33) --[[ Line: 72 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v12 (copy), v28 (copy), l_GameParams_0 (copy), v13 (copy), v6 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), v14 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_ExperienceService_0 (copy)
    return v29(string.format("%sv1/authentication-ticket/redeem", l_Url_0.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            authenticationTicket = v30, 
            retainCurrentSession = true, 
            accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v12.getAccountBlob() or nil
        })
    }):andThen(function(v34) --[[ Line: 81 ]]
        -- upvalues: v28 (ref), v31 (copy), l_GameParams_0 (ref), v12 (ref), v13 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v6 (ref), v33 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), v14 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref), v32 (copy), l_ExperienceService_0 (ref)
        local v35 = v28(v31);
        local v36 = tonumber(v35.placeId);
        if v36 then
            local v37 = l_GameParams_0.fromPlaceId(v36);
            for v38, v39 in pairs(v35) do
                if v38 ~= "placeId" then
                    v37[v38] = tonumber(v39) or v39 == "true" or not (v39 == "false") and v39;
                end;
            end;
            local v40 = v12.getAccountBlob();
            local v41 = v13.fromLocalStorage().userId ~= -1;
            if l_FFlagEnableLuaAccountSwitch_0 and (v41 or v40 ~= "") then
                v6.resolve(v33()):andThen(function() --[[ Line: 98 ]]
                    -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), v14 (ref), v12 (ref), v34 (copy), v35 (copy), l_GuiService_0 (ref), l_NotificationType_0 (ref)
                    local v42 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then v14.AccountSwitcherSwitchedFromLoginStatus else v14.AccountSwitcherSwitchedStatus;
                    v12.setAccountSwitchStatus(v42);
                    v12.setAccountBlob(v34.responseBody.accountBlob);
                    v12.setAccountSwitchStartupQueryParams(v35);
                    v12.flush();
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_SWITCH_ACCOUNT);
                end, function(v43) --[[ Line: 108 ]]
                    print("error: ", v43);
                end);
            else
                return v6.resolve(v32()):andThen(function() --[[ Line: 112 ]]
                    -- upvalues: l_ExperienceService_0 (ref), v37 (copy)
                    l_ExperienceService_0:LaunchExperience(v37, "AuthTicket", nil);
                end);
            end;
        end;
        return v6.resolve();
    end, function(v44) --[[ Line: 119 ]]
        -- upvalues: v6 (ref)
        return v6.reject(v44);
    end);
end;