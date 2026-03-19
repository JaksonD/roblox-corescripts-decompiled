local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_BaseMenu_0 = v3.App.Menu.BaseMenu;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_Parent_0.ToastRodux);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_FriendsNetworking_0 = require(l_Parent_0.AddFriendsState).Networking.FriendsNetworking;
local v12 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local l_EventNames_0 = require(l_script_FirstAncestor_0.Analytics).EventNames;
return function(v14) --[[ Line: 31 ]] --[[ Name: IgnoreAllFriendsRequestsMenu ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), l_useLocalUserId_0 (copy), v12 (copy), v2 (copy), v8 (copy), l_EventNames_0 (copy), l_FriendsNetworking_0 (copy), l_Images_0 (copy), l_BaseMenu_0 (copy)
    local l_open_0 = v14.open;
    local v16 = v14.width or UDim.new(0, 300);
    local v17 = v14.openPositionY or UDim.new(0, 0);
    local l_closeMenu_0 = v14.closeMenu;
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalization_0({
        ignoreAllLabel = "Feature.AddFriends.Action.IgnoreAll"
    });
    local v21 = l_useDesignTokens_0();
    local v22 = l_useLocalUserId_0();
    local v23 = v12();
    local v25 = v2.useCallback(function(v24) --[[ Line: 46 ]]
        -- upvalues: v19 (copy), v8 (ref)
        if not v24 then
            return;
        else
            v19(v8.Actions.SetCurrentToastMessage({
                toastMessage = v24.toastTitle, 
                toastIcon = v24.iconImage
            }));
            return;
        end;
    end, {
        v19
    });
    local v27 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v23 (copy), l_EventNames_0 (ref), v19 (copy), l_FriendsNetworking_0 (ref), v22 (copy), v25 (copy), l_Images_0 (ref)
        v23(l_EventNames_0.IgnoreAllBtnClick);
        return v19(l_FriendsNetworking_0.DeclineAllFriendRequests.API({
            currentUserId = v22
        })):andThen(function(v26) --[[ Line: 63 ]]
            -- upvalues: v25 (ref), l_Images_0 (ref)
            v25({
                toastTitle = v26 and v26.responseBody and v26.responseBody.backgrounded and "Feature.AddFriends.Label.DeclineAllBackgrounded" or "Feature.Profile.Action.AllRequestsIgnored", 
                iconImage = l_Images_0["icons/actions/reject"]
            });
        end);
    end, {
        v22, 
        v23
    });
    local v28 = v2.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v27 (copy), l_closeMenu_0 (copy)
        v27();
        l_closeMenu_0();
    end, {
        v27, 
        l_closeMenu_0
    });
    return l_open_0 and v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        ZIndex = 5
    }, {
        IgnoreAllMenuFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v21.Global.Space_600), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            IgnoreAllFriendsRequestsMenu = v2.createElement(l_BaseMenu_0, {
                width = v16, 
                buttonProps = {
                    {
                        text = v20.ignoreAllLabel, 
                        onActivated = v28
                    }
                }, 
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.new(UDim.new(1, 0), v17)
            })
        })
    }) or nil;
end;