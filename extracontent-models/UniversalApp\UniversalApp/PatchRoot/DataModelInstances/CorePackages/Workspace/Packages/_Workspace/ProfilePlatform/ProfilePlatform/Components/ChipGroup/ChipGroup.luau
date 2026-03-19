local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Chip_0 = v3.Chip;
local l_View_0 = v3.View;
local v7 = UDim2.new(1, 0, 0, 32);
ChipGroup = function(v8) --[[ Line: 24 ]] --[[ Name: ChipGroup ]]
    -- upvalues: v2 (copy), l_Chip_0 (copy), v7 (copy), l_View_0 (copy)
    local v9 = v2.useRef(nil);
    local v10 = v2.useRef(nil);
    local v11, v12 = v2.useState(0);
    local v13, v14 = v2.useState(0);
    local v15, v16 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v8 (copy), v16 (copy), v11 (copy), v13 (copy)
        if v8.scrollingEnabledOverride ~= nil then
            v16(v8.scrollingEnabledOverride);
            return;
        else
            v16(v13 < v11);
            return;
        end;
    end, {
        v11, 
        v13, 
        v8.scrollingEnabledOverride
    });
    if #v8.chips == 0 then
        return nil;
    else
        local v22 = v2.useMemo(function() --[[ Line: 43 ]]
            -- upvalues: v8 (copy), v2 (ref), l_Chip_0 (ref)
            local v17 = {};
            for v18, v19 in ipairs(v8.chips) do
                local l_text_0 = v19.text;
                if v19.count then
                    l_text_0 = ("%* %*"):format(v19.count, v19.text);
                end;
                local v21 = {
                    text = l_text_0, 
                    onActivated = v19.onActivated, 
                    isDisabled = v19.isDisabled or false, 
                    isChecked = false, 
                    LayoutOrder = v19.layoutOrder or v18, 
                    size = v19.size or "Medium", 
                    leading = v19.leading, 
                    trailing = v19.trailing
                };
                v17[v18] = v2.createElement(l_Chip_0, v21);
            end;
            return v17;
        end, {
            v8.chips
        });
        local v24 = v2.useCallback(function(v23) --[[ Line: 68 ]]
            -- upvalues: v14 (copy)
            v14(v23.AbsoluteSize.X);
        end, {});
        local v26 = v2.useCallback(function(v25) --[[ Line: 72 ]]
            -- upvalues: v12 (copy)
            v12(v25.AbsoluteSize.X);
        end, {});
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v8.layoutOrder, 
            Size = v8.size or v7
        }, {
            DynamicScrollingFrame = v2.createElement("ScrollingFrame", {
                ref = v9, 
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                BackgroundTransparency = 1, 
                CanvasSize = v8.size or v7, 
                ClipsDescendants = false, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollingEnabled = v15, 
                Selectable = false, 
                Size = v8.size or v7, 
                ZIndex = 1, 
                [v2.Change.AbsoluteSize] = v24
            }, {
                ChipRow = v2.createElement(l_View_0, {
                    ref = v10, 
                    tag = "row gap-small auto-y size-full-0", 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    onAbsoluteSizeChanged = v26
                }, table.unpack(v22))
            })
        });
    end;
end;
return ChipGroup;