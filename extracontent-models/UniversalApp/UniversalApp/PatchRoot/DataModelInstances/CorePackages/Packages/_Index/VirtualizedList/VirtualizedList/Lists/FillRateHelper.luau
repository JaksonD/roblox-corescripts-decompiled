local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v1.console;
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v6 = setmetatable({}, v5);
    v6.any_blank_count = 0;
    v6.any_blank_ms = 0;
    v6.any_blank_speed_sum = 0;
    v6.mostly_blank_count = 0;
    v6.mostly_blank_ms = 0;
    v6.pixels_blank = 0;
    v6.pixels_sampled = 0;
    v6.pixels_scrolled = 0;
    v6.total_time_spent = 0;
    v6.sample_count = 0;
    return v6;
end;
local v7 = {};
local v8 = 10;
local v9 = nil;
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 98 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v5 (copy), v9 (ref)
    local v12 = setmetatable({}, v10);
    v12._anyBlankStartTime = nil;
    v12._enabled = false;
    v12._info = v5.new();
    v12._mostlyBlankStartTime = nil;
    v12._samplesStartTime = nil;
    v12._getFrameMetrics = v11;
    if v9 then
        v12._enabled = v9 > math.random();
    else
        v12._enabled = math.random() < 0;
    end;
    v12:_resetData();
    return v12;
end;
v10.addListener = function(v13) --[[ Line: 115 ]] --[[ Name: addListener ]]
    -- upvalues: v9 (ref), l_console_0 (copy), v7 (ref), l_Array_0 (copy)
    if v9 == nil then
        l_console_0.warn("Call `FillRateHelper.setSampleRate` before `addListener`.");
    end;
    table.insert(v7, v13);
    return {
        remove = function() --[[ Line: 121 ]] --[[ Name: remove ]]
            -- upvalues: v7 (ref), l_Array_0 (ref), v13 (copy)
            v7 = l_Array_0.filter(v7, function(v14) --[[ Line: 122 ]]
                -- upvalues: v13 (ref)
                return v13 ~= v14;
            end);
        end
    };
end;
v10.setSampleRate = function(v15) --[[ Line: 129 ]] --[[ Name: setSampleRate ]]
    -- upvalues: v9 (ref)
    v9 = v15;
end;
v10.setMinSampleCount = function(v16) --[[ Line: 133 ]] --[[ Name: setMinSampleCount ]]
    -- upvalues: v8 (ref)
    v8 = v16;
end;
v10.activate = function(v17) --[[ Line: 137 ]] --[[ Name: activate ]]
    if v17._enabled and v17._samplesStartTime == nil then
        v17._samplesStartTime = os.clock();
    end;
end;
v10.deactivateAndFlush = function(v18) --[[ Line: 146 ]] --[[ Name: deactivateAndFlush ]]
    -- upvalues: v8 (ref), l_Object_0 (copy), l_Array_0 (copy), v7 (ref)
    if not v18._enabled then
        return;
    else
        local l__samplesStartTime_0 = v18._samplesStartTime;
        if l__samplesStartTime_0 == nil then
            return;
        elseif v18._info.sample_count < v8 then
            v18:_resetData();
            return;
        else
            local v20 = os.clock() - l__samplesStartTime_0;
            local v21 = l_Object_0.assign({}, v18._info, {
                total_time_spent = v20
            });
            l_Array_0.forEach(v7, function(v22) --[[ Line: 179 ]]
                -- upvalues: v21 (copy)
                return v22(v21);
            end);
            v18:_resetData();
            return;
        end;
    end;
end;
v10.computeBlankness = function(v23, v24, v25, v26) --[[ Line: 185 ]] --[[ Name: computeBlankness ]]
    if not v23._enabled or v24.getItemCount(v24.data) == 0 or v23._samplesStartTime == nil then
        return 0;
    else
        local l_dOffset_0 = v26.dOffset;
        local l_offset_0 = v26.offset;
        local l_velocity_0 = v26.velocity;
        local l_visibleLength_0 = v26.visibleLength;
        local l__info_0 = v23._info;
        l__info_0.sample_count = l__info_0.sample_count + 1;
        l__info_0 = v23._info;
        l__info_0.pixels_sampled = l__info_0.pixels_sampled + math.round(l_visibleLength_0);
        l__info_0 = v23._info;
        l__info_0.pixels_scrolled = l__info_0.pixels_scrolled + math.round((math.abs(l_dOffset_0 or 0)));
        l__info_0 = math.round(math.abs(l_velocity_0 or 0) * 1000);
        local v32 = os.clock() * 1000;
        if v23._anyBlankStartTime ~= nil then
            local l__info_1 = v23._info;
            l__info_1.any_blank_ms = l__info_1.any_blank_ms + (v32 - v23._anyBlankStartTime);
        end;
        v23._anyBlankStartTime = nil;
        if v23._mostlyBlankStartTime ~= nil then
            local l__info_2 = v23._info;
            l__info_2.mostly_blank_ms = l__info_2.mostly_blank_ms + (v32 - v23._mostlyBlankStartTime);
        end;
        v23._mostlyBlankStartTime = nil;
        local v35 = 0;
        local l_first_0 = v25.first;
        local v37 = v23._getFrameMetrics(l_first_0);
        while l_first_0 <= v25.last and (not v37 or not v37.inLayout) do
            v37 = v23._getFrameMetrics(l_first_0);
            l_first_0 = l_first_0 + 1;
        end;
        if v37 and l_first_0 > 1 then
            v35 = math.min(l_visibleLength_0, (math.max(0, v37.offset - l_offset_0)));
        end;
        local v38 = 0;
        local l_last_0 = v25.last;
        local v40 = v23._getFrameMetrics(l_last_0);
        while v25.first <= l_last_0 and (not v40 or not v40.inLayout) do
            v40 = v23._getFrameMetrics(l_last_0);
            l_last_0 = l_last_0 - 1;
        end;
        if v40 and l_last_0 < v24.getItemCount(v24.data) then
            local v41 = v40.offset + v40.length;
            v38 = math.min(l_visibleLength_0, (math.max(0, l_offset_0 + l_visibleLength_0 - v41)));
        end;
        local v42 = math.round(v35 + v38);
        local v43 = v42 / l_visibleLength_0;
        if v43 > 0 then
            v23._anyBlankStartTime = v32;
            local l__info_3 = v23._info;
            l__info_3.any_blank_speed_sum = l__info_3.any_blank_speed_sum + l__info_0;
            l__info_3 = v23._info;
            l__info_3.any_blank_count = l__info_3.any_blank_count + 1;
            l__info_3 = v23._info;
            l__info_3.pixels_blank = l__info_3.pixels_blank + v42;
            if v43 > 0.5 then
                v23._mostlyBlankStartTime = v32;
                l__info_3 = v23._info;
                l__info_3.mostly_blank_count = l__info_3.mostly_blank_count + 1;
                return v43;
            end;
        elseif l__info_0 < 0.01 or math.abs(l_dOffset_0 or 0) < 1 then
            v23:deactivateAndFlush();
        end;
        return v43;
    end;
end;
v10.enabled = function(v45) --[[ Line: 271 ]] --[[ Name: enabled ]]
    return v45._enabled;
end;
v10._resetData = function(v46) --[[ Line: 275 ]] --[[ Name: _resetData ]]
    -- upvalues: v5 (copy)
    v46._anyBlankStartTime = nil;
    v46._info = v5.new();
    v46._mostlyBlankStartTime = nil;
    v46._samplesStartTime = nil;
end;
return v10;