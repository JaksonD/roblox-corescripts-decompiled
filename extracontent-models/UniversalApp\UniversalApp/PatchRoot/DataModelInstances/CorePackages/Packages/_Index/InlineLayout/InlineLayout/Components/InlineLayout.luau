local l_Parent_0 = script:FindFirstAncestor("Components").Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.React);
local l_useCallback_0 = v3.useCallback;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local l_useEffect_0 = v3.useEffect;
local l_map_0 = require(l_Parent_1.Dash).map;
local _ = require(l_Parent_0.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement);
local v10 = require(l_Parent_0.Components.InlineLayout.InlineLayoutElements.HardBreakElement);
local v11 = require(l_Parent_0.Components.InlineLayout.InlineLayoutElements.HoverContext);
local l_View_0 = v2.View;
local v13 = game:DefineFastFlag("FFlagDebugInlineLayout", false);
local function v32(v14, v15) --[[ Line: 34 ]] --[[ Name: layoutElements ]]
    -- upvalues: v10 (copy), v13 (copy), l_map_0 (copy), v3 (copy), l_View_0 (copy)
    if #v14 == 0 then
        return {};
    else
        local v16 = {};
        local v17 = {};
        local l_v15_0 = v15;
        local v19 = nil;
        local v20 = 1;
        local v21 = 0;
        local v22 = nil;
        local function _() --[[ Line: 47 ]] --[[ Name: flushRow ]]
            -- upvalues: v16 (copy), v17 (ref), l_v15_0 (ref), v15 (copy)
            table.insert(v16, v17);
            v17 = {};
            l_v15_0 = v15;
        end;
        while (v20 <= #v14 or v19) and v21 < 100 do
            local v24 = v19 or v14[v20];
            if v24 == v10 then
                v20 = v20 + 1;
                table.insert(v16, v17);
                v17 = {};
                l_v15_0 = v15;
            else
                local v25 = v24:getWidth();
                v22 = #v17;
                if v25 <= l_v15_0 then
                    table.insert(v17, v24:render(v20, v22));
                    l_v15_0 = l_v15_0 - v25;
                    v19 = nil;
                    v20 = v20 + 1;
                else
                    local v26, v27 = v24:split(l_v15_0);
                    if v26:getWidth() <= l_v15_0 then
                        table.insert(v17, v26:render(v20, v22));
                        v19 = v27;
                    elseif #v17 == 0 then
                        if v24.canForceSplit then
                            local v28, v29 = v24:split(l_v15_0, true);
                            v26 = v28;
                            v27 = v29;
                        end;
                        table.insert(v17, v26:render(v20, v22));
                        v19 = v27;
                    else
                        v19 = v24;
                    end;
                    table.insert(v16, v17);
                    v17 = {};
                    l_v15_0 = v15;
                end;
                v21 = v21 + 1;
            end;
        end;
        if v21 == 100 and v13 then
            warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect", ("Desired width: %*"):format(v15), debug.traceback());
        end;
        if #v17 > 0 then
            table.insert(v16, v17);
        end;
        return l_map_0(v16, function(v30, v31) --[[ Line: 112 ]]
            -- upvalues: v3 (ref), l_View_0 (ref)
            return v3.createElement(l_View_0, {
                tag = "auto-xy row align-x-left", 
                key = tostring(v31), 
                LayoutOrder = v31
            }, v30);
        end);
    end;
end;
return function(v33) --[[ Line: 121 ]] --[[ Name: InlineLayout ]]
    -- upvalues: l_useRef_0 (copy), v2 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v32 (copy), l_useEffect_0 (copy), v3 (copy), v11 (copy), l_View_0 (copy)
    local v34 = l_useRef_0(nil);
    local v35 = v2.Hooks.useTokens();
    local v36, v37 = l_useState_0({});
    local v38 = l_useCallback_0(function() --[[ Line: 126 ]]
        -- upvalues: v34 (copy), v37 (copy), v32 (ref), v33 (copy)
        if v34.current == nil then
            return;
        elseif v34.current.AbsoluteSize.X == 0 then
            return;
        else
            v37(v32(v33.Elements, v34.current.AbsoluteSize.X));
            return;
        end;
    end, {
        v33.Elements
    });
    l_useEffect_0(v38, {
        v38
    });
    return v3.createElement(v11.Provider, nil, v3.createElement(l_View_0, {
        onAbsoluteSizeChanged = v38, 
        ref = v34, 
        tag = "size-full-0 auto-y", 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v33.HorizontalAlignment or Enum.HorizontalAlignment.Left, 
            Padding = v33.VerticalPadding or UDim.new(0, v35.Gap.Small)
        }
    }, v36));
end;