class Doctor
    attr_accessor :name, :patient

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        array_patients = []
        appointments.each do |appointment|
            array_patients << appointment.patient
        end
        array_patients
    end
end