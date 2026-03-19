local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v6 = {
    "default", 
    "sm", 
    "md", 
    "lg", 
    "xl", 
    "xxl"
};
local v7 = {
    default = 0, 
    sm = 576, 
    md = 768, 
    lg = 992, 
    xl = 1200, 
    xxl = 1400
};
return function(v8) --[[ Line: 49 ]] --[[ Name: useScreenBreakpointsValue ]]
    -- upvalues: l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v6 (copy), v7 (copy)
    local v10 = l_useSelector_0(function(v9) --[[ Line: 50 ]]
        return v9.ScreenSize;
    end, l_getUseSelectorDeepEquals_0());
    local v11 = if v10 then v10.X else 0;
    return v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v6 (ref), v8 (copy), v7 (ref), v11 (copy)
        local v12 = nil;
        for _, v14 in v6 do
            if v8[v14] then
                if v7[v14] <= v11 then
                    v12 = v8[v14];
                else
                    break;
                end;
            end;
        end;
        return v12;
    end, {
        v11, 
        v8
    });
end;