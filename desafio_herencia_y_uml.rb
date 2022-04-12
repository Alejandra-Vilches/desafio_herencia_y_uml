# Superclase
class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

# primera Subclase
class MonthlyAppointment < Appointment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min) #super trae las @variables
        @day = day
    end

    def occurs_on?(day) #valida si la cita corresponde al día
        day == @day
    end

    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}."
    end
end


# segunda Subclase
class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        hour == @hour && min == @min
    end
    def to_s
        "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}."
    end

end

# tercera Subclase
class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day, month, year)
        day == @day && month == @month && year == @year
    end

    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el día #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}."
    end
end

#probando el polimorfismo de to_s para cada subclase
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)

puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)

puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)

#creamos citas, una por cada clase
cita_03 = OneTimeAppointment.new("Parque O'Higgins", 'Picnic empresa', 16, 45, 14, 4, 2022)
cita_02 = DailyAppointment.new('Estación Mapocho', 'Expo Animé', 11, 30)
cita_01 = MonthlyAppointment.new('Disney', 'Mickey', 9, 45, 27)

#probando el método occurs_on con cada onjeto creado
puts cita_03.occurs_on?(22,8,2021)
puts cita_02.occurs_on?(10,30)
puts cita_01.occurs_on?(27)