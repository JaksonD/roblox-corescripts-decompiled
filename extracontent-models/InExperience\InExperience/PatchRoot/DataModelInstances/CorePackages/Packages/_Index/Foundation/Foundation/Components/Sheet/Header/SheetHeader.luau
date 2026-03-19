local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Sheet");
local v5 = require(l_script_FirstAncestor_1.SheetContext);
local v6 = require(l_script_FirstAncestor_1.SheetType);
local v7 = require(l_script_FirstAncestor_0.Utility.Flags);
local v8 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v9 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v10 = require(l_script_FirstAncestor_0.Components.View);
return v2.memo(v2.forwardRef(function(v11, v12) --[[ Line: 21 ]] --[[ Name: SheetHeader ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v6 (copy), v10 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v13 = v3();
    local v14 = v2.useContext(v5);
    local l_innerScrollY_0 = v14.innerScrollY;
    local l_setHasHeader_0 = v14.setHasHeader;
    local l_sheetType_0 = v14.sheetType;
    local l_closeSheet_0 = v14.closeSheet;
    local l_testId_0 = v14.testId;
    local l_closeAffordanceRef_0 = v14.closeAffordanceRef;
    local l_contentStartRef_0 = v14.contentStartRef;
    assert(l_innerScrollY_0 and l_setHasHeader_0 and l_closeSheet_0 and l_testId_0, "SheetHeader must be used within a Sheet");
    local v22 = l_sheetType_0 == v6.Bottom;
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: l_setHasHeader_0 (copy)
        l_setHasHeader_0(true);
        return function() --[[ Line: 38 ]]
            -- upvalues: l_setHasHeader_0 (ref)
            l_setHasHeader_0(false);
        end;
    end, {});
    local v23 = if v11.hasCloseAffordance == nil then not v22 else v11.hasCloseAffordance;
    return v2.createElement(v10, {
        ZIndex = 2, 
        tag = "size-full-0 auto-y col", 
        testId = ("%*--header"):format(l_testId_0), 
        ref = v12
    }, {
        Content = v2.createElement(v10, {
            LayoutOrder = 1, 
            tag = {
                ["auto-y row gap-small items-center"] = true, 
                ["size-full-1400 margin-left-small padding-y-small padding-right-medium align-y-center"] = v7.FoundationSheetHeaderSmallerPadding, 
                ["size-full-0 margin-x-small margin-bottom-small"] = not v7.FoundationSheetHeaderSmallerPadding, 
                ["padding-top-small"] = not v7.FoundationSheetHeaderSmallerPadding and v22, 
                ["margin-top-small"] = not v7.FoundationSheetHeaderSmallerPadding and not v22
            }
        }, {
            SubContent = v2.createElement(v10, {
                LayoutOrder = 1, 
                tag = "size-full-0 auto-y row gap-small items-center shrink"
            }, v11.children), 
            CloseAffordance = if v23 then v2.createElement(v8, {
                onActivated = l_closeSheet_0, 
                ref = l_closeAffordanceRef_0, 
                NextSelectionDown = l_contentStartRef_0, 
                variant = v9.Utility, 
                LayoutOrder = 2, 
                testId = ("%*--header--close-affordance"):format(l_testId_0)
            }) else nil
        }), 
        BottomBorder = v2.createElement(v10, {
            LayoutOrder = 2, 
            backgroundStyle = l_innerScrollY_0:map(function(v24) --[[ Line: 78 ]]
                -- upvalues: v13 (copy)
                return {
                    Color3 = v13.Color.Stroke.Default.Color3, 
                    Transparency = math.lerp(1, v13.Color.Stroke.Default.Transparency, (math.clamp(v24 / v13.Size.Size_1200, 0, 1)))
                };
            end), 
            testId = ("%*--header--bottom-border"):format(l_testId_0), 
            Size = UDim2.new(1, 0, 0, v13.Stroke.Standard)
        })
    });
end));