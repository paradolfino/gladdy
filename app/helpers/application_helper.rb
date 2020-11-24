module ApplicationHelper
    def get_random_number(max, min = 1, round = true)
        num = 0;
        if round == true
            num = floor(rand(min..max))
        else
            num = rand(min..max)
        end
        return num
    end
end
