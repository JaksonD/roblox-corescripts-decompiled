local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v3 = require(l_Parent_0.Style);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Responsive);
local l_hasExtraPlatformInset_0 = v5.HardwareSafeAreaInsets.hasExtraPlatformInset;
local v7 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local l_useMemo_0 = v4.useMemo;
local l_usePreferredInput_0 = v5.usePreferredInput;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local function _(v12, v13) --[[ Line: 22 ]] --[[ Name: getLegacySideMargin ]]
    if v12 < 1024 then
        return v13.Global.Space_150;
    elseif v12 < 1280 then
        return 18;
    elseif v12 < 1440 then
        return v13.Global.Space_300;
    elseif v12 < 1920 then
        return 34;
    elseif v12 < 2260 then
        return 38;
    else
        return v13.Global.Space_600;
    end;
end;
local function _(v15, v16) --[[ Line: 41 ]] --[[ Name: calculateSideMargin ]]
    -- upvalues: l_hasExtraPlatformInset_0 (copy)
    if l_hasExtraPlatformInset_0() then
        return v15.Global.Space_800;
    elseif v16 < 1024 then
        return v15.Global.Space_150;
    elseif v16 < 1280 then
        return 18;
    elseif v16 < 1440 then
        return v15.Global.Space_300;
    elseif v16 < 1920 then
        return 34;
    elseif v16 < 2260 then
        return 38;
    else
        return v15.Global.Space_600;
    end;
end;
return function(v18) --[[ Line: 59 ]]
    -- upvalues: v7 (copy), l_useScreenSize_0 (copy), v3 (copy), l_usePreferredInput_0 (copy), v5 (copy), l_useSelector_0 (copy), l_useMemo_0 (copy), l_hasExtraPlatformInset_0 (copy), l_FormFactor_0 (copy)
    local v19 = v7() or v18;
    local v20 = l_useScreenSize_0();
    local v21 = if v20 and v20.X ~= nil then v20.X else 0;
    local v22 = v3.useDesignTokens();
    local v23 = l_usePreferredInput_0() == v5.Input.Pointer;
    local v25 = l_useSelector_0(function(v24) --[[ Line: 69 ]]
        return v24.FormFactor;
    end);
    return l_useMemo_0(function() --[[ Line: 73 ]]
        -- upvalues: v19 (copy), v23 (copy), v22 (copy), v21 (copy), l_hasExtraPlatformInset_0 (ref), v25 (copy), l_FormFactor_0 (ref)
        if v19 then
            return {
                outer = 12, 
                inner = 12, 
                default = 12
            };
        else
            local v26 = nil;
            if v23 then
                local l_v22_0 = v22;
                local l_v21_0 = v21;
                v26 = if l_hasExtraPlatformInset_0() then l_v22_0.Global.Space_800 else if l_v21_0 < 1024 then l_v22_0.Global.Space_150 else l_v21_0 < 1280 and 18 or if l_v21_0 < 1440 then l_v22_0.Global.Space_300 else l_v21_0 < 1920 and 34 or l_v21_0 < 2260 and 38 or l_v22_0.Global.Space_600;
            else
                v26 = v25 == l_FormFactor_0.COMPACT and 24 or 48;
            end;
            return {
                outer = v26, 
                inner = v26, 
                default = 12
            };
        end;
    end, {
        v21, 
        v23, 
        v25, 
        v19
    });
end;