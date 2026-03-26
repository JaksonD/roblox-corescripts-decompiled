local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_HeaderBar_0 = require(l_Parent_0.UIBlox).App.Bar.HeaderBar;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.AppHeaderBar);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v7) --[[ Line: 22 ]] --[[ Name: AddFriendsPageHeader ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useNavigation_0 (copy), v1 (copy), v5 (copy), l_HeaderBar_0 (copy)
    local l_topBarHeight_0 = v7.topBarHeight;
    local v9 = l_useLocalization_0({
        titleText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Feature.Friends.Heading.AddFriends" or "CommonUI.Features.Label.AddConnections"
    });
    local v10 = l_useNavigation_0();
    local v11 = v1.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v5 (ref), v10 (copy)
        return v5.makeBackButton(function() --[[ Line: 34 ]]
            -- upvalues: v10 (ref)
            v10.pop();
        end);
    end, {
        v10
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        LayoutOrder = -1, 
        ZIndex = 2
    }, {
        headerBar = v1.createElement(l_HeaderBar_0, {
            title = v9.titleText, 
            barHeight = l_topBarHeight_0, 
            renderLeft = v11, 
            isSecondary = true, 
            paddingTop = UDim.new(0, 0), 
            paddingBottom = UDim.new(0, 0)
        })
    });
end;