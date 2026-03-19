local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(script.Parent.BottomSheet);
local v6 = require(script.Parent.CenterSheet);
local v7 = require(script.Parent.SideSheet);
local v8 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local l_GuiService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.GuiService;
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(script.Parent.Types);
local v13 = {
    testId = "--foundation-sheet"
};
return v2.memo(v2.forwardRef(function(v14, v15) --[[ Line: 25 ]] --[[ Name: Sheet ]]
    -- upvalues: v11 (copy), v13 (copy), v2 (copy), v8 (copy), l_GuiService_0 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy)
    local v16 = v11(v14, v13);
    local v17, v18 = v2.useState(v16.isOpen == nil or v16.isOpen);
    local v19 = v2.useRef(nil);
    local v20 = v8();
    local v21, v22 = v2.useState(not v20 or v20.AbsoluteSize.X > v20.AbsoluteSize.Y);
    local v23, v24 = v2.useState(l_GuiService_0.ViewportDisplaySize);
    v2.useImperativeHandle(v16.sheetRef, function() --[[ Line: 35 ]]
        -- upvalues: v19 (copy)
        return v19.current;
    end, {});
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v16 (copy), v19 (copy), v18 (copy)
        if v16.isOpen == false and v19.current then
            v19.current.close();
            return;
        else
            if v16.isOpen then
                v18(true);
            end;
            return;
        end;
    end, {
        v16.isOpen
    });
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v17 (copy), v16 (copy), v18 (copy)
        if not v17 and v16.isOpen then
            v18(true);
        end;
    end, {
        v17
    });
    v3.useEventConnection(l_GuiService_0:GetPropertyChangedSignal("ViewportDisplaySize"), function() --[[ Line: 53 ]]
        -- upvalues: v24 (copy), l_GuiService_0 (ref)
        v24(l_GuiService_0.ViewportDisplaySize);
    end, {});
    v2.useLayoutEffect(function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy), v22 (copy)
        local v25 = nil;
        if v20 then
            v22(v20.AbsoluteSize.X > v20.AbsoluteSize.Y);
            v25 = v20:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 61 ]]
                -- upvalues: v22 (ref), v20 (ref)
                v22(v20.AbsoluteSize.X > v20.AbsoluteSize.Y);
            end);
        end;
        return function() --[[ Line: 66 ]]
            -- upvalues: v25 (ref)
            if v25 then
                v25:Disconnect();
            end;
        end;
    end, {
        v20
    });
    if not v17 then
        return nil;
    else
        local v26 = table.clone(v16);
        v26.isOpen = nil;
        v26.ref = v15;
        v26.sheetRef = v19;
        if not v4.FoundationSideSheetNewWidthCalculation or v4.FoundationSideSheetFixNewWidth then
            v26.displaySize = v23;
        end;
        v26.onClose = function() --[[ Line: 84 ]]
            -- upvalues: v16 (copy), v18 (copy)
            if v16.onClose then
                v16.onClose();
            end;
            v18(false);
        end;
        if v23 == Enum.DisplaySize.Small and not v21 then
            return v2.createElement(v5, v26);
        elseif v16.preferCenterSheet then
            return v2.createElement(v6, v26);
        else
            return v2.createElement(v7, v26);
        end;
    end;
end));