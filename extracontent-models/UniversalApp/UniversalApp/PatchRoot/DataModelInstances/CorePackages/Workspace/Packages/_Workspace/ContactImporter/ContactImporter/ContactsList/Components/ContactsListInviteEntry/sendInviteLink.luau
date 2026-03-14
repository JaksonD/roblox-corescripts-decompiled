local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_useDispatch_0 = v1.useDispatch;
local l_ShareLinksNetworking_0 = v1.ShareLinksNetworking;
local l_ShareLinksRodux_0 = v1.ShareLinksRodux;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v1.useLocalization;
local l_RoduxContacts_0 = v1.RoduxContacts;
local l_React_0 = v1.React;
local l_Promise_0 = v1.Promise;
local v10 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v11 = require(l_script_FirstAncestor_0.Analytics.Enums.EventNames);
local function _(v12) --[[ Line: 20 ]]
    -- upvalues: l_Promise_0 (copy)
    return function(v13) --[[ Line: 21 ]]
        -- upvalues: v12 (copy), l_Promise_0 (ref)
        return v12.smsProtocol:supportsSMS():andThen(function(v14) --[[ Line: 22 ]]
            -- upvalues: v12 (ref), v13 (copy), l_Promise_0 (ref)
            if v14 then
                return v12.smsProtocol:sendSMS({
                    address = v12.address, 
                    message = v13
                });
            else
                return l_Promise_0.reject();
            end;
        end);
    end;
end;
return function(v16) --[[ Line: 32 ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), v10 (copy), v11 (copy), l_useLocalization_0 (copy), v5 (copy), l_ShareLinksNetworking_0 (copy), l_ShareLinksRodux_0 (copy), l_Promise_0 (copy), l_RoduxContacts_0 (copy)
    local v17 = l_useDispatch_0();
    local v18, v19 = l_React_0.useState(false);
    local function v20() --[[ Line: 35 ]]
        -- upvalues: v19 (copy)
        v19(false);
    end;
    local v21 = v10();
    local v22 = nil;
    local function v23() --[[ Line: 41 ]]
        -- upvalues: v21 (copy), v11 (ref), v22 (ref), v19 (copy)
        v21.fireAnalyticsEvent(v11.InviteContact, {
            offNetworkFriendRequestLinkId = v22
        });
        v19(false);
    end;
    local v24 = l_useLocalization_0({
        rootMessage = v5.SMS_DEFAULT_MESSAGE
    });
    local function _(v25) --[[ Line: 51 ]]
        -- upvalues: v22 (ref)
        return function(v26) --[[ Line: 52 ]]
            -- upvalues: v22 (ref), v25 (copy)
            local l_shortUrl_0 = v26.responseBody.shortUrl;
            v22 = v26.responseBody.linkId;
            return l_shortUrl_0 .. "\n\n" .. v25.rootMessage;
        end;
    end;
    return {
        sendInvite = function() --[[ Line: 61 ]] --[[ Name: sendInvite ]]
            -- upvalues: v19 (copy), v17 (copy), l_ShareLinksNetworking_0 (ref), l_ShareLinksRodux_0 (ref), v24 (copy), v22 (ref), v16 (copy), l_Promise_0 (ref), l_RoduxContacts_0 (ref), v23 (copy), v20 (copy)
            v19(true);
            local v29 = v17(l_ShareLinksNetworking_0.GenerateLink.API({
                linkType = l_ShareLinksRodux_0.Enums.LinkType.FriendInvite.rawValue()
            }));
            local l_v24_0 = v24;
            local l_l_v24_0_0 = l_v24_0 --[[ copy: 3 -> 4 ]];
            v29 = v29:andThen(function(v32) --[[ Line: 52 ]]
                -- upvalues: v22 (ref), l_l_v24_0_0 (copy)
                local l_shortUrl_1 = v32.responseBody.shortUrl;
                v22 = v32.responseBody.linkId;
                return l_shortUrl_1 .. "\n\n" .. l_l_v24_0_0.rootMessage;
            end);
            l_v24_0 = v16;
            return v29:andThen(function(v34) --[[ Line: 21 ]]
                -- upvalues: l_v24_0 (copy), l_Promise_0 (ref)
                return l_v24_0.smsProtocol:supportsSMS():andThen(function(v35) --[[ Line: 22 ]]
                    -- upvalues: l_v24_0 (ref), v34 (copy), l_Promise_0 (ref)
                    if v35 then
                        return l_v24_0.smsProtocol:sendSMS({
                            address = l_v24_0.address, 
                            message = v34
                        });
                    else
                        return l_Promise_0.reject();
                    end;
                end);
            end):andThen(v17(l_RoduxContacts_0.Actions.RequestSent({
                id = v16.deviceContactId
            }))):andThen(v23):catch(v20);
        end, 
        isLoading = v18
    };
end;