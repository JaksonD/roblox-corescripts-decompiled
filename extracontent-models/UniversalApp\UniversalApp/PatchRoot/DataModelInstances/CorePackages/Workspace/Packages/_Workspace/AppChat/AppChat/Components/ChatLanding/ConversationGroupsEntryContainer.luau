local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChatLanding");
local v8 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v9 = require(l_script_FirstAncestor_1.ChatLandingTelemetryEvents);
local v10 = require(l_script_FirstAncestor_0.Utils.getAppChatCommunitiesVisualConfig);
local l_getFFlagCommunitiesUseVisualConfigUtil_0 = require(l_Parent_0.SharedFlags).getFFlagCommunitiesUseVisualConfigUtil;
local l_GetFFlagUseCommunitiesTranslation_0 = require(l_Parent_0.SharedFlags).GetFFlagUseCommunitiesTranslation;
local l_Images_0 = v3.App.ImageSet.Images;
local v14 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v15 = require(script.Parent.CustomConversationListEntry);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v17 = l_Images_0["icons/menu/groups"];
ConversationGroupsEntryContainer = function(v18) --[[ Line: 29 ]] --[[ Name: ConversationGroupsEntryContainer ]]
    -- upvalues: l_getFFlagCommunitiesUseVisualConfigUtil_0 (copy), v10 (copy), l_useLocalization_0 (copy), l_GetFFlagUseCommunitiesTranslation_0 (copy), v2 (copy), v4 (copy), v6 (copy), v8 (copy), l_Images_0 (copy), v17 (copy), v15 (copy), v9 (copy), v16 (copy), v14 (copy)
    local v19 = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then v10() else nil;
    local v20 = l_useLocalization_0({
        groupsText = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then v19.label else l_GetFFlagUseCommunitiesTranslation_0() and "Feature.SocialTab.Label.Groups" or "CommonUI.Features.Label.sGroups", 
        createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups"
    });
    local v21 = v2.useContext(v4);
    local v22 = v6(v8.Context);
    local v23 = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then l_Images_0[v19.icon] else v17;
    return v2.createElement(v15, {
        entryHeight = v18.entryHeight, 
        entryIcon = v23, 
        key = "ConversationGroupsEntry", 
        onActivated = v2.useCallback(function() --[[ Line: 49 ]]
            -- upvalues: v22 (copy), v9 (ref), v21 (copy)
            v22.emit(v9.ChatLandingGroupsBtnClicked, {});
            v21.navigateToGroups();
        end, {
            v22, 
            v21
        }), 
        subTitleText = v20.createAndExploreGroupsText, 
        titleText = v20.groupsText, 
        testId = if v16 then v14.chatLandingConversationListHeader("communities") else nil
    });
end;
return ConversationGroupsEntryContainer;