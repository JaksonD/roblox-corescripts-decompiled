local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_abbreviateCount_0 = require(l_Parent_0.Localization).abbreviateCount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local l_Image_0 = v3.Image;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v14 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialCountsItem);
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePressingCommunityOwnerInPeekView);
return function(v18) --[[ Line: 39 ]] --[[ Name: CommunityProfileHeader ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v15 (copy), v16 (copy), v4 (copy), v17 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v10 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), v14 (copy), l_abbreviateCount_0 (copy)
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalization_0({
        byOwner = {
            v15.ByOwner; 
            ownerName = v18.ownerName
        }, 
        members = v15.Members, 
        followers = v15.Followers, 
        follower = v15.Follower
    });
    local v21 = nil;
    if v16 then
        v21 = v4.useMemo(function() --[[ Line: 51 ]]
            -- upvalues: v18 (copy), v20 (copy)
            if v18.hasSocialModules then
                return v20.members;
            elseif v18.membersCount == 1 then
                return v20.follower;
            else
                return v20.followers;
            end;
        end, {
            v20, 
            v18.membersCount, 
            v18.hasSocialModules
        });
    end;
    local v22 = v17 and function() --[[ Line: 64 ]]
        -- upvalues: v18 (copy), v19 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v10 (ref)
        if v18.ownerUserId then
            v19(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v18.ownerUserId, 
                extraProps = {
                    profileType = v10.ProfileTypes.User
                }
            }));
        end;
    end or nil;
    return v4.createElement(l_HorizontalPageMargin_0, {
        layoutOrder = v18.layoutOrder, 
        backgroundTransparency = 1, 
        size = UDim2.new(1, 0, 0, 0), 
        useAutomaticSizing = true
    }, {
        Container = v4.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "col size-full-0 auto-xy gap-xsmall"
        }, {
            HeaderInformation = v4.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row gap-medium size-full-0 auto-xy"
            }, {
                CommunityThumbnail = v4.createElement(l_Image_0, {
                    LayoutOrder = 1, 
                    tag = "radius-medium self-center", 
                    Image = v18.thumbnail, 
                    Size = UDim2.new(0, 80, 0, 80)
                }), 
                Names = v4.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "fill col size-full-0 auto-y align-y-center gap-small", 
                    Size = UDim2.new(1, 0, 0, 80)
                }, {
                    CommunityName = if v18.name then v4.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        tag = "content-emphasis auto-xy text-heading-small text-wrap text-align-x-left", 
                        Text = v18.name
                    }) else nil, 
                    OwnerName = if v18.ownerName then v4.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        tag = "content-default auto-xy text-body-medium text-wrap text-align-x-left", 
                        Text = v20.byOwner, 
                        onActivated = if v17 then v22 else nil
                    }) else nil
                })
            }), 
            Counts = v4.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "size-full-0 auto-xy"
            }, {
                MembersCount = v4.createElement(v14, {
                    layoutOrder = 1, 
                    text = if v16 then v21 else v20.members, 
                    count = l_abbreviateCount_0(v18.membersCount), 
                    onActivated = function() --[[ Line: 131 ]] --[[ Name: onActivated ]]

                    end
                })
            })
        })
    });
end;