local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useBreakpoint_0 = require(l_Parent_0.Foundation).Hooks.useBreakpoint;
local l_useResponsive_0 = require(l_Parent_0.Foundation).Hooks.useResponsive;
local l_ResponsiveProvider_0 = require(l_Parent_0.Foundation).ResponsiveProvider;
local v6 = require(l_Parent_0.Cryo);
local v7 = game:DefineFastFlag("LuaAppInfoTableResponsiveProviderOverride", false);
local v8 = game:DefineFastFlag("LuaAppInfoTableWorkaroundGridJank2", false) and v7;
local l_Breakpoint_0 = v2.Enums.Breakpoint;
return v1.memo(function(v10) --[[ Line: 41 ]] --[[ Name: InfoTable ]]
    -- upvalues: v8 (copy), v1 (copy), v2 (copy), v7 (copy), l_useResponsive_0 (copy), v6 (copy), l_Breakpoint_0 (copy), l_useBreakpoint_0 (copy), l_ResponsiveProvider_0 (copy)
    local v11 = if v10.numColumns and v10.numColumns > 0 then v10.numColumns else 1;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    if v8 then
        local v16, v17 = v1.useState(false);
        v12 = v16;
        v13 = v17;
        v16, v17 = v1.useState(nil);
        v14 = v16;
        v15 = v17;
    end;
    local v18 = {};
    local v19 = 12 / v11;
    if not v8 or v12 then
        for v20, v21 in v10.items do
            v18[("Cell_%*"):format(v20)] = v1.createElement(v2.Grid.Cell, {
                size = v19, 
                tag = "size-full-0 auto-y", 
                LayoutOrder = v20
            }, v21);
        end;
    end;
    local v22 = nil;
    if v7 then
        local v23 = l_useResponsive_0();
        v22 = v6.Dictionary.join(v23.config, {
            grid = v6.Dictionary.join(v23.config.grid, {
                margins = {
                    [l_Breakpoint_0.XSmall] = 0, 
                    [l_Breakpoint_0.Small] = 0, 
                    [l_Breakpoint_0.Medium] = 0, 
                    [l_Breakpoint_0.Large] = 0, 
                    [l_Breakpoint_0.XLarge] = 0, 
                    [l_Breakpoint_0.XXLarge] = 0
                }
            })
        });
    end;
    if v8 then
        local _, v25 = l_useBreakpoint_0(v14);
        v1.useEffect(function() --[[ Line: 82 ]]
            -- upvalues: v25 (copy), v13 (ref)
            if v25.X > 0 then
                task.defer(function() --[[ Line: 84 ]]
                    -- upvalues: v13 (ref)
                    v13(true);
                end);
            end;
        end, {
            v25.X
        });
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v10.LayoutOrder, 
            ref = v15
        }, {
            ContentFrame = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v10.LayoutOrder
            }, {
                Grid = v1.createElement(l_ResponsiveProvider_0, {
                    config = v22
                }, v1.createElement(v2.Grid.Root, {
                    tag = v10.gridTag, 
                    testId = v10.testId
                }, v18))
            })
        });
    elseif v7 then
        return v1.createElement(l_ResponsiveProvider_0, {
            config = v22
        }, v1.createElement(v2.Grid.Root, {
            tag = v10.gridTag, 
            LayoutOrder = v10.LayoutOrder, 
            testId = v10.testId
        }, v18));
    else
        return v1.createElement(v2.Grid.Root, {
            tag = v10.gridTag, 
            LayoutOrder = v10.LayoutOrder, 
            testId = v10.testId
        }, v18);
    end;
end);