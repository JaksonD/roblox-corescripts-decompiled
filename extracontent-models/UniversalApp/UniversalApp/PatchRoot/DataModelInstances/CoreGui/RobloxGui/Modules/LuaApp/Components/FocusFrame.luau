local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v4 = require(l_CorePackages_0.Packages.ReactOtter);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.ReactUtils);
local l_useProperties_0 = v6.useProperties;
local l_useForwardRef_0 = v6.useForwardRef;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_RoactRodux_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux;
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = {
    dampingRatio = 1, 
    frequency = 3, 
    restingPositionLimit = 0.1, 
    restingVelocityLimit = 2
};
local function _(v14, v15) --[[ Line: 52 ]] --[[ Name: useJoinBindings ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), v15 (copy), v1 (ref), v14 (copy)
        local v17 = v2.map(v15, function(v16) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v16) == "table" and v16.getValue then
                return v16;
            else
                return v1.createBinding(v16);
            end;
        end);
        return v1.joinBindings(v17):map(function(v18) --[[ Line: 62 ]]
            -- upvalues: v14 (ref)
            return v14(unpack(v18));
        end);
    end, v15);
end;
local function v24(v20, v21) --[[ Line: 68 ]] --[[ Name: useBackEvent ]]
    -- upvalues: v1 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy)
    local v23 = v1.useCallback(function(v22) --[[ Line: 69 ]]
        -- upvalues: v21 (copy)
        if v22.eventData and v22.eventData.UserInputState == Enum.UserInputState.End and v21 then
            v22.cancelled = true;
            v21();
        end;
    end, {
        v21
    });
    return (v3.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v23, nil, v20));
end;
local function v39(v25) --[[ Line: 87 ]] --[[ Name: useFocusState ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), l_useForwardRef_0 (copy), v13 (copy)
    local v26 = v3.useFocusedGuiObject();
    local v27 = v3.useFocusGuiObject();
    local v28 = v1.useRef(nil);
    local v29 = v1.useRef(nil);
    local v31 = v1.useCallback(function(v30) --[[ Line: 96 ]]
        -- upvalues: v28 (copy), v29 (copy)
        if v30 == 1 and v28.current then
            v28.current();
            v28.current = nil;
        end;
        if v30 == 0 and v29.current then
            v29.current();
            v29.current = nil;
        end;
    end, {});
    local v32, v33 = v4.useAnimatedBinding(0, v31);
    local v34, v35 = v1.useState(false);
    local v36 = v1.useRef(nil);
    local v38 = v1.useCallback(function(v37) --[[ Line: 111 ]]
        -- upvalues: v36 (copy), v28 (copy), v27 (copy), v29 (copy), v35 (copy), v26 (copy)
        v36.current = function() --[[ Line: 112 ]]
            -- upvalues: v28 (ref), v27 (ref), v37 (copy), v29 (ref), v35 (ref), v26 (ref)
            v28.current = function() --[[ Line: 113 ]]
                -- upvalues: v27 (ref), v37 (ref)
                v27(v37);
            end;
            v29.current = function() --[[ Line: 116 ]]
                -- upvalues: v35 (ref), v27 (ref), v26 (ref)
                v35(false);
                v27(v26);
            end;
        end;
    end, {
        v26, 
        v27
    });
    return l_useForwardRef_0(v25, v38), v34, v32, v1.useCallback(function() --[[ Line: 123 ]]
        -- upvalues: v32 (copy), v36 (copy), v35 (copy), v33 (copy), v4 (ref), v13 (ref)
        if v32:getValue() == 0 and v36.current then
            v36.current();
            v35(true);
            v33(v4.spring(1, v13));
        end;
    end, {
        v26, 
        v32
    }), (v1.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v32 (copy), v33 (copy), v4 (ref), v13 (ref)
        if v32:getValue() == 1 then
            v33(v4.spring(0, v13));
        end;
    end, {
        v32
    }));
end;
return v1.forwardRef(function(v40, v41) --[[ Line: 140 ]]
    -- upvalues: l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_RoactRodux_0 (copy), v1 (copy), l_useProperties_0 (copy), v39 (copy), v24 (copy), v2 (copy)
    local v42 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v43 = v40.selectionCursor or v42;
    local v45 = l_RoactRodux_0.useSelector(function(v44) --[[ Line: 144 ]]
        return v44.ScreenSize or Vector2.zero;
    end);
    local v46 = v1.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v40 (copy), v45 (copy)
        if v40.safeAreaSize then
            return Vector2.new(v45.X * v40.safeAreaSize.X.Scale + v40.safeAreaSize.X.Offset, v45.Y * v40.safeAreaSize.Y.Scale + v40.safeAreaSize.Y.Offset);
        else
            return v45;
        end;
    end, {
        v45, 
        v40.safeAreaSize
    });
    local v47, v48 = v1.useBinding(Vector2.zero);
    local v49 = l_useProperties_0(v41, v48, "AbsolutePosition");
    local v50, v51 = v1.useBinding(Vector2.zero);
    local v52 = l_useProperties_0(nil, v51, "AbsoluteSize");
    local _, v54 = v1.useBinding(Vector2.zero);
    local v55 = l_useProperties_0(nil, v54, "AbsolutePosition");
    local v56, v57 = v1.useBinding(Vector2.zero);
    local v58 = l_useProperties_0(nil, v57, "AbsoluteSize");
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63, v64, v65, v66, v67 = v39(v49);
    v49 = v63;
    v59 = v64;
    v60 = v65;
    v61 = v66;
    v62 = v67;
    v49 = v24(v49, if v59 then v62 else nil);
    v63, v64 = v1.useState(false);
    v65 = v1.useMemo(function() --[[ Line: 183 ]]
        -- upvalues: v40 (copy), v2 (ref), v59 (ref)
        return (v40.renderHeader or v2.noop)(v59);
    end, {
        v59, 
        v40.renderHeader
    });
    v66 = v1.useMemo(function() --[[ Line: 188 ]]
        -- upvalues: v40 (copy), v59 (ref)
        return v40.renderContents(v59);
    end, {
        v59, 
        v40.renderContents
    });
    local v68;
    v67, v68 = v1.useMemo(function() --[[ Line: 192 ]]
        -- upvalues: v1 (ref), v58 (copy), v66 (copy), v40 (copy), v63 (copy), v59 (ref)
        local v69 = v1.createElement("Frame", {
            Position = UDim2.new(), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ref = v58, 
            BackgroundTransparency = 1, 
            Selectable = false, 
            SelectionGroup = true, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, v66);
        local v70, v71 = v40.renderContentWrapper(v63, v59, v69);
        return v70, v71 or {};
    end, {
        v66, 
        v63, 
        v58, 
        v40.renderContentWrapper
    });
    local function v80(v72, v73, v74, _, _) --[[ Line: 214 ]]
        local v77 = v74.top or 0;
        local v78 = v74.bottom or 0;
        local v79 = v72.Y + v77 + v73.Y + v78;
        return UDim2.new(1, 0, 0, v79);
    end;
    local v81 = {
        v50, 
        v56, 
        v68, 
        v40.limitInlineHeight, 
        v46
    };
    local l_v81_0 = v81 --[[ copy: 30 -> 40 ]];
    local l_v80_0 = v80 --[[ copy: 29 -> 41 ]];
    local v87 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v81_0 (copy), v1 (ref), l_v80_0 (copy)
        local v85 = v2.map(l_v81_0, function(v84) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v84) == "table" and v84.getValue then
                return v84;
            else
                return v1.createBinding(v84);
            end;
        end);
        return v1.joinBindings(v85):map(function(v86) --[[ Line: 62 ]]
            -- upvalues: l_v80_0 (ref)
            return l_v80_0(unpack(v86));
        end);
    end, v81);
    v81 = function(v88, v89) --[[ Line: 229 ]]
        if v88 > 0 then
            return 1000000;
        else
            return v89;
        end;
    end;
    local v90 = {
        v60, 
        v40.zIndex
    };
    local l_v90_0 = v90 --[[ copy: 31 -> 42 ]];
    local l_v81_1 = v81 --[[ copy: 30 -> 43 ]];
    v80 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v90_0 (copy), v1 (ref), l_v81_1 (copy)
        local v94 = v2.map(l_v90_0, function(v93) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v93) == "table" and v93.getValue then
                return v93;
            else
                return v1.createBinding(v93);
            end;
        end);
        return v1.joinBindings(v94):map(function(v95) --[[ Line: 62 ]]
            -- upvalues: l_v81_1 (ref)
            return l_v81_1(unpack(v95));
        end);
    end, v90);
    v90 = function(v96, v97) --[[ Line: 233 ]]
        if v96 > 0 then
            return UDim2.fromOffset(-v97.X, -v97.Y - 200);
        else
            return UDim2.new();
        end;
    end;
    local v98 = {
        v60, 
        v47
    };
    local l_v98_0 = v98 --[[ copy: 32 -> 44 ]];
    local l_v90_1 = v90 --[[ copy: 31 -> 45 ]];
    v81 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v98_0 (copy), v1 (ref), l_v90_1 (copy)
        local v102 = v2.map(l_v98_0, function(v101) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v101) == "table" and v101.getValue then
                return v101;
            else
                return v1.createBinding(v101);
            end;
        end);
        return v1.joinBindings(v102):map(function(v103) --[[ Line: 62 ]]
            -- upvalues: l_v90_1 (ref)
            return l_v90_1(unpack(v103));
        end);
    end, v98);
    v98 = function(v104, v105) --[[ Line: 241 ]]
        if v104 > 0 then
            return UDim2.fromOffset(v105.X, v105.Y + 400);
        else
            return UDim2.new();
        end;
    end;
    local v106 = {
        v60, 
        v45
    };
    local l_v106_0 = v106 --[[ copy: 33 -> 46 ]];
    local l_v98_1 = v98 --[[ copy: 32 -> 47 ]];
    v90 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v106_0 (copy), v1 (ref), l_v98_1 (copy)
        local v110 = v2.map(l_v106_0, function(v109) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v109) == "table" and v109.getValue then
                return v109;
            else
                return v1.createBinding(v109);
            end;
        end);
        return v1.joinBindings(v110):map(function(v111) --[[ Line: 62 ]]
            -- upvalues: l_v98_1 (ref)
            return l_v98_1(unpack(v111));
        end);
    end, v106);
    v106 = function(v112, v113) --[[ Line: 249 ]]
        return 1 - v112 * (1 - v113);
    end;
    local v114 = {
        v60, 
        v40.overlayTransparency or 1
    };
    local l_v114_0 = v114 --[[ copy: 34 -> 48 ]];
    local l_v106_1 = v106 --[[ copy: 33 -> 49 ]];
    v98 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v114_0 (copy), v1 (ref), l_v106_1 (copy)
        local v118 = v2.map(l_v114_0, function(v117) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v117) == "table" and v117.getValue then
                return v117;
            else
                return v1.createBinding(v117);
            end;
        end);
        return v1.joinBindings(v118):map(function(v119) --[[ Line: 62 ]]
            -- upvalues: l_v106_1 (ref)
            return l_v106_1(unpack(v119));
        end);
    end, v114);
    v114 = function(v120, v121, v122) --[[ Line: 255 ]]
        -- upvalues: v40 (copy), v64 (copy)
        local l_Offset_0 = v121.Y.Offset;
        local v124 = math.min(l_Offset_0, v122.Y) - l_Offset_0;
        local v125 = if v40.limitInlineHeight then v124 else 0;
        local l_v64_0 = v64;
        local v127 = false;
        if v124 < 0 then
            v127 = v120 == 1;
        end;
        l_v64_0(v127);
        return UDim2.new(1, 0, 0, l_Offset_0 + v120 * v124 + (1 - v120) * v125);
    end;
    local v128 = {
        v60, 
        v87, 
        v46, 
        v63, 
        v64
    };
    local l_v128_0 = v128 --[[ copy: 35 -> 50 ]];
    local l_v114_1 = v114 --[[ copy: 34 -> 51 ]];
    v106 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v128_0 (copy), v1 (ref), l_v114_1 (copy)
        local v132 = v2.map(l_v128_0, function(v131) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v131) == "table" and v131.getValue then
                return v131;
            else
                return v1.createBinding(v131);
            end;
        end);
        return v1.joinBindings(v132):map(function(v133) --[[ Line: 62 ]]
            -- upvalues: l_v114_1 (ref)
            return l_v114_1(unpack(v133));
        end);
    end, v128);
    v128 = function(v134, v135, v136, v137) --[[ Line: 267 ]]
        local v138 = (v137.Y - v136.Y.Offset) / 2 - v135.Y;
        return UDim2.fromOffset(0, v134 * v138);
    end;
    local v139 = {
        v60, 
        v47, 
        v106, 
        v45
    };
    local l_v139_0 = v139 --[[ copy: 36 -> 52 ]];
    local l_v128_1 = v128 --[[ copy: 35 -> 53 ]];
    v114 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v139_0 (copy), v1 (ref), l_v128_1 (copy)
        local v143 = v2.map(l_v139_0, function(v142) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v142) == "table" and v142.getValue then
                return v142;
            else
                return v1.createBinding(v142);
            end;
        end);
        return v1.joinBindings(v143):map(function(v144) --[[ Line: 62 ]]
            -- upvalues: l_v128_1 (ref)
            return l_v128_1(unpack(v144));
        end);
    end, v139);
    v139 = function(v145, v146) --[[ Line: 280 ]]
        return v145 + UDim2.fromOffset(0, v146.Y);
    end;
    local v147 = {
        v114, 
        v50
    };
    local l_v147_0 = v147 --[[ copy: 37 -> 54 ]];
    local l_v139_1 = v139 --[[ copy: 36 -> 55 ]];
    v128 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v147_0 (copy), v1 (ref), l_v139_1 (copy)
        local v151 = v2.map(l_v147_0, function(v150) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v150) == "table" and v150.getValue then
                return v150;
            else
                return v1.createBinding(v150);
            end;
        end);
        return v1.joinBindings(v151):map(function(v152) --[[ Line: 62 ]]
            -- upvalues: l_v139_1 (ref)
            return l_v139_1(unpack(v152));
        end);
    end, v147);
    v147 = function(v153, v154) --[[ Line: 284 ]]
        return v153 - UDim2.fromOffset(0, v154.Y);
    end;
    local v155 = {
        v106, 
        v50
    };
    local l_v155_0 = v155 --[[ copy: 38 -> 56 ]];
    local l_v147_1 = v147 --[[ copy: 37 -> 57 ]];
    v139 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), l_v155_0 (copy), v1 (ref), l_v147_1 (copy)
        local v159 = v2.map(l_v155_0, function(v158) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v158) == "table" and v158.getValue then
                return v158;
            else
                return v1.createBinding(v158);
            end;
        end);
        return v1.joinBindings(v159):map(function(v160) --[[ Line: 62 ]]
            -- upvalues: l_v147_1 (ref)
            return l_v147_1(unpack(v160));
        end);
    end, v155);
    v155 = function(v161) --[[ Line: 292 ]]
        if v161 < 1 then
            return 4;
        else
            return 2;
        end;
    end;
    local v162 = {
        v60
    };
    v147 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v2 (ref), v162 (copy), v1 (ref), v155 (copy)
        local v164 = v2.map(v162, function(v163) --[[ Line: 55 ]]
            -- upvalues: v1 (ref)
            if type(v163) == "table" and v163.getValue then
                return v163;
            else
                return v1.createBinding(v163);
            end;
        end);
        return v1.joinBindings(v164):map(function(v165) --[[ Line: 62 ]]
            -- upvalues: v155 (ref)
            return v155(unpack(v165));
        end);
    end, v162);
    return v1.createElement("Frame", {
        Size = if v40.limitInlineHeight then v106 else v87, 
        ref = v49, 
        BackgroundTransparency = 1, 
        LayoutOrder = v40.layoutOrder, 
        ZIndex = v80, 
        Selectable = false
    }, {
        Overlay = v1.createElement("TextButton", {
            Text = "", 
            Position = v81, 
            Size = v90, 
            BackgroundColor3 = v40.overlayColor3 or Color3.new(0, 0, 0), 
            BackgroundTransparency = v98, 
            AutoButtonColor = false, 
            ZIndex = 1, 
            Selectable = false, 
            Active = true, 
            [v1.Event.Activated] = v62
        }), 
        Header = v1.createElement("Frame", {
            ref = v52, 
            Position = v114, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Selectable = false, 
            ZIndex = 3
        }, v65), 
        Panel = v1.createElement("Frame", {
            Position = v128, 
            Size = v139, 
            ref = v55, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            ZIndex = 3
        }, v67), 
        Cover = v1.createElement("TextButton", {
            Text = "", 
            Position = v128, 
            Size = v139, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            ZIndex = v147, 
            Active = true, 
            Selectable = true, 
            SelectionImageObject = v43, 
            SelectionOrder = 1, 
            SelectionGroup = v59, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            [v1.Event.Activated] = v61
        })
    });
end);