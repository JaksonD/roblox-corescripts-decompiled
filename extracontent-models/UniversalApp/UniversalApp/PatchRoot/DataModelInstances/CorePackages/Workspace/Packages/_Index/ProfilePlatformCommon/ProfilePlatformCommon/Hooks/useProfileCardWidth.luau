local l_Parent_0 = script:FindFirstAncestor("ProfilePlatformCommon").Parent;
local v1 = require(l_Parent_0.InputUi);
local v2 = require(l_Parent_0.RobloxAppHooks);
local v3 = require(l_Parent_0.RoactUtils);
local l_useScreenSize_0 = v2.useScreenSize;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_getSafeAreaSize_0 = v1.getSafeAreaSize;
local l_useNavBarSize_0 = require(l_Parent_0.AppNavBar).useNavBarSize;
local l_GetDisplayStore_0 = require(l_Parent_0.Display).GetDisplayStore;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v10 = game:DefineFastFlag("FixIsWideModeCheck", false);
return function() --[[ Line: 19 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useSelector_0 (copy), l_getSafeAreaSize_0 (copy), v10 (copy), l_GetDisplayStore_0 (copy), l_useNavBarSize_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy)
    local v11 = l_useScreenSize_0();
    local v13 = l_useSelector_0(function(v12) --[[ Line: 21 ]]
        return v12.GlobalGuiInset;
    end);
    local v14 = l_getSafeAreaSize_0(v11, v13);
    local v15 = nil;
    v15 = if v10 then v14.X.Offset > v14.Y.Offset else l_GetDisplayStore_0(false).getDisplaySize(false) ~= Enum.DisplaySize.Small;
    local v16 = l_useNavBarSize_0();
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        if v15 then
            return (math.max(456, (math.floor((v14.X.Offset - v16) / 3))));
        else
            return (math.min(v14.X.Offset, 640));
        end;
    else
        return (math.min(v14.X.Offset, 640));
    end;
end;