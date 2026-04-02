local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.Service);
local v2 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v3 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local v4 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v5 = game:DefineFastInt("AvatarSwitcherTooltipPriority", 3000);
local v6 = game:DefineFastString("AvatarSwitcherTooltipStorageKey", "AvatarSwitcherTooltipStorageKey");
local v7 = game:DefineFastInt("AvatarSwitcherTooltipShowDelay", 1000);
local v8 = game:DefineFastInt("AvatarSwitcherTooltipDismissDelay", 8500);
return function(v9) --[[ Line: 17 ]] --[[ Name: AvatarSwitcherFtuxTooltip ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v10 = v1:integrations()[v2.AVATAR_SWITCHER_ID];
    local v11 = if v10 then v10.availability else nil;
    return v3(v11) == v1.AvailabilitySignal.Available and v4({
        id = "AVATAR_SWITCHER_TOOLTIP", 
        priority = v5, 
        isIconVisible = v9.visible, 
        headerKey = "CoreScripts.FTUX.Heading.NewAvatarSwitcher", 
        bodyKey = "CoreScripts.FTUX.Label.AvatarSwitcherDescription", 
        localStorageKey = v6, 
        showDelay = v7, 
        dismissDelay = v8
    });
end;