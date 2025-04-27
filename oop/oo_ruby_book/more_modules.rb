module Animal
    module Swimmable
        def swimm
            "I'm Swimming"
        end
    end

    module Climbable
        def climb
            "I'm climbing"
        end
    end

    module Flyable
        def fly
            "I'm flying"
        end
    end

    module Runnable
        def run
            "I'm running"
        end
    end
end

module Mammal
    class Dog
        include Animal::Swimmable
        include Animal::Runnable
    end

    class Cat
        include Animal::Swimmable
        include Animal::Runnable
        include Animal::Climbable
    end
end

module Fish
    class Tucunare
        include Animal::Swimmable
    end
end

good_dog = Mammal::Dog.new
p "#{good_dog.swimm} | #{good_dog.run}"

xanim = Mammal::Cat.new
p "#{xanim.swimm} | #{xanim.run} | #{xanim.climb}"

glub = Fish::Tucunare.new
p "#{glub.swimm}"