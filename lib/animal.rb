require 'faker'
class Animal
    attr_reader :name, :species, :temperment, :animal_info
    @@animal_info = []
    @@temperment = ["Sassy", "Sadistic", "Aggressively Playful", "Playfully Aggressive", "Mean", "Sleepy", "Dopey", "Loving", "Distrustful", "Short-tempered"]
    def initialize(name = nil, species = nil, temperment = nil)
        @name = name || Faker::Name.unique.name
        @species = species || Faker::Creature::Animal.name.capitalize
        @temperment = temperment || @@temperment[rand(@@temperment.length)]

        @@animal_info.push(self)
    end

    def self.search_by(type, s)
        @@animal_info.select {|ani| /#{s}/i.match? ani.send(type)}.sort_by {|ani| ani.send(type).scan(/#{s}/i).length}.reverse
    end

    def self.animal_info
        @@animal_info
    end
end
