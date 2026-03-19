local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.Service);
local v2 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v3 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local v4 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagEnableUnibarTooltipQueue)();
local v6 = game:DefineFastInt("AvatarSwitcherTooltipPriority", 3000);
local v7 = game:DefineFastString("AvatarSwitcherTooltipStorageKey", "AvatarSwitcherTooltipStorageKey");
local v8 = game:DefineFastInt("AvatarSwitcherTooltipShowDelay", 1000);
local v9 = game:DefineFastInt("AvatarSwitcherTooltipDismissDelay", 8500);
return function(v10) --[[ Line: 19 ]] --[[ Name: AvatarSwitcherFtuxTooltip ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v11 = v1:integrations()[v2.AVATAR_SWITCHER_ID];
    local v12 = if v11 then v11.availability else nil;
    return v3(v12) == v1.AvailabilitySignal.Available and v4({
        id = v5 and "AVATAR_SWITCHER_TOOLTIP" or nil, 
        priority = if v5 then v6 else nil, 
        isIconVisible = v10.visible, 
        headerKey = "CoreScripts.FTUX.Heading.NewAvatarSwitcher", 
        bodyKey = "CoreScripts.FTUX.Label.AvatarSwitcherDescription", 
        localStorageKey = v7, 
        showDelay = v8, 
        dismissDelay = v9
    });
end;