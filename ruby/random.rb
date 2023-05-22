def random_group
  group = ['A', 'B', 'C', 'D', 'E', 'F']

  group1 = group.sample([3, 4].sample).sort
  group2 = group - group1

  p group1
  p group2
end

random_group
