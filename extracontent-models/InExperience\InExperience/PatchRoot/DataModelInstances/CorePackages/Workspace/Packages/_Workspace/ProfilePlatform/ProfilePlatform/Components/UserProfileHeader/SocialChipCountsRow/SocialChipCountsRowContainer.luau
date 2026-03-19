local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.ApolloProfileInsights);
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local v8 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v10 = require(l_script_FirstAncestor_0.Hooks.useAreWebViewsSupported);
local l_ChipGroup_0 = require(l_script_FirstAncestor_0.Components.ChipGroup).ChipGroup;
local l_useLocalUserId_0 = v3.useLocalUserId;
local l_useProfileInsightsByUserIds_0 = v6.Hooks.useProfileInsightsByUserIds;
local l_getProfileInsightsByUserIdFromData_0 = v6.Selectors.getProfileInsightsByUserIdFromData;
local l_useSignalProfileInsightsByUserId_0 = require(l_Parent_0.ProfileInsights).useSignalProfileInsightsByUserId;
local l_GetFFlagEnableProfileInsightsApolloMigration_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration;
local l_Parent_1 = script.Parent;
local v18 = require(l_Parent_1.hooks.useSocialCountsData);
local v19 = require(l_Parent_1.hooks.useSocialCountsActions);
local v20 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local l_ChipSize_0 = v5.Enums.ChipSize;
local l_FFlagAddIEMProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagAddIEMProfilePage;
return function(v23) --[[ Line: 42 ]] --[[ Name: SocialCountsChipRowContainer ]]
    -- upvalues: v9 (copy), v8 (copy), v10 (copy), l_useLocalUserId_0 (copy), v20 (copy), l_FFlagAddIEMProfilePage_0 (copy), l_GetFFlagEnableProfileInsightsApolloMigration_0 (copy), l_useSignalProfileInsightsByUserId_0 (copy), l_useProfileInsightsByUserIds_0 (copy), l_getProfileInsightsByUserIdFromData_0 (copy), v18 (copy), v19 (copy), v2 (copy), v7 (copy), l_ChipSize_0 (copy), l_ChipGroup_0 (copy)
    local v24 = v9();
    local v25 = v8();
    local v26 = v10();
    local v27 = l_useLocalUserId_0();
    local v28, v29 = v20();
    local l_profileId_0 = v24.profileId;
    local v31 = if l_FFlagAddIEMProfilePage_0 then v24.sourceInfo.source else nil;
    local v32 = l_profileId_0 == tostring(v27);
    local v33 = nil;
    if l_GetFFlagEnableProfileInsightsApolloMigration_0() then
        v33 = l_useSignalProfileInsightsByUserId_0({
            userId = l_profileId_0, 
            rankingStrategy = "tc_info_boost"
        });
    else
        local v34 = l_useProfileInsightsByUserIds_0({
            userIds = {
                l_profileId_0
            }
        });
        if v34 and v34.data and not v34.loading then
            v33 = l_getProfileInsightsByUserIdFromData_0(v34.data, l_profileId_0);
        end;
    end;
    local v35 = if v33 and v33.mutualFriends then v33.mutualFriends else {};
    local v36 = {};
    for _, v38 in ipairs(v35) do
        table.insert(v36, v38.id);
    end;
    local v39 = v18(l_profileId_0, v32, v26, v36);
    local v40 = v19(l_profileId_0, v32, v25, v36);
    local v44 = v2.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: v39 (copy), l_FFlagAddIEMProfilePage_0 (ref), v31 (copy), v7 (ref), v40 (copy), l_ChipSize_0 (ref)
        local v41 = {};
        for _, v43 in ipairs(v39) do
            if v43.fieldName ~= "mutualFriendsCount" or tonumber(v43.count) ~= 0 then
                table.insert(v41, {
                    count = v43.count, 
                    text = v43.text, 
                    layoutOrder = v43.layoutOrder, 
                    onActivated = if l_FFlagAddIEMProfilePage_0 and v31 == v7.Sources.InExperienceProfile then nil else v40[v43.fieldName], 
                    isDisabled = v43.isDisabled, 
                    size = l_ChipSize_0.Medium, 
                    leading = v43.leading
                });
            end;
        end;
        return v41;
    end, {
        v39, 
        v40
    });
    return v2.createElement("Frame", {
        LayoutOrder = v23.layoutOrder, 
        Size = v23.size, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v29, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v28), 
            PaddingRight = UDim.new(0, v28)
        }), 
        ChipGroup = v2.createElement(l_ChipGroup_0, {
            chips = v44, 
            automaticSize = Enum.AutomaticSize.Y, 
            scrollingEnabledOverride = true, 
            size = UDim2.new(1, 0, 0, 32), 
            layoutOrder = v23.layoutOrder
        })
    });
end;