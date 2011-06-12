module MilestonesHelper
  def milestone_days_remaining(milestone)
    distance_of_time_in_words_to_now(milestone.due_date)
  end
end
