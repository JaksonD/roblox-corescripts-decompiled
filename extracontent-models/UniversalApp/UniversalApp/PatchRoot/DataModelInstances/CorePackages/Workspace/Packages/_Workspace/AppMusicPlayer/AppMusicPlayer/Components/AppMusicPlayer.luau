local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.AppNavBar);
local v2 = require(l_script_FirstAncestor_0.Parent.AppSystemBar);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Components.PersistentMusicPlayer);
local l_GetFFlagMusicPlayerUseDynamicNavBarHeight_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagMusicPlayerUseDynamicNavBarHeight;
local l_useNavBarPlacement_0 = v1.useNavBarPlacement;
local l_useNavBarSize_0 = v1.useNavBarSize;
return v4.memo(function() --[[ Line: 16 ]] --[[ Name: AppMusicPlayer ]]
    -- upvalues: l_useNavBarPlacement_0 (copy), l_GetFFlagMusicPlayerUseDynamicNavBarHeight_0 (copy), l_useNavBarSize_0 (copy), v2 (copy), v4 (copy), v3 (copy), v1 (copy), v5 (copy)
    local v9 = l_useNavBarPlacement_0();
    local v10 = if l_GetFFlagMusicPlayerUseDynamicNavBarHeight_0() then l_useNavBarSize_0() else v2.Constants.BOTTOM_BAR_SIZE;
    return v4.createElement(v3.View, {
        tag = "size-full-0 auto-y anchor-bottom-left", 
        Position = if v9 == v1.Placement.Bottom then UDim2.new(0, 0, 1, -v10) else UDim2.fromScale(0, 1)
    }, {
        PersistentMusicPlayer = v4.createElement(v5)
    });
end);