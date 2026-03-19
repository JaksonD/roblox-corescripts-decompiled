local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_convertToFoundationPresenceEnum_0 = require(l_Parent_0.SocialCommon).Utils.convertToFoundationPresenceEnum;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Hooks.useUserDataValues);
local v8 = require(script.Parent.BaseRow);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagUserListActivatesTCIndicator);
local l_FFlagHomepagePYMKUseHorizontalUserList_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList;
return v2.memo(function(v11) --[[ Line: 40 ]] --[[ Name: UserRow ]]
    -- upvalues: v7 (copy), v3 (copy), l_convertToFoundationPresenceEnum_0 (copy), l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), v2 (copy), v8 (copy), v9 (copy), v6 (copy)
    local v12 = v7(v11.entityId);
    local v13 = if v12.displayName ~= "" then v12.displayName else nil;
    local v14 = if (not v11.configs or not (v11.configs.showSubtitle ~= nil) or v11.configs.showSubtitle) and v12.username ~= "" then ("@%*"):format(v12.username) else nil;
    local v15 = not v11.configs or not (v11.configs.showPresence ~= nil) or v11.configs.showPresence;
    local l_None_0 = v3.Enums.UserPresence.None;
    if v15 and v11.presence then
        l_None_0 = l_convertToFoundationPresenceEnum_0(v11.presence);
    end;
    local v17 = if v11.loadingState and if l_FFlagHomepagePYMKUseHorizontalUserList_0 then v11.loadingState.title ~= nil else v11.loadingState.title then v11.loadingState.title else v12.isLoading;
    local v18 = if v11.loadingState and if l_FFlagHomepagePYMKUseHorizontalUserList_0 then v11.loadingState.subtitle ~= nil else v11.loadingState.subtitle then v11.loadingState.subtitle else v12.isLoading;
    local v19 = v11.loadingState and v11.loadingState.contextualInfo;
    return v2.createElement(v8, {
        userId = v11.entityId, 
        userPresenceType = l_None_0, 
        title = v13, 
        subtitle = v14, 
        layoutMode = v11.layoutMode, 
        onActivated = v11.onActivated, 
        isTitleLoading = v17, 
        isSubtitleLoading = v18, 
        isContextualInfoLoading = v19, 
        contextualInfo = v11.contextualInfo, 
        primaryCta = v11.primaryCta, 
        secondaryCta = v11.secondaryCta, 
        trailingContent = v11.trailingContent, 
        layoutOrder = v11.layoutOrder, 
        trustedConnectionIndicatorEnabled = if v9 then v11.layoutMode == v6.RowLayoutMode.Wide else nil
    });
end);