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
return v2.memo(function(v13) --[[ Line: 43 ]] --[[ Name: UserRow ]]
    -- upvalues: v7 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), v3 (copy), l_convertToFoundationPresenceEnum_0 (copy), l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), v2 (copy), v8 (copy), v10 (copy), v6 (copy)
    local v14 = v7(v13.entityId);
    local v15 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v15 = l_useIsRobloxSubscriber_0(if v13.entityId then v13.entityId else nil);
    end;
    local v16 = if v14.displayName ~= "" then v14.displayName else nil;
    local v17 = if (not v13.configs or not (v13.configs.showSubtitle ~= nil) or v13.configs.showSubtitle) and v14.username ~= "" then ("@%*"):format(v14.username) else nil;
    local v18 = not v13.configs or not (v13.configs.showPresence ~= nil) or v13.configs.showPresence;
    local l_None_0 = v3.Enums.UserPresence.None;
    if v18 and v13.presence then
        l_None_0 = l_convertToFoundationPresenceEnum_0(v13.presence);
    end;
    local v20 = if v13.loadingState and if l_FFlagHomepagePYMKUseHorizontalUserList_0 then v13.loadingState.title ~= nil else v13.loadingState.title then v13.loadingState.title else v14.isLoading;
    local v21 = if v13.loadingState and if l_FFlagHomepagePYMKUseHorizontalUserList_0 then v13.loadingState.subtitle ~= nil else v13.loadingState.subtitle then v13.loadingState.subtitle else v14.isLoading;
    local v22 = v13.loadingState and v13.loadingState.contextualInfo;
    return v2.createElement(v8, {
        userId = v13.entityId, 
        userPresenceType = l_None_0, 
        title = v16, 
        subtitle = v17, 
        layoutMode = v13.layoutMode, 
        onActivated = v13.onActivated, 
        isTitleLoading = v20, 
        isSubtitleLoading = v21, 
        isContextualInfoLoading = v22, 
        contextualInfo = v13.contextualInfo, 
        primaryCta = v13.primaryCta, 
        secondaryCta = v13.secondaryCta, 
        trailingContent = v13.trailingContent, 
        layoutOrder = v13.layoutOrder, 
        trustedConnectionIndicatorEnabled = if v10 then v13.layoutMode == v6.RowLayoutMode.Wide else nil, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v15 else nil
    });
end);