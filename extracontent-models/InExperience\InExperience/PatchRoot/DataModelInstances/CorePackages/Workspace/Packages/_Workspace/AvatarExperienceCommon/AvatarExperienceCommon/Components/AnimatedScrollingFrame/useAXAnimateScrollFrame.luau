local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_useAnimateScrollViewToSelection_0 = require(l_Parent_0.AppBlox).useAnimateScrollViewToSelection;
local v3 = game:DefineFastInt("AXAnimatedScrollingFrameScrollTimeMs", 200);
local v4 = if v3 > 0 then v3 / 1000 else 0.2;
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: useAXAnimateScrollFrame ]]
    -- upvalues: l_useAnimateScrollViewToSelection_0 (copy), l_UserGameSettings_0 (copy), v4 (copy)
    return l_useAnimateScrollViewToSelection_0(v5, l_UserGameSettings_0.ReducedMotion and 0 or v6 or v4);
end;