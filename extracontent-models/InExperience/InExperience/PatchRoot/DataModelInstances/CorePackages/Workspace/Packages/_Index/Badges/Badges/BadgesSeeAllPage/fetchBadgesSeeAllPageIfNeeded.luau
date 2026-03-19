local l_script_FirstAncestor_0 = script:FindFirstAncestor("Badges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiResponseType_0 = v3.SduiResponseType;
local l_getSduiApiStore_0 = v3.getSduiApiStore;
local v6 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.getBadgesSeeAllUrl);
local v7 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.getBadgesSeeAllPageKey);
local l_FFlagSduiProtobufJsonDecode_0 = require(l_Parent_0.SharedFlags).FFlagSduiProtobufJsonDecode;
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
return function(v10, v11, v12) --[[ Line: 15 ]] --[[ Name: fetchBadgesSeeAllPageIfNeeded ]]
    -- upvalues: v6 (copy), v7 (copy), l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_FFlagSduiProtobufJsonDecode_0 (copy), l_SduiResponseType_0 (copy), l_AppPage_0 (copy), l_FFlagSduiUniversalPageEntry_0 (copy)
    local v13 = v6(v10);
    local v14 = v7(v10);
    local l_badges_see_all_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.badges.badges_see_all;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = if l_FFlagSduiProtobufJsonDecode_0 then l_SduiResponseType_0.Protobuf else nil, 
        url = v13, 
        surfaceKey = l_AppPage_0.BadgesSeeAll, 
        configKey = v14, 
        loadTimer = v11, 
        apiProto = if l_FFlagSduiUniversalPageEntry_0 then l_badges_see_all_0.BadgesSeeAllV2Response else l_badges_see_all_0.BadgesSeeAllResponse, 
        buildNextPageUrl = function(v16) --[[ Line: 36 ]] --[[ Name: buildNextPageUrl ]]
            -- upvalues: v6 (ref), v10 (copy)
            local v17 = v16 and v16.pagination and v16.pagination.next_cursor;
            if v17 and v17 ~= "" then
                return v6(v10, v17);
            else
                return nil;
            end;
        end
    }, v12);
    return v13;
end;