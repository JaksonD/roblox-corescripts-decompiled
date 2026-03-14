local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.AddPlayer);
local v5 = require(l_Actions_0.RemovePlayer);
local v6 = require(l_Actions_0.SetPlayerSpecialGroupIcon);
local v7 = require(l_Actions_0.SetPlayerIsCreator);
local v8 = require(l_Actions_0.SetPlayerAvatarIcon);
return (v1.createReducer({}, {
    [v4.name] = function(v9, v10) --[[ Line: 15 ]]
        -- upvalues: v2 (copy)
        local l_join_0 = v2.Dictionary.join;
        local l_v9_0 = v9;
        local v13 = {};
        local l_userId_0 = v10.userId;
        local v15 = {};
        local v16 = false;
        if game.CreatorType == Enum.CreatorType.User then
            v16 = v10.userId == game.CreatorId;
        end;
        v15.isPlaceOwner = v16;
        v15.avatarIcon = nil;
        v15.specialGroupIcon = nil;
        v13[l_userId_0] = v15;
        return l_join_0(l_v9_0, v13);
    end, 
    [v5.name] = function(v17, v18) --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v17, {
            [v18.userId] = v2.None
        });
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 31 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v19, {
            [v20.userId] = {
                isPlaceOwner = v19[v20.userId].isPlaceOwner, 
                avatarIcon = v20.avatarIcon, 
                specialGroupIcon = v19[v20.userId].specialGroupIcon
            }
        });
    end, 
    [v7.name] = function(v21, v22) --[[ Line: 41 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v21, {
            [v22.userId] = {
                isPlaceOwner = v22.isCreator, 
                avatarIcon = v21[v22.userId].avatarIcon, 
                specialGroupIcon = v21[v22.userId].specialGroupIcon
            }
        });
    end, 
    [v6.name] = function(v23, v24) --[[ Line: 51 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v23, {
            [v24.userId] = {
                isPlaceOwner = v23[v24.userId].isPlaceOwner, 
                avatarIcon = v23[v24.userId].avatarIcon, 
                specialGroupIcon = v24.specialGroupIcon
            }
        });
    end
}));