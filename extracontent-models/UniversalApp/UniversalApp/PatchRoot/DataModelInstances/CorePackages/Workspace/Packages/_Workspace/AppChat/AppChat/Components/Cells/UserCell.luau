local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.PresenceBubbleCellStyled);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v7 = require(l_Parent_0.UIBlox).App.ImageSet.Images["component_assets/circle_25"];
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v11 = {
    subTitleText = "subTitleText", 
    user = {}, 
    childWidth = 0, 
    style = v4.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    }), 
    showDivider = true, 
    boldTitle = true
};
return v2.memo(function(v12) --[[ Line: 51 ]] --[[ Name: UserCell ]]
    -- upvalues: v4 (copy), v11 (copy), v2 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), v5 (copy), l_UserModel_0 (copy), v7 (copy)
    local v13 = v4.Dictionary.join(v11, v12);
    local v14 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v13 (copy)
        if v13.onActivated then
            v13.onActivated(v13.user);
        end;
    end);
    local l_user_0 = v13.user;
    local v16 = l_user_0.metadata and l_user_0.metadata.isPending;
    local v17 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v17 = l_useIsRobloxSubscriber_0(if l_user_0.id then tostring(l_user_0.id) else nil);
    end;
    local v18 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: l_user_0 (copy)
        return {
            l_user_0.thumbnail
        };
    end, {
        l_user_0.thumbnail
    });
    return v2.createElement(v5, {
        style = v13.style, 
        childWidth = v13.childWidth, 
        onActivated = v14, 
        onCircleActivated = v13.onCircleActivated, 
        subTitleText = v13.subTitleText, 
        showDivider = v13.showDivider, 
        boldTitle = not v16 and v13.boldTitle, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v17 else nil, 
        avatarCirclePresenceImage = if l_user_0.presence ~= l_UserModel_0.PresenceType.OFFLINE and l_user_0.presence ~= nil then v7 else nil, 
        titleText = l_user_0.displayName, 
        secondaryTitleText = l_user_0.alias, 
        thumbnails = v18
    }, v13.children or {});
end);