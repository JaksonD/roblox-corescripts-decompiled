local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local l_screenSizeSelector_0 = require(l_script_FirstAncestor_0.Common.Utils).screenSizeSelector;
local l_getMiddleContentWidth_0 = require(l_script_FirstAncestor_0.Common.Utils).getMiddleContentWidth;
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
return function(v6) --[[ Line: 15 ]]
    -- upvalues: l_useSelector_0 (copy), l_screenSizeSelector_0 (copy), l_getMiddleContentWidth_0 (copy)
    local v7 = l_useSelector_0(l_screenSizeSelector_0);
    local v8 = l_getMiddleContentWidth_0(v7.X);
    return function() --[[ Line: 18 ]]
        -- upvalues: v6 (copy), v8 (copy)
        return v6(v8);
    end;
end;