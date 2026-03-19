local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useAbbreviatedNumberLocalization_0 = v4.Hooks.useAbbreviatedNumberLocalization;
local v7 = require(l_Parent_0.VerifiedBadges);
local v8 = require(l_Parent_0.UserLib);
local l_Constants_0 = v8.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v8.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local l_Chip_0 = v3.Chip;
local l_ChipSize_0 = v3.Enums.ChipSize;
local l_EmojiWrapper_0 = v7.EmojiWrapper;
local v17 = require(l_script_FirstAncestor_0.Common.TextKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v19 = require(l_script_FirstAncestor_0.Hooks.useMembersFollowersLabel);
local v20 = require(l_script_FirstAncestor_0.Contexts.useGroupsWrapperContext);
return v2.memo(function(v21) --[[ Line: 38 ]] --[[ Name: GroupListItem ]]
    -- upvalues: v20 (copy), l_useAbbreviatedNumberLocalization_0 (copy), v19 (copy), l_useLocalization_0 (copy), v17 (copy), v2 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_Chip_0 (copy), l_ChipSize_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_EmojiWrapper_0 (copy), v7 (copy), l_Text_0 (copy)
    local v22 = v20();
    local l_group_0 = v21.group;
    if not l_group_0 then
        return nil;
    else
        local v24 = l_group_0.memberCount or 0;
        local v25 = l_useAbbreviatedNumberLocalization_0(if v24 > 0 then v24 else nil);
        local v26 = v19({
            hasSocialModules = l_group_0.hasSocialModules or false, 
            count = v24, 
            truncatedCount = v25, 
            capitalize = false
        });
        local v27 = l_useLocalization_0({
            owned = v17.LabelOwned
        });
        local l_id_0 = l_group_0.id;
        local v29 = v2.useMemo(function() --[[ Line: 62 ]]
            -- upvalues: l_group_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_id_0 (copy), l_Constants_0 (ref)
            if l_group_0.thumbnail and l_group_0.thumbnail ~= "" then
                return l_group_0.thumbnail;
            else
                return l_getRbxthumbWithTypeSizeAndOptions_0(tostring(l_id_0), l_Constants_0.RbxthumbTypes.GroupIcon, 150);
            end;
        end, {
            l_id_0, 
            l_group_0.thumbnail
        });
        local v30 = v2.useCallback(function() --[[ Line: 73 ]]
            -- upvalues: l_id_0 (copy), v22 (copy)
            if l_id_0 then
                v22.navigateTo.groupDetails(l_id_0);
            end;
        end, {
            v22.navigateTo.groupDetails, 
            l_id_0
        });
        local v31 = if v21.showMemberCount and l_group_0.memberCount ~= nil then v26 else nil;
        local v33 = v2.useMemo(function() --[[ Line: 81 ]]
            -- upvalues: v21 (copy), l_group_0 (copy), v2 (ref), l_Chip_0 (ref), v27 (copy), l_ChipSize_0 (ref)
            if not v21.showRank then
                return nil;
            elseif l_group_0.isOwner then
                return v2.createElement(l_Chip_0, {
                    text = v27.owned, 
                    size = l_ChipSize_0.Small, 
                    LayoutOrder = 3, 
                    isChecked = true, 
                    onActivated = function() --[[ Line: 92 ]] --[[ Name: onActivated ]]

                    end
                });
            else
                local v32 = if l_group_0.role and l_group_0.role.name and l_group_0.role.name ~= "" then l_group_0.role.name else nil;
                if v32 then
                    return v2.createElement(l_Chip_0, {
                        text = v32, 
                        size = l_ChipSize_0.Small, 
                        LayoutOrder = 3, 
                        onActivated = function() --[[ Line: 101 ]] --[[ Name: onActivated ]]

                        end
                    });
                else
                    return nil;
                end;
            end;
        end, {
            v21.showRank, 
            l_group_0.isOwner, 
            l_group_0.role, 
            v27.owned
        });
        return v2.createElement(l_View_0, {
            tag = "row size-full-0 auto-y gap-large align-y-center padding-small radius-medium", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v21.layoutOrder, 
            onActivated = v30
        }, {
            Thumbnail = v2.createElement(l_Image_0, {
                LayoutOrder = 1, 
                Image = v29, 
                Size = UDim2.fromOffset(38, 38), 
                tag = "radius-medium bg-surface-100"
            }), 
            Details = v2.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "col size-full-0 auto-y fill"
            }, {
                NameRow = v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 align-y-center", 
                    LayoutOrder = 1
                }, {
                    Name = if l_group_0.groupHasVerifiedBadge then v2.createElement(l_EmojiWrapper_0, {
                        emoji = v7.emoji.verified, 
                        layoutOrder = 1
                    }, {
                        NameText = v2.createElement(l_Text_0, {
                            Text = l_group_0.name or "", 
                            tag = "auto-xy text-align-x-left content-default text-title-medium text-no-wrap text-truncate-end padding-right-small"
                        })
                    }) else v2.createElement(l_Text_0, {
                        Text = l_group_0.name or "", 
                        tag = "auto-xy text-align-x-left content-default text-title-medium text-no-wrap text-truncate-end", 
                        LayoutOrder = 1
                    })
                }), 
                Meta = v31 and v2.createElement(l_Text_0, {
                    Text = v31, 
                    tag = "auto-xy text-align-x-left content-muted text-no-wrap text-truncate-end text-body-medium", 
                    LayoutOrder = 2
                }) or nil
            }), 
            RoleChip = v33
        });
    end;
end);