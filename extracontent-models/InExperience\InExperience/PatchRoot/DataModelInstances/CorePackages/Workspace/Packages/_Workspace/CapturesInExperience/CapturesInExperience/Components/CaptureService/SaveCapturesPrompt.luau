local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.UIBlox);
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local v13 = require(l_Parent_0.Components.CaptureService.CapturePromptItem);
local v14 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = v5.Hooks.useEffectOnce;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useScreenSize_0 = v6.useScreenSize;
local v19 = require(l_Parent_0.Analytics.EventNames);
local v20 = require(l_Parent_0.Thunks.SaveCapturesPromptFinished);
local _ = require(l_Parent_0.Types);
local function _(v22) --[[ Line: 50 ]]
    local v23 = false;
    if typeof(v22) == "Content" then
        v23 = false;
        if v22.Object ~= nil then
            v23 = v22.Object:IsA("VideoCapture");
        end;
    end;
    return v23;
end;
local _ = function(v25) --[[ Line: 54 ]]
    for _, v27 in v25 do
        local v28 = false;
        if typeof(v27) == "Content" then
            v28 = false;
            if v27.Object ~= nil then
                v28 = v27.Object:IsA("VideoCapture");
            end;
        end;
        if v28 then
            return true;
        end;
    end;
    return false;
end;
return function(v30) --[[ Line: 65 ]]
    -- upvalues: v14 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v4 (copy), l_useLocalization_0 (copy), v19 (copy), l_useEffectOnce_0 (copy), v20 (copy), l_ButtonType_0 (copy), l_View_0 (copy), v13 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_InteractiveAlert_0 (copy)
    local v31 = false;
    local v32 = v14();
    local v33 = l_useDispatch_0();
    local v34 = l_useScreenSize_0();
    local v35, v36 = v4.useState(Vector2.new(0, 0));
    local v37, v38 = v4.useState(Vector2.new(0, 0));
    local v39, v40 = v4.useState(1);
    local v41, v42 = v4.useState({});
    local l_contents_0 = v30.promptData.contents;
    local v44 = v30.enableInputDelayed == nil or v30.enableInputDelayed;
    local v45;
    for _, v47 in l_contents_0 do
        local v48 = false;
        if typeof(v47) == "Content" then
            v48 = false;
            if v47.Object ~= nil then
                v48 = v47.Object:IsA("VideoCapture");
            end;
        end;
        if v48 then
            v45 = true;
            v31 = true;
        end;
        if v31 then
            break;
        end;
    end;
    if not v31 then
        v45 = false;
    end;
    v31 = false;
    local v49 = l_useLocalization_0({
        bodyText = "Feature.Captures.Body.SaveCapturesPrompt", 
        no = "Feature.Captures.Action.NoThanks", 
        title = "Feature.Captures.Title.SaveCapturesPrompt", 
        yes = "Feature.Captures.Action.Save"
    });
    v4.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v32 (copy), v19 (ref)
        v32.fireEvent(v19.SaveCapturesPromptViewed);
    end, {});
    v4.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: v45 (copy), v32 (copy), v19 (ref)
        if v45 then
            v32.fireEvent(v19.SaveCapturesPromptVideoPrompted);
        end;
    end, {
        v45
    });
    l_useEffectOnce_0(function() --[[ Line: 97 ]]
        -- upvalues: l_contents_0 (copy), v42 (copy)
        local v50 = {};
        for v51, _ in l_contents_0 do
            v50[v51] = true;
        end;
        v42(v50);
    end, {
        l_contents_0
    });
    local v56 = v4.useCallback(function(v53) --[[ Line: 105 ]]
        -- upvalues: v42 (copy), v39 (copy)
        v42(function(v54) --[[ Line: 106 ]]
            -- upvalues: v39 (ref), v53 (copy)
            local v55 = table.clone(v54);
            v55[v39] = v53;
            return v55;
        end);
    end, {
        v39
    });
    local v58 = v4.useCallback(function(v57) --[[ Line: 113 ]]
        -- upvalues: v36 (copy)
        v36(v57.AbsoluteSize);
    end, {
        v36
    });
    local v60 = v4.useCallback(function(v59) --[[ Line: 117 ]]
        -- upvalues: v38 (copy)
        v38(v59.AbsoluteSize);
    end, {
        v38
    });
    local v69 = v4.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v41 (copy), l_contents_0 (copy), v32 (copy), v19 (ref), v33 (copy), v20 (ref), v30 (copy)
        local v61 = 0;
        local v62 = 0;
        local v63 = false;
        local v64 = {};
        for v65, v66 in v41 do
            v64[l_contents_0[v65]] = v66;
            if v66 then
                v61 = v61 + 1;
                local v67 = l_contents_0[v65];
                local v68 = false;
                if typeof(v67) == "Content" then
                    v68 = false;
                    if v67.Object ~= nil then
                        v68 = v67.Object:IsA("VideoCapture");
                    end;
                end;
                if v68 then
                    v63 = true;
                end;
            end;
            v62 = v62 + 1;
        end;
        if v63 then
            v32.fireEvent(v19.SaveCapturesPromptVideoAccepted);
        end;
        v32.fireEvent(v19.SaveCapturesPromptAccepted, {
            savedCaptures = v61, 
            totalCaptures = v62
        });
        v33(v20(v30.promptId, v64));
    end, {
        v30.promptData, 
        v30.promptId, 
        v41
    });
    local v78 = v4.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: v30 (copy), v32 (copy), v19 (ref), v33 (copy), v20 (ref)
        local v70 = false;
        local v71;
        for _, v73 in v30.promptData.contents do
            local v74 = false;
            if typeof(v73) == "Content" then
                v74 = false;
                if v73.Object ~= nil then
                    v74 = v73.Object:IsA("VideoCapture");
                end;
            end;
            if v74 then
                v71 = true;
                v70 = true;
            end;
            if v70 then
                break;
            end;
        end;
        if not v70 then
            v71 = false;
        end;
        v70 = false;
        if v71 then
            v32.fireEvent(v19.SaveCapturesPromptVideoRejected);
        end;
        v32.fireEvent(v19.SaveCapturesPromptRejected);
        local v75 = {};
        for _, v77 in v30.promptData.contents do
            v75[v77] = false;
        end;
        v33(v20(v30.promptId, v75));
    end, {
        v30.promptData, 
        v30.promptId
    });
    local v79 = v4.useCallback(function() --[[ Line: 164 ]]
        -- upvalues: v40 (copy), v39 (copy)
        v40((math.max(1, v39 - 1)));
    end, {
        v39
    });
    local v80 = v4.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v40 (copy), l_contents_0 (copy), v39 (copy)
        v40((math.min(#l_contents_0, v39 + 1)));
    end, {
        l_contents_0, 
        v39
    });
    local v81 = v4.useMemo(function() --[[ Line: 172 ]]
        -- upvalues: v78 (copy), v49 (copy), l_ButtonType_0 (ref), v44 (copy), v69 (copy)
        return {
            buttons = {
                {
                    props = {
                        onActivated = v78, 
                        text = v49.no
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        delayInputSeconds = 2, 
                        enableInputDelayed = v44, 
                        isDelayedInput = v44, 
                        onActivated = v69, 
                        text = v49.yes
                    }, 
                    isDefaultChild = false
                }
            }
        };
    end, {
        v49, 
        v69, 
        v78
    });
    local v84 = v4.useCallback(function() --[[ Line: 198 ]]
        -- upvalues: v35 (copy), v37 (copy), v34 (copy), v4 (ref), l_View_0 (ref), v60 (copy), v13 (ref), l_contents_0 (copy), v39 (copy), v41 (copy), v56 (copy), l_Text_0 (ref), v79 (copy), l_Icon_0 (ref), v80 (copy)
        local v82 = v35.Y - v37.Y;
        local v83 = v34.Y - 80 - v82;
        return v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 200), 
            sizeConstraint = {
                MaxSize = Vector2.new(1e999, v83)
            }, 
            onAbsoluteSizeChanged = v60
        }, {
            CapturePromptItem = v4.createElement(v13, {
                content = l_contents_0[v39], 
                isSelected = v41[v39], 
                showCheckbox = #l_contents_0 > 1, 
                updateSelected = v56
            }), 
            Overlay = v4.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "padding-small size-full", 
                ZIndex = 2
            }, {
                CountView = v4.createElement(l_View_0, {
                    tag = "bg-over-media-0 anchor-top-left auto-xy clip padding-x-small padding-y-xsmall position-top-left radius-circle", 
                    Visible = #l_contents_0 > 1
                }, {
                    Count = v4.createElement(l_Text_0, {
                        tag = "auto-xy content-emphasis text-body-small", 
                        Text = ("%*/%*"):format(v39, #l_contents_0)
                    })
                }), 
                PrevCaptureButton = if v39 > 1 then v4.createElement(l_View_0, {
                    tag = "bg-over-media-0 anchor-center-left auto-xy clip position-center-left radius-circle", 
                    onActivated = v79
                }, {
                    CycleLeftIcon = v4.createElement(l_Icon_0, {
                        name = "icons/actions/cycleLeft"
                    })
                }) else nil, 
                NextCaptureButton = if v39 < #l_contents_0 then v4.createElement(l_View_0, {
                    tag = "bg-over-media-0 anchor-center-right auto-xy clip position-center-right radius-circle", 
                    onActivated = v80
                }, {}, {
                    CycleRightIcon = v4.createElement(l_Icon_0, {
                        name = "icons/actions/cycleRight"
                    })
                }) else nil
            })
        });
    end, {
        v35, 
        l_contents_0, 
        v37, 
        v39, 
        v60, 
        v80, 
        v79, 
        v34, 
        v41, 
        v56
    });
    return v4.createElement(l_InteractiveAlert_0, {
        bodyText = v49.bodyText, 
        buttonStackInfo = v81, 
        isMiddleContentFocusable = false, 
        middleContent = v84, 
        onAbsoluteSizeChanged = v58, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v34, 
        title = v49.title
    });
end;