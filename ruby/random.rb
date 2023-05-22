def random_group
  group = ['A', 'B', 'C', 'D', 'E', 'F']

  group1 = if [true, false].sample
             (group - group.sample(3)).sort
           else
             (group - group.sample(4)).sort
           end
  group2 = (group - group1).sort

  p group1
  p group2
end

random_group
