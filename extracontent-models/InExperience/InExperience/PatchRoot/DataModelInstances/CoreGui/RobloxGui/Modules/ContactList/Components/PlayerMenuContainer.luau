local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v7 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.BlockPlayer);
local v8 = require(l_ContactList_0.dependencies);
local l_UnfriendTargetUserId_0 = v8.NetworkingFriends.UnfriendTargetUserId;
local l_UIBlox_0 = v8.UIBlox;
local l_useSelector_0 = v8.Hooks.useSelector;
local l_useDispatch_0 = v8.Hooks.useDispatch;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local v14 = require(l_ContactList_0.Actions.CloseCFM);
local v15 = require(l_ContactList_0.Analytics.useAnalytics);
local v16 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v17 = require(l_ContactList_0.Components.ContactListCommon.ConfigureFriendMenu);
local v18 = require(l_ContactList_0.Enums.FriendAction);
local v19 = require(l_ContactList_0.Actions.UpdateLastFriend);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v25 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function() --[[ Line: 43 ]] --[[ Name: PlayerMenuContainer ]]
    -- upvalues: v15 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_useLocalization_0 (copy), v3 (copy), v18 (copy), v7 (copy), v19 (copy), l_UnfriendTargetUserId_0 (copy), v25 (copy), v16 (copy), v17 (copy), l_withStyle_0 (copy), v4 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v14 (copy), l_CoreGui_0 (copy)
    local v26 = v15();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v28 = l_useDispatch_0();
    local v30 = l_useSelector_0(function(v29) --[[ Line: 50 ]]
        return v29.PlayerMenu.isOpen;
    end);
    local v32 = l_useSelector_0(function(v31) --[[ Line: 54 ]]
        return v31.PlayerMenu.friend;
    end);
    local v33 = l_useLocalization_0({
        blockTitle = {
            "Feature.Call.Label.Block"; 
            combinedName = v32.combinedName
        }, 
        blockAction = "Feature.Friends.Action.Block", 
        unfriendTitle = {
            "Feature.Call.Label.Unfriend"; 
            combinedName = v32.combinedName
        }, 
        unfriendAction = "Feature.Friends.Action.Unfriend", 
        cancelAction = "Feature.Friends.Label.Cancel", 
        confirmationDescription = {
            "Feature.SettingsHub.Message.BlockConfirmation"; 
            DISPLAY_NAME = v32.combinedName, 
            RBX_NAME = v32.userName
        }
    });
    local v34, v35 = v3.useState(v18.NoAction);
    local v36, v37 = v3.useState(Vector2.new(0, 0));
    local v38, v39 = v3.useState("");
    local v40, v41 = v3.useState("");
    local v45 = v3.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: v34 (copy), v18 (ref), v28 (copy), v7 (ref), v32 (copy), v19 (ref), l_UnfriendTargetUserId_0 (ref), v25 (ref), v26 (copy), v16 (ref)
        if v34 == v18.Block then
            v28(v7({
                UserId = v32.userId
            }));
            v28(v19(v32.userId));
            return;
        else
            if v34 == v18.Unfriend then
                local v42 = l_UnfriendTargetUserId_0.API({
                    currentUserId = v25, 
                    targetUserId = v32.userId
                });
                v28(v42):andThen(function(_) --[[ Line: 84 ]]
                    -- upvalues: v26 (ref), v16 (ref), v32 (ref), v28 (ref), v19 (ref)
                    v26.fireEvent(v16.PhoneBookPlayerMenuUnfriendFinished, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v32.userId, 
                        success = true
                    });
                    v28(v19(v32.userId));
                end):catch(function(_) --[[ Line: 92 ]]
                    -- upvalues: v26 (ref), v16 (ref), v32 (ref)
                    v26.fireEvent(v16.PhoneBookPlayerMenuUnfriendFinished, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v32.userId, 
                        success = false
                    });
                end);
            end;
            return;
        end;
    end, {
        v34, 
        v32.userId
    });
    v3.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v34 (copy), v18 (ref), v39 (copy), v33 (copy), v41 (copy)
        if v34 == v18.Block then
            v39(v33.blockTitle);
            v41(v33.blockAction);
            return;
        else
            if v34 == v18.Unfriend then
                v39(v33.unfriendTitle);
                v41(v33.unfriendAction);
            end;
            return;
        end;
    end, {
        v34, 
        v32.combinedName, 
        v33.blockAction, 
        v33.blockTitle, 
        v33.unfriendAction, 
        v33.unfriendTitle
    });
    local v47 = v3.useCallback(function(v46) --[[ Line: 119 ]]
        -- upvalues: v35 (copy)
        v35(v46);
    end, {});
    local v48 = v3.useMemo(function() --[[ Line: 123 ]]
        -- upvalues: v3 (ref), v17 (ref), v47 (copy)
        return v3.createElement(v17, {
            initiateConfirmation = v47
        });
    end, {});
    local v50 = v3.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: l_withStyle_0 (ref), v4 (ref), l_InteractiveAlert_0 (ref), v38 (copy), v33 (copy), l_ButtonType_0 (ref), v28 (copy), v14 (ref), v35 (copy), v18 (ref), v40 (copy), v45 (copy), v36 (copy)
        return l_withStyle_0(function(_) --[[ Line: 130 ]]
            -- upvalues: v4 (ref), l_InteractiveAlert_0 (ref), v38 (ref), v33 (ref), l_ButtonType_0 (ref), v28 (ref), v14 (ref), v35 (ref), v18 (ref), v40 (ref), v45 (ref), v36 (ref)
            return v4.createElement(l_InteractiveAlert_0, {
                title = v38, 
                bodyText = v33.confirmationDescription, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                text = v33.cancelAction, 
                                onActivated = function() --[[ Line: 140 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v28 (ref), v14 (ref), v35 (ref), v18 (ref)
                                    v28(v14());
                                    v35(v18.NoAction);
                                end
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Alert, 
                            props = {
                                text = v40, 
                                onActivated = function() --[[ Line: 150 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v45 (ref), v28 (ref), v14 (ref), v35 (ref), v18 (ref)
                                    v45();
                                    v28(v14());
                                    v35(v18.NoAction);
                                end
                            }
                        }
                    }
                }, 
                screenSize = v36
            });
        end);
    end, {
        v38, 
        v40, 
        v34, 
        v32.combinedName, 
        v32.userName, 
        v33.cancelAction, 
        v33.confirmationDescription
    });
    return v3.createElement(v4.Portal, {
        target = l_CoreGui_0
    }, {
        PlayerMenuScreen = v3.createElement("ScreenGui", {
            Enabled = v30, 
            IgnoreGuiInset = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = 8, 
            [v3.Change.AbsoluteSize] = function(v51) --[[ Line: 180 ]]
                -- upvalues: v37 (copy)
                v37(v51.AbsoluteSize);
            end
        }, {
            Overlay = v3.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                [v3.Event.Activated] = function() --[[ Line: 191 ]]
                    -- upvalues: v28 (copy), v14 (ref), v35 (copy), v18 (ref)
                    v28(v14());
                    v35(v18.NoAction);
                end
            }), 
            PlayerMenu = if v34 == v18.NoAction then v48 else v50
        })
    });
end;