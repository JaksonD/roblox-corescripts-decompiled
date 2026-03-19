local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.tutils);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_selectEquippedAssets_0 = v9.State.Selectors.selectEquippedAssets;
local l_selectTryOnItems_0 = v9.State.Selectors.selectTryOnItems;
local l_avatarLastEquippedStateStore_0 = v9.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
return function() --[[ Line: 22 ]] --[[ Name: useCatalogPageRevertToLastEquippedStateHook ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), l_useSelector_0 (copy), l_selectEquippedAssets_0 (copy), v5 (copy), l_selectTryOnItems_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v4 (copy), v13 (copy)
    local v14 = l_useDispatch_0();
    local v15 = v3.useRef({});
    local v16 = l_useSelector_0(l_selectEquippedAssets_0, v5.deepEqual);
    local v17 = l_useSelector_0(l_selectTryOnItems_0);
    v3.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: l_avatarLastEquippedStateStore_0 (ref), v4 (ref), v17 (copy), v15 (copy), v14 (copy), v13 (ref)
        if l_avatarLastEquippedStateStore_0.getChangedLayeredMakeupSorting() and #v4.Dictionary.keys(v17) == 0 and #v4.Dictionary.keys(v15.current) > 0 and l_avatarLastEquippedStateStore_0.getShouldRevertLastEquippedState() and l_avatarLastEquippedStateStore_0.getAvatarLastEquippedState() then
            l_avatarLastEquippedStateStore_0.setChangedLayeredMakeupSorting(false);
            v14(v13(l_avatarLastEquippedStateStore_0.getAvatarLastEquippedState(), true));
        end;
        if not l_avatarLastEquippedStateStore_0.getShouldRevertLastEquippedState() and #v4.Dictionary.keys(v17) == 0 and #v4.Dictionary.keys(v15.current) > 0 then
            l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(true);
            l_avatarLastEquippedStateStore_0.setChangedLayeredMakeupSorting(false);
        end;
    end, {
        v16, 
        v17, 
        v14
    });
    v3.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_avatarLastEquippedStateStore_0 (ref), v4 (ref), v17 (copy), v16 (copy)
        if not l_avatarLastEquippedStateStore_0.getChangedLayeredMakeupSorting() and #v4.Dictionary.keys(v17) == 0 then
            l_avatarLastEquippedStateStore_0.setAvatarLastEquippedState(v16);
        end;
    end, {
        v16, 
        v17
    });
    v3.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v15 (copy), v17 (copy)
        v15.current = v17;
    end, {
        v17
    });
end;