local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.InputUi);
local v3 = require(l_Parent_0.RobloxAppHooks);
local v4 = require(l_Parent_0.RoactUtils);
local l_useScreenSize_0 = v3.useScreenSize;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_getSafeAreaSize_0 = v2.getSafeAreaSize;
local l_useNavBarSize_0 = require(l_Parent_0.AppNavBar).useNavBarSize;
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
return function(v10) --[[ Line: 13 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useSelector_0 (copy), l_getSafeAreaSize_0 (copy), l_useNavBarSize_0 (copy), v9 (copy)
    local v11 = l_useScreenSize_0();
    local v13 = l_useSelector_0(function(v12) --[[ Line: 15 ]]
        return v12.GlobalGuiInset;
    end);
    local v14 = l_getSafeAreaSize_0(v11, v13);
    local v15 = l_useNavBarSize_0();
    if v10 then
        return (math.max(v9.MINIMUN_CONTAINER_WIDTH, (math.floor((v14.X.Offset - v15) / 3))));
    else
        return (math.min(v14.X.Offset, v9.MAXIMUM_CONTAINER_WIDTH));
    end;
end;