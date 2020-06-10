FactoryBot.define do

  factory :notification do
    visitor_id    {1}
    visited_id    {2}
    task_id       {1}
    comment_id    {1}
    action        {"comment"}
    checked       {0}
  end

end