def random_group
    group = ["A","B","C","D","E","F"]
    
    if [true, false].sample
        group1 = (group - group.sample(3)).sort
        group2 = (group - group1).sort
    else
        group1 = (group - group.sample(4)).sort
        group2 = (group - group1).sort
    end

    p group1
    p group2
end

random_group