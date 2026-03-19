local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.TooltipController);
local v8 = require(l_Parent_1.Core.Control.Enum.ControlState);
local v9 = require(l_Parent_1.UIBloxConfig);
return function(v10) --[[ Line: 17 ]] --[[ Name: HoverController ]]
    -- upvalues: v3 (copy), v9 (copy), v6 (copy), v8 (copy), v4 (copy), v7 (copy)
    local v11, v12 = v3.useState(false);
    local v13 = v3.useRef(tick());
    v3.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v13 (copy)
        return function() --[[ Line: 22 ]]
            -- upvalues: v13 (ref)
            v13.current = tick();
        end;
    end, if v9.enableTooltipV2HoverControllerReRenderFix then {} else nil);
    local v14 = v10.delayTime or v6.DEFAULT_DELAY_TIME;
    local v18 = v3.useCallback(function(v15, v16) --[[ Line: 30 ]]
        -- upvalues: v10 (copy), v12 (copy), v8 (ref), v13 (copy), v14 (copy)
        if v10.disabled then
            v12(false);
            return;
        elseif v16 == v8.Hover or v16 == v8.Selected then
            local l_current_0 = v13.current;
            delay(v14, function() --[[ Line: 37 ]]
                -- upvalues: v13 (ref), l_current_0 (copy), v12 (ref)
                if v13.current == l_current_0 then
                    v12(true);
                end;
            end);
            return;
        else
            if v15 == v8.Hover or v15 == v8.Selected then
                v13.current = tick();
                v12(false);
            end;
            return;
        end;
    end, {
        v14
    });
    local v20 = v4.Object.assign({}, v10, {
        delayTime = v4.Object.None, 
        active = v11, 
        renderTriggerPoint = function(v19) --[[ Line: 52 ]] --[[ Name: renderTriggerPoint ]]
            -- upvalues: v10 (copy), v18 (copy)
            return v10.renderTriggerPoint(v19, v18);
        end
    });
    return v3.createElement(v7, v20);
end;