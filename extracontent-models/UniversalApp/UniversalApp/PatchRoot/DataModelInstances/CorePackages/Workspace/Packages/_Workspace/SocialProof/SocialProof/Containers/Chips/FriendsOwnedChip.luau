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
local l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation;
return v4.forwardRef(function(v14, v15) --[[ Line: 30 ]] --[[ Name: FriendsOwnedChip ]]
    -- upvalues: l_useDispatch_0 (copy), v9 (copy), v10 (copy), v4 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useLocalization_0 (copy), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (copy), l_Chip_0 (copy), l_AvatarGroupType_0 (copy)
    local l_fromProfile_0 = v14.fromProfile;
    local l_itemId_0 = v14.itemId;
    local l_itemType_0 = v14.itemType;
    local v19 = l_useDispatch_0();
    local v20 = v9({
        entityId = l_itemId_0, 
        entityType = l_itemType_0, 
        connectionType = v10.ConnectionType.Friend
    });
    local v21 = v20.userIds or {};
    local v22 = {
        table.unpack(v21, 1, (math.min(2, #v21)))
    };
    local v23 = v20.totalConnections or 0;
    local v24 = v4.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_itemId_0 (copy), l_itemType_0 (copy), l_fromProfile_0 (copy)
        v19(l_NavigateDown_0({
            name = l_AppPage_0.FriendsOwnedUserList, 
            extraProps = {
                entityId = l_itemId_0, 
                entityType = l_itemType_0, 
                source = l_fromProfile_0 and "profile" or "marketplace"
            }
        }));
    end, {
        v19, 
        l_itemId_0, 
        l_itemType_0, 
        l_fromProfile_0
    });
    local v25 = l_useLocalization_0({
        connectionsOwn = {
            "Feature.Friends.Label.ConnectionsOwn"; 
            numberOfConnections = v23
        }, 
        singleConnectionOwns = "Feature.Friends.Label.ConnectionOwns"
    });
    local v26 = if v23 == 1 then v25.singleConnectionOwns else v25.connectionsOwn;
    if l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 then
        v4.useEffect(function() --[[ Line: 76 ]]
            -- upvalues: v23 (copy), v14 (copy)
            if v23 > 0 and v14.chipIsRenderedCallback then
                v14.chipIsRenderedCallback(true);
            end;
        end, {
            v23, 
            v14.chipIsRenderedCallback
        });
    end;
    if v23 == 0 then
        return nil;
    else
        return v4.createElement(l_Chip_0, {
            LayoutOrder = v14.layoutOrder or 0, 
            text = v26, 
            onActivated = v24, 
            leading = {
                type = "AvatarGroup", 
                props = {
                    avatars = v22, 
                    type = l_AvatarGroupType_0.Stacked, 
                    max = 2
                }
            }, 
            ref = v15, 
            NextSelectionUp = v14.NextSelectionUp, 
            NextSelectionDown = v14.NextSelectionDown, 
            NextSelectionRight = v14.NextSelectionRight, 
            NextSelectionLeft = v14.NextSelectionLeft
        });
    end;
end);