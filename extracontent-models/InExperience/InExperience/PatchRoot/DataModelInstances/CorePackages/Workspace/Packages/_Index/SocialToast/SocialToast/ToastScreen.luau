local l_Parent_0 = script:FindFirstAncestor("SocialToast").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconSize_0 = v2.App.Constant.IconSize;
local l_Toast_0 = v2.App.Dialog.Toast;
return function() --[[ Line: 17 ]]
    -- upvalues: v1 (copy), l_useNavigation_0 (copy), l_useNavigationProps_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_Toast_0 (copy)
    local v8 = v1.useRef(false);
    local v9 = l_useNavigation_0();
    local v12 = l_useNavigationProps_0(function(_, v11) --[[ Line: 20 ]]
        return {
            toastContent = v11.toastContent, 
            anchorPoint = v11.anchorPoint, 
            duration = v11.duration, 
            layoutOrder = v11.layoutOrder, 
            position = v11.position, 
            size = v11.size, 
            show = v11.show
        };
    end);
    local v13 = v1.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v12 (copy), l_Images_0 (ref), l_IconSize_0 (ref), v8 (copy), v9 (copy)
        return {
            toastTitle = v12.toastContent.toastTitle or "", 
            toastSubtitle = v12.toastContent.toastSubtitle, 
            iconColorStyle = v12.toastContent.iconColorStyle, 
            iconImage = if not v12.toastContent.shouldHideIcon then v12.toastContent.iconImage or l_Images_0["icons/status/alert"] else nil, 
            iconSize = if not v12.toastContent.shouldHideIcon then v12.toastContent.iconSize or Vector2.new(l_IconSize_0.Regular, l_IconSize_0.Regular) else nil, 
            swipeUpDismiss = v12.toastContent.swipeUpDismiss, 
            onAppeared = function() --[[ Line: 44 ]] --[[ Name: onAppeared ]]
                -- upvalues: v12 (ref), v8 (ref)
                if v12.toastContent.onAppeared then
                    v12.toastContent.onAppeared();
                end;
                v8.current = false;
            end, 
            onActivated = v12.toastContent.onActivated, 
            onDismissed = function() --[[ Line: 51 ]] --[[ Name: onDismissed ]]
                -- upvalues: v12 (ref), v8 (ref), v9 (ref)
                if v12.toastContent.onDismissed then
                    v12.toastContent.onDismissed();
                end;
                if not v8.current then
                    v9.goBack();
                end;
            end
        };
    end, {
        v12.toastContent
    });
    v1.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v8 (copy)
        v8.current = true;
    end);
    return v1.createElement(l_Toast_0, {
        toastContent = v13, 
        anchorPoint = v12.anchorPoint, 
        duration = v12.duration or 2, 
        layoutOrder = v12.layoutOrder, 
        position = v12.position, 
        size = v12.size, 
        show = v12.show
    });
end;