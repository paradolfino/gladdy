module Game
    class GameController
        def initialize()
            unit = Unit.new()
            unit = roll_order(unit)
            puts unit[:roll]
        end

        def get_random_number(max, min = 1, round = true)
            return Game::Utilities.get_random_number(max, min, round)
        end

        def generate_unit

        end

        def generate_ladder
        end

        def generate_units
        end

        def generate_ladders
        end

        def do_turn(unit, order, last_turn)
            hit = roll_to_hit(unit)
            idx = order.find_index(unit)
            unit2 = idx == 0 ? order[1] : order[0]
            attackDiff = get_random_number(unit[:attack]) - get_random_number(unit2[:defense])
            dmg = 0

            if attackDiff > 0
                dmg = attackDiff
            else
                dmg = 1
            end

            puts "#{unit[:name]} strikes at #{unit2[:name]}!"

            if hit > get_random_number(unit2[:agility])
                puts "the attack hits #{unit2[:name]} (#{unit2[:hp]}) for #{dmg} damage!"
            elsif hit > unit2[:agility] * 2
                dmg = unit[:attack]
                puts "the attack hits #{unit2[:name]} (#{unit2[:hp]}) HARD for #{dmg} damage!"
            else
                dmg = 0
                puts "#{unit2[:name]} dodges the attack!"
            end

            check_damage_result = check_damage(unit2, dmg)
            fight_end = false

            if check_damage_result[:unit][:status] == 0
                puts "#{unit2[:name]} has perished!"
                fight_end = true
            end

            if last_turn == true
                fight_end = true
            end
            
            if fight_end == true
                puts "The match is over!"
            end

            update_units(unit, unit2)

            return {:end => fight_end}
        end

        def update_units(unit1, unit2)
        end

        def roll_order(unit)
            unit[:roll] = get_random_number(100)
            return unit
        end

        def roll_to_hit(unit)
            return get_random_number(unit[:agility], 1)
        end

        def check_damage(unit, dmg)
            health = unit.HP
            health -= dmg
            if health <= 0
                unit.Status = 0
                unit.HP = 0
            else
                unit.Status = 2
                unit.HP = health
            end
            return {:unit => unit}
        end

        def calculate_ladder_prize_value(units)
            val = 0
            i = 0
            while i < units.size do
                unit = units[i]
                val += (unit[:hp] + unit[:attack] + unit[:defense] + unit[:agility])
                i += 1
            end
            return val
        end
    end

    class Utilities
        def self.get_random_number(max, min = 1, round = true)
            num = 0;
            if round == true
                num = rand(min..max)
                num = num.floor
            else
                num = rand(min..max)
            end
            return num
        end
    end

    class Settings
        @@default_max_ladder_size = 10
        @@default_max_hp = 100
        @@default_max_attack = 100
        @@default_max_defense = 25
        @@default_max_agility = 125
        @@default_max_hit = 5
        @@max_turns = 10
    end
end