local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_combineReactTags_0 = require(l_Parent_0.RoactUtils).combineReactTags;
return function(v6) --[[ Line: 24 ]] --[[ Name: PriceLineItem ]]
    -- upvalues: v1 (copy), l_combineReactTags_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v7 = v6.textStyle or "text-body-small";
    local v8 = v1.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: l_combineReactTags_0 (ref), v7 (copy)
        return l_combineReactTags_0("auto-y", v7, "content-emphasis", "text-align-x-left");
    end, {
        v7
    });
    local v9 = v1.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: l_combineReactTags_0 (ref), v7 (copy)
        return l_combineReactTags_0("auto-y", v7, "content-emphasis", "text-align-x-right");
    end, {
        v7
    });
    return v1.createElement(l_View_0, {
        LayoutOrder = v6.LayoutOrder, 
        tag = v6.tag or "row size-full-0 auto-y align-y-center padding-x-xsmall"
    }, {
        Label = v1.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v6.label, 
            Size = UDim2.new(0.5, 0, 0, 0), 
            tag = v8
        }), 
        Amount = v1.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v6.amount, 
            Size = UDim2.new(0.5, 0, 0, 0), 
            tag = v9, 
            RichText = true
        })
    });
end;