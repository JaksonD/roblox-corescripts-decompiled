local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactRoblox);
local v5 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Components.Image);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v10 = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v11 = require(l_script_FirstAncestor_0.Enums.OnCloseCallbackReason);
local v12 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v13 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(script.Parent.Types);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_useDialogVariants_0 = require(script.Parent.useDialogVariants).useDialogVariants;
local v19 = require(script.Parent.DialogProvider);
local v20 = require(script.Parent.useDialog);
local v21 = require(script.Parent.useDialogResponsiveSize);
local v22 = require(script.Parent.useDialogSize);
local v23 = require(l_script_FirstAncestor_0.Providers.Elevation.useElevation);
local l_ElevationOwnerScope_0 = require(l_script_FirstAncestor_0.Providers.Elevation.ElevationProvider).ElevationOwnerScope;
local v25 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local v26 = {
    size = v10.Medium, 
    disablePortal = true, 
    hasBackdrop = false, 
    testId = "--foundation-dialog"
};
local l_SHADOW_IMAGE_0 = v6.SHADOW_IMAGE;
local l_SHADOW_SIZE_0 = v6.SHADOW_SIZE;
local function v40(v29) --[[ Line: 62 ]] --[[ Name: Dialog ]]
    -- upvalues: v2 (copy), l_useDialogVariants_0 (copy), v13 (copy), v3 (copy), v22 (copy), v9 (copy), v23 (copy), v25 (copy), v20 (copy), v21 (copy), v8 (copy), v12 (copy), v11 (copy), v7 (copy), l_SHADOW_IMAGE_0 (copy), l_SHADOW_SIZE_0 (copy), v14 (copy), v16 (copy), v5 (copy), l_ElevationOwnerScope_0 (copy), v4 (copy)
    local v30 = v2.assign({}, v29, {
        LayoutOrder = 1
    });
    local v31 = l_useDialogVariants_0();
    local v32 = v13(v31.inner.maxWidth);
    local v33 = v3.useRef(nil);
    local v34 = v22(v33);
    local v35 = v9();
    local v36 = v23(v25.Dialog, {
        stackAboveOwner = false
    });
    local v37 = v20();
    v21(v30.size);
    local v39 = v3.createElement(v8, {
        ZIndex = v36.zIndex, 
        tag = "size-full", 
        testId = ("%*--container"):format(v30.testId)
    }, {
        Backdrop = if v30.hasBackdrop then v3.createElement(v8, {
            tag = "position-center-center anchor-center-center", 
            Size = UDim2.fromScale(2, 2), 
            stateLayer = {
                affordance = v12.None
            }, 
            onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
                -- upvalues: v30 (copy), v11 (ref)
                if v30.onClose then
                    v30.onClose(v11.BackdropClick);
                end;
            end, 
            backgroundStyle = v31.backdrop.backgroundStyle, 
            ZIndex = 2, 
            testId = ("%*--backdrop"):format(v30.testId)
        }) else nil, 
        DialogShadowWrapper = v3.createElement(v8, {
            tag = v31.container.tag, 
            ZIndex = 2
        }, {
            Shadow = v3.createElement(v7, {
                Image = l_SHADOW_IMAGE_0, 
                Size = v34:map(function(v38) --[[ Line: 102 ]]
                    -- upvalues: l_SHADOW_SIZE_0 (ref)
                    return UDim2.fromOffset(v38.X + l_SHADOW_SIZE_0 * 2, v38.Y + l_SHADOW_SIZE_0 * 2);
                end), 
                slice = {
                    center = Rect.new(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0), 
                    scale = 2
                }, 
                imageStyle = v31.shadow.imageStyle, 
                testId = ("%*--shadow"):format(v30.testId)
            })
        })
    }, {
        Dialog = v3.createElement(v8, {
            tag = v31.container.tag, 
            ZIndex = 3
        }, {
            DialogFlexStart = v3.createElement(v8, {
                tag = "fill", 
                LayoutOrder = 0
            }), 
            DialogInner = v3.createElement(v8, v14(v30, {
                tag = v31.inner.tag, 
                ref = v30.forwardRef, 
                sizeConstraint = {
                    MaxSize = Vector2.new(v32, 1e999)
                }, 
                stateLayer = {
                    affordance = v12.None
                }, 
                selection = v16.nonSelectable, 
                selectionGroup = v16.isolatedSelectionGroup, 
                onActivated = v2.noop
            }), {
                CloseAffordance = if v30.onClose then v3.createElement(v5, {
                    onActivated = v30.onClose, 
                    ref = v37.closeAffordanceRef, 
                    NextSelectionDown = v37.contentStartRef, 
                    Position = UDim2.new(1, -v31.closeAffordance.offset, 0, v31.closeAffordance.offset), 
                    AnchorPoint = Vector2.new(1, 0), 
                    ZIndex = 2, 
                    testId = ("%*--close-affordance"):format(v30.testId)
                }) else nil, 
                DialogBody = v3.createElement(v8, {
                    tag = v31.body.tag, 
                    ref = v33, 
                    testId = ("%*--body"):format(v30.testId)
                }, v3.createElement(l_ElevationOwnerScope_0, {
                    owner = v36
                }, v30.children))
            }), 
            DialogFlexEnd = v3.createElement(v8, {
                tag = "fill", 
                LayoutOrder = 2
            })
        })
    });
    if v30.disablePortal or v35 == nil then
        return v39;
    else
        return v4.createPortal(v39, v35);
    end;
end;
return v3.memo(v3.forwardRef(function(v41, v42) --[[ Line: 176 ]] --[[ Name: DialogContainer ]]
    -- upvalues: v15 (copy), v26 (copy), v3 (copy), v19 (copy), v40 (copy), v2 (copy)
    local v43 = v15(v41, v26);
    return v3.createElement(v19, {
        size = v43.size, 
        responsiveSize = v43.size, 
        testId = v43.testId
    }, {
        Dialog = v3.createElement(v40, v2.assign({}, v43, {
            forwardRef = v42
        }))
    });
end));