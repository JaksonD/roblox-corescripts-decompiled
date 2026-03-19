local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Logger);
local v5 = require(l_script_FirstAncestor_0.Components.Button);
local v6 = require(l_script_FirstAncestor_0.Components.Image);
local v7 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Components.View);
local v10 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v11 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v16 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v17 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v18 = {
    testId = "--foundation-toast"
};
return v3.memo(v3.forwardRef(function(v19, v20) --[[ Line: 44 ]] --[[ Name: Toast ]]
    -- upvalues: v14 (copy), v18 (copy), v12 (copy), v10 (copy), v3 (copy), v4 (copy), v17 (copy), v16 (copy), v2 (copy), v5 (copy), v11 (copy), v9 (copy), v13 (copy), v6 (copy), v7 (copy)
    local v21 = v14(v19, v18);
    local v22 = v12();
    local v23 = v10({
        radius = UDim.new(0, v22.Radius.Medium), 
        offset = v22.Size.Size_200, 
        borderWidth = v22.Stroke.Thicker
    });
    local l_actions_0 = v21.actions;
    local v30 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: l_actions_0 (copy), v4 (ref), v17 (ref), v16 (ref), v2 (ref), v3 (ref), v5 (ref)
        local v25 = {};
        if l_actions_0 then
            for v26, v27 in l_actions_0 do
                if v26 > 2 then
                    v4:warning((("Toast only supports up to %* actions"):format(2)));
                    return v25;
                else
                    local v28 = {
                        LayoutOrder = #l_actions_0 - v26, 
                        size = v17.Medium, 
                        fillBehavior = v16.Fill
                    };
                    local v29 = v2.union(v27, v28);
                    v25["ToastButton" .. v26] = v3.createElement(v5, v29);
                end;
            end;
        end;
        return v25;
    end, {
        l_actions_0
    });
    local v31 = v21.icon and v21.icon ~= "";
    local v32 = v21.title and v21.title ~= "";
    local v33 = v21.text and v21.text ~= "";
    local v34 = v21.width or UDim.new(0, v11(400));
    return v3.createElement(v9, v13(v21, {
        Size = UDim2.new(v34, UDim.new()), 
        Position = UDim2.fromScale(0.5, 0.1), 
        selection = {
            Selectable = false, 
            SelectionImageObject = v23
        }, 
        tag = "auto-y padding-medium radius-medium row gap-small bg-over-media-0", 
        ref = v20
    }), {
        Media = if v31 then v3.createElement(v6, {
            LayoutOrder = 1, 
            Image = v21.icon, 
            tag = "size-1200-1200", 
            testId = ("%*--media"):format(v21.testId)
        }) else nil, 
        Content = v3.createElement(v9, {
            LayoutOrder = 2, 
            tag = {
                ["auto-y fill self-center"] = true, 
                ["col gap-xxsmall"] = v32 or v33
            }, 
            testId = ("%*--content"):format(v21.testId)
        }, {
            Header = if v32 then v3.createElement(v7, {
                LayoutOrder = 1, 
                Text = v21.title, 
                tag = "auto-y size-full-0 text-align-x-left text-title-small content-emphasis text-truncate-end", 
                testId = ("%*--header"):format(v21.testId)
            }) else nil, 
            Body = if v33 then v3.createElement(v7, {
                LayoutOrder = 2, 
                Text = v21.text, 
                tag = "auto-y size-full-0 text-wrap text-align-x-left text-body-small content-default", 
                testId = ("%*--body"):format(v21.testId)
            }) else nil, 
            Actions = if l_actions_0 and #l_actions_0 > 0 then v3.createElement(v9, {
                LayoutOrder = 3, 
                tag = {
                    ["auto-y row gap-small size-full-0"] = true, 
                    ["padding-top-small"] = v32 or v33
                }, 
                testId = ("%*--actions"):format(v21.testId)
            }, v30) else nil
        })
    });
end));