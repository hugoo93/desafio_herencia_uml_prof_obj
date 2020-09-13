class Appointment

    attr_accessor :location, :purpose, :hour, :min

    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
    
    def location
    end

    def purpose
    end

    def hour
    end

    def min
    end

end

class MonthlyAppointment < Appointment

    attr_accessor :day

    def initialize(location, purpose, hour, min, day)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
        @day = day
    end

    def day
    end

    def occurs_on?(day)

        if (1..31) === @day
            true
        else 
            false
        end

    end

    def to_s
        "Reunión mensual en NASA sobre Aliens el día #{@day} a la(s) #{@hour}:#{@min}."
    end

end

class DailyAppointment < Appointment

    def occurs_on?(hour,min)

        if((1..12) === @hour && (1..60) === @min)
            true
        else
            false
        end

    end

    def to_s

        "Reunión diaria en Desafío Latam sobre Educación a la(s) #{@hour}:#{@min}."

    end

end

class OneTimeAppointment < Appointment

    attr_accessor :day, :month, :year

    def initialize(location, purpose, hour, min, day, month, year)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
        @day = day
        @month = month
        @year = year
    end

    def day
    end

    def month
    end

    def year
    end

    def occurs_on?(day,month,year)
        if((1..31) === @day && (1..12) === @month && (2000..2021) === @year)
            true
        else
            false
        end
    end

    def to_s

        "Reunión única en Desafío Latam sobre Trabajo el #{@day}/#{@month}/#{@year}  a la(s) #{@hour}:#{@min}."

    end

end



prueba1 = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts prueba1.occurs_on?(prueba1.day,prueba1.month,prueba1.year)
puts prueba1.to_s

prueba2 = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts prueba2.occurs_on?(prueba2.hour,prueba2.min)
puts prueba2.to_s

prueba3 = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts prueba3.occurs_on?(prueba3.day)
puts prueba3.to_s