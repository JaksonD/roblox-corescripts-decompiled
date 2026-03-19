local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_IconName_0 = v3.Enums.IconName;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconVariant_0 = v3.Enums.IconVariant;
local _ = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.SubMenuContext);
return function(v11) --[[ Line: 20 ]] --[[ Name: AvatarSwitcherIcon ]]
    -- upvalues: v9 (copy), v2 (copy), v10 (copy), l_useTokens_0 (copy), v3 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_IconVariant_0 (copy)
    local v12 = v9(v11.isActive);
    local v13 = v2.useContext(v10);
    local v14 = l_useTokens_0();
    local v16 = if v13 then v13:map(function(v15) --[[ Line: 26 ]]
        -- upvalues: v14 (copy)
        return {
            Color3 = v14.Color.Content.Default.Color3, 
            Transparency = math.lerp(1, v14.Color.Content.Default.Transparency, v15)
        };
    end) else v14.Color.Content.Default;
    return v2.createElement(v3.Icon, {
        name = l_IconName_0.CirclePerson, 
        size = l_IconSize_0.Large, 
        variant = if v12 then l_IconVariant_0.Filled else l_IconVariant_0.Regular, 
        style = v16
    });
end;