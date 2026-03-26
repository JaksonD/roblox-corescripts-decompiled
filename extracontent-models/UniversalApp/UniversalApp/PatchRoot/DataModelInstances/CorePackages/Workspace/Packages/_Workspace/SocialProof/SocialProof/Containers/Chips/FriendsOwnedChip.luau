local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local l_Chip_0 = v2.Chip;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_AvatarGroupType_0 = v2.Enums.AvatarGroupType;
local v9 = require(l_script_FirstAncestor_0.Hooks.useEntityConnectionsPagination);
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagConnectionsToFriendsRename_0 = v13.FFlagConnectionsToFriendsRename;
local l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 = v13.FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation;
return v4.forwardRef(function(v16, v17) --[[ Line: 32 ]] --[[ Name: FriendsOwnedChip ]]
    -- upvalues: l_useDispatch_0 (copy), v9 (copy), v10 (copy), v4 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (copy), l_Chip_0 (copy), l_AvatarGroupType_0 (copy)
    local l_fromProfile_0 = v16.fromProfile;
    local l_itemId_0 = v16.itemId;
    local l_itemType_0 = v16.itemType;
    local v21 = l_useDispatch_0();
    local v22 = v9({
        entityId = l_itemId_0, 
        entityType = l_itemType_0, 
        connectionType = v10.ConnectionType.Friend
    });
    local v23 = v22.userIds or {};
    local v24 = {
        table.unpack(v23, 1, (math.min(2, #v23)))
    };
    local v25 = v22.totalConnections or 0;
    local v26 = v4.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v21 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_itemId_0 (copy), l_itemType_0 (copy), l_fromProfile_0 (copy)
        v21(l_NavigateDown_0({
            name = l_AppPage_0.FriendsOwnedUserList, 
            extraProps = {
                entityId = l_itemId_0, 
                entityType = l_itemType_0, 
                source = l_fromProfile_0 and "profile" or "marketplace"
            }
        }));
    end, {
        v21, 
        l_itemId_0, 
        l_itemType_0, 
        l_fromProfile_0
    });
    local v27 = l_useLocalization_0({
        connectionsOwn = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendsOwn" or "Feature.Friends.Label.ConnectionsOwn"; 
            numberOfConnections = v25
        }, 
        singleConnectionOwns = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendOwns" or "Feature.Friends.Label.ConnectionOwns"
    });
    local v28 = if v25 == 1 then v27.singleConnectionOwns else v27.connectionsOwn;
    if l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 then
        v4.useEffect(function() --[[ Line: 82 ]]
            -- upvalues: v25 (copy), v16 (copy)
            if v25 > 0 and v16.chipIsRenderedCallback then
                v16.chipIsRenderedCallback(true);
            end;
        end, {
            v25, 
            v16.chipIsRenderedCallback
        });
    end;
    if v25 == 0 then
        return nil;
    else
        return v4.createElement(l_Chip_0, {
            LayoutOrder = v16.layoutOrder or 0, 
            text = v28, 
            onActivated = v26, 
            leading = {
                type = "AvatarGroup", 
                props = {
                    avatars = v24, 
                    type = l_AvatarGroupType_0.Stacked, 
                    max = 2
                }
            }, 
            ref = v17, 
            NextSelectionUp = v16.NextSelectionUp, 
            NextSelectionDown = v16.NextSelectionDown, 
            NextSelectionRight = v16.NextSelectionRight, 
            NextSelectionLeft = v16.NextSelectionLeft
        });
    end;
end);