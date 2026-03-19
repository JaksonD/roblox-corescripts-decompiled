local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.PeopleService);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_script_FirstAncestor_0.Constants);
local l_Button_0 = v2.Button;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useSignalState_0 = v5.useSignalState;
return function(v13) --[[ Line: 28 ]] --[[ Name: PlatformNameSection ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v4 (copy), l_useSignalState_0 (copy), l_View_0 (copy), v6 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = v3.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v4 (ref)
        return v4.getService("PeopleUtility");
    end, {});
    local v16 = v3.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v4 (ref)
        return v4.getService("PeopleListStore");
    end, {});
    local v17 = v3.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v16 (copy), v13 (copy)
        return v16.getPlatformName(v13.UserId);
    end, {
        v13.UserId
    });
    local v18 = v3.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v13 (copy)
        return v16.getPlatformProfileId(v13.UserId);
    end, {
        v13.UserId
    });
    local v19 = l_useSignalState_0(v17);
    local v20 = l_useSignalState_0(v18);
    local v21 = v3.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy), v20 (copy)
        return v15.canShowPlatformProfile(v20);
    end, {
        v20
    });
    local v22 = v3.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v15 (copy), v20 (copy)
        v15.showPlatformProfile(v20);
    end, {
        v20
    });
    local v23 = v3.useRef(nil);
    local v25 = v3.useCallback(function(v24) --[[ Line: 63 ]]
        -- upvalues: v23 (copy), v21 (copy)
        v23.current = v24;
        if v24 and v21 then
            v24.NextSelectionLeft = v24;
            v24.NextSelectionRight = nil;
        end;
    end, {
        v21
    });
    if not (v19 and type(v19) == "string" and string.len(v19) > 0) then
        return nil;
    else
        return v3.createElement(l_View_0, {
            tag = "row gap-xsmall align-y-center auto-x size-0-full", 
            LayoutOrder = -1
        }, {
            PlatformIconContainer = v3.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 1
            }, {
                PlatformIcon = v3.createElement("ImageLabel", {
                    Image = v6.PEOPLEPAGE.PERSON_ROW.PLATFORM_LOGO_IMAGE, 
                    Size = UDim2.fromOffset(v14.Size.Size_900, v14.Size.Size_900), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v14.Color.Content.Default.Color3
                })
            }), 
            PlatformNameButton = v3.createElement(l_Button_0, {
                onActivated = v22, 
                text = v19, 
                variant = l_ButtonVariant_0.Text, 
                size = l_ButtonSize_0.Small, 
                isDisabled = not v21, 
                Selectable = v21, 
                LayoutOrder = 2, 
                ref = v25
            })
        });
    end;
end;