local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useBreakpointXOrLarger_0 = v5.useBreakpointXOrLarger;
local v7 = require(l_Modules_0.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local function _(v9) --[[ Line: 17 ]] --[[ Name: getPadding ]]
    -- upvalues: l_useBreakpointXOrLarger_0 (copy), v5 (copy), v7 (copy), v4 (copy)
    local v10 = l_useBreakpointXOrLarger_0(v5.Keys.Small);
    if v7 then
        return v9.Global.Space_250, v9.Global.Space_300;
    elseif v10 then
        return v4.MORE_PAGE_WIDE_PADDING_HORIZONTAL, v4.MORE_PAGE_WIDE_PADDING_VERTICAL;
    else
        return v4.MORE_PAGE_COMPACT_PADDING_HORIZONTAL, v4.MORE_PAGE_SECTION_PADDING;
    end;
end;
return function(v12) --[[ Line: 28 ]] --[[ Name: withMorePagePaddings ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useBreakpointXOrLarger_0 (copy), v5 (copy), v7 (copy), v4 (copy), v3 (copy), v2 (copy)
    return function(v13) --[[ Line: 29 ]]
        -- upvalues: l_useDesignTokens_0 (ref), l_useBreakpointXOrLarger_0 (ref), v5 (ref), v7 (ref), v4 (ref), v3 (ref), v12 (copy), v2 (ref)
        local v14 = l_useDesignTokens_0();
        local v15 = l_useBreakpointXOrLarger_0(v5.Keys.Small);
        local v16, v17;
        if v7 then
            v16 = v14.Global.Space_250;
            v17 = v14.Global.Space_300;
        elseif v15 then
            v16 = v4.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
            v17 = v4.MORE_PAGE_WIDE_PADDING_VERTICAL;
        else
            v16 = v4.MORE_PAGE_COMPACT_PADDING_HORIZONTAL;
            v17 = v4.MORE_PAGE_SECTION_PADDING;
        end;
        v15 = v4.MORE_PAGE_CONTENT_MAX_WIDTH + v16 * 2;
        return v3.createElement(v12, v2.Dictionary.join(v13, {
            paddings = {
                paddingHorizontal = v16, 
                paddingVertical = v17, 
                contentMaxWidth = v15
            }
        }));
    end;
end;