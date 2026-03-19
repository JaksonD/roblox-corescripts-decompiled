local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 10 ]]
    return {
        useTranslation = v1, 
        messageId = v2
    };
end);