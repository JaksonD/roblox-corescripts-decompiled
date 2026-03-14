local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_Toast_0 = l_UIBlox_0.App.Dialog.Toast;
local l_validateColorInfo_0 = l_UIBlox_0.Style.Validator.validateColorInfo;
local v9 = l_Roact_0.PureComponent:extend("ToastScreen");
v9.defaultProps = {
    navigation = nil
};
local v10 = l_t_0.strictInterface({
    toastTitle = l_t_0.optional(l_t_0.string), 
    toastSubtitle = l_t_0.optional(l_t_0.string), 
    iconColorStyle = l_t_0.optional(l_validateColorInfo_0), 
    iconImage = l_t_0.optional(l_t_0.union(l_t_0.table, l_t_0.string)), 
    iconSize = l_t_0.optional(l_t_0.Vector2), 
    swipeUpDismiss = l_t_0.optional(l_t_0.boolean), 
    onAppeared = l_t_0.optional(l_t_0.callback), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    onDismissed = l_t_0.optional(l_t_0.callback), 
    hideIcon = l_t_0.optional(l_t_0.boolean)
});
local v11 = l_t_0.strictInterface({
    toastContent = l_t_0.optional(l_t_0.table), 
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    duration = l_t_0.optional(l_t_0.integer), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    position = l_t_0.optional(l_t_0.UDim2), 
    size = l_t_0.optional(l_t_0.UDim2), 
    show = l_t_0.optional(l_t_0.boolean)
});
v9.init = function(v12) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v10 (copy), l_Images_0 (copy), l_IconSize_0 (copy)
    v12.hasToastChanged = false;
    v12.getToastProps = function(v13) --[[ Line: 44 ]]
        -- upvalues: v11 (ref), v10 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v12 (copy)
        local v14 = v13.toastContent or {};
        assert(v11(v13));
        assert(v10(v14));
        return {
            toastContent = {
                toastTitle = v14.toastTitle or "", 
                toastSubtitle = v14.toastSubtitle, 
                iconColorStyle = v14.iconColorStyle, 
                iconImage = if not v14.hideIcon then v14.iconImage or l_Images_0["icons/status/alert"] else nil, 
                iconSize = if not v14.hideIcon then v14.iconSize or Vector2.new(l_IconSize_0.Regular, l_IconSize_0.Regular) else nil, 
                swipeUpDismiss = v14.swipeUpDismiss, 
                onAppeared = function() --[[ Line: 62 ]] --[[ Name: onAppeared ]]
                    -- upvalues: v14 (copy), v12 (ref)
                    if v14.onAppeared then
                        v14.onAppeared();
                    end;
                    v12.hasToastChanged = false;
                end, 
                onActivated = v14.onActivated, 
                onDismissed = function() --[[ Line: 69 ]] --[[ Name: onDismissed ]]
                    -- upvalues: v14 (copy), v12 (ref)
                    if v14.onDismissed then
                        v14.onDismissed();
                    end;
                    if not v12.hasToastChanged then
                        v12.props.navigation.goBack();
                    end;
                end
            }, 
            anchorPoint = v13.anchorPoint, 
            duration = v13.duration or 2, 
            layoutOrder = v13.layoutOrder, 
            position = v13.position, 
            size = v13.size, 
            show = v13.show
        };
    end;
end;
v9.render = function(v15) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_Toast_0 (copy)
    assert(type(v15.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation");
    local v16 = v15.getToastProps(v15.props.navigation.getParam("toastProps", {}));
    return l_Roact_0.createElement(l_Toast_0, v16);
end;
v9.didUpdate = function(v17, _, _) --[[ Line: 98 ]] --[[ Name: didUpdate ]]
    v17.hasToastChanged = true;
end;
return v9;