local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_IconName_0 = v3.Enums.IconName;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconButton_0 = v3.IconButton;
local l_View_0 = v3.View;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local v11 = require(l_Parent_0.UserTile);
local v12 = require(l_script_FirstAncestor_0.BaseComponents.EditComponentRow);
local v13 = require(l_script_FirstAncestor_0.BaseComponents.EditProfileHeaderBar);
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v15) --[[ Line: 40 ]] --[[ Name: EditProfileLanding ]]
    -- upvalues: l_useProfileCardWidth_0 (copy), v14 (copy), l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), v13 (copy), v11 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_ButtonVariant_0 (copy), v12 (copy)
    local v16 = l_useProfileCardWidth_0();
    local v17 = if v15.isPolicyEnabled then v14.AgedUpDisplayName else v14.DisplayName;
    local v18 = l_useLocalization_0({
        TopBarTitle = v14.Title, 
        UsernameLabel = v14.Username, 
        DisplayNameLabel = v17, 
        BioLabel = v14.About, 
        BioPlaceholder = v14.AboutPlaceholder
    });
    return v2.createElement(l_View_0, {
        tag = "col bg-surface-0 anchor-top-right position-top-right items-start", 
        Size = UDim2.new(0, v16, 1, 0)
    }, {
        TopBar = v2.createElement(v13, {
            onClose = v15.onClose, 
            headerText = v18.TopBarTitle
        }), 
        EditableComponents = v2.createElement(l_View_0, {
            tag = "col padding-xlarge gap-xxlarge size-full-0 auto-y"
        }, {
            AvatarEditRow = v2.createElement(l_View_0, {
                tag = "size-full-2400", 
                LayoutOrder = 1
            }, {
                AvatarContainer = v2.createElement(l_View_0, {
                    tag = "size-2400-2400 position-center-center anchor-center-center"
                }, {
                    AvatarHeadshot = v2.createElement(l_View_0, {
                        tag = "size-full-full"
                    }, {
                        UserTile = v2.createElement(v11.UserTile, {
                            userId = v15.userId, 
                            layoutMode = v11.LayoutMode.compact, 
                            onActivated = v15.settingButtonOnActivated.avatar
                        })
                    }), 
                    EditAvatarIconButton = v2.createElement(l_View_0, {
                        tag = "position-bottom-right anchor-bottom-right auto-xy bg-over-media-0 radius-circle"
                    }, {
                        IconButton = v2.createElement(l_IconButton_0, {
                            icon = l_IconName_0.PhotoCamera, 
                            size = l_IconSize_0.Small, 
                            onActivated = v15.settingButtonOnActivated.avatar, 
                            isCircular = true, 
                            variant = l_ButtonVariant_0.Standard
                        })
                    })
                })
            }), 
            TextComponentsList = v2.createElement(l_View_0, {
                tag = "col size-full-0 auto-y bg-surface-100 radius-medium", 
                LayoutOrder = 2
            }, {
                EditDisplayNameRow = v2.createElement(v12, {
                    label = v18.DisplayNameLabel, 
                    currentValue = v15.displayName, 
                    onActivated = v15.areNamesLoading and function() --[[ Line: 101 ]]

                    end or v15.settingButtonOnActivated.displayName, 
                    layoutOrder = 1, 
                    shouldShimmer = v15.areNamesLoading, 
                    forwardRef = v15.firstItemRef
                }), 
                UsernameEditRow = v2.createElement(v12, {
                    label = v18.UsernameLabel, 
                    currentValue = v15.username, 
                    onActivated = v15.settingButtonOnActivated.username, 
                    layoutOrder = 2, 
                    shouldShimmer = v15.areNamesLoading
                }), 
                BioEditRow = v2.createElement(v12, {
                    label = v18.BioLabel, 
                    currentValue = if v15.bioText ~= "" and v15.bioText ~= nil then v15.bioText else v18.BioPlaceholder, 
                    onActivated = v15.settingButtonOnActivated.bio, 
                    layoutOrder = 3, 
                    shouldShimmer = v15.isBioLoading
                })
            })
        })
    });
end;