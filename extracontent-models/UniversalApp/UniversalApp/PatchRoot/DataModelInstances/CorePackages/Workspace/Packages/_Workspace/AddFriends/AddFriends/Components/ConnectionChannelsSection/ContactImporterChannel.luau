local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useBeginContactImporter_0 = require(l_Parent_0.ContactImporter).useBeginContactImporter;
local l_Analytics_0 = require(l_Parent_0.DiscoverabilityModal).Analytics;
local l_EventNames_0 = require(l_script_FirstAncestor_0.Analytics).EventNames;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagAddFriendsBannersNewUI_IXP_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsBannersNewUI_IXP;
local l_FFlagAddFriendsCINewIcon_exp_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsCINewIcon_exp;
local _ = require(script.Parent.Types);
return function(v10) --[[ Line: 26 ]] --[[ Name: ContactImporterChannel ]]
    -- upvalues: l_useBeginContactImporter_0 (copy), l_Analytics_0 (copy), v2 (copy), l_EventNames_0 (copy), l_useLocalization_0 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy), l_FFlagAddFriendsCINewIcon_exp_0 (copy)
    local l_component_0 = v10.component;
    local l_componentUIProps_0 = v10.componentUIProps;
    local l_fireAnalyticsEvent_0 = v10.fireAnalyticsEvent;
    local v14, v15 = l_useBeginContactImporter_0({
        entryPoint = l_Analytics_0.EntryPoints.AddFriends
    });
    local v16 = v15 and true or false;
    local v17 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v15 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CIBtnClick);
        v15();
    end, {
        l_fireAnalyticsEvent_0, 
        v15
    });
    local v18 = v2.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.CIBtnImpression);
    end, {
        l_fireAnalyticsEvent_0
    });
    local v19 = v14 and "Feature.AddFriends.Label.ConnectWithContacts" or "Feature.AddFriends.Label.SyncContactsInvitePeople";
    local v20 = l_useLocalization_0({
        contactImporterBannerTitle = if l_FFlagAddFriendsBannersNewUI_IXP_0 then nil else "Feature.AddFriends.Title.ConnectWithContacts", 
        contactImporterBannerText = if l_FFlagAddFriendsBannersNewUI_IXP_0 then nil else v19, 
        contactTitle = l_FFlagAddFriendsBannersNewUI_IXP_0 and "Feature.AddFriends.Label.ContactsTile" or nil
    });
    if v16 then
        return (v2.createElement(l_component_0, {
            icon = l_FFlagAddFriendsBannersNewUI_IXP_0 and l_FFlagAddFriendsCINewIcon_exp_0 and "icons/menu/contacts_large" or "icons/graphic/contacts_large", 
            title = if l_FFlagAddFriendsBannersNewUI_IXP_0 then v20.contactTitle else v20.contactImporterBannerTitle, 
            text = if l_FFlagAddFriendsBannersNewUI_IXP_0 then nil else v20.contactImporterBannerText, 
            onActivated = v17, 
            onMounted = v18, 
            componentUIProps = l_componentUIProps_0
        }));
    else
        return nil;
    end;
end;