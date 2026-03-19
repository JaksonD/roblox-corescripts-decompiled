local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_BaseMenu_0 = v3.App.Menu.BaseMenu;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v8 = require(l_ContactList_0.dependencies);
local l_useSelector_0 = v8.Hooks.useSelector;
local v10 = require(l_ContactList_0.Analytics.useAnalytics);
local v11 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v12 = require(l_ContactList_0.Enums.FriendAction);
local l_useLocalization_0 = v8.Hooks.useLocalization;
return function(v14) --[[ Line: 22 ]] --[[ Name: ConfigureFriendMenu ]]
    -- upvalues: v10 (copy), l_useStyle_0 (copy), l_useSelector_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_BaseMenu_0 (copy), l_Images_0 (copy), v11 (copy), v12 (copy)
    local v15 = v10();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v18 = l_useSelector_0(function(v17) --[[ Line: 27 ]]
        if v17.PlayerMenu.friend then
            return v17.PlayerMenu.friend.combinedName;
        else
            return "";
        end;
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 35 ]]
        if v19.PlayerMenu.friend then
            return v19.PlayerMenu.friend.userId;
        else
            return nil;
        end;
    end);
    local v21 = l_useLocalization_0({
        blockLabel = {
            "Feature.Call.Label.Block"; 
            combinedName = v18
        }, 
        unfriendLabel = {
            "Feature.Call.Label.Unfriend"; 
            combinedName = v18
        }
    });
    return v2.createElement(l_BaseMenu_0, {
        buttonProps = {
            {
                icon = l_Images_0["icons/actions/block"], 
                text = v21.blockLabel, 
                onActivated = function() --[[ Line: 59 ]] --[[ Name: onActivated ]]
                    -- upvalues: v15 (copy), v11 (ref), v20 (copy), v14 (copy), v12 (ref)
                    v15.fireEvent(v11.PhoneBookPlayerMenuBlockClicked, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v20
                    });
                    v14.initiateConfirmation(v12.Block);
                end
            }, 
            {
                icon = l_Images_0["icons/actions/friends/friendRemove"], 
                text = v21.unfriendLabel, 
                onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
                    -- upvalues: v15 (copy), v11 (ref), v20 (copy), v14 (copy), v12 (ref)
                    v15.fireEvent(v11.PhoneBookPlayerMenuUnfriendClicked, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v20
                    });
                    v14.initiateConfirmation(v12.Unfriend);
                end
            }
        }, 
        background = l_Theme_0.BackgroundUIDefault, 
        width = UDim.new(0, 352), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
end;