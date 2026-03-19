local l_script_FirstAncestor_0 = script:FindFirstAncestor("LandingPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.AccountCarouselAvatar);
local v5 = require(l_script_FirstAncestor_0.Components.ScrollIndicatorComponent);
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v8 = game:DefineFastFlag("EnableAccountCarouselPatch", false);
local v9 = game:DefineFastInt("AccountCarouselTweenDurationOnScroll", 100);
local v10 = require(l_Parent_0.AuthAnalytics);
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local l_EventStreamConstants_0 = v10.EventStreamConstants;
local l_authButtonClick_0 = v10.Events.authButtonClick;
local l_AccountCarouselAvatarScaleFactor_0 = require(l_script_FirstAncestor_0.Constants.LandingPageConstants).Common.AccountCarouselAvatarScaleFactor;
local v15 = game:DefineFastFlag("EnableAccountCarouselDefaultCenter", false);
return function(v16) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), l_AccountCarouselAvatarScaleFactor_0 (copy), v15 (copy), v9 (copy), l_TweenService_0 (copy), v8 (copy), l_UserInputService_0 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v17, v18 = v2.useState(1);
    local v19, v20 = v2.useState(0);
    local v21, v22 = v2.useState(0);
    local v23, v24 = v2.useState(0);
    local v25 = v2.useRef({});
    local v26 = v2.useRef(nil);
    local v27 = {};
    local function v29(v28) --[[ Line: 37 ]]
        -- upvalues: v23 (copy), v24 (copy)
        if v28 ~= v23 then
            v24(v28);
        end;
    end;
    local v30, v31 = v2.useState(false);
    local function v41(v32, v33) --[[ Line: 44 ]] --[[ Name: scrollToCenter ]]
        -- upvalues: v30 (copy), v31 (copy), v25 (copy), v16 (copy), l_AccountCarouselAvatarScaleFactor_0 (ref), v15 (ref), v9 (ref), l_TweenService_0 (ref)
        if v30 then
            return;
        else
            v31(true);
            local v34 = v25.current[v32];
            if v34 and v34.AbsolutePosition and v33.AbsolutePosition then
                local v35 = v16.avatarSize.X.Offset * l_AccountCarouselAvatarScaleFactor_0;
                local v36 = v34.AbsolutePosition.X + v35 / 2;
                local v37 = v33.AbsolutePosition.X + v33.AbsoluteSize.X / 2;
                local v38 = 0;
                v38 = v15 and v37 == 0 and 0 or v36 - v37 + v33.CanvasPosition.X;
                local v39 = TweenInfo.new(v9 / 1000);
                local v40 = l_TweenService_0:Create(v33, v39, {
                    CanvasPosition = Vector2.new(v38, 0)
                });
                v40:Play();
                v40.Completed:Connect(function() --[[ Line: 65 ]]
                    -- upvalues: v31 (ref)
                    v31(false);
                end);
            end;
            return;
        end;
    end;
    local function _(v42, v43) --[[ Line: 71 ]]
        -- upvalues: v8 (ref), v30 (copy), v18 (copy), v16 (copy), v41 (copy)
        if v8 and v30 then
            return;
        else
            v18(v42);
            v16.setSelectedAvatarIndex(v42);
            v41(v42, v43);
            return;
        end;
    end;
    local v45 = v2.useRef(v17);
    v2.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v45 (copy), v17 (copy)
        v45.current = v17;
    end, {
        v17
    });
    local v46, v47 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v8 (ref), v26 (copy), v16 (copy), v30 (copy), v18 (copy), v41 (copy), v46 (copy), l_UserInputService_0 (ref), v45 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v47 (copy)
        if v8 and v26.current and #v16.accounts >= 1 then
            local l_current_0 = v26.current;
            if not v8 or not v30 then
                v18(1);
                v16.setSelectedAvatarIndex(1);
                v41(1, l_current_0);
            end;
        end;
        if v46 then
            v46:Disconnect();
        end;
        local v54 = l_UserInputService_0.TouchSwipe:Connect(function(v49) --[[ Line: 98 ]]
            -- upvalues: v16 (ref), v26 (ref), v45 (ref), l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v8 (ref), v30 (ref), v18 (ref), v41 (ref)
            if #v16.accounts <= 1 then
                return;
            elseif v26.current and v49 == Enum.SwipeDirection.Left then
                local v50 = math.clamp(v45.current + 1, 1, #v16.accounts);
                if l_GetFFlagEnableAccountCarouselEvents_0() then
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerSwipeLeft, tostring(v45.current) .. ";" .. tostring(v50));
                end;
                local l_current_1 = v26.current;
                if v8 and v30 then
                    return;
                else
                    v18(v50);
                    v16.setSelectedAvatarIndex(v50);
                    v41(v50, l_current_1);
                    return;
                end;
            else
                if v26.current and v49 == Enum.SwipeDirection.Right then
                    local v52 = math.clamp(v45.current - 1, 1, #v16.accounts);
                    if l_GetFFlagEnableAccountCarouselEvents_0() then
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerSwipeRight, tostring(v45.current) .. ";" .. tostring(v52));
                    end;
                    local l_current_2 = v26.current;
                    if v8 and v30 then
                        return;
                    else
                        v18(v52);
                        v16.setSelectedAvatarIndex(v52);
                        v41(v52, l_current_2);
                    end;
                end;
                return;
            end;
        end);
        v47(v54);
        return function() --[[ Line: 125 ]]
            -- upvalues: v46 (ref)
            if v46 then
                v46:Disconnect();
            end;
        end;
    end, {
        v45, 
        v16.accounts, 
        v26
    });
    v2.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v26 (copy)
        if v26.current then
            v26.current.ScrollingEnabled = false;
        end;
    end, {
        v26
    });
    local v56 = v2.useCallback(function(v55) --[[ Line: 139 ]]
        -- upvalues: v25 (copy)
        table.insert(v25.current, v55);
    end, {});
    for v57, v58 in ipairs(v16.accounts) do
        v27[v57] = v2.createElement(v4, {
            avatarSize = v16.avatarSize, 
            ref = v56, 
            accountInfo = v58, 
            isHighlighted = v57 == v17, 
            setAvatarElementHeightForParent = v29, 
            onActivated = function() --[[ Line: 150 ]] --[[ Name: onActivated ]]
                -- upvalues: v26 (copy), v57 (copy), v17 (copy), v8 (ref), v30 (copy), v18 (copy), v16 (copy), v41 (copy)
                if v26.current and v57 ~= v17 then
                    local l_v57_0 = v57;
                    local l_current_3 = v26.current;
                    if v8 and v30 then
                        return;
                    else
                        v18(l_v57_0);
                        v16.setSelectedAvatarIndex(l_v57_0);
                        v41(l_v57_0, l_current_3);
                    end;
                end;
            end
        });
    end;
    v2.useLayoutEffect(function() --[[ Line: 158 ]]
        -- upvalues: v16 (copy), l_AccountCarouselAvatarScaleFactor_0 (ref), v21 (copy), v19 (copy), v20 (copy)
        local v61 = v16.avatarSize.X.Offset * l_AccountCarouselAvatarScaleFactor_0;
        local v62 = (v21 - v61) / 2;
        if v62 ~= v19 then
            v20(v62);
        end;
    end, {
        v21
    });
    return v2.createElement(v3.View, {
        tag = "col grow size-full-0 align-y-bottom", 
        LayoutOrder = v16.LayoutOrder
    }, {
        ScrollView = v2.createElement(v3.ScrollView, {
            scrollingFrameRef = v26, 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                CanvasSize = UDim2.fromOffset(0, 0), 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                scrollBarVisibility = v3.Enums.ScrollBarVisibility.None
            }, 
            onAbsoluteWindowSizeChanged = function(v63) --[[ Line: 181 ]] --[[ Name: onAbsoluteWindowSizeChanged ]]
                -- upvalues: v21 (copy), v22 (copy)
                local l_X_0 = v63.AbsoluteSize.X;
                if l_X_0 ~= v21 then
                    v22(l_X_0);
                end;
            end, 
            tag = "row gap-none no-wrap", 
            Size = UDim2.new(1, 0, 0, v23), 
            LayoutOrder = 1
        }, {
            v2.createElement(v3.View, {
                tag = "row align-y-center gap-none no-wrap auto-xy"
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v19), 
                    PaddingRight = UDim.new(0, v19)
                }), 
                AvatarElements = v2.createElement(v2.Fragment, {}, v27)
            })
        }), 
        ScrollIndicators = v2.createElement(v5, {
            totalAvatars = #v16.accounts, 
            highlightedIndex = v17, 
            LayoutOrder = 2
        })
    });
end;