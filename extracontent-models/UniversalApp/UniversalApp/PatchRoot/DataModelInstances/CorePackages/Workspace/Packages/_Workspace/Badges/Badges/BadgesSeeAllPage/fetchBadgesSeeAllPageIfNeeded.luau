local l_script_FirstAncestor_0 = script:FindFirstAncestor("Badges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiResponseType_0 = v3.SduiResponseType;
local l_getSduiApiStore_0 = v3.getSduiApiStore;
local v6 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.getBadgesSeeAllUrl);
local v7 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.getBadgesSeeAllPageKey);
local l_FFlagSduiV2PaginationSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2PaginationSupport;
local l_FFlagSduiProtobufJsonDecode_0 = require(l_Parent_0.SharedFlags).FFlagSduiProtobufJsonDecode;
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
return function(v11, v12, v13) --[[ Line: 16 ]] --[[ Name: fetchBadgesSeeAllPageIfNeeded ]]
    -- upvalues: v6 (copy), v7 (copy), l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_FFlagSduiProtobufJsonDecode_0 (copy), l_SduiResponseType_0 (copy), l_AppPage_0 (copy), l_FFlagSduiUniversalPageEntry_0 (copy), l_FFlagSduiV2PaginationSupport_0 (copy)
    local v14 = v6(v11);
    local v15 = v7(v11);
    local l_badges_see_all_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.badges.badges_see_all;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = if l_FFlagSduiProtobufJsonDecode_0 then l_SduiResponseType_0.Protobuf else nil, 
        url = v14, 
        surfaceKey = l_AppPage_0.BadgesSeeAll, 
        configKey = v15, 
        loadTimer = v12, 
        apiProto = if l_FFlagSduiUniversalPageEntry_0 then l_badges_see_all_0.BadgesSeeAllV2Response else l_badges_see_all_0.BadgesSeeAllResponse, 
        buildNextPageUrl = l_FFlagSduiV2PaginationSupport_0 and function(v17) --[[ Line: 38 ]]
            -- upvalues: v6 (ref), v11 (copy)
            local v18 = v17 and v17.pagination and v17.pagination.next_cursor;
            if v18 and v18 ~= "" then
                return v6(v11, v18);
            else
                return nil;
            end;
        end or nil
    }, v13);
    return v14;
end;