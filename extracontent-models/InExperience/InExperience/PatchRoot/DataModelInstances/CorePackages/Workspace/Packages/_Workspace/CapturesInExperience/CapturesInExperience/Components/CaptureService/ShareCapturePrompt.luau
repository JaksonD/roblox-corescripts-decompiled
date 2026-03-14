local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.UIBlox);
local l_View_0 = v2.View;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useScreenSize_0 = v6.useScreenSize;
local v15 = require(l_Parent_0.Components.CaptureService.CapturePromptItem);
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.Thunks.ShareCapturePromptFinished);
local _ = require(l_Parent_0.Types);
return function(v19) --[[ Line: 36 ]]
    -- upvalues: v11 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v4 (copy), l_useLocalization_0 (copy), v16 (copy), v17 (copy), l_ButtonType_0 (copy), l_View_0 (copy), v15 (copy), l_InteractiveAlert_0 (copy)
    local v20 = v11();
    local v21 = l_useDispatch_0();
    local v22 = l_useScreenSize_0();
    local v23, v24 = v4.useState(Vector2.new(0, 0));
    local v25, v26 = v4.useState(Vector2.new(0, 0));
    local v27, v28 = v4.useState(Vector2.new(0, 0));
    local l_content_0 = v19.promptData.content;
    local v30 = v19.enableInputDelayed == nil or v19.enableInputDelayed;
    local v31 = false;
    if typeof(l_content_0) == "Content" then
        v31 = false;
        if l_content_0.Object ~= nil then
            v31 = l_content_0.Object:IsA("VideoCapture");
        end;
    end;
    local v32 = l_useLocalization_0({
        bodyText = "Feature.Captures.Body.ShareCapturePrompt", 
        no = "Feature.Captures.Action.NoThanks", 
        title = "Feature.Captures.Title.ShareCapturePrompt", 
        yes = "Feature.Captures.Action.Share"
    });
    v4.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy), v16 (ref), v31 (copy)
        v20.fireEvent(v16.ShareCapturePromptViewed);
        if v31 then
            v20.fireEvent(v16.ShareCapturePromptVideoPrompted);
        end;
    end, {
        v31
    });
    local v34 = v4.useCallback(function(v33) --[[ Line: 64 ]]
        -- upvalues: v24 (copy)
        v24(v33.AbsoluteSize);
    end, {
        v24
    });
    local v36 = v4.useCallback(function(v35) --[[ Line: 68 ]]
        -- upvalues: v26 (copy)
        v26(v35.AbsoluteSize);
    end, {
        v26
    });
    local v37 = v4.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: v20 (copy), v16 (ref), v31 (copy), v21 (copy), v17 (ref), v19 (copy)
        v20.fireEvent(v16.ShareCapturePromptAccepted);
        if v31 then
            v20.fireEvent(v16.ShareCapturePromptVideoAccepted);
        end;
        v21(v17(v19.promptId, v19.promptData, true));
    end, {
        v31, 
        v19.promptData, 
        v19.promptId
    });
    local v38 = v4.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v20 (copy), v16 (ref), v31 (copy), v21 (copy), v17 (ref), v19 (copy)
        v20.fireEvent(v16.ShareCapturePromptRejected);
        if v31 then
            v20.fireEvent(v16.ShareCapturePromptVideoRejected);
        end;
        v21(v17(v19.promptId, v19.promptData, false));
    end, {
        v31, 
        v19.promptData, 
        v19.promptId
    });
    local v40 = v4.useCallback(function(v39) --[[ Line: 90 ]]
        -- upvalues: v28 (copy)
        v28(v39.Resolution);
    end, {
        v28
    });
    local v41 = v4.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v38 (copy), v32 (copy), l_ButtonType_0 (ref), v30 (copy), v37 (copy)
        return {
            buttons = {
                {
                    props = {
                        onActivated = v38, 
                        text = v32.no
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        delayInputSeconds = 2, 
                        enableInputDelayed = v30, 
                        isDelayedInput = v30, 
                        onActivated = v37, 
                        text = v32.yes
                    }, 
                    isDefaultChild = false
                }
            }
        };
    end, {
        v32, 
        v37, 
        v38
    });
    local v44 = v4.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v23 (copy), v25 (copy), v22 (copy), v4 (ref), l_View_0 (ref), v36 (copy), v15 (ref), l_content_0 (copy)
        local v42 = v23.Y - v25.Y;
        local v43 = v22.Y - 80 - v42;
        return v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 200), 
            sizeConstraint = {
                MaxSize = Vector2.new(1e999, v43)
            }, 
            onAbsoluteSizeChanged = v36
        }, {
            CapturePromptItem = v4.createElement(v15, {
                content = l_content_0, 
                isSelected = true, 
                showCheckbox = false, 
                updateSelected = function() --[[ Line: 135 ]] --[[ Name: updateSelected ]]

                end
            })
        });
    end, {
        v23, 
        l_content_0, 
        v25, 
        v40, 
        v27
    });
    return v4.createElement(l_InteractiveAlert_0, {
        bodyText = v32.bodyText, 
        buttonStackInfo = v41, 
        isMiddleContentFocusable = false, 
        middleContent = v44, 
        onAbsoluteSizeChanged = v34, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v22, 
        title = v32.title
    });
end;