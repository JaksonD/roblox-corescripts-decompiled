local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_UserInputService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.UserInputService;
local v4 = require(l_script_FirstAncestor_0.Utility.Logger);
local v5 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v6 = require(l_script_FirstAncestor_0.Components.Popover.PopoverContext);
local v7 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v8 = require(l_script_FirstAncestor_0.Enums.Radius);
local v9 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.View);
local v12 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(l_script_FirstAncestor_0.Components.Popover);
local v17 = {
    align = v5.Start, 
    side = v7.Right, 
    testId = "--foundation-tooltip"
};
local function v21(v18) --[[ Line: 43 ]] --[[ Name: AnchorWrapper ]]
    -- upvalues: v2 (copy), v6 (copy), v4 (copy), v16 (copy), v14 (copy)
    local v19 = v2.useContext(v6);
    local v20 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v19 (copy), v4 (ref), v20 (copy), v18 (copy)
        if v19.anchor ~= nil then
            if typeof(v19.anchor) ~= "Instance" then
                v4:warning("MeasurableRef cannot be an anchor for the tooltip");
                return;
            else
                v20.current = v19.anchor:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 53 ]]
                    -- upvalues: v18 (ref), v19 (ref)
                    v18.onHover(v19.anchor.GuiState == Enum.GuiState.Hover);
                end);
            end;
        end;
        return function() --[[ Line: 58 ]]
            -- upvalues: v20 (ref)
            if v20.current ~= nil then
                v20.current:Disconnect();
            end;
        end;
    end, {
        v19.anchor, 
        v18.onHover
    });
    return v2.createElement(v16.Anchor, v14(v18, {}), v18.children);
end;
return v2.memo(function(v22) --[[ Line: 68 ]] --[[ Name: Tooltip ]]
    -- upvalues: v15 (copy), v17 (copy), v2 (copy), v13 (copy), v12 (copy), l_UserInputService_0 (copy), v16 (copy), v21 (copy), v14 (copy), v8 (copy), v11 (copy), v9 (copy)
    local v23 = v15(v22, v17);
    local v24, v25 = v2.useState(false);
    local v26 = v13();
    local v27 = v12(320);
    local v32 = v2.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v23 (copy), l_UserInputService_0 (ref)
        if v23.shortcut == nil then
            return nil;
        else
            local v28 = "";
            for v29, v30 in v23.shortcut do
                local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v30);
                if l_l_UserInputService_0_StringForKeyCode_0 == nil or l_l_UserInputService_0_StringForKeyCode_0 == "" then
                    l_l_UserInputService_0_StringForKeyCode_0 = v30.Name;
                end;
                if v29 > 1 then
                    v28 = v28 .. " + ";
                end;
                v28 = v28 .. l_l_UserInputService_0_StringForKeyCode_0;
            end;
            return v28;
        end;
    end, {
        v23.shortcut
    });
    return v2.createElement(v16.Root, {
        isOpen = v24, 
        testId = v23.testId
    }, {
        Anchor = v2.createElement(v21, v14(v23, {
            onHover = v25
        }), v23.children), 
        Content = v2.createElement(v16.Content, {
            hasArrow = false, 
            align = v23.align, 
            side = {
                position = v23.side, 
                offset = v26.Size.Size_200
            }, 
            radius = v8.Small, 
            backgroundStyle = v26.Inverse.Surface.Surface_0, 
            selectionGroup = false
        }, v2.createElement(v11, {
            tag = {
                ["col gap-xsmall auto-xy"] = true, 
                ["padding-y-small padding-x-medium"] = v23.text ~= nil, 
                ["padding-y-xsmall padding-x-small"] = v23.text == nil
            }, 
            sizeConstraint = {
                MaxSize = Vector2.new(v27, 1e999)
            }
        }, {
            Header = v2.createElement(v11, {
                LayoutOrder = 1, 
                tag = "row gap-small size-full-0 auto-y flex-between"
            }, {
                Title = v2.createElement(v9, {
                    LayoutOrder = 1, 
                    Text = v23.title, 
                    tag = "auto-xy text-title-small content-inverse-emphasis text-truncate-end shrink"
                }), 
                Shortcut = if v23.shortcut then v2.createElement(v9, {
                    LayoutOrder = 2, 
                    Text = v32, 
                    tag = "auto-xy text-body-small content-inverse-muted", 
                    testId = ("%*--shortcut"):format(v23.testId)
                }) else nil
            }), 
            Text = if v23.text and v23.text ~= "" then v2.createElement(v9, {
                LayoutOrder = 2, 
                Text = v23.text, 
                tag = "auto-xy text-wrap text-align-x-left text-body-small content-inverse-default", 
                testId = ("%*--text"):format(v23.testId)
            }) else nil
        }))
    });
end);