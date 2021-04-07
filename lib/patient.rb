
class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(date, doctor)
        final = Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    def self.all
        @@all
    end

    def doctors
        array_doctors = []
        appointments.each do |appointment|
            array_doctors << appointment.doctor
        end
        array_doctors
    end

end