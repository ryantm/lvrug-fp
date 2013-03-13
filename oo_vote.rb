require 'pry'
class Presentation
  attr_accessor :votes, :topic, :presented

  def initialize topic_name
    @votes = 0
    @topic = topic_name
    @presented = false
  end

  def upvote
    self.votes += 1
  end

  def award_presentation_points_to(volunteer)
    unless @presented
      volunteer.points += votes
      @presented = true
    end
  end
end

class Volunteer
  attr_accessor :points

  def initialize
    @points = 0
  end
end

ryan = Volunteer.new
p1 = Presentation.new("rails")
p2 = Presentation.new("fp")
p1.upvote
p2.upvote
p2.upvote

p2.award_presentation_points_to(ryan)
puts ryan.points
p2.award_presentation_points_to(ryan)
puts ryan.points

binding.pry
