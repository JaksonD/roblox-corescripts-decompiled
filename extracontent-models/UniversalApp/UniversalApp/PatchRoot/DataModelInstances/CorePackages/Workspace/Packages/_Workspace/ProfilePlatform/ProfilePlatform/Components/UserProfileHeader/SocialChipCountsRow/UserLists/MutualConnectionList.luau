local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserList);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v7 = require(l_Parent_0.RobloxAppHooks);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(l_Parent_0.InputUi);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_UserListViewAdaptor_0 = v4.Components.UserListViewAdaptor;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_getSafeAreaSize_0 = v9.getSafeAreaSize;
local v19 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local v21 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = require(l_Parent_0.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon;
return function(_) --[[ Line: 30 ]] --[[ Name: MutualConnectionList ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigationProps_0 (copy), l_useScreenSize_0 (copy), l_useSelector_0 (copy), l_getSafeAreaSize_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), v21 (copy), v12 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v19 (copy), v2 (copy), l_useLocalization_0 (copy), v13 (copy), v3 (copy), l_UserListViewAdaptor_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v25 = l_useDispatch_0();
    local v28 = l_useNavigationProps_0(function(_, v27) --[[ Line: 32 ]]
        return {
            mutualFriendIds = v27.mutualFriendIds
        };
    end);
    local v29 = l_useScreenSize_0();
    local v31 = l_useSelector_0(function(v30) --[[ Line: 40 ]]
        return v30.GlobalGuiInset;
    end);
    local v32 = l_getSafeAreaSize_0(v29, v31);
    local v33 = if l_FFlagProfilePlatformNewProfileHeader_0 then v21().formFactor == v12.ProfileFormFactor.Wide else false;
    local v34 = (if l_FFlagProfilePlatformNewProfileHeader_0 then if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v19(v33) else math.min(v32.X.Offset, v2.MAXIMUM_CONTAINER_WIDTH)) / v32.X.Offset;
    local v35 = {
        position = UDim2.fromScale(1, 0), 
        size = UDim2.fromScale(v34, 1), 
        anchorPoint = Vector2.new(1, 0)
    };
    local l_mutualFriendIds_0 = v28.mutualFriendIds;
    local v37 = l_useLocalization_0({
        mutualConnections = {
            v13.MutualConnectionsTitle; 
            numConnections = #l_mutualFriendIds_0
        }, 
        mutualConnection = v13.MutualConnectionTitle
    });
    if #l_mutualFriendIds_0 == 0 then
        return nil;
    else
        local v38 = if #l_mutualFriendIds_0 == 1 then v37.mutualConnection else v37.mutualConnections;
        return v3.createElement(l_UserListViewAdaptor_0, {
            users = l_mutualFriendIds_0, 
            title = v38, 
            wideModePeekViewLayout = v35, 
            onUserSelected = function(v39) --[[ Line: 80 ]] --[[ Name: onUserSelected ]]
                -- upvalues: v25 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v12 (ref)
                v25(l_NavigateDown_0({
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = v39, 
                    extraProps = {
                        profileType = v12.ProfileTypes.User, 
                        source = v12.Sources.MutualConnectionsList
                    }
                }));
            end
        });
    end;
end;