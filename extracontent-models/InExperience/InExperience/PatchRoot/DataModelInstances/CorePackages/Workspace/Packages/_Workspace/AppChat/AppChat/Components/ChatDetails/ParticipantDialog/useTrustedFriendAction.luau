local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v5 = require(l_script_FirstAncestor_0.Http.getProfileTrustedFriendActions);
local l_FFlagProfilePlatformAddTC_0 = v3.FFlagProfilePlatformAddTC;
local l_FFlagTCShareLinkSenderUI_0 = v3.FFlagTCShareLinkSenderUI;
local v8 = game:DefineFastFlag("PendingIncomingTrustedConnection", false);
local function _(v9, v10, v11, v12) --[[ Line: 23 ]] --[[ Name: createTrustedFriendAction ]]
    return {
        rawActionType = v9, 
        actionType = v10, 
        isDisabled = v11, 
        modalVariantOverride = v12
    };
end;
local function v18(v14) --[[ Line: 37 ]] --[[ Name: normalizeTrustedFriendAction ]]
    -- upvalues: l_FFlagProfilePlatformAddTC_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_Sources_0 (copy), v8 (copy)
    for _, v16 in v14 do
        if v16 == "AddTrustedConnection" then
            if l_FFlagProfilePlatformAddTC_0 then
                return {
                    rawActionType = v16, 
                    actionType = "AddTrustedConnection", 
                    isDisabled = false, 
                    modalVariantOverride = nil
                };
            end;
        elseif v16 == "AddTrustedConnectionViaLink" then
            if l_FFlagTCShareLinkSenderUI_0 then
                local l_ShareLinkSender_0 = l_Sources_0.ShareLinkSender;
                return {
                    rawActionType = v16, 
                    actionType = "AddTrustedConnection", 
                    isDisabled = false, 
                    modalVariantOverride = l_ShareLinkSender_0
                };
            end;
        elseif v16 == "PendingTrustedConnection" then
            if l_FFlagProfilePlatformAddTC_0 then
                return {
                    rawActionType = v16, 
                    actionType = "AddTrustedConnection", 
                    isDisabled = true, 
                    modalVariantOverride = nil
                };
            end;
        elseif v16 == "AddIncomingTrustedConnection" then
            if l_FFlagProfilePlatformAddTC_0 then
                return {
                    rawActionType = v16, 
                    actionType = "AddIncomingTrustedConnection", 
                    isDisabled = false, 
                    modalVariantOverride = nil
                };
            end;
        elseif v16 == "PendingIncomingTrustedConnection" and v8 then
            return {
                rawActionType = v16, 
                actionType = "AddIncomingTrustedConnection", 
                isDisabled = true, 
                modalVariantOverride = nil
            };
        end;
    end;
    return nil;
end;
return function(v19) --[[ Line: 65 ]] --[[ Name: useTrustedFriendAction ]]
    -- upvalues: v2 (copy), v5 (copy), v18 (copy)
    local v20, v21 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v19 (copy), v21 (copy), v5 (ref), v18 (ref)
        if v19 == "" then
            v21(nil);
            return;
        else
            local v22 = true;
            v21(nil);
            v5(v19):andThen(function(v23) --[[ Line: 79 ]]
                -- upvalues: v22 (ref), v21 (ref), v18 (ref)
                if v22 then
                    v21((v18(v23)));
                end;
            end):catch(function() --[[ Line: 84 ]]
                -- upvalues: v22 (ref), v21 (ref)
                if v22 then
                    v21(nil);
                end;
            end);
            return function() --[[ Line: 90 ]]
                -- upvalues: v22 (ref)
                v22 = false;
            end;
        end;
    end, {
        v19
    });
    return v20;
end;