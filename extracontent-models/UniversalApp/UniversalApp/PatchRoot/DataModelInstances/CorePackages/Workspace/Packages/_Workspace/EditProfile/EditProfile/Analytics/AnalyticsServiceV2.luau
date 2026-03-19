local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = {
    OpenEditDisplayName = "openEditDisplayName", 
    SaveDisplayName = "saveDisplayName", 
    OpenEditUsername = "openEditUsername", 
    OpenAvatarMarketplace = "openAvatarMarketplace"
};
local v6 = {
    EditProfilePage = "EditProfilePage", 
    EditDisplayNameModal = "EditDisplayNameModal"
};
local v7 = {
    EditProfileOpened = "EditProfileOpened", 
    DisplayNameModalOpened = "DisplayNameModalOpened", 
    DisplayNameModalLoaded = "DisplayNameModalLoaded", 
    DisplayNameSaved = "DisplayNameSaved", 
    DisplayNameTooShort = "DisplayNameTooShort", 
    FilteredDisplayName = "FilteredDisplayName", 
    EditUsernameOpened = "EditUsernameOpened", 
    UsernameSaved = "UsernameSaved", 
    DescriptionPINBlocked = "DescriptionPINBlocked", 
    OpenAvatarMarketplace = "OpenAvatarMarketplace"
};
local v8 = {
    eventName = "EditProfileEvent", 
    description = "Event to track edit profile", 
    lastUpdated = {
        2025, 
        1, 
        20
    }, 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("EditProfileThrottleHundredthsPercent", 10000), 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/edit_profile/lua_edit_profile_button_events.proto"
};
local function v12(v9, v10) --[[ Line: 68 ]] --[[ Name: sendAnalyticsEvent ]]
    -- upvalues: v3 (copy), l_TelemetryService_0 (copy), v8 (copy)
    local v11 = v3.Dictionary.join(v9 or {}, v10);
    l_TelemetryService_0:LogEvent(v8, {
        customFields = v11, 
        standardizedFields = {
            "addSessionInfo"
        }
    });
end;
return {
    TelemetryEventType = v7, 
    sendEditProfileOpened = function() --[[ Line: 89 ]] --[[ Name: sendEditProfileOpened ]]
        -- upvalues: v12 (copy), v6 (copy), v7 (copy)
        v12({
            page = v6.EditProfilePage
        }, {
            sub_event_type = v7.EditProfileOpened
        });
    end, 
    sendDisplayNameModalOpened = function() --[[ Line: 93 ]] --[[ Name: sendDisplayNameModalOpened ]]
        -- upvalues: v12 (copy), v5 (copy), v7 (copy)
        v12({
            btn = v5.OpenEditDisplayName
        }, {
            sub_event_type = v7.DisplayNameModalOpened
        });
    end, 
    sendDisplayNameModalLoaded = function(v13) --[[ Line: 100 ]] --[[ Name: sendDisplayNameModalLoaded ]]
        -- upvalues: v12 (copy), v6 (copy), v7 (copy)
        v12({
            page = v6.EditDisplayNameModal, 
            statValue = v13
        }, {
            sub_event_type = v7.DisplayNameModalLoaded, 
            statValue = v13
        });
    end, 
    sendDisplayNameSaved = function(v14, v15) --[[ Line: 107 ]] --[[ Name: sendDisplayNameSaved ]]
        -- upvalues: v12 (copy), v5 (copy), v7 (copy)
        v12({
            btn = v5.SaveDisplayName, 
            displayName = v14, 
            statValue = v15
        }, {
            sub_event_type = v7.DisplayNameSaved, 
            displayName = v14, 
            statValue = v15
        });
    end, 
    sendDisplayNameTooShort = function(v16) --[[ Line: 114 ]] --[[ Name: sendDisplayNameTooShort ]]
        -- upvalues: v12 (copy), v7 (copy)
        v12({
            displayName = v16
        }, {
            sub_event_type = v7.DisplayNameTooShort, 
            displayName = v16
        });
    end, 
    sendFilteredDisplayName = function(v17) --[[ Line: 121 ]] --[[ Name: sendFilteredDisplayName ]]
        -- upvalues: v12 (copy), v7 (copy)
        v12({
            displayName = v17
        }, {
            sub_event_type = v7.FilteredDisplayName, 
            displayName = v17
        });
    end, 
    sendEditUsernameOpened = function() --[[ Line: 128 ]] --[[ Name: sendEditUsernameOpened ]]
        -- upvalues: v12 (copy), v5 (copy), v7 (copy)
        v12({
            btn = v5.OpenEditUsername
        }, {
            sub_event_type = v7.EditUsernameOpened
        });
    end, 
    sendUsernameSaved = function(v18) --[[ Line: 132 ]] --[[ Name: sendUsernameSaved ]]
        -- upvalues: v12 (copy), v7 (copy)
        v12({
            statValue = v18
        }, {
            sub_event_type = v7.UsernameSaved, 
            statValue = v18
        });
    end, 
    sendOpenAvatarMarketplace = function() --[[ Line: 145 ]] --[[ Name: sendOpenAvatarMarketplace ]]
        -- upvalues: v12 (copy), v5 (copy), v7 (copy)
        v12({
            btn = v5.OpenAvatarMarketplace
        }, {
            sub_event_type = v7.OpenAvatarMarketplace
        });
    end, 
    sendError = function(v19) --[[ Line: 139 ]] --[[ Name: sendError ]]
        -- upvalues: v4 (copy), v12 (copy), v7 (copy)
        if v19 == v4.DescriptionErrorCodes.PinLocked then
            v12(nil, {
                sub_event_type = v7.DescriptionPINBlocked
            });
        end;
    end
};