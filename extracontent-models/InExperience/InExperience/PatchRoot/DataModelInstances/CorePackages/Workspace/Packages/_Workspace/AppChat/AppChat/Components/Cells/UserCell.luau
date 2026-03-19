local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.PresenceBubbleCellStyled);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v7 = require(l_Parent_0.UIBlox).App.ImageSet.Images["component_assets/circle_25"];
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local v9 = {
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
return v2.memo(function(v10) --[[ Line: 47 ]] --[[ Name: UserCell ]]
    -- upvalues: v4 (copy), v9 (copy), v2 (copy), v5 (copy), l_UserModel_0 (copy), v7 (copy)
    local v11 = v4.Dictionary.join(v9, v10);
    local v12 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy)
        if v11.onActivated then
            v11.onActivated(v11.user);
        end;
    end);
    local l_user_0 = v11.user;
    local v14 = l_user_0.metadata and l_user_0.metadata.isPending;
    local v15 = v2.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: l_user_0 (copy)
        return {
            l_user_0.thumbnail
        };
    end, {
        l_user_0.thumbnail
    });
    return v2.createElement(v5, {
        style = v11.style, 
        childWidth = v11.childWidth, 
        onActivated = v12, 
        onCircleActivated = v11.onCircleActivated, 
        subTitleText = v11.subTitleText, 
        showDivider = v11.showDivider, 
        boldTitle = not v14 and v11.boldTitle, 
        avatarCirclePresenceImage = if l_user_0.presence ~= l_UserModel_0.PresenceType.OFFLINE and l_user_0.presence ~= nil then v7 else nil, 
        titleText = l_user_0.displayName, 
        secondaryTitleText = l_user_0.alias, 
        thumbnails = v15
    }, v11.children or {});
end);