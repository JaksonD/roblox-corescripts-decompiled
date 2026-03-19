local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppComposition");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Breakpoint_0 = require(l_Parent_0.Foundation).Enums.Breakpoint;
local l_HardwareSafeAreaInsets_0 = require(l_Parent_0.Responsive).HardwareSafeAreaInsets;
local _ = require(l_script_FirstAncestor_0.AppCompositionTypes);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
return {
    getBaseConfig = function(v6, v7) --[[ Line: 20 ]] --[[ Name: getBaseConfig ]]
        -- upvalues: l_Breakpoint_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_HardwareSafeAreaInsets_0 (copy)
        local v8 = nil;
        if v6 == l_Breakpoint_0.XSmall then
            local l_Size_300_0 = v7.Size.Size_300;
            local l_Small_0 = v7.Gutter.Small;
            local v11 = 2 * l_Size_300_0;
            v8 = {
                margin = l_Size_300_0, 
                gutter = l_Small_0, 
                columns = 3, 
                carouselPeek = v11
            };
        elseif v6 == l_Breakpoint_0.Small then
            local l_Small_1 = v7.Margin.Small;
            local l_Medium_0 = v7.Gutter.Medium;
            local v14 = 2 * l_Small_1;
            v8 = {
                margin = l_Small_1, 
                gutter = l_Medium_0, 
                columns = 6, 
                carouselPeek = v14
            };
        else
            v8 = if v6 == l_Breakpoint_0.Medium then {
                margin = v7.Size.Size_800, 
                gutter = v7.Gutter.Large, 
                columns = 12, 
                carouselPeek = 0
            } else if v6 == l_Breakpoint_0.Large then {
                margin = v7.Size.Size_800, 
                gutter = v7.Gutter.Large, 
                columns = 12, 
                carouselPeek = 0
            } else if v6 == l_Breakpoint_0.XLarge then {
                margin = v7.Size.Size_1600, 
                gutter = v7.Gutter.XLarge, 
                columns = 12, 
                carouselPeek = 0
            } else {
                margin = v7.Size.Size_1600, 
                gutter = v7.Gutter.XLarge, 
                columns = 12, 
                carouselPeek = 0
            };
        end;
        if not l_FFlagEnableLeftNavOnConsole_0 and l_HardwareSafeAreaInsets_0.hasExtraPlatformInset() then
            v8.margin = l_HardwareSafeAreaInsets_0.deviceInsets().left;
        end;
        return v8;
    end
};