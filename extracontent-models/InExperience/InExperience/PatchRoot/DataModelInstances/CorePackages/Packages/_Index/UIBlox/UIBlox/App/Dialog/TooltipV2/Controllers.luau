local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.TooltipController);
local v6 = require(l_Parent_0.HoverController);
local function _(v7) --[[ Line: 14 ]] --[[ Name: createControllerFunction ]]
    -- upvalues: v3 (copy), v2 (copy)
    return function(v8, v9, v10) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v2 (ref), v7 (copy)
        local v11 = v3.Object.assign({}, v9, {
            tooltipProps = v8, 
            renderTriggerPoint = v10
        });
        return v2.createElement(v7, v11);
    end;
end;
return {
    withTooltip = function(v13, v14, v15) --[[ Line: 15 ]]
        -- upvalues: v3 (copy), v2 (copy), v5 (copy)
        local v16 = v3.Object.assign({}, v14, {
            tooltipProps = v13, 
            renderTriggerPoint = v15
        });
        return v2.createElement(v5, v16);
    end, 
    withHoverTooltip = function(v17, v18, v19) --[[ Line: 15 ]]
        -- upvalues: v3 (copy), v2 (copy), v6 (copy)
        local v20 = v3.Object.assign({}, v18, {
            tooltipProps = v17, 
            renderTriggerPoint = v19
        });
        return v2.createElement(v6, v20);
    end
};