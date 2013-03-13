require 'pry'
module Topics
  Presentation = Struct.new(:votes, :topic, :presented)
  Volunteer = Struct.new(:points)

  def increment_vote(presentation)
    Presentation.new(presentation.votes + 1, presentation.topic)
  end

  def award_presenter(volunteer, presentation)
    if presentation.presented
      return [volunteer, presentation]
    else
      return [
        Volunteer.new(volunteer.points + presentation.votes),
        Presentation.new(presentation.votes, presentation.topic, true)]
  end
end

include Topics

ryan = Volunteer.new(0)
p1 = Presentation.new(0, "rails")
p2 = Presentation.new(0, "fp")

p1 = increment_vote(p1)
p2 = increment_vote(increment_vote(p2))

ryan, p2 = award_presenter(ryan, p2)
puts ryan.points
ryan, p2 = award_presenter(ryan, p2)
puts ryan.points
binding.pry
