local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
local l_Button_0 = v4.Button;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v9 = require(l_CorePackages_0.Workspace.Packages.PeopleService);
return v2.memo(function(v10) --[[ Line: 22 ]] --[[ Name: AddConnectionButton ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v9 (copy), l_Players_0 (copy), v3 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v11 = l_useLocalization_0({
        isFriend = "CommonUI.Features.Label.Connection", 
        addPerson = "CommonUI.Features.Label.Add", 
        requestSent = "CommonUI.Features.Label.Sent"
    });
    local v12 = v2.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v9 (ref)
        return v9.getService("Constants");
    end, {});
    local v13 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v9 (ref)
        return v9.getService("PeopleAnalyticsManager");
    end, {});
    local v14 = v2.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v9 (ref)
        return v9.getService("FriendStatusStore");
    end, {});
    local v15 = v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v10 (copy), l_Players_0 (ref)
        if v10.userId then
            return (l_Players_0:GetPlayerByUserId(v10.userId));
        else
            return nil;
        end;
    end, {
        v10.userId
    });
    local v16 = v3.useSignalState(v14.getFriendButtonText(v10.userId, v11));
    local v17 = v3.useSignalState(v14.getIsFriendButtonDisabled(v10.userId));
    return v2.createElement(l_Button_0, {
        text = v16, 
        variant = if v17 then l_ButtonVariant_0.Subtle else l_ButtonVariant_0.Emphasis, 
        fillBehavior = l_FillBehavior_0.Fill, 
        isDisabled = v17, 
        LayoutOrder = v10.layoutOrder, 
        onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
            -- upvalues: v13 (copy), v12 (copy), v14 (copy), v15 (copy)
            v13:trackRequestFriendship(v12.ANALYTICS.ENTRY_POINT.PLAYER_PROFILE);
            v14.sendFriendRequest(v15);
        end
    });
end);