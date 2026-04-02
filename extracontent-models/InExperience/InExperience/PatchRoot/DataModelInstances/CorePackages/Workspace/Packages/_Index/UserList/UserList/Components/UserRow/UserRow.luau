local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_convertToFoundationPresenceEnum_0 = require(l_Parent_0.SocialCommon).Utils.convertToFoundationPresenceEnum;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Hooks.useUserDataValues);
local v8 = require(script.Parent.BaseRow);
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagUserListActivatesTCIndicator);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_FFlagHomepagePYMKUseHorizontalUserList_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList;
local l_FFlagFixUserRowCombinedName_0 = require(l_Parent_0.SharedFlags).FFlagFixUserRowCombinedName;
return v2.memo(function(v14) --[[ Line: 43 ]] --[[ Name: UserRow ]]
    -- upvalues: v7 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagFixUserRowCombinedName_0 (copy), v3 (copy), l_convertToFoundationPresenceEnum_0 (copy), l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), v2 (copy), v8 (copy), v10 (copy), v6 (copy)
    local v15 = v7(v14.entityId);
    local v16 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v16 = l_useIsRobloxSubscriber_0(if v14.entityId then v14.entityId else nil);
    end;
    local v17 = if l_FFlagFixUserRowCombinedName_0 then if v15.combinedName ~= "" then v15.combinedName else nil else if v15.displayName ~= "" then v15.displayName else nil;
    local v18 = if (not v14.configs or not (v14.configs.showSubtitle ~= nil) or v14.configs.showSubtitle) and v15.username ~= "" then ("@%*"):format(v15.username) else nil;
    local v19 = not v14.configs or not (v14.configs.showPresence ~= nil) or v14.configs.showPresence;
    local l_None_0 = v3.Enums.UserPresence.None;
    if v19 and v14.presence then
        l_None_0 = l_convertToFoundationPresenceEnum_0(v14.presence);
    end;
    local v21 = if v14.loadingState and if l_FFlagHomepagePYMKUseHorizontalUserList_0 then v14.loadingState.title ~= nil else v14.loadingState.title then v14.loadingState.title else v15.isLoading;
    local v22 = if v14.loadingState and if l_FFlagHomepagePYMKUseHorizontalUserList_0 then v14.loadingState.subtitle ~= nil else v14.loadingState.subtitle then v14.loadingState.subtitle else v15.isLoading;
    local v23 = v14.loadingState and v14.loadingState.contextualInfo;
    return v2.createElement(v8, {
        userId = v14.entityId, 
        userPresenceType = l_None_0, 
        title = v17, 
        subtitle = v18, 
        layoutMode = v14.layoutMode, 
        onActivated = v14.onActivated, 
        isTitleLoading = v21, 
        isSubtitleLoading = v22, 
        isContextualInfoLoading = v23, 
        contextualInfo = v14.contextualInfo, 
        primaryCta = v14.primaryCta, 
        secondaryCta = v14.secondaryCta, 
        trailingContent = v14.trailingContent, 
        layoutOrder = v14.layoutOrder, 
        trustedConnectionIndicatorEnabled = if v10 then v14.layoutMode == v6.RowLayoutMode.Wide else nil, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v16 else nil
    });
end);