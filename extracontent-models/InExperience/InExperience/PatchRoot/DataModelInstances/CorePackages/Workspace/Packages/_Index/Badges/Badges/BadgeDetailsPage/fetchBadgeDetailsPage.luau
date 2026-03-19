local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Badges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v4 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiResponseType_0 = v4.SduiResponseType;
local l_getSduiApiStore_0 = v4.getSduiApiStore;
local v7 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.getBadgeDetailsUrl);
local v8 = require(script.Parent.getBadgeDetailsPageKey);
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local function _() --[[ Line: 15 ]] --[[ Name: getLocalPlayerUserId ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        return nil;
    else
        local l_UserId_0 = l_LocalPlayer_0.UserId;
        if l_UserId_0 <= 0 then
            return nil;
        else
            return (tostring(l_UserId_0));
        end;
    end;
end;
return function(v13, v14) --[[ Line: 27 ]] --[[ Name: fetchBadgeDetailsPage ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_SduiResponseType_0 (copy), l_AppPage_0 (copy), v8 (copy), l_FFlagSduiUniversalPageEntry_0 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    local v16;
    if not l_LocalPlayer_1 then
        v16 = nil;
    else
        local l_UserId_1 = l_LocalPlayer_1.UserId;
        v16 = if l_UserId_1 <= 0 then nil else tostring(l_UserId_1);
    end;
    l_LocalPlayer_1 = v7(v13, v16);
    local l_badge_details_page_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.badges.badge_details_page;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = l_SduiResponseType_0.Protobuf, 
        url = l_LocalPlayer_1, 
        surfaceKey = l_AppPage_0.BadgeDetails, 
        configKey = v8(v13), 
        loadTimer = v14, 
        apiProto = if l_FFlagSduiUniversalPageEntry_0 then l_badge_details_page_0.BadgeDetailsPageV2Response else l_badge_details_page_0.BadgeDetailsPageResponse
    });
end;