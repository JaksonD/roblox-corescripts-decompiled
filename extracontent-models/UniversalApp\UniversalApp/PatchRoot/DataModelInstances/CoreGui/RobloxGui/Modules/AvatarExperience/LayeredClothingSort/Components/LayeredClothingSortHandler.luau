local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.tutils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v7 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort);
local v8 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v9 = v2.PureComponent:extend("LayeredClothingSortHandler");
v9.validateProps = v4.strictInterface({
    avatarRoute = v4.table, 
    tryOnItems = v4.table, 
    currentSort = v4.optional(v4.table), 
    clearCurrentSort = v4.callback, 
    clearRemovedItems = v4.callback
});
v9.render = function(_) --[[ Line: 35 ]] --[[ Name: render ]]
    return nil;
end;
local function _(v11, v12) --[[ Line: 39 ]] --[[ Name: hasSameKeys ]]
    -- upvalues: v5 (copy)
    local v13 = 0;
    for v14 in v11 do
        v13 = v13 + 1;
        if v12[v14] == nil then
            return false;
        end;
    end;
    return v13 == v5.fieldCount(v12);
end;
v9.didSwitchTryOn = function(v16, v17) --[[ Line: 51 ]] --[[ Name: didSwitchTryOn ]]
    -- upvalues: v5 (copy)
    local v18 = false;
    local l_tryOnItems_0 = v17.tryOnItems;
    local l_tryOnItems_1 = v16.props.tryOnItems;
    local v21 = 0;
    local v22;
    for v23 in l_tryOnItems_0 do
        v21 = v21 + 1;
        if l_tryOnItems_1[v23] == nil then
            v22 = false;
            v18 = true;
        end;
        if v18 then
            break;
        end;
    end;
    if not v18 then
        v22 = v21 == v5.fieldCount(l_tryOnItems_1);
    end;
    v18 = false;
    return not v22;
end;
v9.didUpdate = function(v24, v25) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local l_name_0 = v24.props.avatarRoute.opaque.name;
    local l_name_1 = v25.avatarRoute.opaque.name;
    local v28 = v24:didSwitchTryOn(v25);
    if l_name_0 ~= l_AvatarScreen_0.LayeredClothingSort and v28 and #v24.props.currentSort > 0 then
        v24.props.clearCurrentSort();
    end;
    if l_name_0 ~= l_name_1 and l_name_1 == l_AvatarScreen_0.LayeredClothingSort then
        v24.props.clearRemovedItems();
    end;
end;
return (v3.connect(function(v29, _) --[[ Line: 76 ]]
    return {
        tryOnItems = v29.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        currentSort = v29.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
    };
end, function(v31) --[[ Line: 81 ]]
    -- upvalues: v7 (copy), v8 (copy)
    return {
        clearCurrentSort = function() --[[ Line: 83 ]] --[[ Name: clearCurrentSort ]]
            -- upvalues: v31 (copy), v7 (ref)
            v31(v7());
        end, 
        clearRemovedItems = function() --[[ Line: 86 ]] --[[ Name: clearRemovedItems ]]
            -- upvalues: v31 (copy), v8 (ref)
            v31(v8());
        end
    };
end)(v9));