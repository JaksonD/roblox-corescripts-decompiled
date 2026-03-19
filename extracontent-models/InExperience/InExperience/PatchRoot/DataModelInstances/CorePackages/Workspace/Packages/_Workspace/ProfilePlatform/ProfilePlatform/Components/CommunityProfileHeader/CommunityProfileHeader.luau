local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_abbreviateCount_0 = require(l_Parent_0.Localization).abbreviateCount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Image_0 = v3.Image;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v10 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialCountsItem);
local v11 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
return function(v13) --[[ Line: 30 ]] --[[ Name: CommunityProfileHeader ]]
    -- upvalues: l_useLocalization_0 (copy), v11 (copy), v12 (copy), v4 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), v10 (copy), l_abbreviateCount_0 (copy)
    local v14 = l_useLocalization_0({
        byOwner = {
            v11.ByOwner; 
            ownerName = v13.ownerName
        }, 
        members = v11.Members, 
        followers = v11.Followers, 
        follower = v11.Follower
    });
    local v15 = nil;
    if v12 then
        v15 = v4.useMemo(function() --[[ Line: 40 ]]
            -- upvalues: v13 (copy), v14 (copy)
            if v13.hasSocialModules then
                return v14.members;
            elseif v13.membersCount == 1 then
                return v14.follower;
            else
                return v14.followers;
            end;
        end, {
            v14, 
            v13.membersCount, 
            v13.hasSocialModules
        });
    end;
    return v4.createElement(l_HorizontalPageMargin_0, {
        layoutOrder = v13.layoutOrder, 
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
                    Image = v13.thumbnail, 
                    Size = UDim2.new(0, 80, 0, 80)
                }), 
                Names = v4.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "fill col size-full-0 auto-y align-y-center gap-small", 
                    Size = UDim2.new(1, 0, 0, 80)
                }, {
                    CommunityName = if v13.name then v4.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        tag = "content-emphasis auto-xy text-heading-small text-wrap text-align-x-left", 
                        Text = v13.name
                    }) else nil, 
                    OwnerName = if v13.ownerName then v4.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        tag = "content-default auto-xy text-body-medium text-wrap text-align-x-left", 
                        Text = v14.byOwner
                    }) else nil
                })
            }), 
            Counts = v4.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "size-full-0 auto-xy"
            }, {
                MembersCount = v4.createElement(v10, {
                    layoutOrder = 1, 
                    text = if v12 then v15 else v14.members, 
                    count = l_abbreviateCount_0(v13.membersCount), 
                    onActivated = function() --[[ Line: 103 ]] --[[ Name: onActivated ]]

                    end
                })
            })
        })
    });
end;